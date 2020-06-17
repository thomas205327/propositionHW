package ntou.cs.springboot.proposition.QuestionClass;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "multiplechoice")
public class MultipleChoice {
    private String question;
    private String answerA;
    private String answerB;
    private String answerC;
    private String answerD;
    private String answer;
    private String img;
    private String grade;
    private String subject;
    private String id;

    public String getId() { return id; }

    public void setId(String temp) { id = temp; }

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

    public String getQuestion(){
        return question;
    }

    public void setQuestion(String temp){
        question = temp;
    }

    public String getAnswerA(){
        return answerA;
    }

    public void setAnswerA(String temp){
        answerA = temp;
    }

    public String getAnswerB(){
        return answerB;
    }

    public void setAnswerB(String temp){
        answerB = temp;
    }

    public String getAnswerC(){
        return answerC;
    }

    public void setAnswerC(String temp){
        answerC = temp;
    }

    public String getAnswerD(){
        return answerD;
    }

    public void setAnswerD(String temp){
        answerD = temp;
    }

    public String getAnswer(){
        return answer;
    }

    public void setAnswer(String temp){
        answer = temp;
    }

    public String getImg(){
        return img;
    }

    public void setImg(String temp){
        img = temp;
    }

    @Override
    public String toString() {
        return "選擇題 [question=" + question + ", answerA=" + answerA + ", answerB=" + answerB +", answerC="+answerC+", answerD="+answerD+"" +
                ", answer="+answer+", grade="+grade+", subject="+subject+", id="+id+"]";
    }
}
