package com.sweethome.sweet.goodscontract.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sweethome.sweet.goodscontract.vo.GoodsContractVO;
import com.sweethome.sweet.goodscontract.dao.GoodsContractDAO;

@Service("goodsContractService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsContractServiceImpl implements GoodsContractService {
	
	@Autowired
	GoodsContractDAO goodsContractDAO;
	
	//상품조회 사용자
	@Override
	public List<GoodsContractVO>selectAllGoodsContractList(String member_id) throws Exception {
		return goodsContractDAO.selectAllGoodsContractList(member_id);
	}
	
}
