package com.dfp2p.core.home.Common;

import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.dfp2p.baseController.BaseHomeController;
import com.dfp2p.core.sysConfig;
import com.dfp2p.core.home.Category.CategoryService;
import com.dfp2p.core.home.Register.RegisterService;
import com.dfp2p.core.tag.tplCommon;
import com.dfp2p.fun.Common.Common;
import com.dfp2p.mySql.data.DataSet;
import com.dfp2p.mySql.data.dao.MySQL;
import com.dfp2p.mySql.data.dao.T;
import com.dfp2p.util.BeanMapUtils;
import com.dfp2p.util.PageData;
import com.dfp2p.util.Tools;
import com.dfp2p.util.WhereUtil;

@Controller
public class CommonController extends BaseHomeController {
	private static Log log = LogFactory.getLog(CommonController.class);
	public String tplPath = "Common";
	@Resource(name="CommonService")
	private CommonService thisService;
	
	public void getArea(HttpServletRequest request,HttpServletResponse response) {	
		WhereUtil searchMap=new WhereUtil();
		HashMap<String, Object>jsonData=new HashMap<>();
		PageData pd = new PageData(request);
		String rid = pd.get("rid");
		String htmlString="";
		if(StringUtils.isBlank(rid)){
			jsonData.put("NoCity", "1");
		}else{
			searchMap.getStringCondition("reid", rid);
			List<Map<String, String>> arealist = thisService.getArea(searchMap);
			if(arealist!=null&&arealist.size()>0){
				if("1".equals(rid)) htmlString+="<option value='0'>请选择省份</option>\r\n";
				for (int i = 0; i < arealist.size(); i++) {
					htmlString+="<option value='"+arealist.get(i).get("id")+"'>"+arealist.get(i).get("name")+"</option>\r\n";
				}
			}else{
				htmlString+="<option value=''>--该地区下无下级地区--</option>\r\n";
			}
			jsonData.put("option", htmlString);
		}
		this.echoJson(jsonData, response);
/*			if(String($rid)){
				$data['NoCity'] = 1;
				exit(json_encode($data));
			}
			$map['reid'] = $rid;
			$alist = M('area')->field('id,name')->order('sort_order DESC')->where($map)->select();

			if(count($alist)===0){
				$str="<option value=''>--该地区下无下级地区--</option>\r\n";
			}else{
				if($rid==1) $str.="<option value='0'>请选择省份</option>\r\n";
				foreach($alist as $v){
					$str.="<option value='{$v['id']}'>{$v['name']}</option>\r\n";
				}
			}
			$data['option'] = $str;
			$res = json_encode($data);
			echo $res;
*/
	}
	
}


