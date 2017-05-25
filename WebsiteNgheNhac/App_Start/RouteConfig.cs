using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebsiteNgheNhac
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            // BotDetect requests must not be routed
            routes.IgnoreRoute("{*botdetect}",new { botdetect = @"(.*)BotDetectCaptcha\.ashx" });

            routes.MapRoute(
               name: "ChiTietNhac",
               url: "bang-xep-hang/{action}-{id}",
               defaults: new { controller = "NgheNhac", action = "Index", id = UrlParameter.Optional }
           );

            routes.MapRoute(
             name: "Video",
              url: "video/{action}-{Id}",
             defaults: new { controller = "Video", action = "ChiTietVideo", Id=UrlParameter.Optional },
               namespaces: new[] { "WebsiteNgheNhac.Controllers" }
             );

            routes.MapRoute(
            "tintucweb",
              "tin-tuc/{action}",
             new { controller = "TinTuc", action = "Index" },
              namespaces: new[] { "WebsiteNgheNhac.Controllers" }
            );

           
            routes.MapRoute(
            name: "ListCasi",
             url: "{controller}/{action}",
            defaults: new { controller = "Danhsachcasi", action = "Index" },
             namespaces: new[] { "WebsiteNgheNhac.Controllers" }
            );

            routes.MapRoute(
            name: "ListTinTuc",
             url: "{danh-sach}/{cam-xuc-am-nhac}",
            defaults: new { controller = "TinTuc", action = "ListTinTuc"},
             namespaces: new[] { "WebsiteNgheNhac.Controllers" }
            );

            routes.MapRoute(
              name: "Search",
               url: "tim-kiem/{action}",
              defaults: new { controller = "NgheNhac", action = "Search"},
              namespaces: new[] { "WebsiteNgheNhac.Controllers" }
              );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

        }
    }
}
