// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(function(){
  $(".toggle-removed").click(function(){
    $.post($(this).data('path'), function(data) {
      $("#player-false-" + data.player).toggleClass('error');
      if (data.removed) {
        $("#toggle-player-removed-" + data.player).text('Unpick');
      } else {
        $("#toggle-player-removed-" + data.player).text('Picked');
      }
    });
    return false;
  });

  $(".toggle-marked").click(function(){
    $.post($(this).data('path'), function(data) {
      $("#player-false-" + data.player).toggleClass('success');
      if (data.marked) {
        $("#toggle-player-marked-" + data.player).text('Unmark');
      } else {
        $("#toggle-player-marked-" + data.player).text('Mark');
      }
    });
    return false;
  });
})
