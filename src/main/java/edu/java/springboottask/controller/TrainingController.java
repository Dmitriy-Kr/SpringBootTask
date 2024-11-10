package edu.java.springboottask.controller;

import edu.java.springboottask.authbean.AuthBean;
import edu.java.springboottask.authbean.LoginException;
import edu.java.springboottask.dto.TrainingDto;
import edu.java.springboottask.exception.InvalidDataException;
import edu.java.springboottask.service.ServiceException;
import edu.java.springboottask.service.TrainingService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import static edu.java.springboottask.utility.Validation.*;

@Controller
@RequestMapping("/training")
public class TrainingController {

    private TrainingService trainingService;
    private AuthBean authBean;

    public TrainingController(TrainingService trainingService, AuthBean authBean) {
        this.trainingService = trainingService;
        this.authBean = authBean;
    }

    @PostMapping
    @ResponseBody
    @Operation(summary = "Create new Training")
    public void create(@RequestBody TrainingDto trainingDto) throws InvalidDataException, ServiceException, LoginException {
        if (validateLogin(trainingDto.getTraineeUsername())
                && validateLogin(trainingDto.getTrainerUsername())
                && authBean.getUser() != null
                && (authBean.getUser().getUsername().equals(trainingDto.getTraineeUsername())
                    || (authBean.getUser().getUsername().equals(trainingDto.getTrainerUsername())))) {

            validateName(trainingDto.getTrainingName());
            validateDate(trainingDto.getTrainingDay());
            trainingService.create(trainingDto);

        } else {
            throw new LoginException("Login error");
        }
    }

}
