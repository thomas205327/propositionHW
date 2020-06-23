package ntou.cs.springboot.proposition.repository;

import ntou.cs.springboot.proposition.QuestionClass.StuffQuestion;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StuffQuestionRepository extends MongoRepository<StuffQuestion, String> {
    List<StuffQuestion> findByGradeAndSubject(String grade, String subject);
    @Override
    Optional<StuffQuestion> findById(String id);
}
