//
//  SearchBarView.swift
//  WeeatherApp
//
//  Created by Adi Amoyal on 09/03/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var searchAction: () -> Void
    var locationAction: () -> Void
    
    var body: some View {
        HStack {
            HStack {
                TextField("Enter city name", text: $searchText)
            
                Button(action: searchAction) {
                    Image(systemName: "magnifyingglass")
                }
            }
            .foregroundColor(Color(red: 0.5686274509803921, green: 0.43137254901960786, blue: 0.3803921568627451))
            .font(.headline)
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 0.9490196078431372, green: 0.9294117647058824, blue: 0.7803921568627451))
                    .shadow(color: Color(red: 0.5686274509803921, green: 0.43137254901960786, blue: 0.3803921568627451) ,radius: 5, x: 0, y: 0)
            )
            
            Spacer()
            
            Button(action: locationAction) {
                Image(systemName: "location")
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .foregroundColor(Color(red: 0.5686274509803921, green: 0.43137254901960786, blue: 0.3803921568627451))
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color(red: 0.9490196078431372, green: 0.9294117647058824, blue: 0.7803921568627451))
                    .shadow(color: Color(red: 0.5686274509803921, green: 0.43137254901960786, blue: 0.3803921568627451) ,radius: 5, x: 0, y: 0)
            )
        }
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
