package edu.java.springboottask.controller;

import edu.java.springboottask.authbean.AuthBean;
import edu.java.springboottask.authbean.LoginException;
import edu.java.springboottask.dto.TrainingTypeDto;
import edu.java.springboottask.exception.InvalidDataException;
import edu.java.springboottask.service.ServiceException;
import edu.java.springboottask.service.TrainingTypeService;
import edu.java.springboottask.utility.MappingUtils;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/training-type")
public class TrainingTypesController {
    private TrainingTypeService trainingTypeService;
    private AuthBean authBean;

    public TrainingTypesController(TrainingTypeService trainingTypeService, AuthBean authBean) {
        this.trainingTypeService = trainingTypeService;
        this.authBean = authBean;
    }

    @GetMapping("/all")
    @ResponseBody
    @Operation(summary = "Get Training types")
    public List<TrainingTypeDto> findAllTrainingType() throws ServiceException, LoginException, InvalidDataException {
        if (authBean.getUser() != null) {

            return trainingTypeService.getAll().stream()
                    .map(MappingUtils::mapToTrainingTypeDto)
                    .collect(Collectors.toList());

        } else {
            throw new LoginException("Login error");
        }
    }
}
