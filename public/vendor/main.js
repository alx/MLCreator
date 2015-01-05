$(document).ready(function(){

  $('.selectAll').click(function() {
    $('input[type=checkbox]').prop('checked', 'checked');
  });
  $('.deselectAll').click(function() {
    $('input[type=checkbox]').prop('checked', '');
  });

});
