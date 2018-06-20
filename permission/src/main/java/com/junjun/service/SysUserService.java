package com.junjun.service;

import com.google.common.base.Preconditions;
import com.junjun.dao.SysUserMapper;
import com.junjun.exception.PermissionException;
import com.junjun.model.SysUser;
import com.junjun.param.UserParam;
import com.junjun.util.BeanValidator;
import com.junjun.util.Md5Util;
import com.junjun.util.PasswordUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author junjun
 * @date 2018/6/12 21:45:22
 **/
@Service
public class SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    /**
     * 最后一次这样多次回看代码，自己敲
     * */
    public void save(UserParam param){
        BeanValidator.check(param);
        if(checkTelephoneExist(param.getTelephone(), param.getId())){
            throw new PermissionException("电话已被占用");
        }
        if(checkMailExist(param.getMail(), param.getId())){
            throw new PermissionException("邮箱已被占用");
        }
        String password = PasswordUtil.randomPassword();
        //TODO
        password = "12345678";
        String encryptedPassword = Md5Util.encrypt(password);
        SysUser user = SysUser.builder().username(param.getUsername()).telephone(param.getTelephone()).mail(param.getMail())
                .password(encryptedPassword).deptId(param.getDeptId()).status(param.getStatus()).remark(param.getRemark()).build();
        //user.setOperator(RequestHolder.getCurrentUser().getUsername());
        user.setOperateIp("");
        user.setOperateTime(new Date());

        // TODO sendMail
        sysUserMapper.insertSelective(user);
    }

    public void update(UserParam param){
        BeanValidator.check(param);
        if(checkTelephoneExist(param.getTelephone(), param.getId())){
            throw new PermissionException("电话已被占用");
        }
        if(checkMailExist(param.getMail(), param.getId())){
            throw new PermissionException("邮箱已被占用");
        }
        SysUser before = sysUserMapper.selectByPrimaryKey(param.getId());
        Preconditions.checkNotNull(before, "待更新的用户不存在");
        SysUser after = SysUser.builder().id(param.getId()).username(param.getUsername()).telephone(param.getTelephone()).mail(param.getMail())
                .deptId(param.getDeptId()).status(param.getStatus()).remark(param.getRemark()).build();
        //after.getOperator("");
        after.setOperateIp("");
        after.setOperateTime(new Date());
    }

    public SysUser findByKeyword(String keyword){
        return sysUserMapper.findByKeyword(keyword);
    }

    public boolean checkTelephoneExist(String telephone, Integer userId){
        return sysUserMapper.countByTelephone(telephone, userId) > 0;
    }

    public boolean checkMailExist(String mail, Integer userId){
        return sysUserMapper.countByMail(mail, userId) > 0;
    }
}
