using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TKQClock.Models
{
    public class Giohang
    {
        TKQClockDataContext data = new TKQClockDataContext();

        public int iMaDH { set; get; }
        public string sTenDH { set; get; }
        public string sImgUrl { set; get; }
        public int iSoLuong { set; get; }
        public double dGiaban { set; get; }
        public double dThanhTien
        {
            get { return dGiaban * iSoLuong; }
        }
        public Giohang(int MaDH)
        {
            iMaDH = MaDH;
            DongHo DongHo = data.DongHos.Single(n => n.MaDH == iMaDH);
            sTenDH = DongHo.TenDH;
            sImgUrl = DongHo.ImgUrl;
            iSoLuong = 1;
            dGiaban = double.Parse(DongHo.GiaBan.ToString());

        }
    }
}