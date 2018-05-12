package com.whyzaa.mapper;

import com.whyzaa.entity.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface UserInfoMapper {
    //用户登录
    UserInfo loginByUsernameAndPassword(@Param("username")String username, @Param("password")String password);

    List<UserInfo> selectUser(String username, Date registertime);

    List<UserInfo> selectAllUserInfo();

    int deleteByPrimaryKey(Integer userid);
    //注册
    int insert(UserInfo userInfo);

    int insertSelective(UserInfo userInfo);

    UserInfo selectByUserName(@Param("username")String username);

    UserInfo selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
}