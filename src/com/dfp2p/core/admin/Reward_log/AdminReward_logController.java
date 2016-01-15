package com.dfp2p.core.admin.Reward_log;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseAdminController;
import com.dfp2p.core.admin.Capital_log.AdminCapital_logService;
import com.dfp2p.util.ExcelUtil;
import com.dfp2p.util.PageData;

@Controller
public class AdminReward_logController extends BaseAdminController {
	public String tplPath = "Reward_log";
	
	@Resource(name="adminReward_logService")
	private AdminReward_logService thisService;
	
	
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
		Map<String, String> typeSelect = new LinkedHashMap<String,String>();
		typeSelect.put("","所有");
		typeSelect.put("2","会员升级");
		typeSelect.put("3","会员充值");
		typeSelect.put("4","提现冻结");
		typeSelect.put("5","撤消提现");
		typeSelect.put("6","投标冻结");
		typeSelect.put("15","投标成功本金解冻");
		typeSelect.put("28","投标成功待收利息");
		typeSelect.put("7","管理员操作");
		typeSelect.put("8","流标返还");
		typeSelect.put("16","复审未通过返还 ");
		typeSelect.put("9","会员还款");
		typeSelect.put("10","网站代还");
		typeSelect.put("11","偿还借款");
		typeSelect.put("12","提现失败");
		typeSelect.put("13","推荐的会员升级");
		typeSelect.put("14","升级VIP");
		typeSelect.put("17","借款入帐");
		typeSelect.put("18","借款管理费");
		typeSelect.put("19","借款保证金");
		typeSelect.put("21","支付投标奖励");
		typeSelect.put("22","视频认证费用");
		typeSelect.put("23","利息管理费");
		typeSelect.put("24","还款完成解冻");
		typeSelect.put("25","实名认证费用");
		typeSelect.put("26","现场认证费用");
		typeSelect.put("27","充值审核");
		typeSelect.put("29","提现成功");
		typeSelect.put("30","逾期罚息");
		typeSelect.put("31","催收费");
		typeSelect.put("78","借款服务费");
		typeSelect.put("44","提现费用调整");
		typeSelect.put("53","积分兑换入帐");
		typeSelect.put("54","债权转出");
		typeSelect.put("55","承接债权");
		typeSelect.put("56","债权转让手续费");
		typeSelect.put("57","收到债权还款");
		typeSelect.put("67","债权待收变动");
		typeSelect.put("68","转出债权待收变动");
		typeSelect.put("65","投标失败返回到奖");
		typeSelect.put("66","奖励投标预扣");
		typeSelect.put("94","提前还款补偿利息");
		mv.addObject("typeSelect",typeSelect);
		
		Map<String, String> compareSignSelect = new LinkedHashMap<String,String>();
		compareSignSelect.put("gt","大于");
		compareSignSelect.put("eq","等于");
		compareSignSelect.put("lt","小于");
		mv.addObject("compareSignSelect",compareSignSelect);
		
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getReward_logList(pd, mv);

		mv.addObject("list", list);
		return this.getTplView(request,response, tplPath, mv);
	}
	public ModelAndView user_page(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

		return index(request,response, mv);
	}

	public void toExcel(HttpServletRequest request,HttpServletResponse response, ModelAndView mv) {
		PageData pd = new PageData(request);
		
		HashMap<String, Object> list = thisService.getReward_logExcelList(pd, mv);
		
		String[] arr = {"id","user_name as 姓名","type","affect_money","reward_money","add_time","info"};
		ExcelUtil.writeExcel((List<Map<String,Object>>)list.get("data"), "测试", arr,response);
		
	}
}
