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

  $('a[class="active"').click(function() {
    console.log('hahaha');
  })

  $('#root_path').click(function() {
    localStorage.removeItem('category_id')
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
