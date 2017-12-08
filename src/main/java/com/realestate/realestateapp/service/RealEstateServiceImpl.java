package com.realestate.realestateapp.service;

import com.realestate.realestateapp.dao.RealEstateDao;
import com.realestate.realestateapp.model.RealEstate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RealEstateServiceImpl implements RealEstateService {

    @Autowired
    private RealEstateDao realEstateDao;

    @Override
    public void save(RealEstate realEstate) {
        realEstateDao.save(realEstate);
    }

    @Override
    public List<RealEstate> findAll() {
        return realEstateDao.findAll();
    }

    @Override
    public RealEstate findById(Long id) {
        return realEstateDao.findOne(id);
    }

    @Override
    public void deleteById(Long id) {
        realEstateDao.delete(id);
    }
}
