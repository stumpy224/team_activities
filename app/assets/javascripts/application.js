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
//= require moment
//= require turbolinks
//= require ie-placeholder-shim
//= require_tree .

$(document).on("page:change", function() {
  return init();
});

$(function() {
  // init();
});

function init() {
  $("#member_identifier").blur(function() {
    var acid = $('#member_identifier').val();
    if (acid.length > 0) {
      $.getJSON('/get_member/' + acid, function(member) {
        $('#member_id').val(member[0]['id']);
      });
    }
  });

  $(".source, .target").sortable({
    connectWith: ".connected"
  });

  $("#voting_form").submit(function(e) {
    e.preventDefault();
    e.stopImmediatePropagation();
    submitFormAfterValidation();
  });

  $("#close_member_already_voted_modal").click(function() {
    location.reload();
  });

  if (window.location.pathname == '/') {
    setCurrentLinkToVote();
  } else {
    setCurrentLinkToResults();
  }

  showTimeLeftToVote();
}

function showTimeLeftToVote() {
  var cutoffDate = $('#cutoff_at').text();
  var cutoffDateWithoutTimeZone = cutoffDate.substring(0, cutoffDate.indexOf(' -0500'));
  var cutoffDateMoment = moment(cutoffDateWithoutTimeZone);
  
  if (cutoffDateMoment <= new Date()) {
    $('#countdown_alert').hide();
  }

  $('#countdown_alert').countdown(cutoffDateMoment.toDate(), function(event) {
    $(this).html(event.strftime('<strong>%D d %H:%M:%S</strong>')
      + ' until results are official.');
  });
}

function setCurrentLinkToVote() {
  $('#nav_link_to_vote').addClass('active');
  $('#nav_link_to_results').removeClass('active');
}

function setCurrentLinkToResults() {
  $('#nav_link_to_results').addClass('active');
  $('#nav_link_to_vote').removeClass('active');
}

function submitFormAfterValidation() {
  if (isMemberFound() && isMealTypeSelected()) {
    submitVotes();
  }
}

function isMemberFound() {
  if($('#member_id').val()) {
    return true
  } else {
    showInformativeModal('Please enter your E-Business ACID.', 'Close');
    return false;
  }
};

function isMealTypeSelected() {
  if ($("#lunch_radio").is(":checked") || $("#dinner_radio").is(":checked")) {
    return true;
  } else {
    showInformativeModal('Please select a meal option.', 'Close');
    return false;
  }
}

function submitVotes() {
  if ($('#restaurant_selections li').length > 3) {
    showInformativeModal('Only three restaurants can be selected.', 'Close');
    return false;
  } else if ($('#restaurant_selections li').length == 0) {
    showInformativeModal('Please select at least one restaurant.', 'Close');
    return false;
  }

  var selections = [];
  var count = 0;
  $('#restaurant_selections li a').each( function() {
    count++;
    var selection = $(this).attr('data-nomination-id');
    if (count <= 3) {
      selections.push(selection);
    }
  });

  var data = {
    member_id: $('#member_id').val(),
    restaurant_selections: selections,
    dinner_indicator: $('#dinner_radio').is(':checked')
  }

  $.post('/submit_votes', data, function() {});
}

function showInformativeModal(message, buttonText) {
  $('#modal_informative_title h4').text(message);
  $('#modal_informative_button').text(buttonText);
  $('#modal_informative').modal('show');
}

function showMemberAlreadyVotedModal() {
 $('#modal_member_already_voted').modal('show'); 
}

$(document).keypress(function(e) {
  if (e.which == 13) {
    e.preventDefault();
    e.stopImmediatePropagation();
    submitFormAfterValidation();
  }
});
