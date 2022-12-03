package pjatk.Apply4IT.api.v1.dto;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserMinimalDto {

    private Integer id;
    private String firstName;
    private String lastName;
    private String email;
    private String photo;
}
