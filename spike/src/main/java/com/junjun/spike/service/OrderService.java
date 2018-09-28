package com.junjun.spike.service;

import com.junjun.spike.dao.OrderDao;
import com.junjun.spike.domain.MiaoshaOrder;
import com.junjun.spike.redis.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author junjun
 * @date 2018/9/27 22:16:50
 **/
@Service
public class OrderService {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private RedisService redisService;

    public MiaoshaOrder getMiaoshaOrderByUserIdGoodsId(long userId, long goodsId){

        return orderDao.getMiaoshaOrderByUserIdGoodsId(userId, goodsId);
    }

}
