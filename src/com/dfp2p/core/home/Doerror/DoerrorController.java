package com.dfp2p.core.home.Doerror;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.thirdparty.ThirdpartyTpsetController;
import com.dfp2p.util.PageData;

@Controller
public class DoerrorController extends BaseHomeController {
	private static Log logger = LogFactory.getLog(DoerrorController.class);
	
	protected PageData getThisPageData(HttpServletRequest request,HttpServletResponse response) {
		PageData pd = new PageData(request);
		return pd;
	}
	
	public  void unfreeze(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws Exception {
		PageData pd = new PageData(request);
		String freezeID=pd.get("fid");
		String tok=pd.get("k");
		if(!("123443efth323r423t").equals(tok)){
			return ;
		}
	}
	
}
