(function() {
  $(function() {
    return $('.user_manual a[href^="#"]').on('click', function(e) {
      var $target;
      e.preventDefault();
      $target = $("a[name=" + ($(this).attr('href').split('#')[1]) + "]");
      return $("html, body").animate({
        scrollTop: $target.offset().top - '85'
      }, 200);
    });
  });

}).call(this);
