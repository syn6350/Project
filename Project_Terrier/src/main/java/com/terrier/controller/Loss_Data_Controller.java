package com.terrier.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.terrier.domain.C_mgt_Gps_VO;
import com.terrier.domain.L_mgt_controller_VO;
import com.terrier.domain.Reply_VO;
import com.terrier.domain.User_VO;
import com.terrier.service.GpsToAddress;
import com.terrier.service.L_mgt_Service;

@RestController
@RequestMapping("terrier/*")
public class Loss_Data_Controller {
	
	@Inject
	L_mgt_Service l_mgt_service;
	
	@Inject
	GpsToAddress gps;
	
	@RequestMapping(value="loss_management/controll_view",method=RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> controll_view(@RequestParam("emp_num") String emp_num) throws Exception
	{
		ResponseEntity<Map<String, Object>> response = null; 
		try {
			L_mgt_controller_VO c_vo = l_mgt_service.info(emp_num);
			System.out.println(c_vo);
			
			C_mgt_Gps_VO g_vo = gps.getGps_Adress(emp_num,0);
			System.out.println(g_vo);
			
			Map<String,Object> vo = new HashMap<String,Object>();
			vo.put("c_vo", c_vo);
			vo.put("g_vo", g_vo);
			
			response = new ResponseEntity<Map<String,Object>>(vo,HttpStatus.OK);
		}
		catch(Exception e) {
			
			Map<String,Object> test_vo = new HashMap<String,Object>();
			test_vo.put("test", "test");
			
			response = new ResponseEntity<Map<String,Object>>(test_vo,HttpStatus.BAD_REQUEST);
		}
	    return response;
	}
	
	@RequestMapping(value="loss_management/mdm_to_web",method=RequestMethod.POST)
	public ResponseEntity<String> mdm_to_web(@RequestParam("data") String data) throws Exception
	{
		ResponseEntity<String> response = null; 
		try {
			System.out.println(data);
			response = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}
		catch(Exception e) {
			response = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
		}
	    return response;
	}
}
