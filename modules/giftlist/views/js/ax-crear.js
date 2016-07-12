var dates = {
    convert:function(d) {
        // Converts the date in d to a date-object. The input can be:
        //   a date object: returned without modification
        //  an array      : Interpreted as [year,month,day]. NOTE: month is 0-11.
        //   a number     : Interpreted as number of milliseconds
        //                  since 1 Jan 1970 (a timestamp) 
        //   a string     : Any format supported by the javascript engine, like
        //                  "YYYY/MM/DD", "MM/DD/YYYY", "Jan 31 2009" etc.
        //  an object     : Interpreted as an object with year, month and date
        //                  attributes.  **NOTE** month is 0-11.
        return (
            d.constructor === Date ? d :
            d.constructor === Array ? new Date(d[0],d[1],d[2]) :
            d.constructor === Number ? new Date(d) :
            d.constructor === String ? new Date(d) :
            typeof d === "object" ? new Date(d.year,d.month,d.date) :
            NaN
        );
    },
    compare:function(a,b) {
        // Compare two dates (could be of any type supported by the convert
        // function above) and returns:
        //  -1 : if a < b
        //   0 : if a = b
        //   1 : if a > b
        // NaN : if a or b is an illegal date
        // NOTE: The code inside isFinite does an assignment (=).
        return (
            isFinite(a=this.convert(a).valueOf()) &&
            isFinite(b=this.convert(b).valueOf()) ?
            (a>b)-(a<b) :
            NaN
        );
    },
    inRange:function(d,start,end) {
        // Checks if date in d is between dates in start and end.
        // Returns a boolean or NaN:
        //    true  : if d is between start and end (inclusive)
        //    false : if d is before start or after end
        //    NaN   : if one or more of the dates is illegal.
        // NOTE: The code inside isFinite does an assignment (=).
       return (
            isFinite(d=this.convert(d).valueOf()) &&
            isFinite(start=this.convert(start).valueOf()) &&
            isFinite(end=this.convert(end).valueOf()) ?
            start <= d && d <= end :
            NaN
        );
    }
};


var ax_admin = {
    form: '',
    init: function(){
        $(document).ready(function(){
            // Select your input element.
            var guest_number = document.getElementById('guest_number');
            var min_amount = document.getElementById('min_ammount');

            // Listen for input event on numInput.
            guest_number.onkeydown = ax_admin.negative// Listen for input event on numInput.
            min_amount.onkeydown = ax_admin.negative;
            ax_admin.validate();
            $("#city").on('change',function(){
                ax_admin.setTown($("#city option:selected").val());
                $("#town").trigger("chosen:updated");
            });
            $("select").on('change',function(){
                $(this).parent().find("label.error").remove();
            });
            $(".ax-next").on('click',function(){
                ax_admin.changeTab();
            });
            
            $(".ax-prev").on('click',function(){
                ax_admin.prevTab();
            }); 
            
            $(".ax-save").on('click',function(){
                ax_admin.saveList();
            });
            
            $("#ax-img-prof").click(function(){
                $("#image-prof").trigger("click");
            });
            
            $("#ax-img").click(function(){
                $("#image-p").trigger("click");
            });
            
            $("input[type=file]").on('change',function(){
                ax_admin.uploadMsg($(this));
            });
            
            $("a[role=tab]").on('shown.bs.tab',function(){
                var tab = $(".tab-pane.active").attr("data-tab-id");
                $(this).parent().removeClass("active");
                $("#step"+tab).addClass("active");
            });
            
            $("input[name=list_type]").on('click', function(){
                if($("#list_type:checked").val() == "1"){
                    $(".ax-message-private").addClass("hidden");
                    $(".ax-message-public").removeClass("hidden");
                }
                else{
                    $(".ax-message-public").addClass("hidden");
                    $(".ax-message-private").removeClass("hidden");
                }
            });
            
            $("#cocreator").click(function(){
                if($(this).attr('checked') == "checked")
                    $("#cocreator-div").removeClass("hidden");
                else
                    $("#cocreator-div").addClass("hidden");
            });
            
            $("#recieve_bond").click(function(){
                if($(this).attr('checked') == "checked")
                    $("#ammount_div").removeClass("hidden");
                else
                    $("#ammount_div").addClass("hidden");
            });
        });
    },
    uploadMsg:function(el){
        var msg = $("<span>").addClass("ax-up-msg").text("Imagen cargada con éxito.");
        if(!el.parent().parent().parents(".col-md-6").find(".ax-up-msg").length)
            el.parent().parent().parents(".col-md-6").append(msg);
    },
    validateSelect : function(element){
        var ret = true;
        $("select").each(function(){
            if($(this).val() === "0"){
                $(this).parent().append('<label id="event_type-error" class="error">El campo es requerido</label>');
                ret = false; 
            }
        });
        return ret;
    },
    setTown: function (id_state){
	   var states = countries[id_state].states;
        $("#town").empty().append($('<option>', {
            value: 0,
            text: "Seleccione una opción"
        }));
        for(i = 0; i < states.length; i++){
            $('#town').append($('<option>', {
                value: states[i].name,
                text: states[i].name
            }));
            $("#town_chosen .chosen-drop .chosen-results").append('<li class="active-result" data-option-array-index="'+states[i].name+'">'+states[i].name+'</li>');
        }
    },
    prevTab: function(){
         var active = $(".nav-tabs li.active a");
         var prev = parseInt(active.parent().attr("data-id")) - 1;
         $("#step"+prev+" a").attr("href","#step-"+prev);
         $("#step"+prev+" a").tab("show");
    },
    saveList: function(){
        if(!ax_admin.form.form())
            return;
        var data = new FormData();
        $.each($("#image-p")[0].files, function(i, file) {
            data.append('image-p', file);
        });
        $.each($("#image-prof")[0].files, function(i, file) {
            data.append('image-prof', file);
        });
        var formData = $("#frmSaveList").serialize();
        data.append("form",formData);
        data.append("ajax",true);
        data.append("method",'saveList');
        $.ajax({
            type: 'POST',
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            data:data,
            success: function(res){
                res = JSON.parse(res);
                if(res.error)
                    console.log(res.msg);
                else
                    window.location.href = res.url;
            }
        });
    },
    negative: function(e) {
        if(!((e.keyCode > 95 && e.keyCode < 106)
          || (e.keyCode > 47 && e.keyCode < 58) 
          || e.keyCode == 8)) {
            return false;
        }
    },
    changeTab:function(){
        var active = $(".nav-tabs li.active a");
        var next = parseInt(active.parent().attr("data-id")) + 1;
        
        if(ax_admin.form.form()){
            if(!ax_admin.validateSelect())
                return;
            if($(".tab-pane.active").attr("data-tab-id") === "1"){
                var dir = $("#address").val();
                $("#dir_after").val(dir);
                $("#dir_before").val(dir);
            }
            if($(".tab-pane.active").attr("data-tab-id") === "2"){
                var lname = $("#name").val();
                $("#url").val(ax_admin.convertToSlug(lname));
            }
            

            $("#step"+next+" a").attr("href","#step-"+next);
            $("#step"+next+" a").tab("show");
        }else{
            ax_admin.validateSelect();
        }
    },
    convertToSlug: function (Text)
    {
    return Text
        .toLowerCase()
        .replace(/[^\w ]+/g,'')
        .replace(/ +/g,'-')
        ;
    },
    validate: function(){
        $.validator.addMethod("selectRequired",function(value,element){
            return value != 0;
        }, "El campo es requerido");

        $.validator.addMethod("guestNumber",function(value,element){
            return value > 1;
        }, "El valor ingresado en este campo debe ser un número entero mayor que 1.");
        
        $.validator.addMethod("isvalidEmail",function(value,element){
            var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
            return pattern.test(value);
        }, "Por favor, escribe una dirección de correo válida.");

        $.validator.addMethod("noTodayDate", function(value, element) {
            var pattern = /(\d{2})\/(\d{2})\/(\d{4})/;
            var t = new Date(value.replace(pattern,'$3-$2-$1'));
            var now = new Date();
            return (dates.compare(t,now) == 1 ? true : false);
        }, "La fecha seleccionada en este campo debe ser posterior a la fecha actual.");

        ax_admin.form = $("#frmSaveList").validate({
            lang: 'es',
            rules:{
                name: {
                    required:true,
                },
                firstname: {
                    required:true,
                },lastname: {
                    required:true,
                },
                event_type: {
                    selectRequired: true,
                },
                guest_number: {
                    min : 1,
                    required: true,
                    number:true,
                    guestNumber:true
                },
                message: {
                    maxlength:1000
                },
                country:"selectRequired",
                city:"selectRequired",
                town:"selectRequired",
                tel:{
                    required:true,
                },
                cel:{
                    required:true,
                },
                email:{
                    isvalidEmail:true,
                    required:true,
                },
                conf_email:{
                    isvalidEmail:true,
                    required:true,
                    equalTo: "#email"
                },
                address:{
                    required:true,
                },
                dir_before:{
                    required:true,
                },
                dir_after:{
                    required:true,
                },
                email_co:{
                    required:true,
                },
                min_ammount:{
                    required:true,
                },
                url:{
                    required:true,
                },
            },
            message:{
                required:"El campo es requerido"
            }
        });
    }
};

ax_admin.init();