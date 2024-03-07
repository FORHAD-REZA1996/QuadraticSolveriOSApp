//
//  ContentView.swift
//  QuadraticSolverApp
//
//  Created by Reza on 7/3/24.
//

// ContentView.swift
import SwiftUI


struct ContentView: View {
    //state vars for a,b,c,x1, and x2
    //data persistence
    @State private var coefficientA = ""
    @State private var coefficientB = ""
    @State private var coefficientC = ""
    
    @State private var root1 = ""
    @State private var root2 = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("A", text: $coefficientA)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("B", text: $coefficientB)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("C", text: $coefficientC)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Calculate Roots") {
                    solveForX()
                }
                .padding()
                
                HStack {
                    Text("Root 1: \(root1)")
                    Spacer()
                    Text("Root 2: \(root2)")
                }
                .padding()
            }
            .padding()
        }
        //   Text(...)
    }
    private func solveForX() {
        guard let a = Double(coefficientA),
              let b = Double(coefficientB),
              let c = Double(coefficientC) else {
            // Handle invalid input
            return
        }
        
        let discriminant = b * b - 4 * a * c
        
        if discriminant >= 0 {
            let rootOne = (-b + sqrt(discriminant)) / (2 * a)
            let rootTwo = (-b - sqrt(discriminant)) / (2 * a)
            
            root1 = String(format: "%.4f", rootOne)
            root2 = String(format: "%.4f", rootTwo)
        } else {
            // Handle imaginary roots
            root1 = "Roots are imaginary"
            root2 = ""
        }
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
