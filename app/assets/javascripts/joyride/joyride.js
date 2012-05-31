// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require ./modernizr.foundation
//= require ./jquery.joyride-1.0.4
//= require_self

$().ready(function () {
    $("._joyride_tour").each(function (idx, item) {
        this_id = $(item).attr('id');
        console.log(this_id);
        $(window).joyride({
            'tipContent':"#" + this_id,
            'cookieMonster': $(item).attr('data-cookie-enabled') == "true",
            'tipAnimation': $(item).attr('data-animation'),
            'postRideCallback': function() { eval($(item).attr('data-post-tour-callback')) },
            'postStepCallback':  function(){ eval($(item).attr('data-post-step-callback')) }
        });
    });

});

