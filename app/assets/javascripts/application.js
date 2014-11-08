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
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(function() {
  $("#member_identifier").blur(function() {
    var acid = $('#member_identifier').val();
    if (acid.length > 0) {

      $.getJSON('/' + acid, function( member ) {
        var items = [];
        $.each( member, function( key, val ) {
          if (key == 'id')
            $('#member_id').val(val);
          if (key == 'name')
            $('#member_name').text(val);
        });
      });
    }
  });

  $(".source, .target").sortable({
    connectWith: ".connected"
  });

  $( "#voting_form" ).submit(function( event ) {
    event.preventDefault();
    submitVotes();
  });
});

function submitVotes() {
  if ($('#restaurant_selections li').length > 3) {
    $('#modal_informative_title h4').text('Only the top 3 restaurants will be counted.');
    $('#modal_informative_button').text('Got It!');
    $('#modal_informative').modal('show');
  }

  var items = [];
  var count = 0;
  $('#restaurant_selections').children().each( function() {
    count++;
    var item = {restaurant: $(this).text()};
    if (count <= 3)
      items.push(item);
  });

  var data = {
    member_id: $('#member_id').val(),
    restaurants: items
    // wants_dinner:
  }

  $.post('/submit_votes', data, function(isSuccessful) {
    // $('#modal_wait').foundation('reveal', 'close');

    // if (isSuccessful == 'true') {
    //   $('#user_alert span').text('Contact preferences have been updated.');
    //   $('#user_alert').addClass('success').removeClass('alert');
    // }
    // else {
    //   $('#user_alert span').text('Contact preferences could not be updated.');
    //   $('#user_alert').addClass('alert').removeClass('success');
    // }

    // $('#user_alert').css('display', 'inline-block');
  });
};
