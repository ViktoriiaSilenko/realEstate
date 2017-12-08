package com.realestate.realestateapp.controller;

import com.realestate.realestateapp.model.RealEstate;
import com.realestate.realestateapp.model.User;
import com.realestate.realestateapp.model.search.SearchCriteria;
import com.realestate.realestateapp.service.RealEstateService;
import com.realestate.realestateapp.service.SecurityService;
import com.realestate.realestateapp.service.UserService;
import com.realestate.realestateapp.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class FrontController {

    @Autowired
    private UserService userService;

    @Autowired
    private RealEstateService realEstateService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    // manage real estates

    @RequestMapping(value = "/manageRealEstates", method = RequestMethod.GET)
    public String manageRealEstates(Model model) {

        model.addAttribute("realEstate", new RealEstate());
        model.addAttribute("listRealEstates", this.realEstateService.findAll());

        return "manageRealEstates";
    }

    @RequestMapping("/removeRealEstate/{id}")
    public String removeRealEstate(@PathVariable("id") int id){
        this.realEstateService.deleteById(new Long(id));

        return "redirect:/manageRealEstates";
    }

    @RequestMapping("/editRealEstate/{id}")
    public String editRealEstate(@PathVariable("id") int id, ModelMap model){
        model.addAttribute("realEstate", this.realEstateService.findById(new Long(id)));
        model.addAttribute("listRealEstates", this.realEstateService.findAll());

        return "manageRealEstates";
    }

    @RequestMapping(value = "/realEstates/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("realEstate") RealEstate realEstate, @RequestParam("realEstateId") int realEstateId,
                          BindingResult bindingResult){
        if (!new Long(-1).equals(new Long(realEstateId))) {
            realEstate.setId(new Long(realEstateId));
            this.realEstateService.save(realEstate);
        } else {
            this.realEstateService.save(realEstate);
        }

        return "redirect:/manageRealEstates";
    }

    // manage users

    @RequestMapping(value = "/manageUsers", method = RequestMethod.GET)
    public String manageUsers(Model model) {

        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.findAll());
        return "manageUsers";
    }

    @RequestMapping("/removeUser/{id}")
    public String removeUser(@PathVariable("id") int id){
        this.userService.deleteById(new Long(id));

        return "redirect:/manageUsers";
    }

    @RequestMapping("/editUser/{id}")
    public String editUser(@PathVariable("id") int id, ModelMap model){
        model.addAttribute("user", this.userService.findById(new Long(id)));
        model.addAttribute("listUsers", this.userService.findAll());

        return "manageUsers";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user, @RequestParam("userId") int userId,
                          BindingResult bindingResult){
        if (!new Long(-1).equals(new Long(userId))) {
            user.setId(new Long(userId));
            this.userService.save(user);
        } else {
            this.userService.save(user);
        }

        return "redirect:/manageUsers";
    }



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

        return "redirect:/main";
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

    @RequestMapping(value = {"/", "/main"}, method = RequestMethod.GET)
    public String main(Model model) {
        model.addAttribute("listRealEstates", this.realEstateService.findAll());
        return "main";
    }

    @RequestMapping(value = "/main", method = RequestMethod.POST)
    public String main(@ModelAttribute("userForm") SearchCriteria searchCriteria, BindingResult bindingResult, Model model) {

        List<RealEstate> allRealEstates = this.realEstateService.findAll();
        List<RealEstate> filteredRealEstates = new ArrayList<>();

        Byte searchedRoomNumber = null;
        Double searchedPriceFrom = null;
        Double searchedPriceTo = null;

        try {
            if (!searchCriteria.getRoomsNumber().isEmpty()) {
                searchedRoomNumber = Byte.valueOf(searchCriteria.getRoomsNumber());
            }

            if (!searchCriteria.getPriceFrom().isEmpty()) {
                searchedPriceFrom = Double.parseDouble(searchCriteria.getPriceFrom());
            }

            if (!searchCriteria.getPriceTo().isEmpty()) {
                searchedPriceTo = Double.parseDouble(searchCriteria.getPriceTo());
            }
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

        model.addAttribute("listRealEstates", filteredRealEstates);
        return "main";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin() {
        return "admin";
    }
}
