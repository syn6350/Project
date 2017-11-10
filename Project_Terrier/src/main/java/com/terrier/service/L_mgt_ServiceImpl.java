package com.terrier.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.terrier.domain.L_mgt_controller_VO;
import com.terrier.persistence.L_mgt_DAO;

@Service
public class L_mgt_ServiceImpl implements L_mgt_Service {

	@Inject
	L_mgt_DAO l_mgt_dao;
	
	@Override
	public L_mgt_controller_VO info(String e_num) throws Exception {
		return l_mgt_dao.info(e_num);
	}

}
