var ax = {
    init: function(){
        $(document).ready(function(){
            var dateText = $('#event_date');
            dateText.datetimepicker({
                 minDate:'-1969/12/31',
                 format:"d/m/Y H:i",
                 mask: dateText.val() == "" ? true : false
            });
            ax.validate();
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
            var t = new Date(value);
            var now = new Date();
            return t.getDay != now.getDate && t.getMonth != now.getMonth && t.getYear != now.getYear;
        }, "La fecha seleccionada en este campo debe ser posterior a la fecha actual.");

        $("#frmSaveList").validate({
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

ax.init();