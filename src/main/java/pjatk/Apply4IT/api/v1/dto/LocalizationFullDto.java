package pjatk.Apply4IT.api.v1.dto;

import lombok.*;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class LocalizationFullDto {

    private Integer id;

    @NotNull
    @Size(min = 1, max = 200)
    private String name;

}