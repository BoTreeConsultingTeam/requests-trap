______________________

                             REQUESTS-TRAP

                         FIREFIELD TEST PROJECT
                         ______________________


Table of Contents
_________________

1 the rules
2 description
3 How it works
4 deployment

1 the rules
=============

  When looking to grow our team at Firefield, we feel that reviewing a candidate's work is 
  absolutely critical. For us, reviewing commit history is the only way to really assess a
  developer's work. We understand that it's often hard to share code and a history of commits, 
  especially when working on private client projects under an NDA.

  We created this small project in order to help solve this issue - giving developers a chance
  to show us how they work. If you are interested in joining the Firefield team, we ask that
  you participate in this development exercise by following these guidelines:

    i.   clone this repo into your own private repo
    ii.  commit early and often with verbose descriptions
    iii. track the time spent developing the project
    iv.  as a guideline, note that this project shouldn't take more than xx hours
    v.   to be considered complete, your app should be deployed to Heroku
    vi.  when done, give read-only access to your repo to the user 'firefield'
    vii. Email the instructions for accessing the app on Heroku to jobs@firefield.com

  Once we receive a submission, will will get back to you as quickly as possible. Thanks for
  participating.

  

2 description
=============

  Requests Trap: A tool for the capture and display of http requests.

  This simple tool is useful during the development of apps that integrate with external
  services, such as http clients, webhooks, etc. The Requests Trap app ('RT App') provides these
  services with an endpoint to which they can send requests and notifications. 

  For example, let's assume we are developing an ecommerce site named "fireshop" with PayPal
  integration. During development, Fireshop can use RT App to see PayPal requests via a    
  specific endpoint. 

  If RT App gives this URL to the PayPal service:

  ,----
  | http://requests-trap.com/fireshop
  `----

  Then RT App could see the IPN notifications sent by PayPal here:

  ,----
  | http://requests-trap.com/fireshop/requests
  `----


3 How it works
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

  In response to any request made to /:trap_id, we will respond with the
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

  Also include a copy of the raw response, hidden by default, opened by
  clicking a link.

  New requests should appear on the page in real time, without a page
  refresh.

4 deployment
============

  The app must be deployed to Heroku.