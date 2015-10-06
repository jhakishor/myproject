
<%@ page import="java.util.*" %> 
<%@ page import="com.adaptivity.blueprint4it.util.RSSItemVO" %> 
<%@ page import="com.adaptivity.blueprint4it.web.common.Constants" %> 

<%
List<RSSItemVO> blogListSize = (List<RSSItemVO>) request.getAttribute(Constants.BLUEPRINT_BLOG_LIST_SIZE_ELEMENT);
List<RSSItemVO> ceoListSize = (List<RSSItemVO>) request.getAttribute(Constants.CEO_BLOG_LIST_SIZE_ELEMENT);
List<RSSItemVO> ceoList = (List<RSSItemVO>) request.getAttribute(Constants.CEO_BLOG_LIST);
List<RSSItemVO> blogList = (List<RSSItemVO>) request.getAttribute(Constants.BLUEPRINT_BLOG_LIST);
%>
<script type="text/javascript" src="js/blueprint4it.js">
</script>
<div id="completeDivCeoBlog" style="display:none">
	<Table>
	<tr>
	<td height="10"></td>
	</tr>
	<tr>
	<td>
	<b>CEO Blog</b>
	</td>
	</tr>
	<%if(ceoList != null){
		for(RSSItemVO rssItemVO : ceoList){
			%>
			<tr>
			<td>
			<a class="icon feed-file ResourcesLink" href="<%=rssItemVO.getLink() %>" target="_blank"> <%=rssItemVO.getTitle() %> </a>
			</td>
			</tr>
			<%
		}
	}
	%>
	
	</Table>
	<div class="more">
	<a href="javascript:showhideInfoDiv('partialDivCeoBlog','completeDivCeoBlog');"><img src="<%=request.getContextPath()%>/images/minimize.png" border="0" alt="" title="" /></a>
	</div>
</div>
<div id="partialDivCeoBlog">
	<table>
	<tr>
	<td height="10"></td>
	</tr>
	<tr>
	<td>
	<b>CEO Blog</b>
	</td>
	</tr>
	<%if(ceoListSize != null){
		for(RSSItemVO rssItemVO : ceoListSize){
			%>
			<tr>
			<td>
			<a class="icon feed-file ResourcesLink" href="<%=rssItemVO.getLink() %>" target="_blank"> <%=rssItemVO.getTitle() %> </a>
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
	<div class="more">
	<a href="javascript:showhideInfoDiv('completeDivCeoBlog','partialDivCeoBlog');"><img src="<%=request.getContextPath()%>/images/showall.png" border="0" alt="" title="" /></a>
	</div>
</div>

<div id="completeDivBlog" style="display:none">
	<Table>
	<tr>
	<td height="10"></td>
	</tr>
	<tr>
	<td>
	<b>Blueprint 4IT Blog</b>
	</td>
	</tr>
	<%if(blogList != null){
		for(RSSItemVO rssItemVO : blogList){
			%>
			<tr>
			<td>
			<a class="icon feed-file ResourcesLink" href="<%=rssItemVO.getLink() %>" target="_blank"> <%=rssItemVO.getTitle() %> </a>
			</td>
			</tr>
			<%
		}
	}
	%>
	
	</Table>
	<div class="more">
	<a href="javascript:showhideInfoDiv('partialDivBlog','completeDivBlog');"><img src="<%=request.getContextPath()%>/images/minimize.png" border="0" alt="" title="" /></a>
	</div>
</div>
	<div id="partialDivBlog">
	<table>
	<tr>
	<td height="10"></td>
	</tr>
	<tr>
	<td>
	<b>Blueprint4IT Blog</b>
	</td>
	</tr>
	<%if(blogListSize != null){
		for(RSSItemVO rssItemVO : blogListSize){
			%>
			<tr>
			<td>
			<a class="icon feed-file ResourcesLink" href="<%=rssItemVO.getLink() %>" target="_blank"> <%=rssItemVO.getTitle() %> </a>
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
	<div class="more">
	<a href="javascript:showhideInfoDiv('completeDivBlog','partialDivBlog');"><img src="<%=request.getContextPath()%>/images/showall.png" border="0" alt="" title="" /></a>
	</div>
</div>
