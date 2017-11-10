package com.terrier.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.terrier.domain.L_mgt_controller_VO;

@Repository
public class L_mgt_DAOImpl implements L_mgt_DAO {

	private static String namespace = "l_mgt_Mapper";
	@Inject
	SqlSession sqlSession;
	
	@Override
	public L_mgt_controller_VO info(String e_num) throws Exception {
		return sqlSession.selectOne(namespace + ".l_controller",e_num);
	}

}
