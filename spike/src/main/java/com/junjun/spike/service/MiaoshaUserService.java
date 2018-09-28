package com.junjun.spike.service;

import com.junjun.spike.dao.MiaoshaUserDao;
import com.junjun.spike.domain.MiaoshaUser;
import com.junjun.spike.exception.GlobalException;
import com.junjun.spike.redis.RedisService;
import com.junjun.spike.result.CodeMsg;
import com.junjun.spike.util.MD5Util;
import com.junjun.spike.util.UUIDUtil;
import com.junjun.spike.vo.LoginVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

/**
 * @author junjun
 * @date 2018/9/26 14:56:29
 **/
@Service
public class MiaoshaUserService {

    @Autowired
    private MiaoshaUserDao miaoshaUserDao;

    @Autowired
    private RedisService redisService;

    public static final String COOKI_NAME_TOKEN = "token";

    public MiaoshaUser getById(long id){

        MiaoshaUser user = miaoshaUserDao.getById(id);
        /*if(user != null){

        }*/
        return user;
    }

    public boolean updatePassword(String token, long id, String formPass){
        return false;
    }

    //补一个

    public String login(HttpServletResponse response, LoginVo loginVo){

        if(loginVo == null){
            throw new GlobalException(CodeMsg.SERVER_ERROR);
        }
        String mobile = loginVo.getMobile();
        String formPass = loginVo.getPassword();

        //判断手机号是否存在
        MiaoshaUser user = getById(Long.parseLong(mobile));
        if(user == null){
            throw new GlobalException(CodeMsg.MOBILE_NOT_EXIST);
        }

        //验证密码
        String dbPass = user.getPassword();
        String saltDB = user.getSalt();
        String calcPass = MD5Util.formPassToDBPass(formPass, saltDB);
        if(!calcPass.equals(dbPass)){
            throw new GlobalException(CodeMsg.PASSWORD_EMPTY);
        }

        //生成cookie
        String token = UUIDUtil.uuid();
        addCookie(response, token, user);
        return token;
    }

    public void addCookie(HttpServletResponse response, String token, MiaoshaUser user){

        //redisService.set(MiaoshaUserKey.token, token, user);
        Cookie cookie = new Cookie(COOKI_NAME_TOKEN, token);
        //cookie.setMaxAge(MiaoshaUserKey.);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}
