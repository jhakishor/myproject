 <%@ taglib uri="/tags/struts-bean" prefix="bean" %>
 <%@ taglib uri="/tags/struts-html" prefix="html" %>
 <html:html>
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
 <head>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />

 <title></title>
 <html:base/>
 </head>
 <body>
   <%@ include file="../top.jsp"%>  
 <center>
  
  <p><b>Your profile was successfully updated!</b></p>
  <!--
<p><b>For login <html:link page="/pages/user/userlogin.jsp"> Click Here </html:link> !</b></p>
 -->
</center>
  </body>
  </html:html>
 