//
//  ContentView.swift
//  GuessFlag
//
//  Created by mikaila Akeredolu on 5/14/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy","Nigeria", "Poland","Spain", "UK", "Ukraine", "US"].shuffled()  //shuffle arrays at start of game

    @State private var correctAnswer = Int.random(in: 0...2) // 0, 1, 3
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score: Int = 0

    //flagtapped method
    func flagtapped(_ number: Int){
        if number  == correctAnswer{
            scoreTitle = "Correct"
            score = score + 1
        }else{
            scoreTitle = "Wrong, that is the flag of \(countries[number])"
            if score > 0{
                score = score - 1
            }
        }
        
        showingScore = true
    }
    
    //ask question method
    func askQuestion(){
       countries.shuffle()
       correctAnswer = Int.random(in: 0...2)
    }
    
    
    var body: some View {
        
        ZStack{
            
            Color.blue.opacity(0.2)
            
            
            VStack{
                Spacer()
              Text("Gues the Flag")
                    .font(.largeTitle.weight(.bold)).padding(20)
            
            VStack(spacing: 15){
                
                VStack{
                    Text("Tap the flag of ")
                        .font(.subheadline.weight(.heavy))
                        .padding(5)
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                }
                
                //loop through
                ForEach(0..<3){number in
                    Button {
                        //flag was tapped
                        flagtapped(number)
                        print("\(countries[number])")
                        
                    } label: {
                        Image(countries[number])
                            .clipShape(.buttonBorder)
                            .shadow(radius: 5)
                    }
                }
            }
                Spacer()
                Spacer()
                Text("score: is \(score) ")
                    .font(.title.bold())
            Spacer()
            }.padding()
            
            
            //ask question alert to continue
        }.alert(scoreTitle, isPresented: $showingScore){
            Button("continue", action: askQuestion)
        } message: {
            Text("Your score is \(score) " )
        }
        
    }

}

#Preview {
    ContentView()
}











/*
 struct ContentView: View {

     @State private var showAlert: Bool = false
     
     var body: some View {
         
         
         //Cancel button after alert
         Button("Show Alert"){
             showAlert = true
         }
         .alert("important message", isPresented: $showAlert){
             Button("Delete", role: .destructive){}
             Button("Cancel", role: .cancel){}
         } message: {
             Text("Please read ths message")
         }
         
         
         //Button to show alert / modal
 //        Button("Show Alert"){
 //            showAlert = true
 //        }
 //        .alert("important message", isPresented: $showAlert){
 //            Button("ok"){}
 //        }
 //
         //ways to render images
         Image(decorative:"Mikaila_java_tutor")
             .resizable()
             .scaledToFit()
         
         
         //Buttons
         VStack{
             
             //custom button
             
             Button{
                 print("Button tapped")
         
             }label: {
                      Label("deleting", systemImage: "trash")
                     .padding(20)
                     .foregroundColor(.red)
                     .background(.yellow)
                     .cornerRadius(20)
             }
             
             //image and text
 //            Button("Trash", systemImage: "trash.fill"){
 //                print("Button was tapped")
 //                executeDelete()
 //            }
 //
             //image with label
 //            Button{
 //                print("Button was tapped")
 //                executeDelete()
 //            }label: {
 //                Image(systemName: "trash")
 //                    .foregroundColor(.red)
 //                    .padding()
 //
 //            }
             
 //            Button{
 //                print("Button was tapped")
 //                executeDelete()
 //            }label: {
 //                Text("Tap me")
 //                    .padding()
 //                    .foregroundColor(.white)
 //                    .background(.red)
 //                    .cornerRadius(10)
 //            }
             
             
             //system buttons
             
             Button("Button 1") {
                 
             }
             .buttonStyle(.bordered)
             
             Button("Button 2", role: .destructive) {
                 
             }
             .buttonStyle(.bordered)
             
             Button("Button 3") {
                 
             }
             .buttonStyle(.borderedProminent).tint(.indigo)
             
             Button("Button 4", role: .destructive) {
                 
             }
             .buttonStyle(.borderedProminent)
             
            
         }
         
         
         
 //        Button("delete selection", role: .destructive, action: executeDelete)
         
        
         
         
         
         
        //Gradients
         
         /*
         
     LinearGradient(
         gradient: Gradient(colors: [.red, .blue]),
         startPoint: .leading,
         endPoint: .trailing
     )
     .edgesIgnoringSafeArea(.all)
         
         //Create a Sun with blue skies
         RadialGradient(colors: [.orange, .blue], center: .center, startRadius: 20, endRadius: 200)
             .edgesIgnoringSafeArea(.all)
     
         
     AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center, angle: .zero)
             .edgesIgnoringSafeArea(.all)
         
         
         
         */
         
         
         /*
         ZStack{
             Color.red // this is its own view .primary dark mode
             // Color.primary - .secondary - light& dark mode
             
             Text("Hello, World!")
                 .font(.largeTitle)
                 .padding(100)
                 .foregroundColor(.white)
                 .background(.green.gradient)
             
         }
         .background(.blue) // applies .blue to entire background
         //.ignoresSafeArea(.all)  // applies Color.red to entire background
     
         */
         
     }
     
    
     
     func executeDelete(){
         print("now deleting")
     }
     
 }

 #Preview {
     ContentView()
 }

 */
