package ntou.cs.springboot.proposition.Service;

import ntou.cs.springboot.proposition.QuestionClass.MultipleChoice;
import ntou.cs.springboot.proposition.repository.MultipleChoiceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import java.util.List;

@Service
public class MultService {

    @Autowired
    private MultipleChoiceRepository multipleChoiceRepository;

    public MultService(){
        SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this);
    }

    public List<MultipleChoice> getMultipleChoice(String grade, String subject){
        return multipleChoiceRepository.findByGradeAndSubject(grade, subject);
    }

    public MultipleChoice getMultipleChoiceById(String id){
        return multipleChoiceRepository.findById(id).get();
    }

    public MultipleChoice createMultipleChoice(MultipleChoice request){
        return multipleChoiceRepository.insert(request);
    }

    public MultipleChoice replaceMultipleChoice(String id, MultipleChoice request){
        MultipleChoice multipleChoice = new MultipleChoice();
        multipleChoice.setAnswer(request.getAnswer());
        multipleChoice.setAnswerA(request.getAnswerA());
        multipleChoice.setAnswerB(request.getAnswerB());
        multipleChoice.setAnswerC(request.getAnswerC());
        multipleChoice.setAnswerD(request.getAnswerD());
        multipleChoice.setGrade(request.getGrade());
        multipleChoice.setImg(request.getImg());
        multipleChoice.setQuestion(request.getQuestion());
        multipleChoice.setSubject(request.getSubject());
        multipleChoice.setId(id);
        return multipleChoiceRepository.save(multipleChoice);
    }

    public void deleteMultipleChoice(String id){
        multipleChoiceRepository.deleteById(id);
    }
}
