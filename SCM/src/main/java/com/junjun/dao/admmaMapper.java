package com.junjun.dao;

import com.junjun.pojo.admma;

public interface admmaMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMA
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int deleteByPrimaryKey(String ma001);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMA
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int insert(admma record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMA
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int insertSelective(admma record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMA
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    admma selectByPrimaryKey(String ma001);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMA
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int updateByPrimaryKeySelective(admma record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMA
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int updateByPrimaryKey(admma record);
}