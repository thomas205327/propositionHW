package ntou.cs.springboot.proposition.repository;

import ntou.cs.springboot.proposition.QuestionClass.QuestionsAndAnswers;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface QuestionsAndAnswersRepository extends MongoRepository<QuestionsAndAnswers, String> {
    List<QuestionsAndAnswers> findByGradeAndSubject(String grade, String subject);
    @Override
    Optional<QuestionsAndAnswers> findById(String id);
}
