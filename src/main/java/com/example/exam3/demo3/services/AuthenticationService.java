package com.example.exam3.demo3.services;

import com.example.exam3.demo3.dto.*;

public interface AuthenticationService {
    LoginResponse registration(UserCreate userCreate);
    LoginResponse login(LoginRequest request);
    RefreshResponse refresh(RefreshRequest refreshRequest);
    void logout(LogoutRequest logoutRequest);
}
