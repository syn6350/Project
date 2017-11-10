package com.terrier.persistence;

import com.terrier.domain.L_mgt_controller_VO;

public interface L_mgt_DAO {
	public L_mgt_controller_VO info(String e_num)throws Exception;
}
