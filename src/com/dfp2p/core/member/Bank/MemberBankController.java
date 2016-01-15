package com.dfp2p.core.member.Bank;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.dfp2p.baseController.BaseMemberController;
import com.dfp2p.core.thirdparty.ThirdpartyTpqueryController;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.fun.Common.borrowAndInvest;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.sun.jna.platform.win32.Netapi32Util.UserInfo;

@Controller
public class MemberBankController extends BaseMemberController {
	public String tplPath = "Bank";
	
	
}
