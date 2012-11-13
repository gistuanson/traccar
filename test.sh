#!/bin/bash

# testing data:
# imei - 123456789012345
# id - 123456 (trackers that dont send imei)
# time - 12:0X (where X is different for each tracker)
# server - localhost
# ports - default

# to verify test check database entries

echo "0. xexun"
(echo -n -e "111111120009,+436763737552,GPRMC,120000.000,A,6000.0000,N,13000.0000,E,0.0,0.0,010112,,,A*76,F,imei:123456789012345,04,481.2,F:4.15V,0,139,2689,232,03,2725,0576";) | nc -v localhost 5000

echo "1. gps103"
(echo -n -e "imei:123456789012345,help me,1201011201,,F,120100.000,A,6000.0000,N,13000.0000,E,0.00,;";) | nc -v localhost 5001

echo "2. tk103"
(echo -n -e "(000000000000BP05123456789012345120101A6000.0000N13000.0000E000.0120200000.0000000000L000946BB)";) | nc -v localhost 5002

echo "3. gl100"
(echo -n -e "+RESP:GTSOS,123456789012345,0,0,0,1,0.0,0,0.0,1,130.000000,60.000000,20120101120300,0460,0000,18d8,6141,00,11F0,0102120204\0";) | nc -v localhost 5003

echo "4. gl200"
(echo -n -e "+RESP:GTFRI,020102,123456789012345,,0,0,1,1,0.0,0,0.0,130.000000,60.000000,20120101120400,0460,0000,18d8,6141,00,,20120101120400,11F0\$";) | nc -v localhost 5004

echo "5. t55"
(echo -n -e "\$PGID,123456789012345*0F\r\n\$GPRMC,120500.000,A,6000.0000,N,13000.0000,E,0.00,0.00,010112,,*33\r\n";) | nc -v localhost 5005

echo "6. xexun2"
(echo -n -e "111111120009,+436763737552,GPRMC,120600.000,A,6000.0000,N,13000.0000,E,0.00,0.00,010112,,,A*68,F,, imei:123456789012345,04,481.2,F:4.15V,0,139,2689,232,03,2725,0576\n";) | nc -v localhost 5006

echo "7. avl08"
(echo -n -e "\$\$B3123456789012345|AA\$GPRMC,120700.000,A,6000.0000,N,13000.0000,E,0.00,,010112,,,A*74|01.8|01.0|01.5|000000000000|20120403234603|14251914|00000000|0012D888|0000|0.0000|3674|940B\r\n";) | nc -v localhost 5007

echo "8. enfora"
(echo -n -e "\x00\x71\x00\x04\x02\x00                 123456789012345 13 \$GPRMC,120800.00,A,6000.000000,N,13000.000000,E,0.0,0.0,010112,,,A*52\r\n";) | nc -v localhost 5008

echo "9. meiligao"
(echo -n -e "\$\$\x00\x60\x12\x34\x56\xFF\xFF\xFF\xFF\x99\x55120900.000,A,6000.0000,N,13000.0000,E,0.00,,010112,,*1C|11.5|194|0000|0000,0000\x69\x62\x0D\x0A";) | nc -v localhost 5009

echo "10. maxon"


echo "11. st210"
(echo -n -e "SA200STT;123456;042;20120101;12:11:00;16d41;-15.618767;-056.083214;000.011;000.00;11;1;41557;12.21;000000;1;3205\r";) | nc -v localhost 5011

echo "12. progress"


echo "13. h02"
(echo -n -e "*HQ,123456789012345,V1,121300,A,6000.0000,N,13000.0000,E,0.00,0.00,010112,ffffffff,000000,000000,000000,000000#";) | nc -v localhost 5013

echo "14. jt600"
(echo -n -e "\$\x00\x00\x12\x34\x56\x11\x00\x1B\x01\x01\x12\x12\x14\x00\x60\x00\x00\x00\x13\x00\x00\x00\x0F\x00\x00\x07\x50\x00\x00\x00\x2B\x91\x04\x4D\x1F\xA1";) | nc -v localhost 5014

echo "15. ev603"
(echo -n -e "!1,123456789012345;!A,01/01/12,12:15:00,60.000000,130.000000,0.0,25101,0;";) | nc -v localhost 5015

echo "16. v680"
(echo -n -e "#123456789012345#1000#0#1000#AUT#1#66830FFB#13000.0000,E,6000.0000,N,001.41,259#010112#121600##";) | nc -v localhost 5016

echo "17. pt502"
(echo -n -e "\$POS,123456,121700.000,A,6000.0000,N,13000.0000,E,0.0,0.0,010112,,,A/00000,00000/0/23895000//\r\n";) | nc -v localhost 5017

echo "18. tr20"
(echo -n -e "%%123456789012345,A,120101121800,N6000.0000E13000.0000,0,000,0,01034802,150,[Message]\r\n";) | nc -v localhost 5018
