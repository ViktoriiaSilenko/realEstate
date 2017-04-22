package com.realestate.realestateapp.service;

/**
 * Service for Security.
 *
 * @author Viktoriia Silenko
 * @version 1.0
 */

public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
