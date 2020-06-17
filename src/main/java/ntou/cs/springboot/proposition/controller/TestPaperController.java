package ntou.cs.springboot.proposition.controller;

import ntou.cs.springboot.proposition.QuestionClass.Questions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class TestPaperController {

//    @RequestMapping(value = "/propositionWeb/testPaper")
//    public @ResponseBody
//    RedirectView goToTestPaper(Model model, @RequestBody(required = false) Questions questions){
//        RedirectView redirectTarget = new RedirectView();
//        redirectTarget.setContextRelative(true);
//        redirectTarget.setUrl("/propositionWeb/testPaper");
//        model.addAttribute("questionsForQuestionAndAnswers", questions.getQuestionsAndAnswers());
//        model.addAttribute("questionsForMultipleChoice", questions.getMultipleChoice());
//        model.addAttribute("questionsForRightAndWrong", questions.getRightAndWrong());
//        model.addAttribute("questionsForStuffQuestion", questions.getStuffQuestion());
//        System.out.println("成功進入");
//        System.out.println(questions.getQuestionsAndAnswers().toString());
//        System.out.println(questions.getMultipleChoice().toString());
//        System.out.println(questions.getRightAndWrong().toString());
//        System.out.println(questions.getStuffQuestion().toString());
//        //response.sendRedirect("/propositionWeb/testPaperView");
//        return redirectTarget;
//    }

    @GetMapping(value = "/propositionWeb/testPaperView")
    public String goToPropositionWeb(){
        //System.out.println("成功進入");
        return "testPaper";
    }

}
