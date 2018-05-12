package com.whyzaa.controller.front;

import com.whyzaa.entity.UserInfo;
import com.whyzaa.service.UserInfoService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Description: java类作用描述
 * @Author: Whyza
 * @CreateDate: 2018/5/11 9:32
 * @Version: 1.0
 */
@Controller
public class FrontController {
    @Autowired
    private UserInfoService userInfoService;
    @RequestMapping("selectByPrimaryKey")
    @ResponseBody
    public UserInfo getUserInfoById(Integer id) {
        return userInfoService.selectByPrimaryKey(id);
    }
    /**
     * 查询所有用户
     * @return
     */
    @RequestMapping("selectAllUserInfo")
    public @ResponseBody Map<String, Object> selectAllUserInfo() {
        Map<String, Object> UserMap = new HashMap<String, Object>();
        List<UserInfo> userInfoList = new ArrayList<UserInfo>();
        userInfoList = userInfoService.selectAllUserInfo();
        UserMap.put("msg", "");
        UserMap.put("code", 0);
        UserMap.put("count", 1000);
        UserMap.put("data", userInfoList);
        return UserMap;
    }

    /**
     * 查询用户
     * @param username
     * @param registertime
     * @return
     */
    @RequestMapping(value = "selectUser", method = RequestMethod.GET)
    public @ResponseBody Map<String,Object> selectUser(@Param("username")String username, @Param("registertime")Date registertime){
        Map<String, Object> UserMap = new HashMap<String, Object>();
        System.out.println(username+"------------------"+registertime);
        List<UserInfo> userInfoList = userInfoService.selectUser(username, registertime);
        System.out.println(username+"------------------"+registertime);
        UserMap.put("msg", "");
        UserMap.put("code", 0);
        UserMap.put("count", 1000);
        UserMap.put("data", userInfoList);
        return UserMap;
    }

    /**
     * 登陆验证
     * @param username
     * @param password
     * @return
     */
    @RequestMapping(value = "UserLogin.do",method = RequestMethod.POST)
    public String UserLogin(@RequestParam("username") String username, @RequestParam("password") String password) {
        if (userInfoService.login(username, password) != null) {
            return "forward:/index.html";
        } else {
            return "redirect:/pages/login.html";
        }
    }

    @RequestMapping(value = "/Register.do",method = RequestMethod.POST)
    public String Register(UserInfo userInfo){
        if(userInfoService.selectByUserName(userInfo.getUsername()) == null){
            userInfo.setUserstatus(1);
            userInfo.setRegistertime(new Date());
            userInfo.setUserrole(1);
            userInfoService.insert(userInfo);
            return "redirect:/pages/login.html";
        }else {
            return "redirect:/pages/register.html";
        }
    }

    @RequestMapping(value = "/re.do",method = RequestMethod.POST)
    @ResponseBody
    public String re(@RequestBody UserInfo userInfo){
        System.out.println(userInfo.getUsername()+"----"+userInfo.getPassword());
        if(userInfoService.selectByUserName(userInfo.getUsername()) == null){
            userInfo.setUserstatus(1);
            userInfo.setRegistertime(new Date());
            userInfo.setUserrole(1);
            userInfoService.insertSelective(userInfo);
            return "success";
        }else {
            return "error";
        }
    }
}
