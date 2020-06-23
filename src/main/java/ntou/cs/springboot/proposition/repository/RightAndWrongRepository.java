package ntou.cs.springboot.proposition.repository;

import ntou.cs.springboot.proposition.QuestionClass.RightAndWrong;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface RightAndWrongRepository extends MongoRepository<RightAndWrong, String> {
    List<RightAndWrong> findByGradeAndSubject(String grade, String subject);
    @Override
    Optional<RightAndWrong> findById(String id);
}
