    D GO
GO
    SET OPT=""
    FOR  Q:OPT="Exit"  D
    . Q:OPT="Exit"
    . Write !,"Enter the parameter to search on (1 - Town, 2 - Region, 3 - Country) or Exit to Quit "
    . Read OPT
    . Q:OPT="Exit"
    . Write !,"Enter the text to search for "
    . Read ENTRY
    . IF OPT="1" SET PIECE=1
    . ELSE  IF OPT="2" SET PIECE=2
    . ELSE  SET PIECE=3
    . W !!,"Results:"
    . W !!
    . S CNT=0
    . S INDX=""
    . F  S INDX=$O(^%ydbAIMDKAMtqo3xVGHqQ8RwybiAA7(PIECE,INDX)) Q:INDX=""  D
    .. I INDX=ENTRY D
    ... S INDX1=""
    ... F  S INDX1=$O(^%ydbAIMDKAMtqo3xVGHqQ8RwybiAA7(PIECE,INDX,INDX1)) Q:INDX1=""  D
    .... S CNT=CNT+1
    .... W !,"Entry: "_CNT
    .... W !,"Post Code: "_INDX1
    .... W !,"Town: "_$PIECE(^PCODE(INDX1),"|",1)
    .... W !,"Region: "_$PIECE(^PCODE(INDX1),"|",2)
    .... W !,"Country: "_$PIECE(^PCODE(INDX1),"|",3)
    .... W !
    QUIT