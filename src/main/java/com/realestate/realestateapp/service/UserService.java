package com.realestate.realestateapp.service;

import com.realestate.realestateapp.model.User;

/**
 * Service class for {@link User}
 *
 * @author Viktoriia Silenko
 * @version 1.0
 */

public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
