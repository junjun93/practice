package com.junjun.service;

import com.google.common.base.Preconditions;
import com.junjun.beans.PageQuery;
import com.junjun.beans.PageResult;
import com.junjun.common.RequestHolder;
import com.junjun.dao.SysAclMapper;
import com.junjun.exception.ParamException;
import com.junjun.model.SysAcl;
import com.junjun.param.AclParam;
import com.junjun.util.BeanValidator;
import com.junjun.util.IpUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author junjun
 * @date 2018/7/27 16:12:26
 **/
@Service
public class SysAclService {

    @Resource
    private SysAclMapper sysAclMapper;

    public void save(AclParam param){
        BeanValidator.check(param);
        if(checkExist(param.getAclModuleId(), param.getName(), param.getId())){
            throw new ParamException("当前权限模块下面存在相同名称的权限点");
        }
        SysAcl acl = SysAcl.builder().name(param.getName()).aclModuleId(param.getAclModuleId()).url(param.getUrl())
                .type(param.getType()).status(param.getStatus()).seq(param.getSeq()).remark(param.getRemark()).build();
        acl.setCode("");//TODO
        acl.setOperator(RequestHolder.getCurrentUser().getUsername());
        acl.setOperateTime(new Date());
        acl.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        sysAclMapper.insertSelective(acl);
    }

    public void update(AclParam param){
        BeanValidator.check(param);
        if(checkExist(param.getAclModuleId(), param.getName(), param.getId())){
            throw new ParamException("当前权限模块下面存在相同名称的权限点");
        }
        SysAcl before = sysAclMapper.selectByPrimaryKey(param.getId());
        Preconditions.checkNotNull(before, "待更新的权限点不存在");
        SysAcl after = SysAcl.builder().name(param.getName()).aclModuleId(param.getAclModuleId()).url(param.getUrl())
                .type(param.getType()).status(param.getStatus()).seq(param.getSeq()).remark(param.getRemark()).build();
        after.setOperator(RequestHolder.getCurrentUser().getUsername());
        after.setOperateTime(new Date());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        sysAclMapper.updateByPrimaryKeySelective(after);
    }

    public PageResult<SysAcl> getPageByAclModuleId(Integer aclModuleId, PageQuery pageQuery){
        return null;
    }

    public boolean checkExist(int aclModuleId, String name, Integer id){
        return sysAclMapper.countByNameAndAclModuleId(aclModuleId, name, id) > 0;
    }
}
