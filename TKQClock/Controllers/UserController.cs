using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
using TKQClock.Models;
using System.Text;
using PagedList;
using System.IO;

namespace TKQClock.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        TKQClockDataContext data = new TKQClockDataContext();

        public ActionResult Index()
        {
            return View();
        }
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
        [HttpGet]
        public ActionResult Dangky()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangky(FormCollection collection, KhachHang kh)
        {
            var matkhau = collection["register_pass"];
            var matkhaunhaplai = collection["register_repass"];
            var hoten = collection["register_name"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["register_birthday"]);
            var gioitinh = collection["register_sex"];
            var email = collection["register_email"];
            var dienthoai = collection["register_phone"];
            var diachi = collection["register_address"];
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên khách hàng không được để trống";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else if (String.IsNullOrEmpty(matkhaunhaplai))
            {
                ViewData["Loi3"] = "Phải nhập lại mật khẩu";
            }
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi4"] = "Email không được bỏ trống";
            }

            else if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi5"] = "Phải nhập điện thoai";
            }
            else
            {
                //Gán giá trị cho đối tượng được tạo mới (kh)
                kh.MatKhau = GetMD5(matkhau);
                kh.TenDangNhap = email;
                kh.TenKH = hoten;
                kh.DiaChi = diachi;
                kh.GioiTinh = gioitinh;
                kh.SDT = dienthoai;
                kh.NgaySinh = DateTime.Parse(ngaysinh);
                data.KhachHangs.InsertOnSubmit(kh);
                data.KhachHangs.InsertOnSubmit(kh);
                data.SubmitChanges();
                return RedirectToAction("Dangnhap");
            }
            return this.Dangky();
        }
        [HttpGet]
        public ActionResult Dangnhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangnhap(FormCollection f)
        {
            var tendn = f["user_name"];
            var matkhau = GetMD5(f["user_pass"]);
            if (String.IsNullOrEmpty(tendn))
                ViewData["Loi1"] = "Vui lòng nhập tên đăng nhập";
            else if (String.IsNullOrEmpty(matkhau))
                ViewData["Loi2"] = "Vui lòng nhập mật khẩu";
            else
            {
                var tk = data.KhachHangs.SingleOrDefault(n => n.TenDangNhap == tendn && n.MatKhau == matkhau);
                if (tk != null)
                {
                    Session["Taikhoan"] = tk;
                    return RedirectToAction("IndexAfter", "User");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không hợp lệ";
            }

            return View();
        }

        public ActionResult Dangxuat()
        {
            Session.Clear();
            return RedirectToAction("IndexBefore", "ClockStore");
        }
        //-------------------------------------------------------------------
        private List<DongHo> layDongho(int count)
        {
            return data.DongHos.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }

        public ActionResult IndexAfter()
        {
            return View();
        }
        public ActionResult IfCustomer()
        {
            KhachHang kh = (KhachHang)Session["TaiKhoan"];
            return View();
        }

        [HttpGet]
        public ActionResult SuaTTKH()
        {
            KhachHang kh = (KhachHang)Session["TaiKhoan"];
            KhachHang kh1 = new KhachHang();
            kh1.MaKH = kh.MaKH;
            kh1.TenKH= kh.TenKH;
            kh1.SDT = kh.SDT;
            kh1.DiaChi = kh.DiaChi;
            kh1.GioiTinh= kh.GioiTinh;
            kh1.NgaySinh = kh.NgaySinh;
            return View(kh1);
        }

        [HttpPost]
        public ActionResult SuaTTKH(KhachHang kh1)
        {  
            if (ModelState.IsValid)
            {
                UpdateModel(kh1);
                data.SubmitChanges();
            }
            return RedirectToAction("IndexAfter");
        }
        public ActionResult Sanpham(int? page)
        {
            var newclock = layDongho(1000);
            int pagesize = 9;
            int pageNum = (page ?? 1);
            return View(newclock.ToPagedList(pageNum, pagesize));
        }

        public ActionResult Hang()
        {
            var hangs = from hang in data.HangDongHos select hang;
            return PartialView(hangs);
        }

        public ActionResult Loai()
        {
            var loais = from loai in data.LoaiDongHos select loai;
            return PartialView(loais);
        }
        public ActionResult ClockTheoHang(int id)
        {
            var clocks = from clock in data.DongHos where clock.MaHDH == id select clock;
            return View(clocks);
        }
        public ActionResult ClockTheoLoai(int id)
        {
            var clocks = from clock in data.DongHos where clock.MaLoai == id select clock;
            return View(clocks);
        }

        public ActionResult Chitietdongho(int id)
        {
            var clocks = from clock in data.DongHos
                         where clock.MaDH == id
                         select clock;
            return View(clocks.Single());
        }

        private List<TinTuc> layTintuc(int count)
        {
            return data.TinTucs.OrderByDescending(a => a.NgayTao).Take(count).ToList();
        }
        public ActionResult News(int? page)
        {
            var items = layTintuc(10);
            int pagesize = 3;
            int pageNum = (page ?? 1);
            return View(items.ToPagedList(pageNum, pagesize));
        }
        public ActionResult NewsDetail(int id)
        {

            var tts = from tt in data.TinTucs
                      where tt.MaTT == id
                      select tt;
            return View(tts.Single());
        }

    }
}