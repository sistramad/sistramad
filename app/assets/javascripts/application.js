// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require jquery.Jcrop
//= require app
//= require bootstrap-sprockets

//= require jquery.filer
//= require magnific-popup
//= require jquery.slimscroll
//= require moment-with-locales
//= require bootstrap-material-datetimepicker

//= require_tree .



$(document).ready(function() {
    $('.has-tooltip').tooltip();
});

$(document).ready(function() {
  $('.has-tooltip').tooltip();
  $('#date-es').bootstrapMaterialDatePicker({
      format: 'DD/MM/YYYY',
      lang: 'es',
      time: false,
      weekStart: 0,
      cancelText: 'Cancelar'
  });
  $('#date-es1').bootstrapMaterialDatePicker({
      format: 'DD/MM/YYYY',
      lang: 'es',
      time: false,
      weekStart: 0,
      cancelText: 'Cancelar'
  });
});

$(function () {
  $('.popup-modal').magnificPopup({
      type: 'inline',
      preloader: false,
      focus: '#username',
      modal: true
  });
  $(document).on('click', '.popup-modal-dismiss', function (e) {
      e.preventDefault();
      $.magnificPopup.close();
  });
});

$(function () {
    
         $('.add_child').click(function() {
            var association = $(this).attr('data-association');
            var target = $(this).attr('target');
            var regexp = new RegExp('new_' + association, 'g');
            var new_id = new Date().getTime();
            var Dest = (target == '') ? $(this).parent() : $(target);
            Dest.append(window[association+'_fields'].replace(regexp, new_id));
            return false;
          });
    
          $(document).delegate('.remove_child','click', function() {
            $(this).parent()
            $(this).parent().children('.removable')[0].value = 1;
            $(this).parent().hide();
            return false;
          });
    });

var hide_spinner = function(){
  $('#spinner').hide();
}

var show_spinner = function(){
  $('#spinner').show();
}

$(document).ready(function() {
  $('#sandbox-container input').datepicker({
    language: 'es'
  });
});
