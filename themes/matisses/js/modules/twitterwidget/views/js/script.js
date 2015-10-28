/*var li = $('.twitter-box ul li b');
	// получаем содержимое списков (сообщение)
	var vals = li.map(function(){
    	return $(this).text();	
	}).get();

	var li = $('.twitter-box ul li span');
	// получаем содержимое списков (дата)
	var vals2 = li.map(function(){
    	return $(this).text();	
	}).get();

	var len=vals.length-1;

	$('#twittcontent').append("<b>"+vals[0]+"</b> "+vals2[0]);

	var i=0;

	$('#nextTwittLink').click(function(event) {
	event.preventDefault();
	i++;
	if(i>len){
	i=0;
	}
	$('#twittcontent').text('').append("<b>"+vals[i]+"</b> "+vals2[i]);
	console.log(i);	
	});

	$('#prewTwittLink').click(function(event) {
	event.preventDefault();	
	i--;
	if(i==-1){
	i=len;	
	}
	$('#twittcontent').text('').append("<b>"+vals[i]+"</b> "+vals2[i]);
	console.log(i);	
});*/