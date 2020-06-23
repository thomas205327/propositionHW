package ntou.cs.springboot.proposition.controller;

import ntou.cs.springboot.proposition.QuestionClass.QuestionsAndAnswers;
import ntou.cs.springboot.proposition.Service.QueAndService;
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
public class QueAndController {

    @Autowired
    private QueAndService queAndService;

    @GetMapping(value = "/questionsAndAnswers/{id}")
    public ResponseEntity<QuestionsAndAnswers> getQuestionsAndAnswersById(@PathVariable String id){
        QuestionsAndAnswers multipleChoice = queAndService.getQuestionsAndAnswersById(id);
        return ResponseEntity.ok(multipleChoice);
    }

    @GetMapping(value = "questionsAndAnswers/{grade}/{subject}")
    public ResponseEntity<List<QuestionsAndAnswers>> getQuestionsAndAnswers(@PathVariable String grade, @PathVariable String subject){
        List<QuestionsAndAnswers> questionsAndAnswers = queAndService.getQuestionsAndAnswers(grade, subject);
        return ResponseEntity.ok(questionsAndAnswers);
    }

    @PostMapping(value = "questionsAndAnswers/add")
    public ResponseEntity<QuestionsAndAnswers> createQuestionsAndAnswers(@RequestBody QuestionsAndAnswers questionsAndAnswers) {
        queAndService.createQuestionsAndAnswers(questionsAndAnswers);
        return ResponseEntity.ok(questionsAndAnswers);
    }

    @DeleteMapping(value = "questionsAndAnswers/{id}")
    public ResponseEntity<QuestionsAndAnswers> deleteQuestionsAndAnswers(@PathVariable("id") String id){
        queAndService.deletequestionsAndAnswers(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping(value = "/questionsAndAnswers/{id}")
    public ResponseEntity<QuestionsAndAnswers> replaceQuestionsAndAnswers(@PathVariable("id") String id, @RequestBody QuestionsAndAnswers request){
        QuestionsAndAnswers questionsAndAnswers = queAndService.replaceQuestionsAndAnswers(id, request);
        return ResponseEntity.ok(questionsAndAnswers);
    }
}
