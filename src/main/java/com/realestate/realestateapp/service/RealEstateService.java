package com.realestate.realestateapp.service;

import com.realestate.realestateapp.model.RealEstate;

import java.util.List;

public interface RealEstateService {

    void save(RealEstate user);

    List<RealEstate> findAll();

    RealEstate findById(Long id);

    void deleteById(Long id);
}
