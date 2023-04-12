package com.sweethome.sweet.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.sweethome.sweet.order.vo.OrderVO;

public interface OrderDAO {
	public List<OrderVO> listMyOrderGoods(OrderVO orderBean) throws DataAccessException;
	public void insertNewOrder(List<OrderVO> myOrderList, int goodscon_id) throws DataAccessException;
	public OrderVO findMyOrder(int order_id) throws DataAccessException;
	public void removeGoodsFromCart(List<OrderVO> myOrderList)throws DataAccessException;
}

