package com.sweethome.sweet.order.service;

import java.util.List;
import java.util.Map;

import com.sweethome.sweet.order.vo.OrderVO;

public interface OrderService {
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception;
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception;
	public OrderVO findMyOrder(int order_id) throws Exception;
	
	public OrderVO getGoodsById(int goods_id) throws Exception;
}

