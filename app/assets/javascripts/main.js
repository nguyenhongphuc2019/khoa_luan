$(document).ready(function()  {
  $('#owl-1').owlCarousel({
    loop:true,
    nav:true
  });

  $('#owl-2').owlCarousel({
    autoWidth:true,
  });

  $('.collapsed').click(function() {
    var category_id = $(this).attr('data-category');
    localStorage.setItem('category_id', category_id);
  })

  $('#root_path').click(function() {
    localStorage.removeItem('category_id')
  })

  $(".document").click(function() {
    var document_id = $(this).data("document-id")
    var user_id = $(this).data("user-id")
    var data = {document_id: document_id, user_id: user_id}
    var url = "http://localhost:3000/document_trackings"
    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'jsonp',
      data: data
    })
  })
})

window.onload = function() {
  var category_id = localStorage.getItem('category_id');
  display_category(category_id);
};

var display_category = (category_id) => {
  $('a[data-category="' + category_id + '"]').addClass('active');
  $('#subCategory-'.concat(category_id)).addClass('in');
}

