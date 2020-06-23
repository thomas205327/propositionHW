package ntou.cs.springboot.proposition.Service;

import ntou.cs.springboot.proposition.QuestionClass.RightAndWrong;
import ntou.cs.springboot.proposition.repository.RightAndWrongRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import java.util.List;

@Service
public class RightAndWrongService {

    @Autowired
    private RightAndWrongRepository rightAndWrongRepository;

    public RightAndWrongService() { SpringBeanAutowiringSupport.processInjectionBasedOnCurrentContext(this); }

    public List<RightAndWrong> getRightAndWrong(String grade, String subject){
        return rightAndWrongRepository.findByGradeAndSubject(grade, subject);
    }

    public RightAndWrong getRightAndWrongById(String id){
        return  rightAndWrongRepository.findById(id).get();
    }

    public RightAndWrong createRightAndWrong(RightAndWrong request){
        return rightAndWrongRepository.insert(request);
    }

    public RightAndWrong replaceRightAndWrong(String id, RightAndWrong request){
        RightAndWrong rightAndWrong = new RightAndWrong();
        rightAndWrong.setAnswer(request.getAnswer());
        rightAndWrong.setGrade(request.getGrade());
        rightAndWrong.setImg(request.getImg());
        rightAndWrong.setQuestion(request.getQuestion());
        rightAndWrong.setSubject(request.getSubject());
        rightAndWrong.setId(id);
        return rightAndWrongRepository.save(rightAndWrong);
    }

    public void deleteRightAndWrong(String id){
        rightAndWrongRepository.deleteById(id);
    }
}
