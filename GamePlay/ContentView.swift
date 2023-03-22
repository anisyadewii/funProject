//
//  ContentView.swift
//  GamePlay
//
//  Created by Anisya Dewi Larasati on 20/03/23.
//

import SwiftUI

let backgroundColor = Color(red: 91 / 255, green: 30 / 255, blue: 156 / 255)
let borderColor = Color(red: 254 / 255, green: 155 / 255, blue: 0 / 255)

struct ContentView: View {
    var body: some View {
//        backgroundColor.ignoresSafeArea(.all)
        ZStack {
            backgroundColor.ignoresSafeArea(.all)
            VStack{
                ZStack{
                    Rectangle().frame(width: 286, height: 50).opacity(0.15).border(borderColor, width: 5)
                    
                    Text("Welcome on Board")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white).padding()
                   
                }.padding()
//                Text("Welcome on Board")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color.white).padding(.top)
                Spacer()
                HStack{
                    VStack{
                        VStack{
                            Text("Player 1")
                                .font(.title3)
                                .foregroundColor(Color.white)
                            
                            Circle().frame(width: 100).opacity(0.15)
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("Player 2")
                                .font(.title3).foregroundColor(Color.white)
                            
                            Circle().frame(width: 100).opacity(0.15)
                        }
                    }
                    
                    Divider()
//                    Rectangle().frame(width: 360, height: 200).opacity(0.15).border(borderColor, width: 5).cornerRadius(15)
                   
                    ZStack{
                        Rectangle().frame(width: 360, height: 200).opacity(0.15).border(borderColor, width: 5)
                        
                        Text("Hi").foregroundColor(.white)
                    }
                    Divider()
                    
                    VStack{
                        VStack{
                            Text("Player 3")
                                .font(.title3).foregroundColor(Color.white)
                            
                            Circle().frame(width: 100).opacity(0.15)
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("Player 4")
                                .font(.title3).foregroundColor(Color.white)
                            
                            Circle().frame(width: 100).opacity(0.15)
                        }
                    }
                }
            }
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//            backgroundColor.ignoresSafeArea(.all)
        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeLeft)
    }
}
