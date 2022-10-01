package pjatk.Apply4IT.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OfferController {

    @GetMapping("/index")
    public String getString() {
        return "index";
    }
}
