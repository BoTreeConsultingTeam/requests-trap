REFRESH_INTERVAL = 15000; // in milliseconds

// Reference: http://developmentmode.wordpress.com/2011/05/09/defining-custom-functions-on-jquery/
(function($) {
  refreshTrappedRequestsListing = function() {
    // .js is appended when requesting URL to make Rails render RJS template
    // (.js.haml)
    var url = location.href + ".js";
    $.get(url);
  };

}) (jQuery);

// Below used statement is the shortcut for jQuery(document).ready(function() {});
$(function() {

  if ($('#trappedRequestsListingContainer').length > 0) {
    setInterval("refreshTrappedRequestsListing();", REFRESH_INTERVAL);
  }

});