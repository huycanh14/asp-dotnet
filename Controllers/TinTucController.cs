﻿using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTinTuc.Models;

namespace WebTinTuc.Controllers
{
    public class TinTucController : Controller
    {
        // GET: TinTuc
        WebTinTucModel db = new WebTinTucModel();
        public ActionResult Index(int id = 0)
        {
            if (TempData["Done"] != null || TempData["Error"] != null)
            {
                ViewBag.Done = TempData["Done"];
                ViewBag.Error = TempData["Error"];
                TempData.Remove("Done");
                TempData.Remove("Error");
            }
            var data = db.TinTucs.Find(id);
            if (data == null)
            {
                return RedirectToAction("Index", "Home");
            }
            object comments = (from cmt in db.DanhGias
                               join tt in db.TinTucs on cmt.IdTinTuc equals tt.Id
                               join tk in db.TaiKhoans on cmt.IdTaiKhoan equals tk.Id
                               where cmt.IdTinTuc == id && cmt.TrangThai == true
                               orderby cmt.NgayTao descending
                               select new DanhGia_TinTuc
                               {
                                   Id = cmt.Id,
                                   NoiDung = cmt.NoiDung,
                                   TinTuc = tt.TieuDe,
                                   TaiKhoan = tk.HoTen,
                                   NgayTao = cmt.NgayTao,
                                   NgaySua = cmt.NgaySua,
                                   TrangThai = cmt.TrangThai
                               }).ToList();
            ViewBag.Comments = comments;
            return View(data);
        }

        public ActionResult Search(string keywork = "", int page = 1)
        {
            var TinTucs = (from tt in db.TinTucs
                           join dm in db.DanhMucs on tt.IdDanhMuc equals dm.Id
                           orderby tt.Id descending
                           where tt.TieuDe.Contains(keywork) || tt.NoiDung.Contains(keywork)
                           select new TinTuc_DanhMuc
                           {
                               DanhMuc = dm.TenDanhMuc,
                               MaDanhMuc = dm.Id,
                               MaTinTuc = tt.Id,
                               TieuDe = tt.TieuDe,
                               NgayTao = tt.NgayTao,
                               HinhAnh = tt.HinhAnh
                           }).ToPagedList(page, 12);
            return View(TinTucs);
        }
    }
}