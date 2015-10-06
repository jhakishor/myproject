<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.adaptivity.blueprint4it.dao.hibernate.Login"%>
<%@page import="com.adaptivity.blueprint4it.web.common.Constants"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", -1); 
%>
<head>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Adaptivity - Blueprint</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/thickbox.js"></script>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/favicon.ico" type="image/x-icon" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/thickbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

//function submitForm(){
	//document.loginFormId.submit();
//}
function setact(action){
//document.forms[0].action.value="fileDownload.do";
document.forms[0].action="fileDownload.do";

}
</script>
<script type="text/javascript" src="js/matching_columns.js" language="javascript"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="js/supersleight-min.js"></script>
<![endif]-->

</head>
<body>
<div class="bodybg">
<div class="pagewrap">
<div class="topnav"><%@ include file="../common/topMenu.jsp"%>
</div>
<div class="content">
<div class="contentmain column">

<div>
<p class="text_label_header">Design Science</p>
</div>
<div class="innercontent-holder">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
     <td>
      <img src="<%=request.getContextPath()%>/images/formula_web.jpg"
	  width="772" />
     </td>
</tr>
<tr>
	<td height="10" colspan="2"></td>
</tr>
<tr>
	<td height="7" colspan="2" bgcolor="#508aa4"></td>
</tr>
</table>
<!--  
<div style="width: 233px; margin-left: auto; margin-right: auto;">
<object width="235" height="145">
	<param name="movie"
		value="http://www.youtube.com/v/jnuSflyzrAU&hl=en_US&fs=1&rel=0&color1=0x3a3a3a&color2=0x999999"></param>
	<param name="allowFullScreen" value="true"></param>
	<param name="allowscriptaccess" value="always"></param>
	<embed
		src="http://www.youtube.com/v/jnuSflyzrAU&hl=en_US&fs=1&rel=0&color1=0x3a3a3a&color2=0x999999"
		type="application/x-shockwave-flash" allowscriptaccess="always"
		allowfullscreen="true" width="235" height="145"></embed> </object>
</div>
-->
<br/><br/>
<p class="text_para"><strong>Information Technology</strong> is a multi-disciplinary science.
Traditionally, the application of IT has been more of an art than a
science. This "art" approach to applying IT to supporting the execution
of business creates inconsistent and incomplete IT systems. The
resulting impact is a mismatch of business expectations and IT delivery
performance.</p>
<br/>
<p class="text_para">Adaptivity is transforming the "art" of applying information
technology into a <em>design science</em> for the purpose of aligning business
and IT execution. The intersection of business with IT is directly
linked to how business processes execute across their value chain and
how IT systems are engineered to support this execution flow.</p>
<br/>
<p class="text_para">We define this intersection of the business value chain and
systems engineering as the <strong>"new supply chain of the business"</strong> the IT
Supply Chain. By adapting a supply chain discipline to IT, an end-to-end
linkage can be established between business and the infrastructure
(people, process, and technology) that supports it. To incorporate this
into a repeatable discipline one must understand the multiple dimensions
of science that affects the design and optimization of the <em>IT supply
chain: economics, physics and management science</em>.</p>
<br/>
<p class="text_para">Adaptivity has created a repeatable design formula for building
and optimizing the execution of business activities across the IT supply
chain. Below summarizes the formula that incorporates the multiple
dimensions of science that can be used to <em>systematically model, build
and run IT as a repeatable design science</em>.</p>
<br/>
<p class="text_para">The core dimensions of the science as applied to IT are defined
below:</p>
<br/>
<p class="text_para"><strong>IT Economics:</strong> the discipline of continuous correlation of demand
with supply is critical to building an optimal business &amp; IT
execution model. Two components of the economics are critical in design
and optimizing IT delivery price/service determination and price/service
elasticity. To design and realize optimal IT delivery, the business
demand must be profiled and defined in a deterministic manner as to the
options of supply fulfillment that can and should be leveraged.
Moreover, the elasticity or responsiveness of the supply fulfillment
model at varying levels of choice will directly affect the design model.</p>
<br/>
<p class="text_para"><strong>IT Physics:</strong> the execution of the business process digitally
manifests itself in terms of workload that creates different levels of
effort and have different execution characteristics that can be affected
by distance and transfer principles derived from the laws of physics.</p>
<br/>
<p class="text_para"><strong>IT Supply Chain Management:</strong> the configuration, distribution and
logistical optimization of the IT Supply Chain as an end-to-end
fulfillment utility to the business incorporates input from the
economics and physics into architectural, engineering and operational
design dimensions to ensure optimal execution in support of the
business.</p>
<br/>
<p class="text_para">To Learn More about the Design Science of IT download the
following <a target="_blank" href="<%=request.getContextPath()%>/downloads/adaptivity-IT-design-science.pdf" >Adaptivity IT Design Science</a> whitepaper.</p>
</div>
</div>
<%@ include file="../common/rightSidePanel.jsp"%>
</div>
</div>
<%@ include file="../common/footerPanel.jsp"%>
</div>
<%@ include file="../common/footerHolder.jsp"%>
</body>
</html>

