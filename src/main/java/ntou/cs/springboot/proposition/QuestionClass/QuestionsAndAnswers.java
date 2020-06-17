package ntou.cs.springboot.proposition.QuestionClass;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "questionsandanswers")
public class QuestionsAndAnswers {
    private String question;
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
        return "選擇題 [question=" + question + "" +
                ", answer="+answer+", grade="+grade+", subject="+subject+", id="+id+"]";
    }
}
