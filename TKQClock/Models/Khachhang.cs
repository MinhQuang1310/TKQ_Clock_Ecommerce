using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace TKQClock.Models
{
    public class Khachhang
    {
        TKQClockDataContext data = new TKQClockDataContext();
        public int iMaKH { set; get; }
        public string sTenKH { set; get; }
        public string sNgaySinh { set; get; }
        public string sGioiTinh { set; get; }
        public string sSDT { set; get; }
        public string sDiachi { set; get; }
        public string sTenDangNhap { set; get; }
        public string sMatkhau { set; get; }

        public Khachhang (int MaKH)
        {
            iMaKH = MaKH;
            KhachHang kh = data.KhachHangs.Single(n => n.MaKH == iMaKH);
            sTenKH = kh.TenDangNhap;
            sNgaySinh = kh.NgaySinh.ToString();
            sGioiTinh = kh.GioiTinh;
            sSDT = kh.SDT;
            sDiachi = kh.DiaChi;
            sDiachi = kh.TenDangNhap;
            sMatkhau = kh.MatKhau;
        }
    }
}