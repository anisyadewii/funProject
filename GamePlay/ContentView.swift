//
//  ContentView.swift
//  GamePlay
//
//  Created by Anisya Dewi Larasati on 20/03/23.
//

import SwiftUI

let backgroundColor = Color(red: 91 / 255, green: 30 / 255, blue: 156 / 255)
let borderColorPlayer1 = Color(red: 145 / 255, green: 60 / 255, blue: 186 / 255)
let borderColorPlayer2 = Color(red: 237 / 255, green: 42 / 255, blue: 94 / 255)
let borderColorPlayer3 = Color(red: 10 / 255, green: 177 / 255, blue: 68 / 255)
let borderColorPlayer4 = Color(red: 244 / 255, green: 101 / 255, blue: 0 / 255)
let circleBg = Color(red: 216 / 255, green: 216 / 255, blue: 216 / 255)
let buttonColor = Color(red: 254 / 255, green: 155 / 255, blue: 0 / 255)



struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                backgroundColor.ignoresSafeArea(.all)
                VStack{
    //                Spacer()
    //                Image(systemName: "chevron.left").foregroundColor(.white).frame(alignment: .leading)
    //                HStack{
    //                    Image(systemName: "chevron.left").foregroundColor(.white)
    //                    Spacer()
    //                }.padding(.top)
                    
                   
                    ZStack{
                        Rectangle().frame(width: 286, height: 50).opacity(0.15).cornerRadius(10)
                        
                        HStack{
                            Image("master").padding(.trailing, 8)
                            Text("Welcome on Board!")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                       
                    }.padding(.top, 20)

                    Spacer()
                    
                    HStack(spacing: 20){
                        VStack(spacing: 10){
                            VStack{
                                Text("Player 1")
                                    .font(.title3)
                                    .foregroundColor(Color.white)
                                
                                ZStack{
                                    Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer1, lineWidth: 6))
                                    
                                    Image("player1")
                                }
                            }
                            
                            Spacer()
                            
                            VStack{
                                Text("Player 2")
                                    .font(.title3).foregroundColor(Color.white)
                                
                                ZStack{
                                    Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer2, lineWidth: 6))
                                    
                                    Image("player2")
                                }
                            }
                        }
                        
                        Divider()
                       
                        ZStack{
                            Rectangle().frame(width: 440, height: 220).opacity(0.15).cornerRadius(10)
                            
                            VStack(spacing: 20){
                                Text("Are you guys ready?").font(.title2).foregroundColor(.white).fontWeight(.bold)
                                
                                // First Impression
                                NavigationLink("Yes", destination: FirstImpressionView()).frame(maxWidth: 90, maxHeight: 45).background(buttonColor).cornerRadius(10).foregroundColor(Color.white).font(.title2).fontWeight(.medium)
                                
                                // Fun Fact
//                                NavigationLink("Yes!", destination: FunFactView()).frame(maxWidth: 90, maxHeight: 45).background(buttonColor).cornerRadius(10).foregroundColor(Color.white).font(.title2).fontWeight(.medium)
                            }
                        }
                        
                        Divider()
                        
                        VStack(spacing: 10){
                            VStack{
                                Text("Player 3")
                                    .font(.title3).foregroundColor(Color.white)
                                
                                ZStack{
                                    Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer3, lineWidth: 6))
                                    
                                    Image("player3")
                                }
                            }
                            
                            Spacer()
                            
                            VStack{
                                Text("Player 4")
                                    .font(.title3).foregroundColor(Color.white)
                                
                                ZStack{
                                    Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer4, lineWidth: 6))
                                    
                                    Image("player4")
                                }
                            }
                        }
                    }.padding(.bottom, 10)
                }
            }
        }
    }
}


struct FirstImpressionView: View {
    
    @State private var timeRemaining = 180
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func convertSecondsToTime(timeInSeconds : Int) -> String{
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea(.all).navigationBarHidden(true)
            VStack{
                    ZStack{
                        Rectangle().frame(width: 286, height: 50).opacity(0.15).cornerRadius(10)
                        
                        HStack{
                            Image("master").padding(.trailing, 8)
                            Text("First Impression")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                       
                    }.padding(.top, 20)

                Spacer()
                
                HStack(spacing: 20){
                    VStack(spacing: 10){
                        VStack{
                            Text("Player 1")
                                .font(.title3)
                                .foregroundColor(Color.white)
                            
                            ZStack{
                                Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer1, lineWidth: 6))
                                
                                if timeRemaining <= 135{
                                    Image("player1")
                                }else if timeRemaining > 135{
                                    ZStack{
                                        Image("player1")
                                        Image("bling").position(x:95, y:12)
                                    }
                                }
                                
                            }
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("Player 2")
                                .font(.title3).foregroundColor(Color.white)
                            
                            ZStack{
                                Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer2, lineWidth: 6))
                                
                                if timeRemaining > 135 || timeRemaining <= 90{
                                    Image("player2")
                                }else if timeRemaining == 135 ||  timeRemaining > 90{
                                    ZStack{
                                        Image("player2")
                                        Image("bling").position(x:95, y:12)
                                    }
                                }
                            }
                        }
                    }
                    
                    Divider()
                   
                    ZStack{
                        Rectangle().frame(width: 440, height: 220).opacity(0.15).cornerRadius(10)
                        
                        if timeRemaining > 0{
                            Text(convertSecondsToTime(timeInSeconds:timeRemaining)).font(.system(size: 36)).foregroundColor(Color.white)
                        }else{
                            Text("Bye").font(.title2).foregroundColor(.white).fontWeight(.bold)
                        }
                     
                    }
//                    .onReceive(timer){
//                        time in if timeRemaining > 0 {
//                            timeRemaining -= 1
//                        }
//                    }
                    
                    
                    Divider()
                    
                    VStack(spacing: 10){
                        VStack{
                            Text("Player 3")
                                .font(.title3).foregroundColor(Color.white)
                            
                            ZStack{
                                Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer3, lineWidth: 6))
                                
                                if timeRemaining > 90 || timeRemaining <= 45 {
                                    Image("player3")
                                }else if timeRemaining == 90 || timeRemaining > 45 {
                                    ZStack{
                                        Image("player3")
                                        Image("bling").position(x:95, y:12)
                                    }
                                }
                                
                            }
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("Player 4")
                                .font(.title3).foregroundColor(Color.white)
                            
                            ZStack{
                                Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer4, lineWidth: 6))
                                
                                if timeRemaining > 45 || timeRemaining == 0 {
                                    Image("player4")
                                }else if timeRemaining <= 45{
                                    ZStack{
                                        Image("player4")
                                        Image("bling").position(x:95, y:12)
                                    }
                                }
                            }
                        }
                    }
                }.padding(.bottom, 10)
            }
        }.onReceive(timer){
            time in if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
}


struct FunFactView: View {
    
    @State private var funFact1: String = ""
    @State private var funFact2: String = ""
    
    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea(.all).navigationBarHidden(true)
            VStack{
//                HStack{
//                    Text("Hi")
//                    Spacer()
                    ZStack{
                        Rectangle().frame(width: 286, height: 50).opacity(0.15).cornerRadius(10)
                        
                        HStack{
                            Image("master").padding(.trailing, 8)
                            Text("Fun Fact")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                       
                    }.padding(.top, 20)

                Spacer()
                
                HStack(spacing: 20){
                    VStack(spacing: 10){
                        VStack{
                            Text("Player 1")
                                .font(.title3)
                                .foregroundColor(Color.white)
                            
                            ZStack{
                                Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer1, lineWidth: 6))
                                
                                Image("player1")
                            }
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("Player 2")
                                .font(.title3).foregroundColor(Color.white)
                            
                            ZStack{
                                Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer2, lineWidth: 6))
                                
                                Image("player2")
                            }
                        }
                    }
                    
                    Divider()
                   
                    ZStack{
                        Rectangle().frame(width: 440, height: 220).opacity(0.15).cornerRadius(10)
                        
                        VStack(spacing: 20){
                            Text("Fun fact about yourself").font(.title2).foregroundColor(.white).fontWeight(.bold)
                            
                            
                            VStack{
                                TextField(
                                        "Fun fact",
                                        text: $funFact1
                                ).padding().frame(width: 360, height: 45).background(Color.black.opacity(0.15)).foregroundColor(Color.white).cornerRadius(10)
                                
                                TextField(
                                        "Fun fact",
                                        text: $funFact2
                                ).padding().frame(width: 360, height: 45).background(Color.black.opacity(0.15)).foregroundColor(Color.white).cornerRadius(10)
                            }
                                
                                
//                                TextField(
//                                        "Fun fact",
//                                        text: $funFact2
//                                ).background(.opacity(0.15)).padding()
                          
                        }
                    }
                    
                    Divider()
                    
                    VStack(spacing: 10){
                        VStack{
                            Text("Player 3")
                                .font(.title3).foregroundColor(Color.white)
                            
                            ZStack{
                                Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer3, lineWidth: 6))
                                
                                Image("player3")
                            }
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("Player 4")
                                .font(.title3).foregroundColor(Color.white)
                            
                            ZStack{
                                Circle().fill(circleBg).opacity(0.45).overlay(Circle().stroke(borderColorPlayer4, lineWidth: 6))
                                
                                Image("player4")
                            }
                        }
                    }
                }.padding(.bottom, 10)
            }
        }
        
//        ZStack{
//            Rectangle().frame(width: 440, height: 220).opacity(0.15).cornerRadius(10)
//
//            Text("\(timeRemaining)").font(.system(size: 100)).fontWeight(.semibold).foregroundColor(Color.white)
//        }.onReceive(timer){
//            time in if timeRemaining > 0 {
//                timeRemaining -= 1
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.landscapeLeft)
    }
}
