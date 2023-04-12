package com.sweethome.sweet.order.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;
import com.sweethome.sweet.order.dao.OrderDAO;
import com.sweethome.sweet.order.vo.OrderVO;


@Service("orderService")
@Transactional(propagation=Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception{
		List<OrderVO> orderGoodsList;
		orderGoodsList=orderDAO.listMyOrderGoods(orderVO);
		return orderGoodsList;
	}
	
	public void addNewOrder(List<OrderVO> myOrderList) throws Exception{
		//orderDAO.insertNewOrder(myOrderList, goodscon_id);
		orderDAO.removeGoodsFromCart(myOrderList);
	}	
	
	public OrderVO findMyOrder(int order_id) throws Exception{
		return orderDAO.findMyOrder(order_id);
	}

	public OrderVO getGoodsById(int goods_id) throws Exception {
	    // TODO: Add code to retrieve GoodsVO object by ID from the data source (e.g. database)
		OrderVO orderVO = new OrderVO();
		orderVO.setGoods_id(goods_id);
	    return orderVO;
	}
}

