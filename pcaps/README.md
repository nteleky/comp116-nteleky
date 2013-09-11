Assignment 1: Packet Sleuth
============================

#### Comp116: Computer Security ####
##### Author: Nicholas Teleky #####
##### Sept 8, 2013 #####

- - - - - - - - - - - - - - - - - - - - - - - - - -

In this assignment, we were given two .pcap files and were asked to analyze them, then answer the questions below. To analyze, I used the following tool(s):

* Wireshark

This assignment took me __ hours to complete.

Analysis below.

- - - - - - - - - - - - - - - - - - - - - - - - - -

### set1.pcap ###

***1. How many packets are there in this set?***

276 packets total.


***2. What protocol was used to transfer files from PC to server?***

File Transfer Protocol (FTP)


***3. Briefly describe why the protocol used to transfer the files is insecure?***

The biggest security flaw with FTP is that all information, including usernames, passwords, and files are sent over the network as
plaintext. This means that anyone could potentially view your logon information and intercept files that are transferred relatively
simply. This could mean that an unauthorized individual could have access to a server of files that they ought not have access to.


***4. What is the secure alternative to the protocol used to transfer files?***

Secure File Transfer Protocol (SFTP) is part of the 'Open-SSH' package, which secures usernames, passwords, and files by encrypting
them over the network.


***5. What is the IP address of the server?***

67.23.79.113


***6. What was the username and password used to access the server?***

Username: stokerj

Password: w00tfu!


***7. How many files were transferred from PC to server?***

Three


***8. What are the names of the files transferred from PC to server?***

code.rtf

secret.pdf

acb.jpg


***9. Extract all the files that were transferred from PC to server.***

*Extracted files contained in this repository*

- - - - - - - - - - - - - - - - - - - - - - - - - -

### set2.pcap ###

***10. How many packets are there in your set?***

74,566 packets.


***11. How many plaintext username-password pairs are there in this packet set?***




***12. Briefly describe how you found the username-password pairs.***




***13. For each of the plaintext username-password pair that you found, identify the protocol used, server IP, the corresponding domain name (e.g., google.com), and port number.***




***14. Of all the plaintext username-password pairs that you found, how many of them are legitimate? That is, the username-password was valid, access successfully granted?***




***15. How did you verified the successful username-password pairs?***




***16. In a few words, explain why I asked you not to log on to websites or services associated with the username-password pairs that you found.***




***17. What advice would you give to the owners of the username-password pairs that you found so their account information would not be revealed "in-the-clear" in the future?***




***18. Provide a listing of all IP addresses with corresponding hosts (hostname + domain name) that are in this PCAP set. Describe your methodology.***




***19. Provide a summary of the all protocols used. What was the most popular protocol used? Describe your methodology.***




***20. A fun question: what other interesting things did you find in this PCAP set (e.g., files)?***





- - - - - - - - - - - - - - - - - - - - - - - - - -