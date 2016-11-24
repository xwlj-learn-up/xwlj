package tk.xwlj666.service;

import tk.xwlj666.dao.UserMapper;
import tk.xwlj666.pojo.User;

import javax.inject.Inject;
import javax.inject.Named;

/**
 * Created by 123 on 2016/1/16.
 */
@Named
public class UserService {
    @Inject
    private UserMapper userMapper;


    public User findByUsername(String username) {
        return userMapper.findByUsername(username);

    }

    public void update(User user) {
        userMapper.update(user);
    }
}
