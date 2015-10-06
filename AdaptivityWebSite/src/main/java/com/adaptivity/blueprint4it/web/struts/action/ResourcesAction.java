/**
 * 
 */
package com.adaptivity.blueprint4it.web.struts.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.adaptivity.blueprint4it.beans.DownloadProperties;
import com.adaptivity.blueprint4it.services.ServiceFinder;
import com.adaptivity.blueprint4it.util.RSSItemVO;
import com.adaptivity.blueprint4it.util.RssFeedParser;
import com.adaptivity.blueprint4it.web.common.Constants;

/**
 * @author sunila
 *
 */
public class ResourcesAction extends BaseAction {
	@Override
	public ActionForward executeAction(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DownloadProperties downloadProperties = (DownloadProperties) ServiceFinder
		.getContext(request).getBean("downloadProperties");
		int feedSize = Integer.valueOf(downloadProperties.getFeedSize());
		String page = request.getParameter("page");
		String type = request.getParameter("type");
		String forward = Constants.SUCCESS;
		if(page != null && type.equals("ceoBlog")){
			forward = "ceoBLog";
		}else if(page != null && type.equals("blueprintBlog")){
			forward = "blueprintBlog";
		}
		RssFeedParser rssFeedParser = new RssFeedParser();
		String ceoBlogFeed = downloadProperties.getCeoBlogFeed();
		rssFeedParser.parse(ceoBlogFeed);
		List<RSSItemVO> CEOBlogList = rssFeedParser.getItemVOCollection();
		List<RSSItemVO> CEOBlogListSizeElements = rssFeedParser.getItemVOCollectionOfSize(feedSize);
		
		RssFeedParser rssFeedParser1 = new RssFeedParser();
		String blueprint4itBlogFeed = downloadProperties.getBlueprint4itBlogFeed();
		rssFeedParser1.parse(blueprint4itBlogFeed);
		List<RSSItemVO> BluePrintBlogList = rssFeedParser1.getItemVOCollection();
		List<RSSItemVO> BluePrintBlogListSizeElements = rssFeedParser1.getItemVOCollectionOfSize(feedSize);
		
		request.setAttribute(Constants.CEO_BLOG_LIST, CEOBlogList);
		request.setAttribute(Constants.CEO_BLOG_LIST_SIZE_ELEMENT, CEOBlogListSizeElements);
		request.setAttribute(Constants.BLUEPRINT_BLOG_LIST, BluePrintBlogList);
		request.setAttribute(Constants.BLUEPRINT_BLOG_LIST_SIZE_ELEMENT, BluePrintBlogListSizeElements);
		
		// TODO Auto-generated method stub
		return mapping.findForward(forward);
	}


}
