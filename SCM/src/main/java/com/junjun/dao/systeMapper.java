package com.junjun.dao;

import com.junjun.pojo.syste;

public interface systeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTE
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int deleteByPrimaryKey(String te001);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTE
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int insert(syste record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTE
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int insertSelective(syste record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTE
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    syste selectByPrimaryKey(String te001);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTE
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int updateByPrimaryKeySelective(syste record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTE
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int updateByPrimaryKey(syste record);
}