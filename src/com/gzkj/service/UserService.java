package com.gzkj.service;

import com.gzkj.dao.UserInf;

public interface UserService {
    //登录功能
    UserInf login(String username, String password);
}
