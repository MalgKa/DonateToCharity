package pl.coderslab.charity.controller.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Table(name="categories")
@Data
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

}
