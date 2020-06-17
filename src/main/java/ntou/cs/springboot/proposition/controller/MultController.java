package ntou.cs.springboot.proposition.controller;

import ntou.cs.springboot.proposition.QuestionClass.MultipleChoice;
import ntou.cs.springboot.proposition.Service.MultService;
import ntou.cs.springboot.proposition.repository.MultipleChoiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MultController {

    @Autowired
    private MultService multService;

    //以年級科目進行搜尋  呈現多個
    @GetMapping(value = "/multipleChoice/{grade}/{subject}")
    public ResponseEntity<List<MultipleChoice>> getMultipleChoice(@PathVariable String grade, @PathVariable String subject){
        List<MultipleChoice> multipleChoice = multService.getMultipleChoice(grade, subject);
        return ResponseEntity.ok(multipleChoice);
    }

    //新增
    @PostMapping(value = "/multipleChoice/add")
    public ResponseEntity<MultipleChoice> createMultipleChoice(@RequestBody MultipleChoice multipleChoice) {
        multService.createMultipleChoice(multipleChoice);
        return ResponseEntity.ok(multipleChoice);
    }

    @DeleteMapping(value = "/multipleChoice/{id}")
    public ResponseEntity<MultipleChoice> deleteMultipleChoice(@PathVariable("id") String id){
        multService.deleteMultipleChoice(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping(value = "/multipleChoice/{id}")
    public ResponseEntity<MultipleChoice> replaceMultipleChoice(@PathVariable("id") String id, @RequestBody MultipleChoice request){
        MultipleChoice multipleChoice = multService.replaceMultipleChoice(id, request);
        return ResponseEntity.ok(multipleChoice);
    }
}
