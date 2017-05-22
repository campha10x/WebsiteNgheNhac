
var nhanvienconfig = {
    pageSize:3,
    pageIndex:1
}
function formatJsonDate(jsonDate) {
    var dateString = jsonDate.substr(6);
    var currentTime = new Date(parseInt(dateString));
    var month = currentTime.getMonth() + 1;
    var day = currentTime.getDate();
    var year = currentTime.getFullYear();
    var date = day + "/" + month + "/" + year;
    return date;
};

function formatJsonMonth(jsonDate) {
    var dateString = jsonDate.substr(6);
    var currentTime = new Date(parseInt(dateString));
    var month = currentTime.getMonth() + 1;
    var day = currentTime.getDate();
    var year = currentTime.getFullYear();
    if (day < 10) { day = '0' + day } if (month < 10) { month = '0' + month }
    var date = year + "-" + month + "-" + day;
    return date;
};

var nhanvienController = {
    init:function()
    {
        nhanvienController.loadData();
        nhanvienController.registerEvent();
       
    },
    registerEvent:function()
    {
        $('#frmSaveData').validate({
            rules: {
                txtName: {
                    required: true,
                    minlength: 5
                },
                txtSalary: {
                    required: true,
                    number: true,
                    min: 0
                },
                txtuser: {
                    required: true,
                    minlength: 5
                },
                txtpassword: {
                    required: true,
                    minlength: 5
                },
                txtngaysinh: {
                    required: true
                }
            },
            messages: {
                txtName: {
                    required: "Bạn phải nhập tên",
                    minlength: "Tên phải lớn hơn 5 ký tự",
                    success: function (label) {
                        label.addClass("valid").text("Ok!");
                    }
                },
                txtSalary: {
                    required: "Bạn phải nhập lương",
                    number: "Lương phải là số",
                    min: "Lương của bạn phải lớn hơn hoặc bằng 0"
                },
                txtpassword:{
                    required: "Bạn phải nhập mật khẩu"
                },
                txtuser: {
                    required: "Bạn phải nhập tên tài khoản",
                    minlength: "Tên phải lớn hơn 5 ký tự"
                },
                txtngaysinh:{
                    required: "Bạn phải nhập mật khẩu",
                    minlength: "Tên phải lớn hơn 5 ký tự"
                },
                txtngaysinh: {
                    required: "Bạn phải nhập ngày sinh"
                }
            }
        });

        $('.txtLuong').off('keypress').on('keypress', function (e) {
            if (e.which == 13) {
                var id = $(this).data('id');
                var value = $(this).val();
                nhanvienController.updateLuong(id, value);
            }
        });
        $('.btn-edit').off('click').on('click', function () {
            $('#modalAddUpdate').modal('show');
            var Id = $(this).data('id');
            nhanvienController.LoadDropDownContent();
            nhanvienController.loadDetail(Id);
        });
        $('#btnAddNew').off('click').on('click', function () {
            $('#modalAddUpdate').modal('show');
            nhanvienController.resetForm();
            nhanvienController.LoadDropDownContent();
        });
        $('#btnSave').off('click').on('click', function () {
            if ($('#frmSaveData').valid()) {
                nhanvienController.saveData();
            }
        });
        $('.btn-delete').off('click').on('click', function () {
            var id = $(this).data('id');
            bootbox.confirm({
                message: "Are you sure?",
                buttons: {
                    confirm: {
                        label: 'Yes',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'No',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    if(result===true)
                        nhanvienController.deleteEmployee(id);
                }
            });

        });
        $('#btnReset').off('click').on('click', function () {
            $('#txtNameS').val('');
            $('#ddlStatusS').val('');
            homeController.loadData(true);
        });
        $('#btnSearch').off('click').on('click', function () {
            nhanvienController.loadData(true);
        });
        $('#btnReset').off('click').on('click', function () {
            $('#txtNameS').val('');
            $('#ddlStatusS').val('');
            nhanvienController.loadData(true);
        });
        $('#txtNameS').off('keypress').on('keypress', function (e) {
            if (e.which == 13) {
                nhanvienController.loadData(true);
            }
        });

    },
    deleteEmployee: function(id)
    {
        $.ajax({
            url: '../NhanVien/Delete',
            data: {
                id:id
            },
            type:'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status == true) {
                    bootbox.alert("Delete Success", function () {

                        nhanvienController.loadData(true);
                    });
                   

                }
                else {
                    bootbox.alert(response.message);
                }
            },
            error:function(err)
            {
                console.log(err);
            }
        });
    },
        saveData: function () {
            var name = $('#txtName').val();
            var salary = parseFloat($('#txtSalary').val());
            var ngaysinh = $('#txtngaysinh').val();
            var gioitinh = $('input[name=ckbgioitinh]:Checked').val();
           
            var Id_Quyen = $('.ddlquyen').val();
            var chucvu = $('.ddlchucvu').val();
            var userName = $('#txtuser').val();
            var passWord = $('#txtpassword').val();
            var status = $('#ckStatus').prop('checked');
            var id = parseInt($('#hidID').val());
            var employee = {
                tenNV: name,
                Luong: salary,
                NgaySinh: ngaysinh,
                gioitinh:gioitinh,
                ChucVu: chucvu,
                UserName:userName,
                Password:passWord,
                Status: status,
                ID: id,
                Id_Quyen: Id_Quyen
            }
            $.ajax({
                url: '../NhanVien/SaveData',
                data: {
                    strEmployee: JSON.stringify(employee)
                },
                type: 'POST',
                dataType: 'json',
                success: function (response) {
                    if (response.status == true) {
                        bootbox.alert("Save Success", function () {
                            $('#modalAddUpdate').modal('hide');
                            nhanvienController.loadData(true);
                        });

                    }
                    else {
                        bootbox.alert(response.message);
                    }
                },
                error: function (err) {
                    console.log(err);
                }
            });
        },
        resetForm: function () {
            $('#hidID').val('0');
            $('#txtName').val('');
            $('#txtngaysinh').val(Date.now());
            $('#ckbNam').prop('checked', true);
            $(".ddlchucvu").val($(".ddlchucvu option:first").val());
            $('#txtuser').val('');
            $('#txtpassword').val('');
            $('#txtSalary').val('');
            $('#ckStatus').prop('checked', true);
        },
        loadDetail: function (id) {
        $.ajax({
            url: '../NhanVien/GetDetail',
            data: {
                Id: id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status == true) {
                    var data = response.data;
                    $('#hidID').val(data.Id);
                    $('#txtName').val(data.tenNV);
                    $('#txtngaysinh').val(formatJsonMonth(data.NgaySinh));
                    if (data.gioitinh === "Nam")
                        $('#ckbNam').prop('checked', true);
                    else
                        $('#ckbNu').prop('checked', true);
                    $('.ddlchucvu').val(data.ChucVu);
                    $('.ddlquyen').val(data.Id_Quyen);
                    $('#txtuser').val(data.UserName);
                    $('#txtpassword').val(data.Password);
                    $('#txtSalary').val(data.Luong);
                    $('#ckStatus').prop('checked', data.Status);
                }
                else {
                    bootbox.alert(response.message);
                }
            },
            error: function (err) {
                console.log(err);
            }
        });
    },
    updateLuong:function(id,value)
    {
        var data = {
            Id: id,
            Luong: value
        }
        $.ajax({
            url: '../NhanVien/Update',
            type: 'POST',
            dataType: 'json',
            data: {model:JSON.stringify(data)},
            success: function (response) {
                if(response.status)
                {
                    bootbox.alert("Update successed", function () {
                        $('#modalAddUpdate').modal('hide');
                        nhanvienController.loadData(true);
                    });
                }
                else
                {
                    bootbox.alert("Update failed", function () {
                        $('#modalAddUpdate').modal('hide');
                        nhanvienController.loadData(true);
                    });
                }
            }
        })
    },
    LoadDropDownContent:function()
    {

        $.ajax({
            url: '../NhanVien/GetItems',
            type: 'GET',
            dataType: 'json',
            success: function (items) {
                var ddl = $('.ddlquyen');
                ddl.empty();
                ddl.append($('<option/>', { value: '', text: '--Selected--' }));
                $.each(items, function (index, item) {
                    ddl.append($('<option/>', {
                        value: item.Value,
                        text: item.Text,
                        selected: item.Selected
                    }));
                });
            }
        })
    },
    loadData: function (changePageSize)
    {
        var name = $('#txtNameS').val();
        var status = $('#ddlStatusS').val();
        $.ajax({
            url: '../NhanVien/LoadData',
            type: 'GET',
            data: {
                name: name,
                status: status,
                page: nhanvienconfig.pageIndex,
                pageSize: nhanvienconfig.pageSize
            },
            dataType: 'json',
            success:function(response)
            {
               
                if(response.status)
                {
                    var data = response.data;
                    var html = '';
                    var template = $('#data-template').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.Id,
                            tenNV: item.tenNV,
                            NgaySinh: formatJsonDate(item.NgaySinh),
                            gioitinh: item.gioitinh,
                            Luong: item.Luong,
                            ChucVu: item.ChucVu,
                            Id_Quyen: item.Id_Quyen,
                            UserName: item.UserName,
                            Status: item.Status==true?"<span class=\"label label-success\"> Active</span>":"<span class=\"label label-danger\">Locked<span>"
                        });
                    });
                    $('#tblData').html(html);
                    nhanvienController.paging(response.total, function () {
                        nhanvienController.loadData();
                    }, changePageSize);
                    nhanvienController.registerEvent();
                }
            }
        })
    },
    paging:function(totalRow,callback,changePageSize)
    {
        var totalPage = Math.ceil(totalRow / nhanvienconfig.pageSize);


        //Unbind pagination if it existed or click change pagesize
        if ($('#pagination a').length === 0 || changePageSize === true) {
            $('#pagination').empty();
            $('#pagination').removeData("twbs-pagination");
            $('#pagination').unbind("page");
        }

        $('#pagination').twbsPagination({
            totalPages: totalPage,
            first:"Đầu",
            next:"Tiếp",
            last:"Cuối",
            prev:"Trước",
            visiblePages: 7,
            onPageClick: function (event, page) {
                //$('#page-content').text('Page ' + page);
                nhanvienconfig.pageIndex = page;
                setTimeout(callback,200);
            }
        });
    }

}
nhanvienController.init();