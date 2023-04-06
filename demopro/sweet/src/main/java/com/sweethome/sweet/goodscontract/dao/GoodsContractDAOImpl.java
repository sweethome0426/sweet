package com.sweethome.sweet.goodscontract.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.sweethome.sweet.goodscontract.vo.GoodsContractVO;

@Repository("goodsContractDAO")
public class GoodsContractDAOImpl implements GoodsContractDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//상풍목록조회
	@Override
	public List<GoodsContractVO>selectAllGoodsContractList(String member_id) throws Exception {
		return sqlSession.selectList("mapper.goodscontract.selectAllGoodsContractList",member_id);
	}

}
