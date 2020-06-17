package ntou.cs.springboot.proposition.repository;

import ntou.cs.springboot.proposition.QuestionClass.StuffQuestion;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StuffQuestionRepository extends MongoRepository<StuffQuestion, String> {
    List<StuffQuestion> findByGradeAndSubject(String grade, String subject);
    StuffQuestion findByIdContainingIgnoreCase(String id);
}
