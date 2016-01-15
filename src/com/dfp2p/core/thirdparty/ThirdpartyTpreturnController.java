package com.dfp2p.core.thirdparty;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseThirdpartyController;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;

@Controller
public class ThirdpartyTpreturnController extends BaseThirdpartyController {
	ThirdpartyTpnoticeController tpnotice = new ThirdpartyTpnoticeController().setIsReturn(true);
	public ModelAndView recharge(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		String actionType = "create_hosting_deposit";
		PageData pd = new PageData(request);
		return this.showTip(mv, "success", "3", "充值成功");
	}
}
