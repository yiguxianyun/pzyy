package kk.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jeecgframework.web.cgform.exception.BusinessException;

/**   
 * @author 
 * @date 
 * @version 
 */
public class 其他工具 {
    public static Map<String,Object> 提取工作流表单(Map map) {
    	Map<String,Object> dataMap= new HashMap<String, Object>(0);
        if(map!=null){
	        Iterator it=map.entrySet().iterator();
	        while(it.hasNext()){
		        Map.Entry entry=(Map.Entry)it.next();
		        String key=entry.getKey().toString();
		        if(!key.startsWith("工作流_")){
		        	continue;
		        }
		        Object keyval=entry.getValue();
                dataMap.put(key, keyval);
	        }	        
        }
        return dataMap;
    }
    
    public static String [] 过滤字段 = {"tableName","saveOrUpdateMore","提取"};

}








