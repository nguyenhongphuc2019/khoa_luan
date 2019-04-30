$(document).ready(function () {
  $('#owl-1').owlCarousel({
    loop: true,
    nav: true
  });

  $('#owl-2').owlCarousel({
    autoWidth: true,
  });

  $('#owl-3').owlCarousel({
    nav: false,
    items: 4
  });

  $('#owl-4').owlCarousel({
    nav: false,
    items: 4
  });

  $('.collapsed').click(function () {
    var category_id = $(this).attr('data-category');
    localStorage.setItem('category_id', category_id);
  })

  $('#root_path').click(function () {
    localStorage.removeItem('category_id')
  })

  $(".document").click(function () {
    var document_id = $(this).data("document-id")
    var user_id = $(this).data("user-id")
    var data = {
      document_id: document_id,
      user_id: user_id
    }
    var url = "http://localhost:3000/document_trackings"
    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'jsonp',
      data: data
    })
  })

  $(window).scroll(function () {
    url = $("a[rel*='next']").attr('href');
    if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
      $(".pagination").html('<img class="" width="200" height="100" src="/assets/load-more.gif" alt="Fetching more data..." title="Fetching more data......" />');
      $.getScript(url);
    }
  });

  toastr.options = {
    "closeButton": false,
    "debug": false,
    "newestOnTop": false,
    "progressBar": false,
    "positionClass": "toast-top-center",
    "preventDuplicates": false,
    "onclick": null,
    "showDuration": "30000",
    "hideDuration": "10000",
    "timeOut": "50000",
    "extendedTimeOut": "1000",
    "showEasing": "swing",
    "hideEasing": "linear",
    "showMethod": "fadeIn",
    "hideMethod": "fadeOut"
  }

  $('.js-select-main-major').select2({
    multiple: true
  });

  keywords = [];
  fetch('http://localhost:3000/keywords').then(function(response) {
    return response.json();
  }).then(function(data) {
    data.map(function(keyword) {
      keywords.push(keyword.name);
    })
  });
  $('#autocomplete').autocomplete({
    source: keywords
  });
})

window.onload = function () {
  var category_id = localStorage.getItem('category_id');
  display_category(category_id);
};

var display_category = (category_id) => {
  $('a[data-category="' + category_id + '"]').addClass('active');
  $('#subCategory-'.concat(category_id)).addClass('in');
}
