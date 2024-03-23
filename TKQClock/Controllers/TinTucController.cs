using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TKQClock.Models;

namespace TKQClock.Controllers
{
    public class TinTucController : Controller
    {
        // GET: TinTuc
        TKQClockDataContext data = new TKQClockDataContext();
        private List<TinTuc> layTintuc(int count)
        {
            return data.TinTucs.OrderByDescending(a => a.NgayTao).Take(count).ToList();
        }
        public ActionResult Index(int? page)
        {
            var items = layTintuc(100);
            int pagesize = 3;
            int pageNum = (page ?? 1);
            return View(items.ToPagedList(pageNum, pagesize));
        }
        public ActionResult TinTuc()
        {
            var items = data.TinTucs.ToList();
            return View(items);
        }
        public ActionResult NoiDungTinTuc(int id)
        {

            var tts = from tt in data.TinTucs
                      where tt.MaTT == id
                      select tt;
            return View(tts.Single());
        }
        public ActionResult Partial_New()
        {
            var items = data.TinTucs.Take(3).ToList();
            return View(items);
        }
    }
}