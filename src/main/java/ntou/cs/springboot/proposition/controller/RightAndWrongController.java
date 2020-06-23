package ntou.cs.springboot.proposition.controller;

import ntou.cs.springboot.proposition.QuestionClass.RightAndWrong;
import ntou.cs.springboot.proposition.Service.RightAndWrongService;
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
public class RightAndWrongController {

    @Autowired
    private RightAndWrongService rightAndWrongService;

    @GetMapping(value = "/rightAndWrong/{id}")
    public ResponseEntity<RightAndWrong> getRightAndWrongById(@PathVariable String id){
        RightAndWrong multipleChoice = rightAndWrongService.getRightAndWrongById(id);
        return ResponseEntity.ok(multipleChoice);
    }

    @GetMapping(value = "/rightAndWrong/{grade}/{subject}")
    public ResponseEntity<List<RightAndWrong>> getRightAndWrong(@PathVariable String grade, @PathVariable String subject){
        List<RightAndWrong> rightAndWrong = rightAndWrongService.getRightAndWrong(grade, subject);
        return ResponseEntity.ok(rightAndWrong);
    }

    @PostMapping(value = "/rightAndWrong/add")
    public ResponseEntity<RightAndWrong> createRightAndWrong(@RequestBody RightAndWrong rightAndWrong){
        rightAndWrongService.createRightAndWrong(rightAndWrong);
        return ResponseEntity.ok(rightAndWrong);
    }

    @DeleteMapping(value = "/rightAndWrong/{id}")
    public ResponseEntity<RightAndWrong> deleteRightAndWrong(@PathVariable("id") String id){
        rightAndWrongService.deleteRightAndWrong(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping(value = "/rightAndWrong/{id}")
    public ResponseEntity<RightAndWrong> replaceRightAndWrong(@PathVariable("id") String id, @RequestBody RightAndWrong request){
        RightAndWrong rightAndWrong = rightAndWrongService.replaceRightAndWrong(id, request);
        return  ResponseEntity.ok(rightAndWrong);
    }
}
