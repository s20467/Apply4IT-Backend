package pjatk.Apply4IT.model;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Objects;

@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Experience {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private LocalDate startDate;
    private LocalDate endDate;
    private String job;
    private String companyName;
    private String description;

    @ManyToOne(cascade = {CascadeType.REFRESH, CascadeType.MERGE})
    private User user;

    private boolean stillWorking;
}