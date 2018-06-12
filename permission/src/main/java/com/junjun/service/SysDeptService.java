package com.junjun.service;

import com.google.common.base.Preconditions;
import com.junjun.dao.SysDeptMapper;
import com.junjun.exception.ParamException;
import com.junjun.model.SysDept;
import com.junjun.param.DeptParam;
import com.junjun.util.BeanValidator;
import com.junjun.util.LevelUtil;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author junjun
 * @date 2018/6/4 21:34:55
 **/
@Service
public class SysDeptService {

    @Resource
    private SysDeptService sysDeptService;
    @Resource
    private SysDeptMapper sysDeptMapper;

    public void save(DeptParam param){
        BeanValidator.check(param);
        if(checkExist(param.getParentId(), param.getName(), param.getId())){
            throw new ParamException("同一层级下存在相同名称的部门");
        }
        SysDept dept = SysDept.builder().name(param.getName()).parentId(param.getParentId()).seq(param.getSeq()).
                remark(param.getRemark()).build();
        dept.setLevel(LevelUtil.calculateLevel(getLevel(param.getParentId()), param.getParentId()));
        dept.setOperator(""); //TODO
        dept.setOperateIp("");
        dept.setOperateTime(new Date());
        sysDeptMapper.insertSelective(dept);
    }

    /**
     * 更新前、更新时判断下是否存在同名部门
     * */
    public void update(DeptParam param){
        BeanValidator.check(param);
        if(checkExist(param.getParentId(), param.getName(), param.getId())){
            throw new ParamException("同一层级下存在相同名称的部门");
        }
        SysDept before = sysDeptMapper.selectByPrimaryKey(param.getId());
        Preconditions.checkNotNull(before, "待更新的部门不存在");
        if(checkExist(param.getParentId(), param.getName(), param.getId())){
            throw new ParamException("同一层级下存在相同名称的部门");
        }
        SysDept after = SysDept.builder().id(param.getId()).name(param.getName()).parentId(param.getParentId()).
                seq(param.getSeq()).remark(param.getRemark()).build();
        after.setLevel(LevelUtil.calculateLevel(getLevel(param.getParentId()), param.getParentId()));
        after.setOperator("");
        after.setOperateIp("");
        after.setOperateTime(new Date());
        updateWithChild(before, after);
    }

    @Transactional
    public void updateWithChild(SysDept before, SysDept after){
        String newLevelPrefix = after.getLevel();
        String oldLevelPrefix = before.getLevel();
        if(!after.getLevel().equals(before.getLevel())){
            List<SysDept> deptList = sysDeptMapper.getChildDeptListByLevel(before.getLevel());
            if(CollectionUtils.isNotEmpty(deptList)){
                for(SysDept dept : deptList){
                    String level = dept.getLevel();
                    if(level.indexOf(oldLevelPrefix) == 0){
                        level = newLevelPrefix + level.substring(oldLevelPrefix.length());
                        dept.setLevel(level);
                    }
                }
                sysDeptMapper.batchUpdateLevel(deptList);
            }
        }
        sysDeptMapper.updateByPrimaryKey(after);
    }

    public void delete(Integer deptId){
        SysDept dept = sysDeptMapper.selectByPrimaryKey(deptId);
        Preconditions.checkNotNull(dept, "待删除的部门不存在，无法删除");
        if(sysDeptMapper.countByParentId(dept.getId()) > 0){
            throw  new ParamException("当前部门下有子部门，无法删除");
        }
        /*if(sysDeptMapper.countByDeptId(dept.getId()) > 0){
            throw  new ParamException("当前部门下有用户，无法删除");
        }*/
        sysDeptMapper.deleteByPrimaryKey(deptId);
    }

    private boolean checkExist(Integer parentId, String name, Integer id){
        return sysDeptMapper.countByNameAndParentId(parentId, name, id) > 0;
    }

    private String getLevel(Integer deptId){
        SysDept dept = sysDeptMapper.selectByPrimaryKey(deptId);
        if(dept == null){
            return null;
        }
        return dept.getLevel();
    }
}
