package com.junjun.dao;

import com.junjun.pojo.admml;

public interface admmlMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMML
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int deleteByPrimaryKey(String ml001);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMML
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int insert(admml record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMML
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int insertSelective(admml record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMML
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    admml selectByPrimaryKey(String ml001);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMML
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int updateByPrimaryKeySelective(admml record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMML
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int updateByPrimaryKey(admml record);
}