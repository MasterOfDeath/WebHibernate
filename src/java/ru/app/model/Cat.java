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
@Table(name = "cat")

public class Cat implements Serializable{
    @Id
    @Column(name = "id")
    private Integer id;
    
    @Size(max = 255)
    @Column(name = "name")
    private String name;

    public Cat() {
    }
    
    public Cat(String name) {
        this.name = name;
    }

    public Cat(Integer id, String name) {
        this.id = id;
        this.name = name;
    }
    
    public Cat(Integer id) {
        this.id = id;
    }
    
    public Integer getId() {
        return id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
}
