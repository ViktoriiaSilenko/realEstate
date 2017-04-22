package com.realestate.realestateapp.model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;

/**
 *
 * @author Sergei
 * @version 1.0
 */
@Entity
@Table(name = "real_estates")
public class RealEstate {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "type", unique = true, nullable = false, length = 100)
    private String type;

    @Column(name = "area", unique = false, nullable = false)
    private Double area;

    @Column(name = "nrooms", unique = false, nullable = false)
    private Byte nrooms;

    @Column(name = "dateIn", unique = false, nullable = false)
    private Date dateIn;

   /* @Column(name = "dateOut", unique = false, nullable = false)
    private Date dateOut;*/

    @Column(name = "initPrice", nullable = false, precision = 10, scale = 2)
    private BigDecimal initPrice;

    @Column(name = "userDesc", unique = true, nullable = false, length = 300)
    private String userDescription;

    @OneToOne(targetEntity = Address.class, fetch = FetchType.LAZY, optional = false, orphanRemoval = true)
    @JoinColumn(name = "id_addr", nullable = false)
    private Address address;

    @ManyToOne
    @JoinColumn(name = "owner_id")
    private User owner;


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Byte getNrooms() {
        return nrooms;
    }

    public void setNrooms(Byte nrooms) {
        this.nrooms = nrooms;
    }

    public Date getDateIn() {
        return dateIn;
    }

    public void setDateIn(Date dateIn) {
        this.dateIn = dateIn;
    }

    /*public Date getDateOut() {
        return dateOut;
    }

    public void setDateOut(Date dateOut) {
        this.dateOut = dateOut;
    }*/

    public BigDecimal getInitPrice() {
        return initPrice;
    }

    public void setInitPrice(BigDecimal initPrice) {
        this.initPrice = initPrice;
    }

    public String getUserDescription() {
        return userDescription;
    }

    public void setUserDescription(String userDescription) {
        this.userDescription = userDescription;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are
        // not set
        if (!(object instanceof RealEstate)) {
            return false;
        }
        RealEstate other = (RealEstate) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "test.entities.RealEstateEntity[ id=" + id + " ]";
    }

}
