package com.junjun.spike.service;

import com.junjun.spike.domain.MiaoshaOrder;
import com.junjun.spike.domain.MiaoshaUser;
import com.junjun.spike.domain.OrderInfo;
import com.junjun.spike.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author junjun
 * @date 2018/9/27 22:23:02
 **/
@Service
public class MiaoshaService {

    //不建议引用别的dao，建议引用别的service


    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderService orderService;

    @Transactional
    public OrderInfo miaosha(MiaoshaUser user, GoodsVo goodsVo){

        //减库存 下订单 写入秒杀订单
        goodsService.reduceStock(goodsVo);
        OrderInfo orderInfo = orderService.createOrder(user, goodsVo);
        return orderInfo;
    }

    public long getMiaoshaResult(Long userId, long goodsId){

        MiaoshaOrder order = orderService.getMiaoshaOrderByUserIdGoodsId(userId, goodsId);
        if(order != null){
            return order.getOrderId();
        }
        return 0;
    }
}
