/**
 * 
 */
package com.adaptivity.blueprint4it.web.struts.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

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
public class WelcomeAction extends BaseAction {
	private static Logger logger = Logger.getLogger(WelcomeAction.class);

	@Override
	public ActionForward executeAction(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.info("Welcome Action is loaded");
		
		DownloadProperties downloadProperties = (DownloadProperties) ServiceFinder
		.getContext(request).getBean("downloadProperties");
		int feedSize = 1;
		String page = request.getParameter("page");
		String type = request.getParameter("type");
	/*	String forward = Constants.SUCCESS;
		if(page != null && type.equals("ceoBlog")){
			forward = "ceoBLog";
		}else if(page != null && type.equals("blueprintBlog")){
			forward = "blueprintBlog";
		}*/
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
		
		request.setAttribute(Constants.CEO_BLOG_LIST_RSS, CEOBlogList);
		request.setAttribute(Constants.CEO_BLOG_LIST_SIZE_ELEMENT_RSS, CEOBlogListSizeElements);
		request.setAttribute(Constants.BLUEPRINT_BLOG_LIST_RSS, BluePrintBlogList);
		request.setAttribute(Constants.BLUEPRINT_BLOG_LIST_SIZE_ELEMENT_RSS, BluePrintBlogListSizeElements);
		
		// TODO Auto-generated method stub
		
		String forward = request.getParameter(Constants.FORWARD);
		logger.info("forward >> " + forward);
		if (forward != null) {
			if (forward.equals(Constants.LOGIN_SUCCESS)) {
				return mapping.findForward(Constants.LOGIN_SUCCESS);
			} else if (forward.equals(Constants.FORGET_PASSWORD_SUCCESS)) {
				request.setAttribute(Constants.DISPLAY_MSG,	"Your password information has been sent to you via E-mail");
				return mapping.findForward(Constants.SUCCESS);
			} else if (forward.equals(Constants.FORGET_PASSWORD)) {
				return mapping.findForward(Constants.FORGET_PASSWORD);
			}else if (forward.equals(Constants.ABOUT_US)) {
				return mapping.findForward(Constants.ABOUT_US);
			}else if (forward.equals(Constants.RESOURCES)) {
				return mapping.findForward(Constants.RESOURCES);
			}else if (forward.equals(Constants.PRODUCT)) {
				return mapping.findForward(Constants.PRODUCT);
			}else if (forward.equals(Constants.SOLUTION)) {
				return mapping.findForward(Constants.SOLUTION);
			}else if (forward.equals(Constants.DESIGN_SCIENCE)) {
				return mapping.findForward(Constants.DESIGN_SCIENCE);
			}else if (forward.equals(Constants.CHANGE_PASSWORD)) {
				return mapping.findForward(Constants.CHANGE_PASSWORD);
			}else if (forward.equals(Constants.CHANGE_PASSWORD_FROM_LINK)) {
				return mapping.findForward(Constants.CHANGE_PASSWORD_FROM_LINK);
			}else if (forward.equals(Constants.CONTACT_US)) {
				return mapping.findForward(Constants.CONTACT_US);
			}else if (forward.equals(Constants.CHANGE_PASSWORD_SUCCESS)) {
				request.setAttribute(Constants.DISPLAY_MSG,
						"Password change successful.");
				return mapping.findForward(Constants.SUCCESS);
			} else {
				return mapping.findForward(Constants.FAILURE);
			}
		} else {
			return mapping.findForward(Constants.SUCCESS);
		}

	}
}
