package com.gzkj.dao;

import java.util.Date;

public class UserInf {
    private Integer id;

    private String loginname;

    private String username;

    private String password;

    private String phone;

    private Integer status;

    private Date createdate;

    private String txpic;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname == null ? null : loginname.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getTxpic() {
        return txpic;
    }

    public void setTxpic(String txpic) {
        this.txpic = txpic == null ? null : txpic.trim();
    }

    @Override
    public String toString() {
        return "UserInf{" +
                "id=" + id +
                ", loginname='" + loginname + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", status=" + status +
                ", createdate=" + createdate +
                ", txpic='" + txpic + '\'' +
                '}';
    }
}