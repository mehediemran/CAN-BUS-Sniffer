CAN-BUS-Sniffer
===============

Martin's CAN-BUS Sniffer Tool V1.0


Purpose of the "Martin's CAN-BUS Sniffer Tool"

1.Compares incomming CAN-BUS data with common Vehicle Idle Messages.
When the vehicle's Key is in the on position "Engine Not Started" The canbus sends regular messages on a very frequent basis.
I.E when monitoring the can bus and saving the data to text file for approximatly 5 Minutes will generate about 1Mb of data
1 Mb of text data = 1,048,576 characters or 873 pages worth of data. Of which 1 can bus message could contain 1 message (27)
Bytes which means that in between a million keyboard characters will be the message you are looking for.

How it works.
You need to generate a database before you start using Martin's CAN-BUS Sniffer, by hooking up the can-bus device to the vehicles CAN-BUS.
Use a serial monitoring tool such as putty and log the data to file, The longer you run it the better.
If you let it run for about 5 Minutes it will generate enought data.

Martin's CAN-BUS Sniffer Tool, will by default load "\ignoredatabase.can" in the application directory.
So you can just copy and rename the log file you generated into the same path as the "Martin's CAN-BUS Sniffer Tool" exe file.

Comparing data.
By default the "Martin's CAN-BUS Sniffer Tool" loads the "\incomming.can" log file,
You need to generate this file the same way you generated the initial ingnoredatabase.can file.
I.E connect the arduino CAN-BUS device to your laptop, open putty specify a new log file called I.E "LeftBlinker.can"
Conect with putty then when ready connect the Arduino CAN-BUS interface to the vehicle and turn on the left blinker and as quickly as quickly as
possible disconnect the Arduino CAN-BUS interface or disconenct the putty session, so that minimal data can be generated.
Then rename and copy "LeftBlinker.can" to "\incomming.can" also in the same path as "Martin's CAN-BUS Sniffer Tool" exe file.

Start "Martin's CAN-BUS Sniffer Tool" then load both files by clicking the load button next to each file's path and then finally click compare.
It will then dump all unuiqe messages into the log box below ,the messages displayed will be related to the buttons you pressed in the vehicle in this case the left blinker.

You can also use the serial connection to do this on a live basis.
Simply select the COM port to which the Arduino CAN-BUS Shield is connected to and set the baud rate. (Default baud rate = 115200)

Extra Information:
All tests were performed ona Jeep Wrangler (AKA Jeep JK) Rubicon 2010 2dr Manual.
The Interiour can-bus can be accessed by connecting to the White/Orange CAN-L  & White/Grey CAN-H
The bus speed should be set to 125Kb/s in the Arduino Shield's Bus Init section. I.E if(CAN_OK == CAN.begin(CAN_125KBPS)).........
If the BUS speed was not set correctly the Cluster will bing a couple of times and multiple dash lights will apear as well as the wipers will move.
This will not harm it , if you managed to swop the CAN-H & CAN-L pos/neg wires, it shouldnt blow, whilst testing i managed to do this and it didnt damage
Although its not reccomended.

WHAT EVER YOU DO! DO NOT ACCIDENTALLY CONNECT 12V Vehicle Power or power from the LAPTOP into THE CAN BUS!
The results are unknown but it cant be good.












