//
//  WeatherView.swift
//  WeeatherApp
//
//  Created by Adi Amoyal on 09/03/2023.
//

import SwiftUI

struct WeatherView: View {
    let weather: WeatherModel
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                Text("\(weather.temperatureString)°C")
                    .font(.system(size: 55))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .shadow(radius: 5)
                Text(weather.cityName.uppercased())
                    .font(.title2)
                    .fontWeight(.light)
            }
            .foregroundColor(Color(red: 0.1568627450980392, green: 0.12156862745098039, blue: 0.18823529411764706))

            HStack(spacing: 20) {
                Text(weather.description.uppercased())
                    .font(.title2)
                    .fontWeight(.semibold)
                Image(systemName: weather.conditionName)
            }
            .padding()
            .foregroundColor(Color(red: 0.1568627450980392, green: 0.12156862745098039, blue: 0.18823529411764706))
            
        }
        .frame(width: 325)
        .padding()
        .background(
            Rectangle()
                .fill(.white)
                .opacity(0.3)
                .cornerRadius(15)
        )
        
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
