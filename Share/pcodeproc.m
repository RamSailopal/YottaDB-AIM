START
 SET FIL="/home/YDB/postcodes.csv"
 OPEN FIL:(read)
 USE FIL F  Q:$ZEOF=1  D
 . READ LIN
 . SET PCODE=$P(LIN,",",1)
 . SET PCODE=$TR(PCODE,"""","")
 . Q:PCODE="postcode"!(PCODE="")
 . SET TOWN=$P(LIN,",",6)
 . SET TOWN=$TR(TOWN,"""","")
 . SET REGION=$P(LIN,",",7)
 . SET REGION=$TR(REGION,"""","")
 . SET COUNTRY=$P(LIN,",",9)
 . SET COUNTRY=$TR(COUNTRY,"""","")
 . SET ^PCODE(PCODE)=TOWN_"|"_REGION_"|"_COUNTRY
 CLOSE FIL
 QUIT