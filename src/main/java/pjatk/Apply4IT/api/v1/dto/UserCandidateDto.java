package pjatk.Apply4IT.api.v1.dto;

import lombok.*;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserCandidateDto {

    private Integer userId;
    private Integer applicationId;
    private String firstName;
    private String lastName;
    private String email;
    private String photo;
    private Boolean hasCv;
}
