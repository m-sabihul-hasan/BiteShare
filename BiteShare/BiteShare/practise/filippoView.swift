//
//  filippoView.swift
//  BiteShare
//
//  Created by Filippo Caliendo on 11/11/24.
//

import SwiftUI

struct filippoView: View {
    
    var imageTitle : String = "Gnocchi"
    var personName : String = "Filippo Caliendo"
    
    var body: some View {
        VStack {
            ZStack {
                Image(imageTitle)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 402, height: 402)
                    .offset(y: -50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(Rectangle().fill(Color.black).opacity(0.2))
                    .overlay(Text("Gnocchi alla sorrentina").font(.title).foregroundColor(.white).bold().offset(x: -40, y: 180))
            }
            Spacer()
            HStack {
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundStyle(.orange)
                    Text(personName)
                        .font(.headline)
                        .foregroundStyle(.orange)
                }
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundStyle(.orange)
                    Text(personName)
                        .font(.headline)
                        .foregroundStyle(.orange)
                }
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundStyle(.orange)
                    Text(personName)
                        .font(.headline)
                        .foregroundStyle(.orange)
                }
            }
        }
    }
}

#Preview {
    filippoView()
}
