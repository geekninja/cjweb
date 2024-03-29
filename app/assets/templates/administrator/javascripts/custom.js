$(document).ready(function(){
  $('.date').mask("00/00/0000", {placeholder: "__/__/____"});

  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'Nenhum resultado encontrado'
  })
})
  

jQuery(function() {
  $('form').on('click', '.remove_fields', function(event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });
  return $('form').on('click', '.add_fields', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
});