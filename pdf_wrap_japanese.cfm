﻿<cfprocessingdirective pageencoding="utf-8">
<cfset q ="英語�?�ら�?�れ早�?�中世イングランド�?�話�?�れ�?�?�在世界�?�最も広�??使用�?�れ�?��?�る言語�?��?�る�?�西ゲルマン語�?��?�。[4]�??れ�?��?英国を�?�む�?��??�?��?��?�主権国家�?大多数�?�集団�?�第一言語�?��?��?�話�?�れ�?��?�る�?米国�?カナダ�?オーストラリア�?アイルランド�?ニュージーランド�?カリブ海諸国�?�数"/>
<cfset r = "English is a West Germanic language that was first spoken in early medieval England and is now the most widely used language in the world.[4] It is spoken as a first language by the majority populations of several sovereign states, including the United Kingdom, the United States, Canada, Australia, Ireland, New Zealand and a number of Caribbean nations" />
<cfset test= q />
<cfset test1= r />
<cfdocument format="PDF" filename="./pdf_wrap_japanese.pdf" overwrite="Yes" fontEmbed = "yes">
<cfoutput>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>PDF Export Example</title>
<style>
   body { font-family: verdana; }
</style>
</head>
<body>
<h1>PDF Export Example Combined Japanese & English (html table structure td width 400px)</h1>
<br/>
<table border="1">
<tr>
    <td style="word-wrap: break-word;width:400px;">#test#</td>
</tr>
</table>
<h1>PDF Export Example Combined Japanese & English (html div structure div width 400px)</h1>
<br/>
<div style="word-wrap: break-word;width:400px;">#test#</div>

<br/><br/><br/><br/>
<h1>PDF Export Example English (html table structure td width 400px)</h1>
<br/>
<table border="1">
<tr>
    <td style="word-wrap: break-word;width:400px;">#test1#</td>
</tr>
</table>    
<h1>PDF Export Example English (html div structure div width 400px)</h1>
<br/>
<div style="word-wrap: break-word;width:400px;">#test1#</div>
</body>
</html>
</cfoutput>
</cfdocument>
<cfheader name="Content-Disposition" value="attachment; filename=pdf_wrap_japanese.pdf">
<cfcontent type="application/pdf" file="D:/Projects/pdf/pdf_wrap_japanese.pdf" deletefile="no">  
