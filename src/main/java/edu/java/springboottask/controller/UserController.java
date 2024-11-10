package edu.java.springboottask.controller;

import edu.java.springboottask.authbean.AuthBean;
import edu.java.springboottask.dto.UserPasswordDto;
import edu.java.springboottask.entity.User;
import edu.java.springboottask.exception.InvalidDataException;
import edu.java.springboottask.exception.NoResourcePresentException;
import edu.java.springboottask.service.ServiceException;
import edu.java.springboottask.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

import static edu.java.springboottask.utility.Validation.validateLogin;
import static edu.java.springboottask.utility.Validation.validatePassword;

@Controller
@RequestMapping("/user")
public class UserController {
    private UserService userService;
    private AuthBean authBean;

    public UserController(UserService userService, AuthBean authBean) {
        this.userService = userService;
        this.authBean = authBean;
    }

    @GetMapping("/login")
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Login in App")
    public void login(@RequestParam("username") String username, @RequestParam("password") String password) throws NoResourcePresentException, InvalidDataException {
        if (validateLogin(username) && validatePassword(password)) {

            Optional<User> user = userService.findByUsernameAndPassword(username, password);
            if (user.isPresent()) {
                authBean.setUser(user.get());
            } else {
                throw new NoResourcePresentException("No such user present in DB");
            }

        }
    }

    @PutMapping("/password")
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    @Operation(summary = "Change password")
    public void changePassword(@RequestBody UserPasswordDto userPasswordDto) throws InvalidDataException, ServiceException {
        if (validateLogin(userPasswordDto.getUsername()) && validatePassword(userPasswordDto.getOldPassword()) && validatePassword(userPasswordDto.getNewPassword())) {

            userService.changePassword(userPasswordDto);

            authBean.clear();

        }
    }
}