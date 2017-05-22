var nv = {
    init:function()
    {
        nv.registerEvents();
    },
    registerEvents:function()
    {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/TinTuc/ChangeStatus",
                data: { id: id },
                dataType: "json",
                type: "POST",
                success: function (response) {
                    if (response.status == true) {
                        btn.html("<p class='label label-success'> Active </p>");
                    }
                    else {
                        btn.html("<p class='label label-danger'> Locked</p>");
                    }
                }
            });
        });
       
    }
}
nv.init();