//
//  QuoteView.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 24.04.2022.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
        HStack {
            Image("001")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(30)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
            VStack(alignment: .leading) {
                HStack {
                    Text ("Самый темный час – перед рассветом")
                        .font(.system(size: 16, weight: .bold))
                    }
                Spacer().frame(height:6)
                HStack {
                        Text("Пауло Коэльо").font(.system(size:14))
                    }
                }
    }.padding(6)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
