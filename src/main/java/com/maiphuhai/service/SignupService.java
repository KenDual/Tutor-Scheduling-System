package com.maiphuhai.service;

import com.maiphuhai.model.UserAccount;
import jakarta.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

@Service

public class SignupService {

    private final List<UserAccount> accountList = new ArrayList<>();

    //List all user exist
    public List<UserAccount> findAll() {
        return accountList;
    }
    
    @PostConstruct
    public void init() {
        add(new UserAccount("Mai Phu Hai", "maiphuhai123@gmail.com", "123456789"));
        add(new UserAccount("Mai Phu Hai", "maiphuhai123@gmail.com", "123456789"));
        add(new UserAccount("Mai Phu Hai", "maiphuhai123@gmail.com", "123456789"));
        add(new UserAccount("Mai Phu Hai", "maiphuhai123@gmail.com", "123456789"));
        add(new UserAccount("Mai Phu Hai", "maiphuhai123@gmail.com", "123456789"));
        add(new UserAccount("Mai Phu Hai", "maiphuhai123@gmail.com", "123456789"));
    }

    //Add new account   
    public void add(UserAccount userAccount) {
        accountList.add(userAccount);
    }

    //Logic for Login function -> dashboard
    public boolean validateUser(String email, String password) {
        for (UserAccount user : accountList) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

}
