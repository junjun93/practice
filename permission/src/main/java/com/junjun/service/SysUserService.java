package com.junjun.service;

import com.junjun.dao.SysUserMapper;
import com.junjun.exception.PermissionException;
import com.junjun.model.SysUser;
import com.junjun.param.UserParam;
import com.junjun.util.BeanValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author junjun
 * @date 2018/6/12 21:45:22
 **/
@Service
public class SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    public void save(UserParam param){
        BeanValidator.check(param);
        if(checkTelephoneExist(param.getTelephone(), param.getId())){
            throw new PermissionException("电话已被占用");
        }
        if(checkMailExist(param.getMail(), param.getId())){
            throw new PermissionException("邮箱已被占用");
        }
        String password = "12345678";

        SysUser user = SysUser.builder().username(param.getUsername()).telephone(param.getTelephone()).mail(param.getMail())
                .password().status(param.getStatus()).remark(param.getRemark());


        // TODO sendMail
        sysUserMapper.insertSelective(user);
    }

    public void update(){

    }

    public boolean checkTelephoneExist(String telephone, Integer userId){
        return false;
    }

    public boolean checkMailExist(String mail, Integer userId){
        return false;
    }
}
