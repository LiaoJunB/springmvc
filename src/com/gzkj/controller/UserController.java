package com.gzkj.controller;

import com.gzkj.dao.UserInf;
import com.gzkj.service.UserService;
import com.gzkj.service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UserController", value = "/UserController/*")
public class UserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        UserService userService = new UserServiceImpl();
        String uri = request.getRequestURI();

//        Object code1 = request.getSession().getAttribute("code");
//        String code = code1.toString();
        String code = (String) request.getSession().getAttribute("code");
        String checkcode = request.getParameter("checkcode1");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (uri.endsWith("login.do")) {
            if (code.equalsIgnoreCase(checkcode)) {
                // 验证成功就去验证用户名和密码
                UserInf user = userService.login(username, password);
                if (user != null) {
                    //登录成功
                    out.append(1 + "");
                    session.setAttribute("user", user);
                } else {
                    //登录失败
                    out.append(2 + "");
                }

            } else {
                out.append(-3 + "");
            }
        } else if (uri.endsWith("logout.do")) {
            //退出登录逻辑
            session.removeAttribute("user");
            response.sendRedirect(request.getContextPath());
        }
    }

}

