$(document).ready(function() {
     
    $(".newsSideLinkZone").mouseenter(function () {
        $('.newsSideTitleActive').removeClass('newsRmOpacity');
        $(this).children('.newsSideTitleActive').addClass('newsRmOpacity');
    }).mouseleave(function () {
        $('.newsSideTitleActive').removeClass('newsRmOpacity');
    });
    onloadSetTextSize();
});


function news_ajax(news_page){
    $('.newsPager').remove();
    $('.loadingAjax').show("slow");
    $.ajax({
        mode: "abort",
        port: "news_ajax",
        data: 'GET',
        url: news_page+'#'+Math.floor((Math.random()*100000)+100),
        data: {},
        success: function(data) {
            $('.newsAjaxContent').html(data).removeClass('newsAjaxContent');
        }
    });
}



var defaulTextSizeTitle=26,defaulTextSizeNew=11,textSizeTitle=26,textSizeNew=11;

function moreText(){
    textSizeTitle+=1;
    textSizeNew+=1;
    applyTextSize();
    return false
}
function normalText(){
    textSizeTitle=defaulTextSizeTitle;
    textSizeNew=defaulTextSizeNew;
    applyTextSize();
    return false
}
function lessText(){
    textSizeTitle-=1;
    textSizeNew-=1;
    applyTextSize();
    return false
}
function applyTextSize(){
    jQuery(".newTitle").css("font-size",textSizeTitle+"px");
    jQuery(".newText").css("font-size",textSizeNew+"px")
}

function onloadSetTextSize(){
    textSizeTitle=parseInt($('.newTitle').css('fontSize'));
    textSizeNew=parseInt($('.newText').css('fontSize'));
    if(!textSizeTitle||!textSizeNew){
        if(!textSizeTitle){
            textSizeTitle=defaulTextSizeTitle;
        }
        if(!textSizeNew){
            textSizeNew=defaulTextSizeNew;
        }
        return
    }
    applyTextSize();
}
