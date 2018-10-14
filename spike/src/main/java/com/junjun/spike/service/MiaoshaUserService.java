package com.junjun.spike.service;

import com.junjun.spike.dao.MiaoshaUserDao;
import com.junjun.spike.domain.MiaoshaUser;
import com.junjun.spike.exception.GlobalException;
import com.junjun.spike.redis.RedisService;
import com.junjun.spike.result.CodeMsg;
import com.junjun.spike.util.MD5Util;
import com.junjun.spike.util.UUIDUtil;
import com.junjun.spike.vo.LoginVo;
import org.apache.commons.lang3.StringUtils;
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


    /**
     * 为何不直接调用，多此一举
     * */
    public MiaoshaUser getById(long id){

        MiaoshaUser user = miaoshaUserDao.getById(id);
        /*if(user != null){

        }*/
        return user;
    }

    public boolean updatePassword(String token, long id, String formPass){
        return false;
    }

    public MiaoshaUser getByToken(HttpServletResponse response, String token){

        if(StringUtils.isEmpty(token)){
            return null;
        }

        MiaoshaUser user = redisService.get(MiaoshaUserKey.token, token, MiaoshaUser.class);

        //延长有效期
        if(user != null){
            addCookie(response, token, user);
        }
        return user;
    }

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

        //验证密码，比较前端加密的密码与数据库里的密码是否一致
        String dbPass = user.getPassword();
        String saltDB = user.getSalt();
        String calcPass = MD5Util.formPassToDBPass(formPass, saltDB);
        // 补充，记得！
        if(!calcPass.equals(dbPass)){
            throw new GlobalException(CodeMsg.PASSWORD_EMPTY);
        }

        //生成cookie
        String token = UUIDUtil.uuid();
        addCookie(response, token, user);
        return token;
    }

    public void addCookie(HttpServletResponse response, String token, MiaoshaUser user){

        // token虽然设置好了，但没有放到缓存中
        redisService.set(MiaoshaUserKey.token, token, user);
        Cookie cookie = new Cookie(COOKI_NAME_TOKEN, token);
        cookie.setMaxAge(MiaoshaUserKey.token.expireSeconds());
        cookie.setPath("/");
        response.addCookie(cookie);
    }
}
