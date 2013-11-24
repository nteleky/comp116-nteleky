Assignment 5: Forensics
===================================

#####Authors: Nick Teleky and Matt Brennan#####
#####Comp116: Computer Security#####
#####November 20, 2013#####

- - - - - - - - - - - - - - - - - - - - - - - -

###Part 1: Images

Image A: We started by using steghide, and ran the following command on Image A: 

`steghide extract -sf a.jpg`

We were then prompted for a password, and we started by trying a blank password. This worked, and we were able to get
an image of Norman's beautiful, smiling face called prado.jpg (attached in the repo).

Image B: We started by trying a dictionary attack on the password by using a bash script and a wordlist (attached to the repo).

Image C: After running diff on c.jpg and b.jpg, we found that Image B and C are the same. Both are also different from Image A.

- - - - - - - - - - - - - - - - - - - - - - - - -

###Part 2: SDCard Image

* __What is/are the disk format(s) of the SD card?__

There are two partitions on this disk:
 - Win95 Fat32
 - Linux

* __Is there a phone carrier involved?__

Probably not. After looking at the .bash_history file on the linux partition, the user installs raspi-config, indicating that this
OS is running on a Raspberry Pi. Further, in /usr/bin, there is a list of applications that have been installed; among them are config
apps for an Arduino.  The .bash_history file also indicates that the user installed the Kali Linux distrubution, which is like a hacker's 
tool-kit, and probably couldn't run its full functionality on a phone. While it is possible to install Kali on Android phones, it
seems like this is most likely operating on a raspberry pi and not on a phone.

* __What operating system, including version number, is being used? Please elaborate how you determined this information.__

Kali Linux 1.0

We determined this by looking at the os-release file in /etc/, which contained information about the operating system being
run on the system. This was confirmed by the .bash_history

* __What other applications are installed? Please elaborate how you determined this information.__

To find installed applications, we looked in /usr/bin on the linux partition. We found a lot of apps that, after Google searching them,
 are typically used for security purposes (password cracking, port and network scanning, encryption and decryption, private browsing, etc).
 Here is a small list of some of them:

Arduino
Autopsy
Blind Elephant
BeEF-XSS
BurpSuite
ClusterDB
Exploit6
FindMyHash
iCat-SleuthKit
Msfcli - Metasploit
Paros
SoCat
TraceRoute
WPSScan
SubVersion
UnicornScan
UPower
Wireshark
Ettercap
Cowsay
Tor

* __Is there a root password? If so, what is it?__

Yes; we found the passwd files in /etc/ and ran them through John The Ripper (without needing a wordlist):

root/toor

* __Are there any additional user accounts on the system?__

There appear to be two users:

root
john

* __List some of the incriminating evidence that you found. Please elaborate where and how you uncovered the evidence.__

Using Autopsy, we explored the file system of the two partitions. In the Linux partition, we found a folder of pictures. Inside were pictures titled
 old.jpg. After opening them, we found that they were all pictures of a young Celine Dion (determined by downloading several of the images, 
 Google searching for them, and finding that they all pointed to Celine Dion). We also found two setlists for CelineDion, which were in the Documents
 folder. Finally, we found a list of upcoming tour dates for 2013 and 2014, which after checking, were found to be dates that Celine is performing
 at Caesers Palace in Las Vegas, NV.

We also looked in /2/root/ and found the .bash_history file. Upon opening, we found that the suspect previously tried to remove most user files on
 his computer, possibly to avoid detection.

* __Did the suspect move or try to delete any files before his arrest? Please list the name(s) of the file(s) and any indications of their contents that you can find.__

There were a lot of files that at some point had been deleted off the system, including everying in $OrphanFiles$, which appeared to be a video
 compressor or converter, a handful of applications, and a few system files.
Right before the suspect's arrest though, the suspect ran a number of terminal commands to ostensibly remove incriminating files. After looking at 
the .bash_history, we found that the suspect started by deleting several folders out of the root folder:
    
Documents  
Videos  
Pictures  
Music  
Downloads  
Public  
Template  


Three image files titled 'new.jpg' and 'reciept.pdf' were found deleted and unrecoverable. They were created on Jan 2, 1970 at 8:34 PM EST. 

The suspect further deleted a shadow file.

Finally, it looks like the suspect attempted to delete all the files within the /root/ folder, notably Documents, Videos, Pictures, Music, 
 Downloads, Public, and Template folders. He then tried to remake the Documents and Pictures folder. He also tried to change Dropbox.zip to .dropbox.zip,
  to make the file a hidden file on the computer, and then remove the visible dropbox file.

* __Are there any encrypted files? If so, list the contents and a brief description of how you obtained the contents.__



* __Did the suspect at one point went to see this celebrity? If so, note the date and location where the suspect met the celebrity? Please elaborate how you determined this information.__



* __Is there anything peculiar with the files on the system?__

In /www/, there is an index.html that indicates that the suspect is running a webserver on his mobile device. Further, we found several 
applications that look like they would be useful in running a webserver on an Android phone.

* __Who is the celebrity that the suspect has been stalking?__
Celine Dion