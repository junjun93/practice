package com.junjun.dao;

import com.junjun.pojo.systf;

public interface systfMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTF
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int deleteByPrimaryKey(String tf001);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTF
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int insert(systf record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTF
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int insertSelective(systf record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTF
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    systf selectByPrimaryKey(String tf001);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTF
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int updateByPrimaryKeySelective(systf record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table SYSTF
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int updateByPrimaryKey(systf record);
}