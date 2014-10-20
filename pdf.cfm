
<cfprocessingdirective pageencoding="utf-8">
<cfset q ="1972年 McGill University B.Eng. (電気) 1976年 Osgoode Hall Law School of York University LL.B. 1978年　特許�?�?�士登録 1978年　商標�?�?�士登録 登録米国�?�?�士 プロフェッショナルエンジニア　(オンタリオ州プロフェッショナルエンジニア�?�会 (Professional Engineers Ontario))"/>
<cfset r = "English is a West Germanic language that was first spoken in early medieval England and is now the most widely used language in the world.[4] It is spoken as a first language by the majority populations of several sovereign states, including the United Kingdom, the United States, Canada, Australia, Ireland, New Zealand and a number of Caribbean nations" />
<cfset test=addSpan(q)>
<cfset test1=addSpan(r)>
<cfoutput><div style="width:400px; float:left;">#test#</div></cfoutput>
<cfdocument format="PDF" filename="../pdf.pdf" overwrite="Yes" fontEmbed = "yes">
<cfoutput>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>PDF Export Example</title>
 <style>
 body { font-family: SimSun, sans-serif; }
  span {font-family: Verdana, sans-serif; color:red;}
  h1 { font-family: SimSun, sans-serif; }
  </style>
</head>
<body>
<h1>PDF Export Example Combined Japanese & English</h1>
<br/>
<div>#Wrap1(test, 18, '<br>', true)#</div>
<br/><br/><br/><br/>	
<h1>PDF Export Example English</h1>
<br/>
<div>#Wrap1(test1, 18, '<br>', true)#</div>

</p>
</body>
</html>
</cfoutput>
</cfdocument>
<cfheader name="Content-Disposition" value="inline; filename=pdf.pdf">
<cfcontent type="application/pdf" file="../pdf.pdf" deletefile="no">  
<cffunction name="addSpan">
			<cfargument name="k" default="">
			<cfset a=ListLast(#arguments.k#,"<body>")>
			<cfset str = arguments.k>
			<cfset pos = findNoCase("<body>", str)>
			<cfset length = len(str)>
			<cfset rlen = length-pos>
			<cfif pos>
				<cfset piece = right(str, rlen-6)>
			<cfelse>
				<cfset piece = str>
			</cfif>
			<cfset str=piece>
			<cfset pos = findNoCase("</body>", str)>
			<cfif pos>
				<cfset piece = left(str, pos-1)>
			<cfelse>
				<cfset piece = str>
			</cfif>
			
			
			<cfset a=ReplaceNoCase(#piece#," ","|","ALL")>
			<cfset a=ReplaceNoCase(#a#,"。","。|","ALL")>
			<cfset modify = ListLen(a,"||")>
			<cfloop from="1" to = #modify# index="i">
				<cfset a=ReplaceNoCase(#a#,"||","|","ALL")>
				<cfset modify = ListLen(a,"||")>
			</cfloop>
			
			
		<cfset Lan = "ja">
		<cfset strModified="">
		<cfset a=ReplaceNoCase(#a#,"|",",","ALL")>
		
		<cfset status="closed">
		
		<cfoutput>
		<cfloop list="#a#" index="str">
			<cfset LastLan = Lan>
			<cfif REFind("^[\x20-\x7F]*$", str)>
				<cfset Lan = "en">
			<cfelse>
				<cfset Lan = "ja">				
			</cfif>
			<cfif LastLan NEQ Lan>
				<cfif status EQ "open" AND LastLan EQ "en">
					<cfset strModified=strModified&" </span>"&str>
					<cfset status="closed">
				<cfelseif status EQ "closed" AND LastLan EQ "ja">
					<cfset strModified=strModified&" <span>"&str>
					<cfset status="open">
				</cfif>
			<cfelse>
				<cfset strModified=strModified&" "&str>				
			</cfif>
		</cfloop>
		<cfif status EQ "open" >
			<cfset strModified=strModified&" </span>">
		</cfif>
		</cfoutput>
		
		<cfreturn strModified>
		</cffunction>
		
		
		
<cfscript>
/**
 * Wraps a chunk of text at a given character count.
 * Note that this function needs to be renamed if you are going to use it on a CF MX 6.1 server since 6.1 now has a native wrap() function (that serves a different purpose).
 * 
 * @param str      The string to format. (Required)
 * @param maxline      Length of each line, defaults to 40. (Optional)
 * @param br      The newline string. Defaults to &lt;br&gt;. (Optional)
 * @param breaklongwords      Boolean to break words longer than maxline. Defaults to true. (Optional)
 * @return Returns a string. 
 * @author Dave Pomerance (dpomerance@mos.org) 
 * @version 2, August 19, 2003 
 */
function Wrap1(str) {
    var maxline = 40;
    var br = "<br>";
    var breaklongwords = 1;
    var filetype = "pc";
    var eol = chr(13) & chr(10);
    var lineofstr = "";
    var returnstr = "";
    var pos = "";

    //check optional args
    if(ArrayLen(arguments) eq 2) {
        maxline = arguments[2];
    } 
    else if(ArrayLen(arguments) eq 3) {
        maxline = arguments[2];
        br = arguments[3];
    }
    else if(ArrayLen(arguments) eq 4) {
        maxline = arguments[2];
        br = arguments[3];
        breaklongwords = arguments[4];
    }

    // determine file type
    if (find(chr(10), str)) {
        if (find(chr(13), str)) {
            filetype = "pc";
            eol = chr(13) & chr(10);
        } else {
            filetype = "unix";
            eol = chr(10);
        }
    } else if (find(chr(13), str)) {
        filetype = "mac";
        eol = chr(13);
    }

    // add space due to CF "feature" of ignoring list elements of length 0
    str = replace(str, eol, " #chr(13)#", "ALL") & " ";
    
    for (i=1; i lte listlen(str, chr(13)); i=i+1) {
        lineofstr = listgetat(str, i, chr(13));
        if (lineofstr eq " ") {
            returnstr = returnstr & br;
            lineofstr = "";
        } else {
            // remove the space
            lineofstr = left(lineofstr, len(lineofstr)-1);
        }
        while (len(lineofstr) gt 0) {
            // determine wrap point
            if (len(lineofstr) lte maxline) pos = len(lineofstr);
            else {
                pos = maxline - find(" ", reverse(left(lineofstr, maxline))) + 1;
                if (pos gt maxline) {
                    if (breaklongwords) pos = maxline;
                    else {
                        pos = find(" ", lineofstr, 1);
                        if (pos eq 0) pos = len(lineofstr);
                    }
                }
            }
            // add line to returnstr
            returnstr = returnstr & left(lineofstr, pos) & br;
            // remove line from lineofstr
            lineofstr = removechars(lineofstr, 1, pos);
        }
    }

    return returnstr;
}
</cfscript>