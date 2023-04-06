package com.sweethome.sweet.goodscontract.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.goodscontract.vo.GoodsContractVO;


public interface GoodsContractDAO {
	
	//상품 목록
	public List<GoodsContractVO>selectAllGoodsContractList(String member_id) throws Exception;
}
