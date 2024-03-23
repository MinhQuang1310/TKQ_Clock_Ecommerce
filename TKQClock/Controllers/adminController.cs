using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TKQClock.Models;
using PagedList.Mvc;
using PagedList;
using System.IO;
using System.Web.UI.WebControls;

namespace TKQClock.Controllers
{
    public class adminController : Controller
    {
        // GET: admin
        TKQClockDataContext data = new TKQClockDataContext();
        #region Login
        public ActionResult Index()
        {
            return View();
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
            var matkhau = (f["user_pass"]);
            if (String.IsNullOrEmpty(tendn))
                ViewData["Loi1"] = "Vui lòng nhập tên đăng nhập";
            else if (String.IsNullOrEmpty(matkhau))
                ViewData["Loi2"] = "Vui lòng nhập mật khẩu";
            else
            {
                var ad = data.Admins.SingleOrDefault(n => n.TenDangNhap == tendn && n.MatKhau == matkhau);
                if (ad != null)
                {
                    Session["Taikhoan"] = ad;
                    return RedirectToAction("QuanLy", "admin");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không hợp lệ";
            }

            return View();
        }
        public ActionResult QuanLy()
        {
            return View();
        }
        public ActionResult Dangxuat()
        {
            Session.Clear();
            return RedirectToAction("Index", "admin");
        }
        #endregion

        #region Dongho
        //controller về bảng Đồng Hồ
        public ActionResult Dongho(int? page)
        {
            int pageNumber = page ?? 1;
            int pageSize = 3;
            return View(data.DongHos.ToList().OrderBy(n => n.MaDH).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult Create_Clock()
        {
            ViewBag.MaHDH = new SelectList(data.HangDongHos.ToList().OrderBy(n => n.TenHang), "MaHDH", "TenHang");
            ViewBag.MaLoai = new SelectList(data.LoaiDongHos.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create_Clock(DongHo dongHo, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaHDH = new SelectList(data.HangDongHos.ToList().OrderBy(n => n.TenHang), "MaHDH", "TenHang");
            ViewBag.MaLoai = new SelectList(data.LoaiDongHos.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/hinhsp"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại ";
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }
                    dongHo.ImgUrl = fileName;
                    data.DongHos.InsertOnSubmit(dongHo);
                    data.SubmitChanges();
                }
                return RedirectToAction("Dongho");
            }
        }
        public ActionResult ChiTiet(int id)
        {   
            DongHo clock = data.DongHos.SingleOrDefault(n => n.MaDH == id);
            ViewBag.MaDH = clock.MaDH;
            if( clock == null )
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(clock);
        }
        [HttpGet]
        public ActionResult Xoadongho(int id)
        {
            DongHo clock = data.DongHos.SingleOrDefault(n => n.MaDH == id);
            ViewBag.MaDH = clock.MaDH;
            if (clock == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(clock);
        }

        [HttpPost,ActionName("Xoadongho")]

        public ActionResult Xacnhanxoa(int id) 
        {
            DongHo clock = data.DongHos.SingleOrDefault(n => n.MaDH == id);
            ViewBag.MaDH = clock.MaDH;
            if (clock == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.DongHos.DeleteOnSubmit(clock);
            data.SubmitChanges();
            return RedirectToAction("Dongho");
        }

        [HttpGet]
        public ActionResult SuaDH(int id)
        {
            DongHo clock = data.DongHos.SingleOrDefault(n => n.MaDH == id);
            ViewBag.MaDH= clock.MaDH;
            if (clock == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaHDH = new SelectList(data.HangDongHos.ToList().OrderBy(n => n.TenHang), "MaHDH", "TenHang",clock.MaHDH);
            ViewBag.MaLoai = new SelectList(data.LoaiDongHos.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai", clock.MaLoai);
            return View(clock);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SuaDH(DongHo dh, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaHDH = new SelectList(data.HangDongHos.ToList().OrderBy(n => n.TenHang), "MaHDH", "TenHang");
            ViewBag.MaLoai = new SelectList(data.LoaiDongHos.ToList().OrderBy(n => n.TenLoai), "MaLoai", "TenLoai");
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh!";
                return View();
            }
            if (ModelState.IsValid)
            {
                var dongho = data.DongHos.FirstOrDefault(x => x.MaDH == dh.MaDH);
                if (dongho != null)
                {
                    // Cập nhật thông tin khách hàng trong CSDL
                    dongho.TenDH = dh.TenDH;
                    dongho.SoLuongTon = dh.SoLuongTon;
                    dongho.NoiDung = dh.NoiDung;
                    dongho.KichThuoc = dh.KichThuoc;
                    dongho.Mausac = dh.Mausac;
                    dongho.MoTaNgan = dh.MoTaNgan;
                    dongho.NgayCapNhat = dh.NgayCapNhat;
                    dongho.ChatLieu = dh.ChatLieu;
                    dongho.Maubanhxe = dh.Maubanhxe;
                    dongho.Dai = dh.Dai;
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/hinhsp"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại!";
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }
                    dh.ImgUrl = fileName;
                    UpdateModel(dh);
                    data.SubmitChanges();
                }
                return RedirectToAction("Dongho");
            }
            return View(dh);
        }

        #endregion

        #region Hang dong ho
        //controller về hãng đồng hồ
        public ActionResult HangDH()
        {
            return View(data.HangDongHos.ToList());
        }
        [HttpGet]
        public ActionResult ThemHang()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemHang(HangDongHo hang)
        {
            if (ModelState.IsValid)
            {
                data.HangDongHos.InsertOnSubmit(hang);
                data.SubmitChanges();
            }
            return RedirectToAction("HangDH");
        }

        [HttpGet]
        public ActionResult XoaHangDH(int id)
        {
            HangDongHo hang = data.HangDongHos.SingleOrDefault(n => n.MaHDH == id);
            ViewBag.MaHDH = hang.MaHDH;
            if (hang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(hang);
        }

        [HttpPost, ActionName("XoaHangDH")]

        public ActionResult XacNhanXoaHang(int id)
        {
            HangDongHo hang = data.HangDongHos.SingleOrDefault(n => n.MaHDH == id);
            ViewBag.MaHDH = hang.MaHDH;
            if (hang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.HangDongHos.DeleteOnSubmit(hang);
            data.SubmitChanges();
            return RedirectToAction("HangDH");
        }

        [HttpGet]
        public ActionResult SuaHDH(int id)
        {
            HangDongHo hang = data.HangDongHos.SingleOrDefault(n => n.MaHDH == id);
            if (hang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(hang);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SuaHDH(HangDongHo h)
        {
            if (ModelState.IsValid)
            {
                var hang = data.HangDongHos.FirstOrDefault(x => x.MaHDH == h.MaHDH);
                if (hang != null)
                {
                    // Cập nhật thông tin khách hàng trong CSDL
                    hang.TenHang = h.TenHang;
                    data.SubmitChanges();
                }
                return RedirectToAction("TheLoaiDH");
            }
            return View(h);
        }
        #endregion

        #region Loai dong ho
        // controller về thể loại đồng hồ
        public ActionResult TheLoaiDH()
        {
            return View(data.LoaiDongHos.ToList());
        }
        [HttpGet]
        public ActionResult ThemTL()
        {
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemTL(LoaiDongHo loai)
        {
            if (ModelState.IsValid)
            {
                data.LoaiDongHos.InsertOnSubmit(loai);
                data.SubmitChanges();
            }
            return RedirectToAction("TheLoaiDH");
        }
        [HttpGet]
        public ActionResult XoaTLDH(int id)
        {
            LoaiDongHo loai = data.LoaiDongHos.SingleOrDefault(n => n.MaLoai == id);
            ViewBag.MaLoai = loai.MaLoai;
            if (loai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(loai);
        }

        [HttpPost, ActionName("XoaTLDH")]

        public ActionResult XNXoaLoai(int id)
        {
            LoaiDongHo loai = data.LoaiDongHos.SingleOrDefault(n => n.MaLoai == id);
            ViewBag.MaLoai = loai.MaLoai;
            if (loai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.LoaiDongHos.DeleteOnSubmit(loai);
            data.SubmitChanges();
            return RedirectToAction("TheLoaiDH");
        }

        [HttpGet]
        public ActionResult SuaLDH(int id)
        {
            LoaiDongHo loai = data.LoaiDongHos.SingleOrDefault(n => n.MaLoai == id);
            if (loai == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(loai);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SuaLDH(LoaiDongHo l)
        {
            if (ModelState.IsValid)
            {
                var loai = data.LoaiDongHos.FirstOrDefault(x => x.MaLoai == l.MaLoai);
                if (loai != null)
                {
                    // Cập nhật thông tin khách hàng trong CSDL
                    loai.TenLoai = l.TenLoai;
                    data.SubmitChanges();
                }
                return RedirectToAction("TheLoaiDH");
            }
            return View(l);
        }

        #endregion

        #region Khach hang
        public ActionResult Khachhang(int? page)
        {
            int pageNumber = page ?? 1;
            int pageSize = 5;
            return View(data.KhachHangs.ToList().OrderBy(n => n.MaKH).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult XoaKH(int id)
        {
            KhachHang kh = data.KhachHangs.SingleOrDefault(n => n.MaKH == id);
            ViewBag.MaKH = kh.MaKH;
            if (kh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(kh);
        }

        [HttpPost, ActionName("XoaKH")]

        public ActionResult XacNhanXoaKH(int id)
        {
            KhachHang kh = data.KhachHangs.SingleOrDefault(n => n.MaKH == id);
            ViewBag.MaKH = kh.MaKH;
            if (kh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.KhachHangs.DeleteOnSubmit(kh);
            data.SubmitChanges();
            return RedirectToAction("Khachhang");
        }

        [HttpGet]
        public ActionResult SuaKH(int id)
        {
            KhachHang kh = data.KhachHangs.SingleOrDefault(n => n.MaKH == id);
            if (kh == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(kh);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SuaKH(KhachHang kh)
        {
            if (ModelState.IsValid)
            {
                var khachhang = data.KhachHangs.FirstOrDefault(x => x.MaKH == kh.MaKH);
                if (khachhang != null)
                {
                    // Cập nhật thông tin khách hàng trong CSDL
                    khachhang.TenKH = kh.TenKH;
                    khachhang.SDT = kh.SDT;
                    khachhang.DiaChi = kh.DiaChi;
                    khachhang.NgaySinh = kh.NgaySinh;
                    khachhang.MatKhau = kh.MatKhau;
                    data.SubmitChanges();
                }
                return RedirectToAction("Khachhang");
            }
            return View(kh);
        }
        #endregion

        #region DonDatHang
        public ActionResult DonDatHang(int? page)
        {
            int pageNumber = page ?? 1;
            int pageSize = 3;
            return View(data.DonDatHangs.ToList().OrderBy(n => n.MaDDH).ToPagedList(pageNumber, pageSize));
        }


        [HttpGet]
        public ActionResult xoaDDH(int id)
        {
            DonDatHang don = data.DonDatHangs.SingleOrDefault(n => n.MaDDH == id);
            ViewBag.MaDDH = don.MaDDH;
            if (don == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(don);
        }

        [HttpPost, ActionName("xoaDDH")]

        public ActionResult XacNhanXoaDonDatHang(int id)
        {
            DonDatHang don = data.DonDatHangs.SingleOrDefault(n => n.MaDDH == id);
            ViewBag.MaDDH = don.MaDDH;
            if (don == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.DonDatHangs.DeleteOnSubmit(don);
            data.SubmitChanges();
            return RedirectToAction("DonDatHang");
        }

        [HttpGet]
        public ActionResult SuaDonDatHang(int id)
        {
            DonDatHang don = data.DonDatHangs.SingleOrDefault(n => n.MaDDH == id);
            ViewBag.MaDDH = don.MaDDH;
            if (don == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(don);
        }
        
        public ActionResult SuaDonDatHang(DonDatHang don)
        {
            if (ModelState.IsValid)
            {
                var DonDatHang = data.DonDatHangs.FirstOrDefault(x => x.MaDDH == don.MaDDH);
                if (don != null)
                {
                    // Cập nhật thông tin khách hàng trong CSDL
                    DonDatHang.MaDDH = don.MaDDH;
                    DonDatHang.NgayDat = don.NgayDat;
                    DonDatHang.NgayGiao = don.NgayGiao;
                    DonDatHang.Tinhtranggiaohang = don.Tinhtranggiaohang;
                    data.SubmitChanges();
                }
                return RedirectToAction("DonDatHang");
            }
            return View(don);
        }
        #endregion

        #region Tin tuc
        public ActionResult TinTuc(int ?page)
        {
            int pageNumber = page ?? 1;
            int pageSize = 3;
            return View(data.TinTucs.ToList().OrderBy(n => n.MaTT).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult ThemTinTuc()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemTinTuc(TinTuc tt, HttpPostedFileBase fileUpload)
        {
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/hinhTinTuc"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại ";
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }
                    tt.Img = fileName;
                    data.TinTucs.InsertOnSubmit(tt);
                    data.SubmitChanges();
                }
                return RedirectToAction("TinTuc");
            }
        }
        public ActionResult ChiTiet_News(int id)
        {
            TinTuc tt = data.TinTucs.SingleOrDefault(n => n.MaTT == id);
            ViewBag.MaTT = tt.MaTT;
            if (tt == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(tt);
        }

        public ActionResult Delete_News(int id)
        {
            TinTuc tt = data.TinTucs.SingleOrDefault(n => n.MaTT == id);
            ViewBag.MaTT = tt.MaTT;
            if (tt == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(tt);
        }

        [HttpPost, ActionName("Delete_News")]

        public ActionResult Confirm_Delete(int id)
        {
            TinTuc tt = data.TinTucs.SingleOrDefault(n => n.MaTT == id);
            ViewBag.MaTT = tt.MaTT;
            if (tt == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            data.TinTucs.DeleteOnSubmit(tt);
            data.SubmitChanges();
            return RedirectToAction("TinTuc");
        }

        [HttpGet]
        public ActionResult Edit_News(int id)
        {
            TinTuc tt = data.TinTucs.SingleOrDefault(n => n.MaTT == id);
            ViewBag.MaTT = tt.MaTT;
            if (tt == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(tt);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit_News(TinTuc tt)
        {
            if (ModelState.IsValid)
            {
                var tts = data.TinTucs.FirstOrDefault(x => x.MaTT == tt.MaTT);
                if (tts != null)
                {
                    tts.MaTT = tt.MaTT;
                    tts.Img = tt.Img;
                    tts.TieuDe = tt.TieuDe;
                    tts.NoiDung = tt.NoiDung;
                    tts.NgayTao  = tt.NgayTao;
 
                    data.SubmitChanges();
                }
                return RedirectToAction("TinTuc");
            }
            return View(tt);
        }
        #endregion
    }
}