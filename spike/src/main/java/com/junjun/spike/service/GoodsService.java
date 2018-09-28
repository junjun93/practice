package com.junjun.spike.service;

import com.junjun.spike.dao.GoodsDao;
import com.junjun.spike.domain.MiaoshaGoods;
import com.junjun.spike.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author junjun
 * @date 2018/9/27 20:33:39
 **/
@Service
public class GoodsService {

    @Autowired
    private GoodsDao goodsDao;

    public List<GoodsVo> listGoodsVo(){
        return goodsDao.listGoodsVo();
    }

    public GoodsVo getGoodsVoByGoodsId(long goodsId){
        return goodsDao.getGoodsVoByGoodsId(goodsId);
    }

    public boolean reduceStock(GoodsVo goodsVo){
        MiaoshaGoods g = new MiaoshaGoods();
        g.setGoodsId(goodsVo.getId());
        int ret = goodsDao.reduceStock(g);
        return ret > 0;
    }

    //补充理解，前台传集合、后台接集合
    public void resetStock(List<GoodsVo> goodsVoList){
        for(GoodsVo goodsVo : goodsVoList){
            MiaoshaGoods g = new MiaoshaGoods();
            g.setGoodsId(goodsVo.getId());
            g.setStockCount(goodsVo.getStockCount());
            goodsDao.resetStock(g);
        }
    }
}
