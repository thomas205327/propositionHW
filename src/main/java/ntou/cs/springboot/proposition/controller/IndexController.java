package ntou.cs.springboot.proposition.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class IndexController {

    @GetMapping(value = "/propositionWeb")
    public String goToPropositionWeb(){
        //System.out.println("成功進入");
        return "propositionWeb";
    }

    @GetMapping(value = "/questionDB")
    public String goToQuestionDB(){
        return "questionDB";
    }

}
