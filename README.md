# YottaDB AIM

Mumps based databases such as YottaDB are notoriously quick when querying subscripts but querying data based on entries can take time. YottaDB's AIM (Application Independant Metadata) overcomes such issues.

## Example

A database of UK post codes is used for this example

    ^PCODE("YO18")="Pickering|North Yorkshire|England"
    ^PCODE("YO19")="Wheldrake|York|England"
    ^PCODE("YO21")="Hutton Mulgrave|North Yorkshire|England"
    ^PCODE("YO22")="Snainton|North Yorkshire|England"
    ^PCODE("YO23")="Copmanthorpe|York|England"
    ^PCODE("YO24")="|York|England"
    ^PCODE("YO25")="Driffield|East Riding of Yorkshire|England"
    ^PCODE("YO26")="Upper Poppleton|York|England"
    ^PCODE("YO30")="Rawcliffe|York|England"

The post code e.g. **YO18** serves as the subscript and querying the subscript returns results in fast time. The slower times in querying "pieces" of  the entry e.g. North Yorkshire for the region or England for the country is overcome with AIM.

More details about YottaDB AIM can be found here https://yottadb.com/wp-content/uploads/2021/11/211020-1YDBAIMIntro.pdf

With the **^PCODE** global populated, we run:

    XREFDATA^%YDBAIM("^PCODE",1,"|","1:3",,,,2)

This will index the global **^PCODE** working with the data at the first subscript level only (1), using "|" as the separator for the indexes and indexing the first to the third | separated fields.

Running the above command yields an index global as below:

    ^%ydbAIMDKAMtqo3xVGHqQ8RwybiAA7(3,"Wales","SA63")=""
    ^%ydbAIMDKAMtqo3xVGHqQ8RwybiAA7(3,"Wales","SA64")=""
    ^%ydbAIMDKAMtqo3xVGHqQ8RwybiAA7(3,"Wales","SA65")=""
    ^%ydbAIMDKAMtqo3xVGHqQ8RwybiAA7(3,"Wales","SA66")=""
    ^%ydbAIMDKAMtqo3xVGHqQ8RwybiAA7(3,"Wales","SA67")=""

In the above global example, 3 represents the relevant index (the country), then the country entry itself and then the post code. The post code attained from the index can then be used as a subscript reference to query data directly from the ^PCODE global.

## Working demonstration

To view a cross compatible working demonstration, follow these steps:

    git clone https://github.com/RamSailopal/YottaDB-AIM.git
    cd YottaDB-AIM
    docker run --rm --name "Yottadb" -it -v ${PWD}/Share:/home/YDB --entrypoint /home/YDB/entrypoint.sh yottadb/yottadb

Wait for the text **Initialisation complete ...** to appear and then open another terminal/powershell. Enter:

    docker exec -it Yottadb /opt/yottadb/current/ydb

    YDB>ZL "/opt/yottadb/current/indexsrch.m" D GO^indexsrch

    Enter the parameter to search on (1 - Town, 2 - Region, 3 - Country) or Exit to Quit 2
    Enter the text to search for Sandwell

    Results:


    Entry: 1
    Post Code: B43
    Town: West Bromwich
    Region: Sandwell
    Country: England

    Entry: 2
    Post Code: B64
    Town: West Bromwich
    Region: Sandwell
    Country: England

    Entry: 3
    Post Code: B65
    Town: West Bromwich
    Region: Sandwell
    Country: England

    Entry: 4
    Post Code: B66
    Town: West Bromwich
    Region: Sandwell
    Country: England

    Entry: 5
    Post Code: B67
    Town: West Bromwich
    Region: Sandwell
    Country: England

    Entry: 6
    Post Code: B68
    Town: West Bromwich
    Region: Sandwell
    Country: England

    Entry: 7
    Post Code: B69
    Town: West Bromwich
    Region: Sandwell
    Country: England

    Entry: 8
    Post Code: B70
    Town: West Bromwich
    Region: Sandwell
    Country: England

    Entry: 9
    Post Code: B71
    Town: West Bromwich
    Region: Sandwell
    Country: England

    Entry: 10
    Post Code: DY4
    Town: West Bromwich
    Region: Sandwell
    Country: England

    Entry: 11
    Post Code: WS10
    Town: West Bromwich
    Region: Sandwell
    Country: England


The routine indexsrch utilises the indexes to attain town, region and country data

## Reference

https://yottadb.com/




