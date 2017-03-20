package kk.activiti.controller;

import java.io.InputStream;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import me.kafeitu.demo.activiti.service.activiti.WorkflowProcessDefinitionService;
import me.kafeitu.demo.activiti.service.activiti.WorkflowTraceService;

import org.activiti.engine.HistoryService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.ProcessEngineConfiguration;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;

import org.activiti.engine.repository.ProcessDefinition;

import org.activiti.spring.ProcessEngineFactoryBean;
import org.jeecgframework.core.common.model.json.AjaxJson;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kk.activiti.service.工作流管理服务器;
import kk.controller.通用控制器;
/**
 * 流程管理控制器
 *
 * @author kk
 */
@Controller
@RequestMapping(value = "/工作流")
public class 工作流管理控制器 {

    protected Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    protected WorkflowProcessDefinitionService workflowProcessDefinitionService;
    @Autowired
    protected RepositoryService repositoryService;
    @Autowired
    protected RuntimeService runtimeService;
    @Autowired
    protected TaskService taskService;
    @Autowired
    protected HistoryService historyService;
    @Autowired
    protected WorkflowTraceService traceService;
    @Autowired
    ManagementService managementService;

    protected static Map<String, ProcessDefinition> PROCESS_DEFINITION_CACHE = new HashMap<String, ProcessDefinition>();

    @Autowired
    ProcessEngineFactoryBean processEngine;

    @Autowired
    ProcessEngineConfiguration processEngineConfiguration;
	@Autowired
	private 工作流管理服务器 工作流管理服务器;	
	@Autowired
	private 通用控制器 通用控制器;	
    /**
     * 读取资源，通过部署ID
     *
     * @param processDefinitionId 流程定义
     * @param resourceType        资源类型(xml|image)
     * @throws Exception
     */
    @RequestMapping(params = "resourceRead")
    public void loadByDeployment(String processDefinitionId, String resourceType,HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
        String resourceName = "";
        if (resourceType.equals("image")) {
            resourceName = processDefinition.getDiagramResourceName();
        } else if (resourceType.equals("xml")) {
            resourceName = processDefinition.getResourceName();
        }
        InputStream resourceAsStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
        byte[] b = new byte[1024];
        int len = -1;
        while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
            response.getOutputStream().write(b, 0, len);
        }
    }

    @RequestMapping(params = "删除流程部署")
	@ResponseBody
    public void 删除流程部署(String id,HttpServletRequest request) throws Exception {
    	repositoryService.deleteDeployment(id, true);
    }
    @RequestMapping(params = "删除流程")
	@ResponseBody
    public AjaxJson 删除流程(String id,String 原因,String 表单名称,String 表单编号,String 步骤,HttpServletRequest request) throws Exception {
		String message = null;
		AjaxJson j = new AjaxJson();
    	
    	String[] str={"tianxie","1"};
        List<String> asList = Arrays.asList(str);
        
        if (asList.contains(步骤) || 通用控制器.查用户("username",request).equals("admin")){
        	工作流管理服务器.deleteProcessInstance(id, 原因,表单名称,表单编号);
        	j.setSuccess(true);
			message = "流程及相关表单，删除成功！";
    	}else{
    		j.setSuccess(false);
			message = "流程已经走到下一步，不能删除！";
    	}
        j.setMsg(message);
		return j;
    }
    @RequestMapping(params = "删除已结束流程")
	@ResponseBody
    public AjaxJson 删除已结束流程(String id,HttpServletRequest request) throws Exception {
		String message = null;
		AjaxJson j = new AjaxJson();
    	historyService.deleteHistoricProcessInstance(id);
    	j.setSuccess(true);
		message = "删除成功！";
		j.setMsg(message);
		return j;
    }

}










