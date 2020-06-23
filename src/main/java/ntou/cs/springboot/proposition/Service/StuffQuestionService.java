package ntou.cs.springboot.proposition.Service;

import ntou.cs.springboot.proposition.QuestionClass.StuffQuestion;
import ntou.cs.springboot.proposition.repository.StuffQuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import java.util.List;

@Service
public class StuffQuestionService {

    @Autowired
    private StuffQuestionRepository stuffQuestionRepository;

    public StuffQuestionService() { SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this); }

    public List<StuffQuestion> getStuffQuestion(String grade, String subject){
        return stuffQuestionRepository.findByGradeAndSubject(grade, subject);
    }

    public StuffQuestion getStuffQuestionById(String id){
        return stuffQuestionRepository.findById(id).get();
    }

    public StuffQuestion createStuffQuestion(StuffQuestion request){
        return stuffQuestionRepository.insert(request);
    }

    public StuffQuestion replaceStuffQuestion(String id, StuffQuestion request){
        StuffQuestion stuffQuestion = new StuffQuestion();
        stuffQuestion.setAnswer(request.getAnswer());
        stuffQuestion.setGrade(request.getGrade());
        stuffQuestion.setImg(request.getImg());
        stuffQuestion.setQuestion(request.getQuestion());
        stuffQuestion.setSubject(request.getSubject());
        stuffQuestion.setId(id);
        return stuffQuestionRepository.save(stuffQuestion);
    }

    public void deleteStuffQuestion(String id){
        stuffQuestionRepository.deleteById(id);
    }
}
