$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}

//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}

//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
  var message = link.data("confirm");
  swal({
    title: message,
    type: 'warning',
    confirmButtonText: 'Chắc chắn',
    confirmButtonColor: '#2acbb3',
    showCancelButton: true,
    cancelButtonText: 'Hủy bỏ',
  }).then(function(e){
    $.rails.confirmed(link);
  });
};
