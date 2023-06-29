package com.gzkj.service;

import com.gzkj.dao.DeptInf;
import com.gzkj.dao.DeptInfExample;
import com.gzkj.dao.UserInf;
import com.gzkj.dao.UserInfExample;
import com.gzkj.mapper.DeptInfMapper;
import com.gzkj.mapper.UserInfMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
import java.util.List;

public class UserServiceImpl implements UserService {

    @Override
    public UserInf login(String username, String password) {

        try {
            String configXml = "mybatis-config.xml";

            InputStream inputStream = Resources.getResourceAsStream(configXml);

            // 创建sqlSessionFactory
            SqlSessionFactory sqlSession = new SqlSessionFactoryBuilder().build(inputStream);

            // 使用sqlSessionFactory 创建sqlSession
            SqlSession session = sqlSession.openSession(true);
            UserInfMapper mapper = session.getMapper(UserInfMapper.class);
            UserInfExample example = new UserInfExample();
            UserInfExample.Criteria criteria = example.createCriteria();
            criteria.andLoginnameEqualTo(username);

            List<UserInf> list = mapper.selectByExample(example);
            if(list.size()!=0){
                //判断查询到的密码是否与输入密码一致
                if(list.get(0).getPassword().equals(password)){
                    return list.get(0);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
