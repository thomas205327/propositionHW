package ntou.cs.springboot.proposition.QuestionClass;

import java.util.List;

public class Questions {
    private List<MultipleChoice> multipleChoice;
    private List<QuestionsAndAnswers> questionsAndAnswers;
    private List<RightAndWrong> rightAndWrong;
    private List<StuffQuestion> stuffQuestion;

    public void setMultipleChoice(List<MultipleChoice> multipleChoice) {

        this.multipleChoice = multipleChoice;
    }

    public void setQuestionsAndAnswers(List<QuestionsAndAnswers> questionsAndAnswers) {
        this.questionsAndAnswers = questionsAndAnswers;
    }

    public void setRightAndWrong(List<RightAndWrong> rightAndWrong) {
        this.rightAndWrong = rightAndWrong;
    }

    public void setStuffQuestion(List<StuffQuestion> stuffQuestion) {
        this.stuffQuestion = stuffQuestion;
    }

    public List<MultipleChoice> getMultipleChoice() {
        return multipleChoice;
    }

    public List<StuffQuestion> getStuffQuestion() {
        return stuffQuestion;
    }

    public List<QuestionsAndAnswers> getQuestionsAndAnswers() {
        return questionsAndAnswers;
    }

    public List<RightAndWrong> getRightAndWrong() {
        return rightAndWrong;
    }

    @Override
    public String toString() {
        return "題目 [multipleChoice=" + multipleChoice.toString() + "" +
                ", stuffQuestion="+stuffQuestion.toString()+", questionsAndAnswers="+questionsAndAnswers.toString()+", rightAndWrong="+rightAndWrong.toString()+"]";
    }
}
