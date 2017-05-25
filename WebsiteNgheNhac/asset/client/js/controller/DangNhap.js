$(document).ready(function () {
    
    $('#btnSubmit').off('click').on('click', function () {
        var username = $('#txttaikhoan').val();
        var password = $('#txtPassword').val();
        var remember = $('#ckbRemember').is(':checked') ? true : false;
        if (username == '' || password == '') {
            $('#lblError').text('Tài khoản và mật khẩu không thể bỏ trống');
            return;
        }
        $.ajax({
            type: "POST",
            url: '/TrangChu/Dangnhap',
            dataType: 'json',
            data: { 'Username': username, 'Password': password, 'RememberPass': remember },
            success:function(res)
            {
                if (res.status == false)
                {
                    $('#lblError').text('Tài khoản đăng nhập không đúng!!');
                }
                else
                {
                    $('.sign-in').html('Đăng kí');
                    window.location.href = '/TrangChu/Index';
                }
            }
        })
    });
});