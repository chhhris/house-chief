function init(){
  $('.datepicker').datepicker( {
      changeMonth: true,
      changeYear: true,
      showButtonPanel: true,
      dateFormat: 'MM yy',
      yearRange: 'c-30:c+5',
      monthNamesShort: $.datepicker.regional["en"].monthNames,
      onClose: function(dateText, inst) {
          var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
          var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
          $(this).datepicker('setDate', new Date(year, month, 1));
      }
  });
}

$(document).ready(function() {
  init();
});

