package com.realestate.realestateapp.service;

import com.realestate.realestateapp.model.User;

public interface UserService {

    void save(User user);

    User findByUsername(String username);

    User findByEmail(String email);
}
