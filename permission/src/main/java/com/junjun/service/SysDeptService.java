package com.junjun.service;

import com.junjun.dao.SysDeptMapper;
import com.junjun.exception.ParamException;
import com.junjun.model.SysDept;
import com.junjun.param.DeptParam;
import com.junjun.util.BeanValidator;
import com.junjun.util.LevelUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

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

    public void update(DeptParam param){

    }

    public void delete(Integer id){

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
