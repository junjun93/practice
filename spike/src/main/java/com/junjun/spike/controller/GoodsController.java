package com.junjun.spike.controller;

import com.junjun.spike.domain.MiaoshaUser;
import com.junjun.spike.redis.RedisService;
import com.junjun.spike.service.GoodsService;
import com.junjun.spike.service.MiaoshaUserService;
import com.junjun.spike.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author junjun
 * @date 2018/9/26 21:32:20
 **/
@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private MiaoshaUserService userService;

    @Autowired
    private RedisService redisService;

    @Autowired
    private GoodsService goodsService;

    //补充 user封装好，就不需要写一坨了
    @RequestMapping("/to_list")
    public String list(HttpServletRequest request, HttpServletResponse response, Model model, MiaoshaUser user){

        model.addAttribute("user", user);
        List<GoodsVo> goodsVoList = goodsService.listGoodsVo();
        model.addAttribute("goodsVosList", goodsVoList);
        return "goods_list";
    }

    @RequestMapping("/to_detail/{goodsId}")
    @ResponseBody
    public String detail(Model model, MiaoshaUser user, @PathVariable("goodsId") long goodsId){

        model.addAttribute("user", user);
        GoodsVo goodsVo = goodsService.getGoodsVoByGoodsId(goodsId);

        long startAt = goodsVo.getStartDate().getTime();
        long endAt = goodsVo.getEndDate().getTime();
        long now = System.currentTimeMillis();
        int miaoshaStatus = 0;
        int remainSeconds = 0;

        if(now < startAt){
            miaoshaStatus = 0;
            remainSeconds = (int)((startAt - now)/1000);
        } else if(now > endAt){
            miaoshaStatus = 2;
            remainSeconds = -1;
        } else{
            miaoshaStatus = 1;
            remainSeconds = 0;
        }

        model.addAttribute("miaoshaStatus", miaoshaStatus);
        model.addAttribute("goods", goodsVo);
        return "goods_detail";
    }
}
