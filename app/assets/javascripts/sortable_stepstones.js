$(function() {
  $('.sortable').sortable();

  $('.sortable').on('sortupdate', function(e, ui) {
    $('.edit_adventure[action*=sort]').submit();
  });
});