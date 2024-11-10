package edu.java.springboottask.service;

import edu.java.springboottask.dto.UserPasswordDto;
import edu.java.springboottask.entity.User;
import edu.java.springboottask.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@Transactional(readOnly = true)
public class UserService {

    private UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public Optional<User> findByUserName(String userName) {
        return userRepository.findByUsername(userName);
    }

    public Optional<User> findByUsernameAndPassword(String username, String password) {
        return userRepository.findByUsernameAndPassword(username, password);
    }

    @Transactional
    public void changePassword(UserPasswordDto userPasswordDto) throws ServiceException {

        Optional<User> userFromDB = userRepository.findByUsernameAndPassword(userPasswordDto.getUsername(), userPasswordDto.getOldPassword());

        if (userFromDB.isPresent()) {

            userFromDB.get().setPassword(userPasswordDto.getNewPassword());

            try {
                userRepository.save(userFromDB.get());
            } catch (Exception ex) {
                throw new ServiceException("Cannot save new password");
            }

        } else {
            throw new ServiceException("Cannot save new password");
        }
    }
}