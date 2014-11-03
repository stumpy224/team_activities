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
  $( "#member_identifier" ).blur( function() {
    var acid = $( '#member_identifier' ).val();
    if ( acid.length > 0 ) {
      $.ajax ({
        url: '/?acid=' + acid ,
        type: 'GET',
        dataType: 'script',
        success: function( member_name ){
          alert( member_name );
        },
        error: function(){

        }
      });
    }
  });

  $( "#submit_votes" ).click( function() {
    submitVotes();
  });
});


$(function () {
  $( ".source, .target" ).sortable({
    connectWith: ".connected"
  });
});

function submitVotes() {
  var items = [];
  $( "ul.target" ).children().each( function() {
    var item = {restaurant: $( this ).text()};
    items.push( item );
  });
  var jsonData = JSON.stringify( items );           
  $.ajax ({
    url: "/submit",
    type: "PUT",
    data: jsonData,
    dataType: "json",
    contentType: "application/json; charset=utf-8",
    success: function(){},
    error: function(){}
  });
};
