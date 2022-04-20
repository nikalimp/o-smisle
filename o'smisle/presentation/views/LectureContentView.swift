//
//  LectureContentView.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import SwiftUI
import AVKit

struct LectureContentView: View {
    var body: some View {
    ZStack {
    Color(red: 0.94, green: 0.94, blue: 0.94).ignoresSafeArea()
    VStack {
        Text("Название лекции").font(.largeTitle).fontWeight(.bold).foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25)).padding(.top, 36.0).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        Text("Узнай как зарабатывать и не работать").font(.headline).fontWeight(.regular).foregroundColor((Color(red: 0.20, green: 0.20, blue: 0.20))).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        player().padding(.top, 24.0).frame(height: UIScreen.main.bounds.height / 4)
    HStack {
    Image("avatar").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/).frame(width: 64, height: 64).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(lineWidth:2)).foregroundColor((Color(red: 1, green: 0.68, blue: 0.36)))
    VStack {
        Text("Аркадий").font(.title3).fontWeight(.semibold).foregroundColor((Color(red: 0.20, green: 0.20, blue: 0.20))).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        Text("Контент-мейкер на подхвате").font(.headline).fontWeight(.regular).foregroundColor((Color(red: 0.20, green: 0.20, blue: 0.20))).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
}
    }
    .padding(.top, 24.0)
Divider()
    Card(image: "phone.fill", message: "+7(909)019-97-80")
    Card(image: "envelope.fill", message: "nikitaalimpiev@mail.ru")
    Spacer()
            }
        }
    .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

struct Card: View {
    let image: String
    let message: String
    var body: some View {
    RoundedRectangle(cornerRadius: 8).padding(.horizontal).foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25)).frame(width: 280, height: 40).overlay(HStack {Image(systemName:image).foregroundColor(Color(red: 1, green: 1, blue: 1))
            Text(message).foregroundColor(Color(red: 1, green: 1, blue: 1))
        })
    }
}

struct player: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }


    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {

    let controller = AVPlayerViewController()
    let url = "https://www.w3schools.com/html/mov_bbb.mp4"
    let player1 = AVPlayer(url: URL(string: url)!)
    controller.player = player1
    return controller

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
    }
}
}

