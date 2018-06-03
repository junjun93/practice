package com.junjun.param;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;

/**
 * @author junjun
 * @date 2018/5/31 21:29:10
 **/
@Getter
@Setter
@ToString
public class DeptParam {
    private Integer id;

    @NotBlank(message = "部门名称不能为空")
    @Length(max = 15,min = 2, message = "部门名称长度需要在2-15个字之间")
    private String name;

    private Integer parentId;

    @NotNull(message = "展示顺序不能为空")
    private Integer seq;

    @Length(max = 150, message = "备注的长度需要在150个字以内")
    private String remark;
}
