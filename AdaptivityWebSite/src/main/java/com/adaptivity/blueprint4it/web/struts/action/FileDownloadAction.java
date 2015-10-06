/**
 * 
 */
package com.adaptivity.blueprint4it.web.struts.action;

/**
 * @author pawang
 *
 */
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DownloadAction;

import com.adaptivity.blueprint4it.beans.DownloadProperties;
import com.adaptivity.blueprint4it.dao.hibernate.Login;
import com.adaptivity.blueprint4it.dao.hibernate.LoginDownloads;
import com.adaptivity.blueprint4it.services.ServiceFinder;
import com.adaptivity.blueprint4it.util.MailUtil;
import com.adaptivity.blueprint4it.web.common.Constants;

public class FileDownloadAction extends DownloadAction {
	
	private static Logger logger = Logger.getLogger(FileDownloadAction.class);	
	/**
	 * Returns the information on the file, or other stream, to be downloaded by
	 * this action.
	 * 
	 * @param mapping
	 *            The ActionMapping used to select this instance.
	 * @param form
	 *            The optional ActionForm bean for this request (if any).
	 * @param request
	 *            The HTTP request we are processing.
	 * @param response
	 *            The HTTP response we are creating.
	 * 
	 * @return The information for the file to be downloaded.
	 * 
	 * @throws Exception
	 *             if an exception occurs.
	 */
	protected StreamInfo getStreamInfo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String operatingSystemName = request.getParameter(Constants.OS_NAME);
		String download = request.getParameter(Constants.DOWNLOAD);
		
		DownloadProperties downloadProperties = (DownloadProperties) ServiceFinder
				.getContext(request).getBean("downloadProperties");
		
		String filePath = null;
		String fileName = null; 
		
		if (Constants.OS_WINDOWS.equals(operatingSystemName)) {
			filePath = downloadProperties.getWindowsUrl();
			fileName = downloadProperties.getWindowsFileName();
		} else if (Constants.OS_MAC.equals(operatingSystemName)) {
			filePath = downloadProperties.getMacUrl();
			fileName = downloadProperties.getMacFileName();
			
		} else if (Constants.OS_LINUX.equals(operatingSystemName)) {
			filePath = downloadProperties.getLinuxUrl();
			fileName = downloadProperties.getLinuxFileName();
		}	
		if(download != null && download.equals(Constants.TUTORIAL)){
			filePath = downloadProperties.getBlueprintTutorialUrl();
			fileName = downloadProperties.getBlueprintTutorialFileName();
			
		}/*else if (download != null && download.equals(Constants.LIFECYCLE_VIDEO)) {
			filePath = downloadProperties.getLifecycleVideoUrl();
			fileName = downloadProperties.getLifecycleVideoFileName();
			
		}else if (download != null && download.equals(Constants.WORKLOADS_VIDEO)) {
			filePath = downloadProperties.getWorkloadsVideoUrl();
			fileName = downloadProperties.getWorkloadsVideoFileName();
		}	*/
		/*Logging the information of hte user downloading the file
		 * in 'login_downloads'*/
		
	/*	if(download != null && !(download.equals(Constants.WORKLOADS_VIDEO)||download.equals(Constants.LIFECYCLE_VIDEO))){*/
			
			com.adaptivity.blueprint4it.dao.SpringHibernateDAO springHibernateDAO = (com.adaptivity.blueprint4it.dao.SpringHibernateDAO) ServiceFinder
			.getContext(request).getBean("SpringHibernateDao");
			LoginDownloads loginDownloads = new LoginDownloads();
			loginDownloads.setFileName(fileName);
			HttpSession session = request.getSession();
			Login loginUser = (Login)session.getAttribute(Constants.CURRENT_USER);
			loginDownloads.setLoginUser(loginUser);
			String timeStamp = new Date().toString();
			loginDownloads.setTimeStamp(timeStamp);
			springHibernateDAO.saveDownloadDetails(loginDownloads);
			
			/*Sending mail to the sales team.*/
			String downloadInfoMailBody = MailUtil.getDownloadInfoForSalesDept(loginUser, timeStamp, fileName);
			
			com.adaptivity.blueprint4it.web.common.SendMail mailBean = (com.adaptivity.blueprint4it.web.common.SendMail) ServiceFinder
					.getContext(request)
					.getBean(
							com.adaptivity.blueprint4it.web.common.Constants.MAIL_BEAN);
			String[] recipients = new String[1];
			recipients[0] =downloadProperties.getSalesAddress();
			mailBean.sendMail(recipients,"Blueprint4it installer download details" , downloadInfoMailBody, Constants.FROM_MAIL , null);
		//}
		String contentType = downloadProperties.getContentType();

		response.setHeader("Content-Disposition", "attachment; filename="
				+ fileName + ".zip;");

		return new SI(contentType, new File(filePath));
	}

	/**
	 * This class represents the pertinent details about the file to be
	 * downloaded.
	 * 
	 */
	public static class SI implements StreamInfo {

		private String contentType;
		private File file;

		public SI(String contentType, File file) {
			this.contentType = contentType;
			this.file = file;
		}

		public String getContentType() {
			return this.contentType;
		}

		/**
		 * Method to get a stream on the file to download
		 * 
		 * @return The InputStream wrapping the file to download
		 * 
		 */
		public InputStream getInputStream() throws IOException {
			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			return bis;
		}

	}

}
