$('.tbody').on('click', '.destroy', function() { 
  var id = $(this).data('id')    
  var childTr = $(this).closest('tr')  
  $.ajax({
    url: '/users/' + id,
    type: 'delete'
  })
  .done(function() {
    childTr.hide();
    $('.users-size').text((parseInt($('.users-size').text()) - 1)); 
  })
  return false;
})