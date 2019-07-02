+++
title = "IP 로 해당국가 알아내기"
date = "2006-09-08T00:11:00+0900"
categories = ["Software Engineering"]
tags = []
description = ""
+++
<span class="copyright_entry" style="display:block;" title="IP 로 해당국가 알아내기@@**@@http://shed.egloos.com/1408446"></span>http://software77.net/cgi-bin/ip-country/geo-ip.pl
<br>
<br>에서
<br>
<br>
<a href="http://pds2.egloos.com/pds/1/200609/08/82/IpToCountry.csv.gz">IpToCountry.csv.gz</a>
<br>
<br>를 공.짜.로 나눠주고 있음
<br>
<br>
<hr>
<br>
<br>http://www.private.org.il/IP2geo.html 에서 허락없이 퍼옴
<br>
<br>
<br>
<h1>How do I find the geographical location of a host, given its IP address ?</h1> 
<p>In general, it is impossible - IP addresses are allocated arbitrarily, as there's no inherent connection between an IP address and it's physical location, and there's no reliable method to do the trick.</p> 
<p>Yet, doing some detective work could help. Try following methods :</p> 
<ol>
 <li>Note the following links for reference : <br><br> A complete list of country codes<br> &nbsp;<a href="http://www.iana.org/domain-names.htm">http://www.iana.org/domain-names.htm</a><br> &nbsp;<a href="http://www.ics.uci.edu/pub/websoft/wwwstat/country-codes.txt">http://www.ics.uci.edu/pub/websoft/wwwstat/country-codes.txt</a><br> <br> A complete list of U.S. state abbreviation<br> &nbsp;<a href="http://www.usps.gov/ncsc/lookups/abbr_state.txt">http://www.usps.gov/ncsc/lookups/abbr_state.txt</a><br> <br> A complete list of airport codes<br> &nbsp;<a href="http://www.aviationjobsonline.com/airports/citycode.html">http://www.aviationjobsonline.com/airports/citycode.html</a><br> <br> Microsoft's TerraServer - satellites pictures of geographical areas<br> &nbsp;<a href="http://www.terraserver.microsoft.com/">http://www.terraserver.microsoft.com/</a><br> <br> </li>
 <li>Use reverse DNS to find out the host's name. This item could supply some clues that could help. <br><br> E.g. given the IP address 132.74.18.2, the command 'nslookup 132.74.18.2' translates the address to construct.haifa.ac.il gives two hints -<br> 
  <ol>
   <li>The TLD is .il, which hints the host is in Israel. </li>
   <li>The next two domains are haifa.ac, so this host belongs to the 'haifa' academical institute (a university, in this case). The Haifa university happens to be in the city Haifa. </li>
  </ol> <br>Reverse DNS translation doesnt always work - it depends on the host's [the host with the given IP address] DNS server's correct configuration. <br><br>Another trick is to execute a whois request on the IP address. Try to direct the whois query to whois.arin.net - if it doesn't have the reply it will tell you to query either whois.apnic.net or whois.ripe.net <br><br>Notice that a host in one domain might be hosted in another country. This is due to both virtual hosting, where a domain of a company from one country or region, might be hosted where hosting is cheap. <br><br>Also notice that the .org, .com, and even .edu domains does not imply the host is in the U.S., as many of those domains belong to companies that are either not U.S. based, or are international, and might have some hosts all over the world. <br><br> </li>
 <li>Some hosts support a DNS extension which allows for hosts to enter their geographical location into their DNS record, based on an extension to DNS described in <a href="ftp://ftp.rfc-editor.org/in-notes/rfc1876.txt">RFC 1876</a>. <br><br> For further information see - <a href="http://www.ckdhr.com/dns-loc/">http://www.ckdhr.com/dns-loc/</a> <br><br> Another attempt to express a host's geographical location via DNS is done in <a href="ftp://ftp.rfc-editor.org/in-notes/rfc1712.txt">RFC 1712</a>. Both RFCs define a DNS Resource Record to contain the geographical location. <br><br> </li>
 <li>Visit the host's web server. A web site will sometimes contain hints regarding the site's location. <br><br> E.g. for construct.haifa.ac.il, you can find info at both <a href="http://www.haifa.ac.il/">http://www.haifa.ac.il/</a> and <a href="http://www.ac.il/">http://www.ac.il/</a> <br><br> </li>
 <li>Use whois. The whois database contains administrative contact info for all domains, filled in during domain registration time, and updated from time to time. This admin info could give some hints. <br><br>The whois database is not highly reliable - if an address belongs to a large &amp; responsible company, the company will supply reliable info and update it, but as domain name registrators do not insist on keeping the database accurate and current, the data might be incorrect. <br><br> The IP to Lat/Long page will attempt to display the same information in a graphical representation.<br> &nbsp;<a href="http://cello.cs.uiuc.edu/cgi-bin/slamm/ip2ll/">http://cello.cs.uiuc.edu/cgi-bin/slamm/ip2ll/</a> <br><br> The Allwhois.com page allows whois requests for many countries.<br> &nbsp;<a href="http://www.allwhois.com/">http://www.allwhois.com/</a> <br><br> A list of whois servers, collected by Matt Power, is available at <a href="ftp://sipb.mit.edu/pub/whois/whois-servers.list">ftp://sipb.mit.edu/pub/whois/whois-servers.list</a> <br><br>Note that the data is usually given for the owners' main branch or contact points, but the IP addresses might be allocated to hosts that may be located at a different location(s). <br><br> </li>
 <li>Use traceroute. The names of the routers through which packets flow from your [or any] host to the host with the given IP address might hint at the geographical path which the packets follow, and at the final destination's physical location. <br><br> <pre>E.g. &gt; traceroute www.mit.edu<br>traceroute to DANDELION-PATCH.MIT.EDU(18.181.0.31), ...<br> 1 teg.technion.ac.il (132.68.7.254)              2 ms   1 ms   1 ms<br> 2 tau-smds.man.ac.il (128.139.210.16)            5 ms   5 ms   5 ms<br> 3 128.139.198.129 (128.139.198.129)              9 ms  11 ms  13 ms<br> 4 TAU-shiber.route.ibm.net.il (192.115.73.5)   535 ms 549 ms 513 ms<br> 5 fe7507.tlv.ibm.net.il (192.116.177.1)        562 ms 596 ms 600 ms<br> 6 165.87.220.18 (165.87.220.18)               1195 ms1204 ms<br> 7 nyc28-16-sar1.ny.us.ibm.net (165.87.28.19)  1208 ms1216 ms1233 ms<br> 8 198.133.27.5 (198.133.27.5)                 1210 ms1239 ms1211 ms<br> 9 sprint-nap.bbnplanet.net (192.157.69.51)    1069 ms1087 ms1122 ms<br>10 nyc1-br2.bbnplanet.net (4.0.1.25)           1064 ms1109 ms1061 ms<br>11 cambridge1-br1.bbnplanet.net (4.0.1.122)    1185 ms1146 ms1203 ms<br>12 cambridge2-br2.bbnplanet.net (4.0.2.26)     1185 ms1159 ms1073 ms<br>13 ihtfp.mit.edu (192.233.33.3)                1052 ms 642 ms 658 ms<br>14 W20-RTR-FDDI.MIT.EDU (18.168.0.8)            640 ms 665 ms 674 ms<br>15 DANDELION-PATCH.MIT.EDU (18.181.0.31)        702 ms 915 ms 868 ms<br></pre> <br>The 3rd hop takes the path to the academic network [checked by local whois lookup], the fifth hop takes the path to New-York [on the east coast], and the 10th hop takes the path to Cambridge [in Massachusetts, on the coast, northern to New-York]. <br><br> There is a utility named VisualRoute (<a href="http://www.visualware.com/visualroute/index.html">http://www.visualware.com/visualroute/index.html</a>) which traceroutes a host, and displays the route on a map of the world. The host's location on the map is based on the whois query, which may be wrong - an Israely domain might be displayed as being in Israel though it is hosted in another country. <br><br> </li>
 <li>Some of the services available on the host might give further info. <br> <pre>E.g. telnet construct.haifa.ac.il 13  &lt;== Time of day service<br>     Trying 132.74.18.2...<br>     Connected to construct.haifa.ac.il.<br>     Escape character is '^]'.<br>     Wed Jan 21 08:32:53 1998         &lt;== Time difference hints at the<br>                                          host's time zone.<br></pre> <br> </li>
 <li>Naming conventions of ISPs and back-bones <br><br> AT&amp;T dialups : &lt;port&gt;.&lt;router-location&gt;.&lt;state&gt;.dial-access.att.net <br><br>Port is 2-254 for the dial-up ports, and 1 for the router itself. location: example: "los-angeles-2" (city and router #). state: 2-letter abbreviation. <br><br> (Thanks to D. Stussy) <br><br> uu.net dialups :<br> A. &lt;port&gt;.&lt;device&gt;.&lt;city&gt;.&lt;state&gt;.&lt;iu&gt;.uu.net<br> B. &lt;port&gt;.&lt;device&gt;.&lt;airport&gt;.&lt;iu&gt;.uu.net<br> <br><br> iu = intended use (meaningless), state is per USPS ZIP code, deviceis Ascend 'TNT' # or Ascend 'MAX' #. <br><br> (Thanks to Robert Bonomi)<br> (Thanks to John Bradshaw) <br><br> </li>
 <li>Related sites : <br><br> The Mappa.Mundi Magazine - <a href="http://mappa.mundi.net/">http://mappa.mundi.net/</a><br> Cyber Geography - <a href="http://www.cybergeography.org/">http://www.cybergeography.org/</a> </li>
</ol> 
<!--
       <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		    xmlns:dc="http://purl.org/dc/elements/1.1/"
		    xmlns:trackback="http://madskills.com/public/xml/rss/module/trackback/">
       <rdf:Description
	        rdf:about="http://shed.egloos.com/1408446"
	        dc:identifier="http://shed.egloos.com/1408446"
	        dc:title="IP 로 해당국가 알아내기"
	        trackback:ping="http://shed.egloos.com/tb/1408446"/>
       </rdf:RDF>
       -->

<ul></ul>