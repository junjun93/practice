package com.junjun.service;

import com.google.common.base.Preconditions;
import com.junjun.common.RequestHolder;
import com.junjun.dao.SysAclMapper;
import com.junjun.dao.SysAclModuleMapper;
import com.junjun.exception.ParamException;
import com.junjun.model.SysAclModule;
import com.junjun.param.AclModuleParam;
import com.junjun.util.BeanValidator;
import com.junjun.util.IpUtil;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author junjun
 * @date 2018/7/27 16:27:21
 **/
@Service
public class SysAclModuleService {

    @Resource
    private SysAclModuleMapper sysAclModuleMapper;
    @Resource
    private SysAclMapper sysAclMapper;
    
    public void save(AclModuleParam param){
        BeanValidator.check(param);
        if(checkExist(param.getParentId(), param.getName(), param.getId())){
           throw new ParamException("同一层级下存在相同名称的权限模块");
        }
        SysAclModule aclModule = SysAclModule.builder().name(param.getName()).parentId(param.getParentId()).seq(param.getSeq())
                .status(param.getStatus()).remark(param.getRemark()).build();
        aclModule.setLevel("");//TODO
        aclModule.setOperator(RequestHolder.getCurrentUser().getUsername());
        aclModule.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        aclModule.setOperateTime(new Date());
        sysAclModuleMapper.insertSelective(aclModule);
    }

    public void update(AclModuleParam param){
        BeanValidator.check(param);
        if(checkExist(param.getParentId(), param.getName(), param.getId())){
            throw new ParamException("同一层级下存在相同名称的权限模块");
        }
        SysAclModule bofore = sysAclModuleMapper.selectByPrimaryKey(param.getId());
        Preconditions.checkNotNull(bofore, "待更新的权限模块不存在");
        SysAclModule after = SysAclModule.builder().name(param.getName()).parentId(param.getParentId()).seq(param.getSeq())
                .status(param.getStatus()).remark(param.getRemark()).build();
        after.setLevel("");
        after.setOperator(RequestHolder.getCurrentUser().getUsername());
        after.setOperateIp(IpUtil.getRemoteIp(RequestHolder.getCurrentRequest()));
        after.setOperateTime(new Date());
        updateWithChild(bofore, after);
    }

    public void delete(int id){

    }

    private boolean checkExist(Integer parentId, String aclModuleName, Integer deptId){
        return sysAclModuleMapper.countByNameAndParentId(parentId, aclModuleName, deptId) > 0;
    }

    /**
     * 重置层级的数值
     * */
    @Transactional
    private void updateWithChild(SysAclModule before, SysAclModule after){
        String newLevelPrefix = after.getLevel();
        String oldLevelPrefix = before.getLevel();
        if(!after.getLevel().equals(before.getLevel())){
            List<SysAclModule> aclModuleList = sysAclModuleMapper.getChildAclModuleListByLevel(before.getLevel());
            if(CollectionUtils.isNotEmpty(aclModuleList)){
                for(SysAclModule aclModule : aclModuleList){
                    String level = aclModule.getLevel();
                    if(level.indexOf(oldLevelPrefix) == 0){
                        level = newLevelPrefix + level.substring(oldLevelPrefix.length());
                        aclModule.setLevel(level);
                    }
                }
                sysAclModuleMapper.batchUpdateLevel(aclModuleList);
            }
        }
        sysAclModuleMapper.updateByPrimaryKeySelective(after);
    }

}
