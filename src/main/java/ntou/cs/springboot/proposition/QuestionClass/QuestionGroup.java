package ntou.cs.springboot.proposition.QuestionClass;

import org.springframework.data.mongodb.core.mapping.Document;

import java.util.List;

@Document(collection = "questiongroup")
public class QuestionGroup {
    private String question;
    private String img;
    private String subject;
    private String grade;
    private List<MultipleChoice> multipleChoices;

    public String getQuestion(){
        return question;
    }

    public void setQuestion(String temp){
        question = temp;
    }

    public String getImg(){
        return img;
    }

    public void setImg(String temp){
        img = temp;
    }

    public String getGrade(){
        return grade;
    }

    public void setGrade(String temp){
        grade = temp;
    }

    public String getSubject(){
        return subject;
    }

    public void setSubject(String temp){
        subject = temp;
    }
}
