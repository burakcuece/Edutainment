//
//  GameView.swift
//  Edutainment
//
//  Created by Burak Cüce on 27.07.22.
//

import SwiftUI

struct GameView: View {
    @Binding var gamePage: Bool
    
    let table: Int
    let numberOfQuestions: Int
    
    @State private var questionsAsked = 0
    @State private var number = Int.random(in: 0...12)
    @State private var answer = ""
    
    @State private var showResult = false
    @State private var gameEnded = false
    @State private var numberOfCorrectAnswers = 0
    
    
    private var question: String {
        return "What is \(table) * \(number)?"
    }
    
    private var answerIsCorrect: Bool {
        Int(answer) ?? 0 == number * table
    }
    
    
    var body: some View {
        VStack {
            Text(question)
            TextField("Enter Answer", text: $answer)
                .onChange(of: answer) { _ in
                    showResult = false
                }
            Button("Submit Answer!") {
                questionsAsked += 1
                
                showResult = true
                
                if answerIsCorrect {
                    numberOfCorrectAnswers += 1
                }
            }
            
            .alert(answerIsCorrect ? "Correct" : "Incorrect", isPresented: $showResult) {
                Button("Continue") {
                    if questionsAsked == numberOfQuestions {
                        gameEnded = true
                    } else {
                        nextQuestion()
                    }
                }
            }
            
            .alert("Game ended", isPresented: $gameEnded) {
                Button("Go Back") {
                    gamePage = false
                }
            } message: {
                Text("Your Final Score Is: \(numberOfCorrectAnswers)")
            }
        }
        .padding()
    }
    
    func nextQuestion() {
        showResult = false
        number = Int.random(in: 0...10)
        answer = ""
    }
    
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gamePage: .constant(false), table: 2, numberOfQuestions: 5)
    }
}
