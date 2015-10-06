<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<%@page import="com.adaptivity.blueprint4it.dao.hibernate.Login"%>
<%@page import="com.adaptivity.blueprint4it.web.common.Constants"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib uri="/tags/struts-html" prefix="html" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Adaptivity - Blueprint</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/thickbox.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<!--[if lte IE 6]>
<script type="text/javascript" src="js/supersleight-min.js"></script>
<![endif]-->

<script type="text/javascript">

//function submitForm(){
	//document.loginFormId.submit();
//}

</script>
<script type="text/javascript" src="js/matching_columns.js" language="javascript"></script>
</head>
<body>

<% String aboutus_flow_name = request.getParameter("aboutus_flow_name"); 
if (aboutus_flow_name == null) {
	aboutus_flow_name = "profile";
}
%>
<div class="bodybg">
<div class="pagewrap">
	<div class="topnav">
    	<%@ include file="../common/topMenu.jsp"%>
    </div>    
    
    <div class="content">		    	
		<div class="contentmain column">
        	<%@ include file="../common/aboutusHeader.jsp"%>
        	<% if ("profile".equals(aboutus_flow_name)) {%>
				<%@ include file="./profile.jsp"%>
			<%}%>
			<% if ("awards".equals(aboutus_flow_name)) {%>
				<%@ include file="./awards.jsp"%>
			<%}%>
			<% if ("executiveteam".equals(aboutus_flow_name)) {%>
				<%@ include file="./executiveteam.jsp"%>
			<%}%>
        </div>
        
        <%@ include file="../common/rightSidePanel.jsp"%>        
    </div>
</div>
<%@ include file="../common/footerPanel.jsp"%>
</div>
<%@ include file="../common/footerHolder.jsp"%>
</body>
</html>

