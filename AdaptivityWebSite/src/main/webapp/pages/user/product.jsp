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

<% String submenu_name = request.getParameter("submenu_name"); 
if (submenu_name == null) {
	submenu_name = "";
}
%>
<div class="bodybg">
<div class="pagewrap">
	<div class="topnav">
    	<%@ include file="../common/topMenu.jsp"%>
    </div> 
    
    <div class="content">		    	
		<div class="contentmain column">
        	 <!--%@ include file="../common/submenuProduct.jsp"%--> 
        <div>
        
         <% if ("".equals(submenu_name)) {%>

   <div class="contentmain">
      <div ><img src="images/Product_Banner.png" border="0" alt="" title="" /></div>
          <div style="display: block; overflow:hidden; float: left; width: 100%; "> 	
               <table cellpadding="0" cellspacing="0" border="0">
                <tr > <td height="5px"> </td></tr>
                <tr>
	                <td>
	               		 <div class="img"><a href="./Welcome.do?forward=product&submenu_name=model"><img src="<%=request.getContextPath()%>/images/Product_SubPageButtons_Plan.png" /></div>
	                </td>
	                <td  width="9px"> </td>
	                <td>
	              		  <div class="img"> <a href="./Welcome.do?forward=product&submenu_name=design"><img src="<%=request.getContextPath()%>/images/Product_SubPageButtons_Design.png" /></div>
	                </td>
               		<td width="9px"></td>
	                <td>
	              		  <div class="img">  <a href="./Welcome.do?forward=product&submenu_name=govern"><img src="<%=request.getContextPath()%>/images/Product_SubPageButtons_Govern.png" /></div>
	                </td>
      			</tr>
      		</table>
      		</div>
      		
      
      
    </div>
<%}%>
</div>
        	 <% if ("model".equals(submenu_name)) {%>
				<%@ include file="./model.jsp"%>
			<%}%>
			<% if ("design".equals(submenu_name)) {%>
				<%@ include file="./design.jsp"%>
			<%}%>
			 <% if ("govern".equals(submenu_name)) {%>
				<%@ include file="./govern.jsp"%>
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

