﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebsiteNgheNhac.Areas.Admin.Controllers
{
    public class TinTucController : BaseController
    {
        // GET: Admin/TinTuc
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Create()
        {
            return View();
        }
    }
}