package pjatk.Apply4IT.api.v1.dto;

import lombok.*;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CompanyListItemDto {

    private Integer id;
    private String name;
    private String logoPhoto;
    private Integer offersNumber;
    private Boolean enabled;
}