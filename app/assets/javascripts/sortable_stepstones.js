$(function() {
  $('.sortable').sortable();

  $('.sortable').on('sortupdate', function(e, ui) {
    $('.edit_adventure').submit();
    // ids = [];
    // for( li of  e.target.children ) {
    //   ids.push( li.id.replace('stepstone_',''));
    // }
    // console.log( JSON.stringify(ids) );
    // $.post('', function( JSON.stringify(ids) ))
  });
});