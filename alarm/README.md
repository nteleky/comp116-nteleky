-----------------------
Assignment 2: PacketFu Alarm
-----------------------

Nicholas Teleky
10/10/13

In this assignment, I was required to create an Incident Alarm that would alert a user
if the following security breaches were found:

* NULL Scan
* XMAS Scan
* NMAP Scan
* Clear-text passwords
* Clear-text credit card numbers
* XSS Attacks

I did this using Ruby and a gem called PacketFu.

This assignment made heavy use of regular expressions for searching through packet payloads, using
scan().

The program has been implemented correctly and passes all tests I threw at it. Notably, XSS, false credit card numbers,
and PASS was tested by running this alarm and sending these attacks or this info to my MessageHub App, which
I created for Comp120 (heroku link: http://fast-reef-2117.herokuapp.com/messages/).

This assignment took about 9 hours to complete, most of which was spent learning ruby and PacketFu.