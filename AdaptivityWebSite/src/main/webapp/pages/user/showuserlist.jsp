<%@ taglib uri="/tags/struts-bean" prefix="bean" %>
<%@ taglib uri="/tags/struts-html" prefix="html" %>


<%@page import="java.util.*"%>

<html:html>
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />

<title>index page</title>
<html:base/>
<style type="text/css">


A:active { COLOR: green; TEXT-DECORATION: none } 
A:hover { COLOR: red; TEXT-DECORATION: none; font-weight: none }

</style>
</head>

<body>




<table width="100%" border="0" align="left" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
	<tr valign="top">
		
			<td valign="top">
			<table width="100%" height="188" border="0" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
				<tr bgcolor="#F4F4F4">
				  <td align ="left"><strong>Latest Jobs</strong></td>
				  </tr>
				  <tr>
				  <td>
				  <table>
				     
					
				 	<c:forEach var="result" items="${userlist}">

						<tr>
							
							<td><li><a href="../jobs/viewjob/<c:out value="${result.id}"/>"><c:out value="${result.loginid}"/></a></li></td>
							
						</tr>

                    
					</c:forEach>

				
				 
				 
				</table>
				</td>
			   </tr>
			</table>
</body>
</html:html>