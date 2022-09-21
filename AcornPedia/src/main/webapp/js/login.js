/*
 * ajax 활용하여 로그인하는 javaScript
 */
$(function() {
            $('#submitBtn').mouseenter(function() {
                $(this).css('cursor','pointer') ;
            }).mouseout(function() {
                $(this).css('cursor','normal') ;
            }).click(function() {
                submitCheck() ;
            }) ;
        }) ;
        
        function submitCheck() {
            var id  = $('#id' ).val() ;
            var Pwd = $('#pwd').val() ;
            $.ajax({
                type : "POST",
                url: 'login.do',
                data: {id:id, pwd:pwd},
                success: function(data) {
                    if(data == "false")
                        alert('잘못된 아이디이거나, 비밀번호가 틀렸습니다.') ;
                    else
                        location.href="${contextPath}" ; // home.do로 돌아가시면 됩니다.
                }
            }) ;
        }
        
        $('.loginInput').keydown(function(key) {
            if(key.keyCode == 13) {
                $('#submitBtn').click() ;
            }
        }) ;