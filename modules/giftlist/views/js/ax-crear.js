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
    init: function(){
        $(document).ready(function(){
            var dateText = $('#event_date');
            dateText.datetimepicker({
                 minDate:'-1969/12/31',
                 format:"d/m/Y H:i",
                 mask: dateText.val() == "" ? true : false
            });
            ax_admin.validate();
            $('#tel').mask("000-00-00", {placeholder: "___-__-__"});
            $('#cel').mask("000-000-0000", {placeholder: "___-___-____"});
        });
    },
    validate: function(){
        $.validator.addMethod("selectRequired",function(value,element){
            return value != 0;
        }, "El campo es requerido");

        $.validator.addMethod("guestNumber",function(value,element){
            return value > 1;
        }, "El valor ingresado en este campo debe ser un número entero mayor que 1.");

        $.validator.addMethod("noSpaceStart", function(value, element) {
            return value.indexOf(" ") != 0;
        }, "El campo es requerido");

        $.validator.addMethod("noSpaceEnd", function(value, element) {
            return value.lastIndexOf(" ") != value.length - 1;
        }, "El campo es requerido");
        $.validator.addMethod("noTodayDate", function(value, element) {
            var pattern = /(\d{2})\/(\d{2})\/(\d{4})/;
            var t = new Date(value.replace(pattern,'$3-$2-$1'));
            var now = new Date();
            return (dates.compare(t,now) == 1 ? true : false);
        }, "La fecha seleccionada en este campo debe ser posterior a la fecha actual.");

        $("#frmSaveList").validate({
            lang: 'es',
            rules:{
                name: {
                    required:true,
                    noSpaceStart:true,
                    noSpaceEnd:true
                },
                event_type: "selectRequired",
                event_date: {
                    required:true,
                    noSpaceStart:true,
                    noSpaceEnd:true,
                    noTodayDate:true
                },
                guest_number: {
                    required: true,
                    number:true,
                    guestNumber:true
                },
                message: {
                    maxlength:1000
                },
                city:{
                    required:true,
                    noSpaceStart:true,
                    noSpaceEnd:true
                },
                town:{
                    required:true,
                    noSpaceStart:true,
                    noSpaceEnd:true
                },
                tel:{
                    required:true,
                    noSpaceStart:true,
                    noSpaceEnd:true
                },
                cel:{
                    required:true,
                    noSpaceStart:true,
                    noSpaceEnd:true
                }
            },
            message:{
                required:"El campo es requerido"
            }/*,
            submitHandler: function(form) {
                $(form).submit();
            }*/
        });
    }
};

ax_admin.init();