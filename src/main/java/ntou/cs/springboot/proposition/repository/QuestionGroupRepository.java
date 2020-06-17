package ntou.cs.springboot.proposition.repository;

import ntou.cs.springboot.proposition.QuestionClass.QuestionGroup;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionGroupRepository extends MongoRepository<QuestionGroup, String> {
    List<QuestionGroup> findByGradeAndSubject(String grade, String subject);
}
