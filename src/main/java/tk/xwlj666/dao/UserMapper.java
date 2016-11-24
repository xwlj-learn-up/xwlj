package tk.xwlj666.dao;

import tk.xwlj666.pojo.User;

public interface UserMapper {

    User findByUsername(String username);

    void update(User user);
}