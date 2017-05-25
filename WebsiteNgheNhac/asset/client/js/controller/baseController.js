var common = {
    init:function()
    {
        common.registerEvent();
    },
   // registerEvent:function()
   // {
   //     $("#txtSearch").autocomplete({
   //         minLength: 0,
   //         source: function (request, response) {
   //             $.ajax( {
   //                 url: "/TrangChu/ListName",
   //                 dataType: "json",
   //                 data: {
   //                     q: request.term
   //                 },
   //                 success: function (data) {
   //                     //console.log(data.data);
   //                     response(data.data);
   //                     //response(data.data);
   //                 }
   //             } );
   //             },
   //         focus: function (event, ui) {
   //             $("#txtSearch").val(ui.item.label);
   //             return false;
   //         },
   //         select: function (event, ui) {
   //             $("#txtSearch").val(ui.item.label);
   //             return false;
   //         }
   //     })
   //.autocomplete("instance")._renderItem = function (ul, item) {
   //    return $("<li>")
   //      .append("<a>" + item.label  + "</a>")
   //      .appendTo(ul);
   //};
    // }
     registerEvent:function()
     {
         $("#txtSearch").autocomplete({
             minLength: 0,
             source: function (request, response) {
                 $.ajax( {
                     url: "/TrangChu/ListName",
                     dataType: "json",
                     data: {
                         q: request.term
                     },
                     success: function (data) {
                         //var item = new Array();
                         //var label = new Array();
                         //var i;
                         //for(i=0;i<data.data.length;i++)    
                         //{
                         //    item[i] = data.data[i].TenBaiHat;
                         //    label[i] = data.data[i].url_Image;
                         //}
                         //response(item,label);
                         response(data.data);
                     }
                 } );
                 },
             focus: function (event, ui) {
                 $("#txtSearch").val(ui.item.TenBaiHat);
                 return false;
             },
             select: function (event, ui) {
                 $("#txtSearch").val(ui.item.TenBaiHat);
                 return false;
             }
         })
    .autocomplete("instance")._renderItem = function (ul, item) {
        return $("<li style='width:100%;height:100%;border-bottom: 1px solid #f0f0f0;'>")
          //.append("<a ><img src='" + item.url_Image + "' width='50px'/>" + item.TenBaiHat + "</a>")
              .append("<div><img src='" + item.url_Image + "' width='50px'/> <a> " + item.TenBaiHat + " </a> </div>")
              //.append("<a style='display: inline-block;height: 36px;'> " + item.TenBaiHat + " </a>")
             
          .appendTo(ul);
    };
     }
}
common.init();


