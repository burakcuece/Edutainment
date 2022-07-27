//
//  ContentView.swift
//  Edutainment
//
//  Created by Burak Cüce on 27.07.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var table = 2
    @State private var numberOfQuestions = 1
    @State private var isActive = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                Stepper("Choose a Multiplication Table: \(table)", value: $table, in: 2...12)
                Stepper("Number of Questions: \(numberOfQuestions)", value: $numberOfQuestions, in: 5...20, step: 5)
                NavigationLink("Start Game", destination: GameView(gamePage: $isActive, table: table, numberOfQuestions: numberOfQuestions), isActive: $isActive)
            }
            .navigationTitle("Edutainment")
            .padding()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
