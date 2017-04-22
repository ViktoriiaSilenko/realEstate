package com.realestate.realestateapp.dao;

import com.realestate.realestateapp.model.Address;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AddressDao extends JpaRepository<Address, Long> {
}
