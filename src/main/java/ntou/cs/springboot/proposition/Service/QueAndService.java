package ntou.cs.springboot.proposition.Service;

import ntou.cs.springboot.proposition.QuestionClass.QuestionsAndAnswers;
import ntou.cs.springboot.proposition.repository.QuestionsAndAnswersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import java.util.List;

@Service
public class QueAndService {

    @Autowired
    QuestionsAndAnswersRepository questionsAndAnswersRepository;

    public QueAndService() { SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this); }

    public List<QuestionsAndAnswers> getQuestionsAndAnswers(String grade, String subject){
        return questionsAndAnswersRepository.findByGradeAndSubject(grade, subject);
    }

    public QuestionsAndAnswers getQuestionsAndAnswersById(String id){
        return questionsAndAnswersRepository.findById(id).get();
    }

    public QuestionsAndAnswers createQuestionsAndAnswers(QuestionsAndAnswers request){
        return questionsAndAnswersRepository.insert(request);
    }

    public QuestionsAndAnswers replaceQuestionsAndAnswers(String id, QuestionsAndAnswers request){
        QuestionsAndAnswers questionsAndAnswers = new QuestionsAndAnswers();
        questionsAndAnswers.setAnswer(request.getAnswer());
        questionsAndAnswers.setGrade(request.getGrade());
        questionsAndAnswers.setImg(request.getImg());
        questionsAndAnswers.setQuestion(request.getQuestion());
        questionsAndAnswers.setSubject(request.getSubject());
        questionsAndAnswers.setId(id);
        return questionsAndAnswersRepository.save(questionsAndAnswers);
    }

    public void deletequestionsAndAnswers(String id){
        questionsAndAnswersRepository.deleteById(id);
    }
}
