//
//  LoginView.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 20.04.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    private let keyboardIsOnPublisher = Publishers.Merge( NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
    .map { _ in true }, NotificationCenter.default.publisher(for:
    UIResponder.keyboardWillHideNotification) .map { _ in false }
    )
    .removeDuplicates()
    
    @State private var login = ""
    @State private var password = ""
    @State private var showIncorrentCredentialsWarning: Bool = false
    @Binding var isUserLoggedIn: Bool
//    @State private var shouldShowLogo: Bool = true
    
 
    private func verifyLoginData() {
    if login == "Admin" && password == "123456" {
        isUserLoggedIn = true
    } else {
    showIncorrentCredentialsWarning = true
    }
    password = ""
    }
    
//    init(isUserLoggedIn: Binding<Bool>) {
//        self.isUserLoggedIn = isUserLoggedIn
//    }
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            ZStack {
//            GeometryReader { _ in Image("sunny_weather")
//            .resizable() .edgesIgnoringSafeArea(.all)
//            }
            Color(red: 0.94, green: 0.94, blue: 0.94).ignoresSafeArea()
            VStack{
                Image("logo").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width: 64, height: 64).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text("О'Смысле").font(.title)
                HStack{
//                    Text("Email")
//                    Spacer()
                    TextField("Login", text: $login) .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack{
//                    Text("Password")
//                    Spacer()
                    SecureField("Password", text: $password) .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                Button(action: verifyLoginData) {
                    Text("Log in") }.frame(width: 124, height: 36).foregroundColor(.white).background(Color(red: 1.00, green: 0.68, blue: 0.36))
                .disabled(login.isEmpty || password.isEmpty)
                }.frame(maxWidth: 264).padding(.top, 36)
            }.onTapGesture { UIApplication.shared.endEditing()
            }.alert(isPresented: $showIncorrentCredentialsWarning, content: { Alert(title: Text("Error"), message: Text("Incorrent Login/Password was entered"))
            })
//            HStack {
//                Image("001")
//                    .resizable()
//                    .frame(width: 60, height: 60)
//                    .cornerRadius(30)
//                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
//                VStack(alignment: .leading) {
//                    HStack {
//                        Text ("Самый темный час – перед рассветом")
//                            .font(.system(size: 16, weight: .bold))
//                        }
//                    Spacer().frame(height:6)
//                    HStack {
//                            Text("Пауло Коэльо").font(.system(size:14))
//                        }
//                    }
//        }.padding(6)
        }
        .onReceive(keyboardIsOnPublisher) { isKeyboardOn in withAnimation(Animation.easeInOut(duration: 0.5)) {
//        self.shouldShowLogo = !isKeyboardOn
            }
        }
    }
}
extension UIApplication { func endEditing() {
sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
} }
