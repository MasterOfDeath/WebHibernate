/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package ru.app.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Size;

/**
 *
 * @author rinat
 */

@Entity
@Table(name = "prod")

public class Prod implements Serializable{
    @Id
    @Column(name = "id")
    private Integer id;
    
    @Column(name = "cat_id")
    private Integer catId;
    
    @Size(max = 255)
    @Column(name="name")
    private String name;
    
    @Column(name="price")
    private Float price;
    

    public Prod() {
    }

    
    public Prod(Integer id, Integer catId, String name, Float price) {
        this.id = id;
        this.catId = catId;
        this.name = name;
        this.price = price;
    }
     
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public Integer getCatId() {
        return catId;
    }
    
    public void setCatId(Integer catId) {
        this.catId = catId;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public Float getPrice() {
        return price;
    }
    
    public void setPrice(Float price) {
        this.price = price;
    }
    
}
