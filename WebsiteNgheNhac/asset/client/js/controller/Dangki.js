$(document).ready(function () {

    $('#btnSubmit').off('click').on('click', function () {
        debugger;
        var username = $('#TaiKhoan').val();
        var password = $('#MatKhau').val();
        var replyPass = $('#ReplyTaiKhoan').val();
        var email = $('#Email').val();
        if (username == '' || password == '' || replyPass==''||email=='') {
            $('#lblError').text('Bạn phải nhập đầy đủ thông tin!!!');
            return;
        }
        if (password != replyPass)
        {
            $('#lblError').text('Mật khẩu phải giống nhau');
            return;
        }
        var obj = {
            TaiKhoan: username,
            MatKhau: password,
            Email: email
        };
        $.ajax({
            type: "POST",
            url: '/TrangChu/Dangki',
            dataType: 'json',
            data: obj,
            success: function (res) {
                debugger;
                if (res.status === false) {

                    $('#lblError').text('Tài khoản đăng nhập không đúng!!');
                }
                else {
                    alert('Bạn đã đăng kí thành công!!')
                    $('#TaiKhoan').html = '';
                    $('#MatKhau').html = '';
                    $('#ReplyTaiKhoan').html = '';
                    $('#Email').html = '';
                    $('#CaptchaCode').html = '';
                }
            }
        })
    });
});