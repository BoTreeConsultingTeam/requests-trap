______________________

                             REQUESTS-TRAP

                         FIREFIELD TEST PROJECT
                         ______________________


Table of Contents
_________________

1 description
2 How it works
3 request


1 description
=============

  A tool for capture and display http requests.

  This will be useful during integration with external services, http
  clients, webhooks, whatever. For example, we are developing an
  ecommerce site named "fireshop" with paypal integration, paypal sends
  notifications to an endpoint on your app, you can tell paypal to use
  an url in his tool to see the requests during development.

  We can give paypal this url:

  ,----
  | http://requests-trap.com/fireshop
  `----

  And we could see the IPN notifications send by paypal here:

  ,----
  | http://requests-trap.com/fireshop/requests
  `----


2 How it works
==============

  The app has three routes:

  ,----
  | /                       # splash page with some instructions
  | /:trap_id               # send requests to be captured here
  | /:trap_id/requests      # display requests here
  | /:trap_id/requests/:id  # display a single request here
  `----

  Any request [POST, PUT, GET, DELETE, ...] made to /:trap_id will be
  saved in the db and displayed in /:trap_id/requests

  In response to any request made to /:trap_id, we  will respond with the
  correct http code if success or not.

  In /:trap_id/requests we should see the trap_id in the header, and a
  list of the received requests, ordered by creation date DESC.

  Each request item should display all the information contained in the
  request, well formatted:

  - request date
  - remote ip
  - request-method
  - scheme
  - query-string
  - query-params
  - cookies
  - headers
  - ...

  Also include a copy of the raw response, hidden by default, open
  clicking a link.

  New requests should appear on the page in real time, without a page
  refresh.