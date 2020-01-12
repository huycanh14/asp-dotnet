﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTinTuc.Models;

namespace WebTinTuc.Controllers
{
    public class DanhGiaController : Controller
    {
        WebTinTucModel db = new WebTinTucModel();
        // GET: DanhGia
        public ActionResult Create(string cMessage, int MaTinTuc)
        {
            var session = Session["TaiKhoan"];
            if (session == null)
            {
                TempData["Error"] = "Bạn phải đăng nhập";
                return Redirect("/TinTuc/Index/" + MaTinTuc);
            };
            string data = Session["TaiKhoan"].ToString();
            string[] Account = new string[3];
            Account = (data != null) ? data.Split(',') : Account;
            //if (id == int.Parse(Account[2]))
            //{
            //    Session.Remove("TaiKhoan");
            //    return RedirectToAction("Index", "Login");
            //}
            DanhGias cmt = new DanhGias();
            cmt.NoiDung = cMessage;
            cmt.IdTinTuc = MaTinTuc;
            cmt.IdTaiKhoan = int.Parse(Account[2]);
            cmt.NgayTao = DateTime.Now;
            cmt.NgaySua = DateTime.Now;
            cmt.TrangThai = true;
            db.DanhGias.Add(cmt);
            db.SaveChanges();
            return Redirect("/TinTuc/Index/" + MaTinTuc);
        }
    }
}