// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require ./form-master/jquery.form
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-slider
//= require cloudinary

  WebFontConfig = {
    google: { families: [ 'Architects+Daughter::latin', 'Fredericka+the+Great::latin', 'Cabin+Sketch::latin', 'Yellowtail::latin', 'Lato::latin', 'Poiret+One::latin', 'Lobster::latin', 'Kaushan+Script::latin', 'Lobster+Two::latin', 'Pinyon+Script::latin', 'Playball::latin', 'Tangerine::latin', 'Great+Vibes::latin', 'Special+Elite::latin', 'Rochester::latin', 'Allerta+Stencil::latin', 'Adamina::latin', 'Montez::latin', 'Cinzel+Decorative::latin', 'Lustria::latin', 'Seaweed+Script::latin', 'Vast+Shadow::latin', 'UnifrakturMaguntia::latin', 'Monoton::latin', 'Rye::latin', 'Monofett::latin', 'Dawning+of+a+New+Day::latin' ] }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })();

//adding faceboook buttons
/*(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v2.4";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));*/