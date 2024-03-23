using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TKQClock.Models;
using PagedList;
using PagedList.Mvc;

namespace TKQClock.Controllers
{
    public class ClockStoreController : Controller
    {
        // GET: ClockStore
        TKQClockDataContext data = new TKQClockDataContext();
        private List<DongHo> layDongho(int count)
        {
            return data.DongHos.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }

        public ActionResult IndexBefore(int? page)
        {
            var newclock = layDongho(1000);
            int pagesize = 9;
            int pageNum = (page ?? 1);
            return View(newclock.ToPagedList(pageNum, pagesize));
        }
        public ActionResult Index(int? page )
        {
            var newclock = layDongho(15);
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
    }
}