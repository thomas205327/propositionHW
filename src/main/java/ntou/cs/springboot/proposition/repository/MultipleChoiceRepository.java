package ntou.cs.springboot.proposition.repository;

import ntou.cs.springboot.proposition.QuestionClass.MultipleChoice;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MultipleChoiceRepository extends MongoRepository<MultipleChoice, String> {
    List<MultipleChoice> findByGradeAndSubject(String grade, String subject);
    @Override
    Optional<MultipleChoice> findById(String id);
}
