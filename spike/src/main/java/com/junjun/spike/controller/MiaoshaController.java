package com.junjun.spike.controller;

import com.junjun.spike.domain.MiaoshaOrder;
import com.junjun.spike.domain.MiaoshaUser;
import com.junjun.spike.domain.OrderInfo;
import com.junjun.spike.redis.RedisService;
import com.junjun.spike.result.CodeMsg;
import com.junjun.spike.service.GoodsService;
import com.junjun.spike.service.MiaoshaService;
import com.junjun.spike.service.MiaoshaUserService;
import com.junjun.spike.service.OrderService;
import com.junjun.spike.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author junjun
 * @date 2018/9/27 22:04:36
 **/
@Controller
@RequestMapping("/miaosha")
public class MiaoshaController {

    @Autowired
    private MiaoshaUserService userService;

    @Autowired
    private RedisService redisService;

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private MiaoshaService miaoshaService;

    @RequestMapping("/do_miaosha")
    @ResponseBody
    public String list(Model model, MiaoshaUser user, @RequestParam("goodsId") long goodsId){

        model.addAttribute("user", user);
        if(user == null){
            return "login";
        }

        //判断库存
        GoodsVo goodsVo = goodsService.getGoodsVoByGoodsId(goodsId);
        int stock = goodsVo.getStockCount();
        if(stock <= 0){
            model.addAttribute("errmsg", CodeMsg.MIAO_SHA_OVER.getMsg());
            return "miaosha_fail";
        }

        //判断是否秒杀到了
        MiaoshaOrder order = orderService.getMiaoshaOrderByUserIdGoodsId(user.getId(), goodsId);
        if(order == null){
            model.addAttribute("errmsg", CodeMsg.REPEATE_MIAOSHA.getMsg());
            return "miaosha_fail";
        }

        //减库存 下订单 写入秒杀订单
        OrderInfo orderInfo = miaoshaService.miaosha(user, goodsVo);
        model.addAttribute("orderInfo", orderInfo);
        model.addAttribute("goodsVo", goodsVo);
        return "order_detail";
    }
}
