package pjatk.Apply4IT.api.v1.dto;

import lombok.*;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.User;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CompanyMinimalDto {

    private Integer id;
    private String name;
    private String logoPhoto;

}