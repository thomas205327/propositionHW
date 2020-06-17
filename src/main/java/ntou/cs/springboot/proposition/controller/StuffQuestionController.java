package ntou.cs.springboot.proposition.controller;

import ntou.cs.springboot.proposition.QuestionClass.StuffQuestion;
import ntou.cs.springboot.proposition.Service.StuffQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class StuffQuestionController {

    @Autowired
    private StuffQuestionService stuffQuestionService;

    @GetMapping(value = "/stuffQuestion/{grade}/{subject}")
    public ResponseEntity<List<StuffQuestion>> getStuffQuestion(@PathVariable String grade, @PathVariable String subject){
        List<StuffQuestion> stuffQuestions = stuffQuestionService.getStuffQuestion(grade, subject);
        return ResponseEntity.ok(stuffQuestions);
    }

    @PostMapping(value = "/stuffQuestion/add")
    public ResponseEntity<StuffQuestion> createStuffQuestion(@RequestBody StuffQuestion stuffQuestion){
        stuffQuestionService.createStuffQuestion(stuffQuestion);
        return ResponseEntity.ok(stuffQuestion);
    }

    @DeleteMapping(value = "/stuffQuestion/{id}")
    public ResponseEntity<StuffQuestion> deleteStuffQuestion(@PathVariable("id") String id){
        stuffQuestionService.deleteStuffQuestion(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping(value = "/stuffQuestion/{id}")
    public ResponseEntity<StuffQuestion> replaceStuffQuestion(@PathVariable("id") String id, @RequestBody StuffQuestion request){
        StuffQuestion stuffQuestion = stuffQuestionService.replaceStuffQuestion(id, request);
        return ResponseEntity.ok(stuffQuestion);
    }
}
