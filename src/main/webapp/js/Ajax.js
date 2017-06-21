/**
 * Created by Jason on 21/06/2017.
 */
function remindNewForum() {
    $.ajax({
        url: '/remindNewForum.do',
        type: "POST",//请求方式：get或post
        scriptCharset: 'utf-8',
        dataType: "json",//数据返回类型：xml、json、script
        cache: false,
        data: {
            'currentDateTime': $("input[name=visitTime]").val()
        },//自定义提交的数据
        success: function (json) {
            if (json !== null || json !== undefined || json !== '') {
                if (json[0].flag == 'Y' ) {
                    if ( $(".remindNewForum").length <= 0 ) {
                        $(".content")[0].innerHTML = '<div class="remindNewForum" onclick="getNewForum();">有新回复的主题,点击查看</div>' + $(".content")[0].innerHTML
                    }
                }
            }
        },
        error: function (json) {
            alert("This is Error!")
        }
    })
}