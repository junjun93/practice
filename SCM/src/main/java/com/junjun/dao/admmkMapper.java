package com.junjun.dao;

import com.junjun.pojo.admmk;

public interface admmkMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMK
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int deleteByPrimaryKey(String mk001);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMK
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int insert(admmk record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMK
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int insertSelective(admmk record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMK
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    admmk selectByPrimaryKey(String mk001);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMK
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int updateByPrimaryKeySelective(admmk record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table ADMMK
     *
     * @mbggenerated Fri Jul 20 08:56:22 CST 2018
     */
    int updateByPrimaryKey(admmk record);
}