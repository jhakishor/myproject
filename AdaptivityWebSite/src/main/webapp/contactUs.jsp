<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.adaptivity.blueprint4it.dao.hibernate.Login"%> <!-- DEA: this was on every other page so I added it  -->
<%@page import="com.adaptivity.blueprint4it.web.common.Constants"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<head>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-cache" /> 
<meta http-equiv="Pragma" content="no-cache" />
<title>Adaptivity - Blueprint</title>
<!--[if lte IE 6]>
<script type="text/javascript" src="js/supersleight-min.js"></script>
<![endif]-->

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<script type="text/javascript" src="js/matching_columns.js" language="javascript"></script>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/thickbox.css" rel="stylesheet" type="text/css" />

</head> 
<body>
<div class="bodybg">
<div class="pagewrap">
	<div class="topnav">
    	<%@ include file="./pages/common/topMenu.jsp"%> 
    </div>
    <div class="content">		    	
		<div class="contentmain column">

		<iframe 
        width="772px" 
        height="800px" 
        frameBorder="0"
        scrolling="no"  
        name="Contact Adaptivity" 
        title="Contact Adaptivity" 
        src="http://b2.caspio.com/dp.asp?AppKey=81d4100068ad6f8a10664867ab98">
        Sorry, but your browser does not support frames. Please sent email to support at adaptivity dot com.
        </iframe>
        </div>
       <%@ include file="./pages/common/rightSidePanel.jsp"%>
    </div>
</div>
<%@ include file="./pages/common/footerPanel.jsp"%>
</div>
<%@ include file="./pages/common/footerHolder.jsp"%>
</body>
</html>

