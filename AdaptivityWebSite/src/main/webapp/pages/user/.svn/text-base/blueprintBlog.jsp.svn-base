<%@ page import="java.util.*" %> 
<%@ page import="com.adaptivity.blueprint4it.util.RSSItemVO" %> 
<%@ page import="com.adaptivity.blueprint4it.web.common.Constants" %> 

<%
List<RSSItemVO> blogList = (List<RSSItemVO>) request.getAttribute(Constants.BLUEPRINT_BLOG_LIST);
%>
<Table>
<tr>
<td height="10"></td>
</tr>
<tr>
<td>
<b>Blueprint 4IT Blog</b>&nbsp;<img alt="feed=icon" src="images/feed-icon.gif">
</td>
</tr>
<%if(blogList != null){
	for(RSSItemVO rssItemVO : blogList){
		%>
		<tr>
		<td>
		<a href="<%=rssItemVO.getLink() %>" target="_blank"> <%=rssItemVO.getTitle() %> </a>
		</td>
		</tr>
		<%
	}
}
%>

</Table>
