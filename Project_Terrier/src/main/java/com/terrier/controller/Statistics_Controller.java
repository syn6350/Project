package com.terrier.controller;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.terrier.domain.Control_count_VO;
import com.terrier.domain.Dep_ctl_on_count_VO;
import com.terrier.domain.Dep_ctl_status_VO;
import com.terrier.domain.S_mgt_date_con_count_VO;
import com.terrier.service.S_mgt_Service;
//통계관리 메뉴측
@Controller
@RequestMapping("terrier/*")
public class Statistics_Controller {

	@Inject
	S_mgt_Service s_mgt_service;
	
	@RequestMapping(value="statistics_management/measurement_mgt",method=RequestMethod.GET)//날짜별 사용률통계
	public void measurement_mgtGET(Model model) throws Exception
	{
		
		String nowDate=s_mgt_service.nowDate();
		model.addAttribute("now",nowDate);//현재 날짜 기본값으로 두기
		
		S_mgt_date_con_count_VO vo_on =new S_mgt_date_con_count_VO();//ON에 대한 정보뽑기
		vo_on.setDate(nowDate);
		vo_on.setController("ON");
		model.addAttribute("ON",s_mgt_service.date_count_on_off(vo_on));//${ON.??}
		
		S_mgt_date_con_count_VO vo_off =new S_mgt_date_con_count_VO();//OFF에 대한 정보뽑기
		vo_off.setDate(nowDate);
		vo_off.setController("OFF");
		model.addAttribute("OFF",s_mgt_service.date_count_on_off(vo_off));//${OFF.??}		
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="statistics_management/test",method=RequestMethod.GET)//날짜별 사용률통계
	public void test(Model model) throws Exception
	{
		
	
	}
	
	
	//실시간 제어 통계
	@RequestMapping(value="statistics_management/c_measurement_mgt",method=RequestMethod.GET)
	public void control(Model model)
	{
		Control_count_VO c_count_on = s_mgt_service.control_count("on");
		Control_count_VO c_count_off = s_mgt_service.control_count("off");
		
		Dep_ctl_on_count_VO dep_ctl_vo = new Dep_ctl_on_count_VO(); 
		dep_ctl_vo.setEng_dep(s_mgt_service.dep_ctl_on_count("인사"));
		dep_ctl_vo.setGa_dep(s_mgt_service.dep_ctl_on_count("기술"));
		dep_ctl_vo.setHr_dep(s_mgt_service.dep_ctl_on_count("생산"));
		dep_ctl_vo.setPro_dep(s_mgt_service.dep_ctl_on_count("총무"));
		
		model.addAttribute("c_count_on", c_count_on);
		model.addAttribute("c_count_off", c_count_off);
		model.addAttribute("dep_ctl_vo",dep_ctl_vo);
	}
	
	// 실시간 통계의 load용 div
	@RequestMapping(value="statistics_management/c_measurement_dep_mgt",method=RequestMethod.GET)
	public void control_dep_ctl(@RequestParam("department") String department, Model model)
	{
		Dep_ctl_status_VO dep_status_vo = new Dep_ctl_status_VO();
		dep_status_vo.setDepartment(department);
		dep_status_vo.setStatus("on");
		Control_count_VO d_count_on = s_mgt_service.dep_ctl_status(dep_status_vo);	
		dep_status_vo.setStatus("off");
		Control_count_VO d_count_off = s_mgt_service.dep_ctl_status(dep_status_vo);
		
		model.addAttribute("department", department);
		model.addAttribute("d_count_on", d_count_on);
		model.addAttribute("d_count_off", d_count_off);
	}
}