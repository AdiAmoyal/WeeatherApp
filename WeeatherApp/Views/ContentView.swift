//
//  ContentView.swift
//  WeeatherApp
//
//  Created by Adi Amoyal on 08/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(hue: 0.077, saturation: 0.297, brightness: 0.783))
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                SearchBarView(searchText: $viewModel.cityName, searchAction: viewModel.searchPressed, locationAction: viewModel.requestLocation)
                
                if let weather = viewModel.weather {
                    WeatherView(weather: weather)
                } else if viewModel.isLoading {
                    LoadingView()
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
