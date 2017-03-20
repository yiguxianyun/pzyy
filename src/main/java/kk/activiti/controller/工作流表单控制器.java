package kk.activiti.controller;

import me.kafeitu.demo.activiti.entity.oa.Leave;
//import me.kafeitu.demo.activiti.service.oa.leave.LeaveManager;
import me.kafeitu.demo.activiti.service.oa.leave.LeaveWorkflowService;
import me.kafeitu.demo.activiti.util.Page;
import me.kafeitu.demo.activiti.util.PageUtil;
import me.kafeitu.demo.activiti.util.UserUtil;
import me.kafeitu.demo.activiti.util.Variable;
import org.activiti.engine.ActivitiException;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.identity.User;
import org.activiti.engine.runtime.ProcessInstance;
import org.apache.commons.lang3.StringUtils;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.web.cgform.common.CommUtils;
import org.jeecgframework.web.cgform.engine.TempletContext;
import org.jeecgframework.web.cgform.exception.BusinessException;
import org.jeecgframework.web.cgform.service.build.DataBaseService;
import org.jeecgframework.web.cgform.service.config.CgFormFieldServiceI;
import org.jeecgframework.web.cgform.service.template.CgformTemplateServiceI;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kk.activiti.service.工作流表单服务器;
import kk.controller.通用控制器;

/**
 * 控制器，包含保存、启动流程
 * @author kk
 */
@Controller
@RequestMapping("/工作流表单")
public class 工作流表单控制器 extends BaseController{
    private Logger logger = LoggerFactory.getLogger(getClass());
//    @Autowired
//    protected LeaveManager leaveManager;
    @Autowired
    protected RuntimeService runtimeService;
    @Autowired
    protected TaskService taskService;
    
	@Autowired
	private TempletContext templetContext;
	@Autowired
	private CgformTemplateServiceI cgformTemplateService;
	@Autowired
	private CgFormFieldServiceI cgFormFieldService;	
	@Autowired
	private 工作流表单服务器 工作流表单服务器;
	@Autowired
	private 通用控制器 通用控制器;
    /**
     */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(params="提交")
	@ResponseBody
	public AjaxJson 提交(HttpServletRequest request) throws Exception{
		String message = null;
		AjaxJson j = new AjaxJson();
		String 流程id = request.getParameter("流程id");
		Map data = request.getParameterMap();
		if(StringUtils.isBlank(流程id)){			
			data = CommUtils.mapConvert(data);
			String tableName = (String)data.get("tableName");
//			String id = (String)data.get("id");
		    Map<String,List<Map<String,Object>>> mapMore =CommUtils.mapConvertMore(data, tableName);
			logger.info("一对多启动！！！！！！！！");
	    	try {
	    		Map<String, Object> result = 工作流表单服务器.启动流程(mapMore, tableName);
	    		data.put("id", result.get("id"));
	    		data.put("流程id", result.get("流程id"));
	    		j.setSuccess(true);
				message = "流程启动成功 流程id："+result.get("流程id");				
			} catch (BusinessException e) {
				e.printStackTrace();
				j.setSuccess(false);
				message = e.getMessage();
			}		    	
		}else {
			Map 待办任务=通用控制器.查流程(流程id, request);
			String 步骤 = (String)待办任务.get("步骤");
			String 办理人 = (String)待办任务.get("办理人");
			String username=通用控制器.查用户("username",request);
			if (  !username.equals(办理人)  ){			
				j.setSuccess(true);
				message = "不能办理！！！你不是当前任务的办理人！！！";
			}else {
				if(步骤.equals("xuanxing")){
					data = CommUtils.mapConvert(data);
					String tableName = (String)data.get("tableName");
				    Map<String,List<Map<String,Object>>> mapMore =CommUtils.mapConvertMore(data, tableName);
					logger.info("一对多选型算价提交！！！！！！！！");
					try {
						工作流表单服务器.选型提交(mapMore, tableName);
						j.setSuccess(true);
						message = "选型算价结果提交成功！";
					} catch (BusinessException e) {
						e.printStackTrace();
						j.setSuccess(false);
						message = e.getMessage();
					}
				}else if(步骤.equals("xiaoshouqueren")){					
					try {
						工作流表单服务器.销售确认(流程id);
						j.setSuccess(true);
						message = "销售确认成功！";
					} catch (BusinessException e) {
						e.printStackTrace();
						j.setSuccess(false);
						message = e.getMessage();
					}
				}else if(步骤.equals("tianxie")){					
					try {
						String 技术支持 = request.getParameter("技术支持");
						自动完成第一步(流程id,技术支持, request);
						j.setSuccess(true);
						message = "数据表提交成功！";
					} catch (BusinessException e) {
						e.printStackTrace();
						j.setSuccess(false);
						message = e.getMessage();
					}
				}
			}
		}
		j.setMsg(message);
		j.setObj(data);
		return j;
	}	

    @RequestMapping(params = "自动完成第一步")
	@ResponseBody
    public void 自动完成第一步(String 流程id,String 技术支持,HttpServletRequest request) throws Exception {
        String taskId=通用控制器.查任务id("待办任务视图", 流程id);
        Map<String, Object> variables = new HashMap<String, Object>();
        variables.put("技术支持",技术支持);
        taskService.complete(taskId, variables);
    }
    
    @RequestMapping(params = "签收")
	@ResponseBody
    public void 签收(String 任务id,String 技术支持,HttpServletRequest request) throws Exception {
    	String userId=通用控制器.查用户("username",request);
    	taskService.claim(任务id, userId);
    }
	@RequestMapping(params="驳回")
	@ResponseBody
	public AjaxJson 驳回(HttpServletRequest request) throws Exception{
		String message = null;
		AjaxJson j = new AjaxJson();
		String 流程id = request.getParameter("流程id");
		工作流表单服务器.驳回(流程id);
		j.setSuccess(true);
		message = "已经驳回！";
		j.setMsg(message);
		return j;
	}	

}












