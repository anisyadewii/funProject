//
//  choosingTheme.swift
//  WooHoo
//
//  Created by Falah Hasbi Assidiqi on 20/03/23.
//

import SwiftUI

struct homeView: View{
    
    //@State private var isPortrait = false
    
    var body: some View{
        NavigationStack {
            ZStack{
                backgroundApp.ignoresSafeArea()
                //backgroundLogin.ignoresSafeArea(.all).onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in guard let scene = UIApplication.shared.windows.first? .windowScene else {return}
                //self.isPortrait = scene.interfaceOrientation.isPortrait}
                VStack{
                    Text("Theme")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    HStack {
                        NavigationLink{
                            EmptyView()
                        } label:{
                            ZStack{
                                Group{
                                    Text("First\nImpression")
                                        .font(.title)
                                        .frame(width: 265, height: 115, alignment: .bottomLeading)
                                        .foregroundColor(.white)
                                        .bold()
                                }.frame(width: 280, height: 130).background(boxTheme)
                                    .cornerRadius(15)
                                Image("first_impression")
                                    .resizable()
                                    .frame(width: 125, height: 125, alignment: .topTrailing)
                                    .padding(EdgeInsets(top: 0, leading: 150, bottom: 50, trailing: 0))
                            }
                        }
                        NavigationLink{
                            EmptyView()
                        } label: {
                            ZStack {
                                Group {
                                    Text("Fun Facts")
                                        .font(.title)
                                        .frame(width: 265, height: 115, alignment: .bottomLeading)
                                        .foregroundColor(Color.white)
                                        .bold()
                                }.frame(width: 280, height: 130).background(boxTheme)
                                    .cornerRadius(15)
                                Image("funfact")
                                    .resizable()
                                    .frame(width: 125, height: 125, alignment: .topTrailing)
                                    .padding(EdgeInsets(top: 0, leading: 150, bottom: 50, trailing: 0))
                            }
                        }
                    }
                }
            }
        }
    }
}



struct themeView_previews: PreviewProvider {
    static var previews: some View {
        homeView().previewInterfaceOrientation(.landscapeLeft)
    }
}
