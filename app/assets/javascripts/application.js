// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.turbolinks
//= require social-share-button
//= require sweet-alert
//= require sweet-alert-confirm


function alertMessage()
{
	$( ".alert-error" ).hide();
	$( ".alert-success" ).hide();
  	$( ".alert-error" ).fadeIn(500).delay( 3000 ).fadeOut( 500 );
  	$( ".alert-success" ).fadeIn(500).delay( 3000 ).fadeOut( 500 );
}
$(document).ready(function() {

  $.ajax({
    type:"GET",
    url:"orders/test",
    dataType:"json",
    data: {some_parameter: 'hello'},
    success:function(result){
      alert(result);
    }
  })

  var fontsize = 100;
  $(".tables-content").hide(0);
	$("."+"products").hide(200);

    $(".category").click(function(event) {
        $("#"+event.target.id + "-products").toggle(200);
    });

    $(".toggle-hide").click(function(event){
      $("#"+event.target.id + "-content").toggle(200);
    });

    // ACCESSIBILITY //
    $(".bigger").click(function(){
      // var fontSize = parseInt($("#container").css("font-size"));
      fontsize = parseInt(fontsize);
      fontsize = fontsize + 10 + "%";
      $("#container").css({'font-size':fontsize});
    });

    $(".smaller").click(function(){
      fontsize = parseInt(fontsize);
      fontsize = fontsize - 10 + "%";
      $("#container,#product").css({'font-size':fontsize});
    });
});

jQuery(function() {
  $.ajax({
    type:"GET",
    url:"orders/test",
    dataType:"json",
    data: {some_parameter: 'hello'},
    success:function(result)
    {
      alert(result);
    }
  })
});
$("#modal_trigger").click(function(){
     leanModal();
});

(function($){$.fn.extend({leanModal:function(options){var defaults={top:100,overlay:0.5,closeButton:null};var overlay=$("<div id='lean_overlay'></div>");$("body").append(overlay);options=$.extend(defaults,options);return this.each(function(){var o=options;$(this).click(function(e){var modal_id=$(this).attr("href");$("#lean_overlay").click(function(){close_modal(modal_id)});$(o.closeButton).click(function(){close_modal(modal_id)});var modal_height=$(modal_id).outerHeight();var modal_width=$(modal_id).outerWidth();
$("#lean_overlay").css({"display":"block",opacity:0});$("#lean_overlay").fadeTo(200,o.overlay);$(modal_id).css({"display":"block","position":"fixed","opacity":0,"z-index":11000,"left":50+"%","margin-left":-(modal_width/2)+"px","top":o.top+"px"});$(modal_id).fadeTo(200,1);e.preventDefault()})});function close_modal(modal_id){$("#lean_overlay").fadeOut(200);$(modal_id).css({"display":"none"})}}})})(jQuery);
