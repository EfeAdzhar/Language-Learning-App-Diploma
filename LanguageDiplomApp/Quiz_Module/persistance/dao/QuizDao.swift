//
//  QuizDao.swift
//  LanguageDiplomApp
//
//  Created by Efe on 18.12.23.
//

import Foundation

class QuizDao {
    private var questions : [QuestionProtocol] = []
    private var quizes : [QuizProtocol] = []
    
    init() {
        self.questions = questionDB()
        self.quizes = quizDB()
    }
    
    func getQuestion() -> Optional<QuestionProtocol> {
        return Optional.some(questions.remove(at: 0))
    }
    
    func getQuiz() -> Optional<QuizProtocol> {
        return Optional.some(quizes.remove(at: 0))
    }
    
    func questionDbStorage() -> Int {
        print("In DAO \(questions.count)")
        return questions.count
    }
    
    func quizDbStorage() -> Int {
        return quizes.count
    }
    
    private func questionDB() -> [QuestionProtocol] {
        return [
            Question(question: "What is your age?",
                     answers: Answers(answers: ["13-17", "18-25", "25-29", "30+"]),
                     questionImage: "IMAGE MUST BE HERE"),
            Question(question: "Your gender",
                     answers: Answers(answers: ["Male", "Female"]),
                     questionImage: "IMAGE MUST BE HERE"),
            Question(question: "Your hobby",
                     answers: Answers(answers: ["Sports", "Art", "Tech", "Fashion", "Games"]),
                     questionImage: "IMAGE MUST BE HERE"),
            Question(question: "Ok, now let's see witch lerning style suits you better! Are you ready?",
                     answers: Answers(answers: ["Yes", "YES!!!", "Of corse!"]),
                     questionImage: "IMAGE MUST BE HERE"),
            Question(question: "I follow spoken directions better than written directions.",
                     answers: Answers(answers: ["Yes", "Middle", "No"]),
                     questionImage: "IMAGE MUST BE HERE"),
            Question(question: "I learn better by listening to a lecture than by reading a textbook.",
                     answers: Answers(answers: ["Yes", "Middle", "No"]),
                     questionImage: "IMAGE MUST BE HERE"),
            Question(question: "I need explanations of diagrams, graphs, and maps in order to understand them.",
                     answers: Answers(answers: ["Yes", "Middle", "No"]),
                     questionImage: "IMAGE MUST BE HERE"),
            Question(question: "I enjoy participating in classroom discussions and debates.",
                     answers: Answers(answers: ["Yes", "Middle", "No"]),
                     questionImage: "IMAGE MUST BE HERE"),
            Question(question: "I create songs and jingles to remember information..",
                     answers: Answers(answers: ["Yes", "Middle", "No"]),
                     questionImage: "IMAGE MUST BE HERE"),
            Question(question: "I remember things I hear better than things I see.",
                     answers: Answers(answers: ["Yes", "Middle", "No"]),
                     questionImage: "IMAGE MUST BE HERE"),
            Question(question: "It helps me to read out loud when studying from my textbooks.",
                     answers: Answers(answers: ["Yes", "Middle", "No"]),
                     questionImage: "IMAGE MUST BE HERE")]
    }
    
    private func quizDB() -> [QuizProtocol] {
        return [
            Quiz(
                question: "Her hands ___ small.?",
                answers: Answers(answers: ["has very", "very", "are very", "is very"]),
                answer: "are very", questionImage: "IMAGE MUST BE HERE"),
            Quiz(
                question: "Which is correct?",
                answers: Answers(answers: ["Today it sunny", "It sunny today", "It has sunny today", "It is sunny today"]),
                answer: "It is sunny today", questionImage: "IMAGE MUST BE HERE"),
            Quiz(
                question: "My brother ___ in an office",
                answers: Answers(answers: ["hasn't work", "doesn't work", "don't work", "isn't work"]),
                answer: "doesn't work", questionImage: "IMAGE MUST BE HERE"),
            Quiz(
                question: "How much ___ tomatoes?",
                answers: Answers(answers: ["are a", "is a", "are the", "is the"]),
                answer: "are the", questionImage: "IMAGE MUST BE HERE"),
            Quiz(
                question: "Lina's food is ___.",
                answers: Answers(answers: ["very saltily", "very salty", "very salt", "verily salty"]),
                answer: "very salty", questionImage: "IMAGE MUST BE HERE"),
            Quiz(
                question: "Where are you? I ___ all day.",
                answers: Answers(answers: ["been waiting", "have been waiting", "am waiting", "wait"]),
                answer: "have been waiting", questionImage: "IMAGE MUST BE HERE"),
            Quiz(
                question: "The Buchwalds ___ live in this neighborhood. They moved away 6 months ago.",
                answers: Answers(answers: ["are used to", "have used to", "used to", "were use to"]),
                answer: "used to", questionImage: "IMAGE MUST BE HERE"),
            Quiz(
                question: "Can you open the door, please? It ___ be Izzy. She said she would come by.",
                answers: Answers(answers: ["can't", "would be", "mustn't", "must"]),
                answer: "must", questionImage: "IMAGE MUST BE HERE"),
            
            Quiz(
                question: "___ that the volcano has stopped erupting.",
                answers: Answers(answers: ["Reporting", "It was reported", "It be reported", "There was report"]),
                answer: "It was reported", questionImage: "IMAGE MUST BE HERE"),
            Quiz(
                question: "___ to take an earlier flight, they would need to call us immediately.",
                answers: Answers(answers: ["Would they decide", "They should decide", "Should they decide", "In case decide"]),
                answer: "Should they decide", questionImage: "IMAGE MUST BE HERE")]
    }
}
