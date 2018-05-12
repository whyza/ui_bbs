package com.whyzaa.service;

import com.whyzaa.entity.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface UserInfoService {
    //用户注册
    int insert(UserInfo userInfo);
    //用户登录
    UserInfo login(@Param("username")String username, @Param("password")String password);
    List<UserInfo> selectUser(String username,Date registertime);
    /**
     * 获取所有user信息
     * @return
     */
    List<UserInfo> selectAllUserInfo();
    /**
     * 删除通过ID
     * @param userid
     * @return
     */
    int deleteByPrimaryKey(Integer userid);

    /**
     * 添加User
     * @param userInfo
     * @return
     */
    int insertSelective(UserInfo userInfo);

    /**
     * 通过ID查询
     * @param userid
     * @return
     */
    UserInfo selectByPrimaryKey(Integer userid);

    /**
     * 更新userinfo
     * @param userInfo
     * @return
     */
    int updateByPrimaryKeySelective(UserInfo userInfo);

    /**
     * 更新userinfo
     * @param userInfo
     * @return
     */
    int updateByPrimaryKey(UserInfo userInfo);

    /**
     * 查询数据库中是否有同名用户
     * @param username
     * @return
     */
    UserInfo selectByUserName(String username);
}