//
//  ContentView.swift
//  WooHoo
//
//  Created by Falah Hasbi Assidiqi on 19/03/23.
//

import SwiftUI

extension Color {
    init ( _ hex:UInt, alpha: Double = 1){
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double((hex) & 0xFF) / 255,
            opacity: alpha
        )
    }
}

extension View {
    func placeholder<Content: View> (
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View{
            
            ZStack(alignment: alignment){
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

//let backgroundLogin = Color(red: 91/255, green: 30/255, blue: 156/255)
let backgroundApp = Color(0x5B1E9C)
let boxTheme = Color(red: 0/255, green: 0/255, blue: 0/255).opacity(0.15)
// let backgroundLogin = LinearGradient(colors: [Color, Color.purple], startPoint: .top, endPoint: .bottom)

struct LoginView: View {
    
    @State private var userName: String = ""
    @State private var isLoginValid: Bool = false
    @State private var shouldShowLoginAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundApp.ignoresSafeArea(.all)
                VStack {
                    Text("Who I Am?")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                    Spacer()
                    Image("Logo_2")
                        .resizable()
                        .frame(width: 275, height: 275)
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Spacer()
                    VStack {
                        HStack {
                            Text("Let's have fun!")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                //.border(.orange)
                            Spacer()
                        }
                        HStack {
                            Text("Play with your best friends to experience it to the fullset.")
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                                .foregroundColor(Color.white)
                                //.border(.orange)
                            Spacer()
                        }
                    }
                        TextField(
                            "", text: $userName
                        )
                        .placeholder(when: userName.isEmpty){
                            Text("Username").font(.title2)
                        .foregroundColor(Color(.white).opacity(0.6))
                        }
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                        .font(.title)
                        .frame(width: 361, height: 50, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color(0x4D1A85))
                        .disableAutocorrection(true)
                        .border(.opacity(.signalingNaN))
                        .cornerRadius(8.0)
                        //.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        //.border(.orange)
                        NavigationLink(destination: themeView(), label: { // cek biar ga ada alert-nya
                            Text("Start")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: 45)
                                .background(.orange)
                                .cornerRadius(8)
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .padding(.vertical, 5)
                            }
                        ).onTapGesture {
                            let isLoginValid = self.userName == "" //cari biar minimal ada nulis
                            if isLoginValid{
                                self.isLoginValid = true
                            }else{
                                self.shouldShowLoginAlert = true
                            }
                        }
                        .navigationBarHidden(true)
                        .padding(.init(top: 0, leading: 15, bottom: 20, trailing: 15))
                }
            }
//            .navigationBarTitle("Login Screen")
//            .alert(isPresented: $shouldShowLoginAlert){
//                Alert(title: Text("Silahkan isi username Kamu!"))
//            }
        }
    }
}
        
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
