
function news_ajax(target,url){


    $('#'+target).html('');
    $('#'+target).html("<center><img src='../modules/news/img/loading_mini.gif'></center>");
    $.ajax({
        mode: "abort",
        port: "news",
        type: "GET",
        data:{},
        url: url+'#'+Math.floor((Math.random()*100000)+100),
        success: function(data) {
                $('#'+target).html(data);
        },
        error:function( error ){
            // try get
            $.get(url, function(data){
                $('#'+target).html(data);
            });
        }
    });

}


function checkbox_tag(action,id){
    if(action=='r'){
        $('#check_tag_'+id).removeAttr('checked');
    }else{
        $('#check_tag_'+id).attr('checked','checked');
    }
}


function confirm_delete_tag(msg,url,id){
       if(confirm(msg)){
            $('#tag_img_'+id).attr("src","../modules/news/img/loading.gif");
            news_ajax('newsAjaxOut',url)
       }
}

function delete_tag(id){
        $('#list_tag_'+id).remove();
}

function add_tag(msg,default_lang){
    if($('.form_add_tag #body_tag_' +default_lang).val()==''){
        alert(msg); return false ;
    }
     $('.addTag').attr("src","../modules/news/img/loading.gif");
     return true ;
}
function add_remove_loading_tag(){
	 $('.form_add_tag input').each(function(index) {
		$(this).val('');
	 });
     $('.addTag').attr("src","../img/admin/add.gif");
}

function edit_tag(url, id){
    $('.tag_options').css('display','block');
    $('.div_edit_tag').remove();
    $('#list_tag_'+id).css('display','none');
    $('#list_tag_'+id).after('<div class="div_edit_tag" id="edit_tag_'+id+'"><center><img src="../modules/news/img/loading_mini.gif"></center></div>');
    news_ajax('edit_tag_'+id,url);
}

function save_edit_tag(msg){
    if($('.form_edit_tag input:first').val()==''){
        alert(msg); return false ;
    }
     $('.saveTag').attr("src","../modules/news/img/loading_mini.gif");
     return true ;
}




function checkbox_cat(action,id){
    if(action=='r'){
        $('#check_cat_'+id).removeAttr('checked');
    }else{
        $('#check_cat_'+id).attr('checked','checked');
    }
}


function confirm_delete_cat(msg,url,id){
       if(confirm(msg)){
            $('#cat_img_'+id).attr("src","../modules/news/img/loading.gif");
            news_ajax('newsAjaxOut',url)
       }
}

function delete_cat(id){
        $('#list_cat_'+id).remove();
}

function add_cat(msg,default_lang){
    if($('.form_add_cat #body_cat_' +default_lang+'').val()==''){
        alert(msg); return false ;
    }
     $('.addCat').attr("src","../modules/news/img/loading.gif");
     return true ;
}
function add_remove_loading_cat(){
	 $('.form_add_cat input').each(function(index) {
		$(this).val('');
	 });
     $('.addCat').attr("src","../img/admin/add.gif");
}

function edit_cat(url, id){
    $('.cat_options').css('display','block');
    $('.div_edit_cat').remove();
    $('#list_cat_'+id).css('display','none');
    $('#list_cat_'+id).after('<div class="div_edit_cat" id="edit_cat_'+id+'"><center><img src="../modules/news/img/loading_mini.gif"></center></div>');
    news_ajax('edit_cat_'+id,url);
}

function save_edit_cat(msg){
    if($('.form_edit_cat input:first').val()==''){
        alert(msg); return false ;
    }
     $('.saveCat').attr("src","../modules/news/img/loading_mini.gif");
     return true ;
}

function pos_cat(url, id){

    $('#newsCatContent').html('<center><img src="../modules/news/img/loading.gif"></center>');
    news_ajax('newsCatContent',url);
}

function submit_upload_imag(){
    $('#newsUploadStatusAjax').html('<center><div id="newsUploadStatusLoadind"></div><img class="newsUploadLoadingImg" src="../modules/news/img/loading_upload.gif"></center>');
 
}

function get_imgs_rel(url){

    $('#newsBlockImagsRel').html('<center><br><br><br><img src="../modules/news/img/loading.gif"></center>');
    news_ajax('newsBlockImagsRel',url);
}

function get_imgs_arq(url){

    $('#newsBlockImagsArq').html('<center><br><br><br><img src="../modules/news/img/loading.gif"></center>');
    news_ajax('newsBlockImagsArq',url);
}

function delete_imgs_arq(msg,url){
     if(confirm(msg)){
             get_imgs_arq(url);
       }
}

function submitformNew()
{
  document.fromNewUpdate.submit();
}
