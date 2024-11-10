package edu.java.springboottask.authbean;

import edu.java.springboottask.entity.User;
import org.springframework.stereotype.Component;

@Component
public class AuthBean {
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void clear(){
        this.user = null;
    }
}
