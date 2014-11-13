Massive-Theatre
===============

Creating a theatre booking system which will be able to accept and reject bookings for general OOP practice, under the following specification.

- Cinema has 100 rows and 50 seats
- Customers can request seats with bookings.
- Bookings are accepted if they are: For 5 seats or less, all seats are adjacent and on same row, all seats are available, and accepting the booking would not leave a gap.

The system can accept bookings from a text file that contains one booking per line where each booking is displayed like this: `(<id>,<index of first seat row>:<index of first seat within row>,<index of last seat row>:<index of last seat within row>)`, rows and seats must be 0-indexed


How to use
===============
1. Git clone repository.
2. run 'ruby booking_processor.rb'
You will be prompted to enter a file, if you enter ./booking_requests.txt you will get the default results, another file in the same format would also be readable.
