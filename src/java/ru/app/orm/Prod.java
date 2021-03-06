package ru.app.orm;
// Generated 21.06.2015 21:51:28 by Hibernate Tools 4.3.1


import java.math.BigDecimal;

/**
 * Prod generated by hbm2java
 */
public class Prod  implements java.io.Serializable {


     private Integer id;
     private Cat cat;
     private String name;
     private BigDecimal price;

    public Prod() {
    }

	
    public Prod(Cat cat, String name) {
        this.cat = cat;
        this.name = name;
    }
    public Prod(Cat cat, String name, BigDecimal price) {
       this.cat = cat;
       this.name = name;
       this.price = price;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Cat getCat() {
        return this.cat;
    }
    
    public void setCat(Cat cat) {
        this.cat = cat;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public BigDecimal getPrice() {
        return this.price;
    }
    
    public void setPrice(BigDecimal price) {
        this.price = price;
    }




}


