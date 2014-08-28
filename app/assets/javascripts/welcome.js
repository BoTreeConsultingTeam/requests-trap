// Reference: http://developmentmode.wordpress.com/2011/05/09/defining-custom-functions-on-jquery/
(function($) {

   elementAvailable = function(elementSelector) {
     return $(elementSelector).length > 0;
   };

   welcomePageSubscriberTrappingCodeInputSelector = function() {
      return '#wc_pg_trapping_code';
   };

   welcomePageSubscriberTrappedRequestsLinkSelector = function() {
      return '#wc_pg_trapped_requests_link';
   };

   updateWelcomePageSubscriberTrappedRequestsLinkHref = function() {
    if ( elementAvailable(welcomePageSubscriberTrappingCodeInputSelector()) &&
        elementAvailable(welcomePageSubscriberTrappedRequestsLinkSelector()) ) {

      var subscriberTrappingCode = $(welcomePageSubscriberTrappingCodeInputSelector()).val();
      var trappedRequestsLink = $(welcomePageSubscriberTrappedRequestsLinkSelector());

      if (subscriberTrappingCode.length > 0)  {
        var trappedRequestsLinkCurrentHref = trappedRequestsLink.attr('href');
        var trappedRequestsLinkUpdatedHref = trappedRequestsLinkCurrentHref.replace('xxx', subscriberTrappingCode);

        trappedRequestsLink.attr('href', trappedRequestsLinkUpdatedHref);
      } else {
        // If trapping code is blank, reset the link to default path
        trappedRequestsLink.attr('href', trappedRequestsLink.attr('data-default-path'));
      }
    }
   };

}) (jQuery);

// Below used statement is the shortcut for jQuery(document).ready(function() {});
$(function() {

  // Bind a blur event to Trapping Code field on Welcome Page for Individual
  // Subscriber and update the Requests Link dynamically.
  $(welcomePageSubscriberTrappingCodeInputSelector()).blur(function() {
    updateWelcomePageSubscriberTrappedRequestsLinkHref();
  });
});