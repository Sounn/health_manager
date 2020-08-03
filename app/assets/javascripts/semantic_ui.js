$('#move-sidebar').click(function() {
  $('.ui.sidebar').sidebar('toggle');
});
$('.dropdown').dropdown();

$('.message .close')
.on('click', function() {
  $(this)
    .closest('.message')
    .transition('fade')
  ;
});