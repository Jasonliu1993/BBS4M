/**
 * Created by Jason on 21/06/2017.
 */
function getReplyContent(replyContentid) {
    $.ajax({
        url: '/ajax/replyContentList.do',
        type: "POST",//请求方式：get或post
        scriptCharset: 'utf-8',
        dataType: "json",//数据返回类型：xml、json、script
        cache: false,
        data: {
            'id': replyContentid
        },//自定义提交的数据
        success: function (json) {
            if (json !== null || json !== undefined || json !== '') {
                var varBlock = '';
                var varList = '';
                varBlock = varBlock + '<span class="out-triangle" ></span>' +
                '<span class="reply-area-content">' +
                '<ul>' ;

                for (var i = 0; i < json.length; i++) {
                    varList = varList + '<li class="reply-area-core-content-list">' +
                        '<div class="reply-area-core-content">' +
                        '<div class="reply-area-content-title">' +
                        '<span class="reply-area-content-title-left">' +
                        '<span class="reply-area-content-title-avater">' +
                        '<img src="/images/getAvator.do?id=' + json[i].creater +'" />' +
                        '</span>' +
                        '<span class="reply-area-content-title-person">' + json[i].userAttribute.userName + '</span>' +
                        '</span>' +
                        '<span class="reply-area-content-title-right">' +
                        '<span class="reply-area-content-title-right-time">' + json[i].createTime + '</span>' +
                        '<span class="reply-area-content-title-right-reply-button">回复</span>' +
                        '</span>' +
                        '</div>' +
                        '<div class="reply-area-content-content">' +
                        json[i].content +
                        '</div>' +
                        '</div>' +
                        '</li>' ;
                }
                varBlock = varBlock + varList;

                varBlock = varBlock + '</ul>' +
                '<span class="reply-area-content-reply-content">' +
                '<div class="reply-area-content-content-textarea">' +
                '<textarea name="reply-content" id="reply-content" ></textarea>' +
                '</div>' +
                '<div class="reply-area-content-button">' +
                '<span class="reply-area-content-button-left">' +
                '<button>取消</button>' +
                '</span>' +
                '<span class="reply-area-content-button-right">' +
                '<button>评论</button>' +
                '</span>' +
                '</div>' +
                '</span>' +
                '</span>'



                $(".reply-area").html(varBlock);
            }
        },
        error: function (json) {
            alert("Request Error!")
        }
    })
}