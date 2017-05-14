package com.realestate.realestateapp.controller;

import com.realestate.realestateapp.model.RealEstate;
import com.realestate.realestateapp.model.SearchCriteria;
import com.realestate.realestateapp.model.User;
import com.realestate.realestateapp.service.RealEstateService;
import com.realestate.realestateapp.service.SecurityService;
import com.realestate.realestateapp.service.UserService;
import com.realestate.realestateapp.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Controller for {@link User}'s pages.
 *
 * @author Viktoriia Silenko
 * @version 1.0
 */

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RealEstateService realEstateService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect.");
        }

        if (logout != null) {
            model.addAttribute("message", "Logged out successfully.");
        }

        return "login";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        model.addAttribute("listRealEstates", this.realEstateService.findAll());
        return "welcome";
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.POST)
    public String welcome(@ModelAttribute("userForm") SearchCriteria searchCriteria, BindingResult bindingResult, Model model) {

        List<RealEstate> allRealEstates = this.realEstateService.findAll();
        List<RealEstate> filteredRealEstates = new ArrayList<>();

        Byte searchedRoomNumber = null;
        Double searchedPriceFrom = null;
        Double searchedPriceTo = null;

        try {
            searchedRoomNumber = Byte.valueOf(searchCriteria.getRoomsNumber());
            searchedPriceFrom = Double.parseDouble(searchCriteria.getPriceFrom());
            searchedPriceTo = Double.parseDouble(searchCriteria.getPriceTo());
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
        }


        for(RealEstate realEstate: allRealEstates) {

            boolean conditionForAdding = true;

            if((searchedRoomNumber == null) && (searchedPriceFrom == null) && (searchedPriceTo == null)) {
                filteredRealEstates.addAll(allRealEstates);
                break;
            }

            if(searchedRoomNumber != null) {
                conditionForAdding = conditionForAdding && realEstate.getNrooms().equals(searchedRoomNumber);
            }

            if(searchedPriceFrom != null) {
                conditionForAdding = conditionForAdding && (realEstate.getInitPrice() >= searchedPriceFrom);
            }

            if(searchedPriceTo != null) {
                conditionForAdding = conditionForAdding && (realEstate.getInitPrice() <= searchedPriceTo);
            }

            if(conditionForAdding) {
                filteredRealEstates.add(realEstate);
            }
        }

        /*if(filteredRealEstates.isEmpty()) {
            filteredRealEstates.addAll(allRealEstates);
        }*/

        model.addAttribute("listRealEstates", filteredRealEstates);
        return "welcome";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        return "admin";
    }
}
