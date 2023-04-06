package com.sweethome.sweet.goodscontract.service;

import java.util.List;
import java.util.Map;

import com.sweethome.sweet.goodscontract.vo.GoodsContractVO;

public interface GoodsContractService {
		//상품 목록
		public List<GoodsContractVO>selectAllGoodsContractList(String member_id) throws Exception;

}
