package com.realestate.realestateapp.dao;

import com.realestate.realestateapp.model.Address;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RealEstateDao extends JpaRepository<Address, Long> {
}
