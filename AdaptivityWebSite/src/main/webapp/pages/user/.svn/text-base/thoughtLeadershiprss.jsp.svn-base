
<%@ page import="java.util.*" %> 
<%@ page import="com.adaptivity.blueprint4it.util.RSSItemVO" %> 
<%@ page import="com.adaptivity.blueprint4it.web.common.Constants" %> 

<%
List<RSSItemVO> blogListSize1 = (List<RSSItemVO>) request.getAttribute(Constants.BLUEPRINT_BLOG_LIST_SIZE_ELEMENT_RSS);
List<RSSItemVO> ceoListSize1 = (List<RSSItemVO>) request.getAttribute(Constants.CEO_BLOG_LIST_SIZE_ELEMENT_RSS);
List<RSSItemVO> ceoList1 = (List<RSSItemVO>) request.getAttribute(Constants.CEO_BLOG_LIST_RSS);
List<RSSItemVO> blogList1 = (List<RSSItemVO>) request.getAttribute(Constants.BLUEPRINT_BLOG_LIST_RSS);
%>
<script type="text/javascript" src="js/blueprint4it.js">
</script>


	<div id="partialDivBlog">
	<table>
	<tr>
	<td height="0"></td>
	</tr>
	<tr>
	<td>
	<span style="font-size: 11px; font-family: Arial,Verdana; color: #508AA4"><strong>Adaptivity Blog</strong></span>
	</td>
	</tr>
	<%if(blogListSize1 != null){
		for(RSSItemVO rssItemVO : blogListSize1){
			%>
			<tr>
			<td>
			<a class="icon feed-file "  style="font-family: Helvetica,Arial,Verdana; font-size: 11px;" href="<%=rssItemVO.getLink() %>" target="_blank"> <%=rssItemVO.getTitle() %> </a>
			</td>
			</tr>
			<%
		}
	}
	%>
	<tr>
	<td>
	
	</td>
	</tr>
	</Table>
	
</div>

<!--<div id="partialDivCeoBlog">
	<table>
	<tr>
	<td height="10"></td>
	</tr>
	<tr>
	<td>
	<span style="font-size: 11px; font-family:Arial,Verdana; color: #508aa4;"><strong>CEO Blog</strong></span>
	</td>
	</tr>
	<%if(ceoListSize1 != null){
		for(RSSItemVO rssItemVO : ceoListSize1){
			%>
			<tr>
			<td>
			<a class="icon feed-file "  style="font-family: Helvetica,Arial,Verdana; font-size: 11px;" href="<%=rssItemVO.getLink() %>" target="_blank"> <%=rssItemVO.getTitle() %> </a>
			</td>
			</tr>
			<%
		}
	}
	%>
	<tr>
	<td>
	
	</td>
	</tr>
	</table>

</div>


-->