//
//  ContentView.swift
//  Lotus
//
//  Created by Fredrik Gordh Riseby on 4/28/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = hotelViewModel()
    
    var body: some View {
            NavigationView {
                List(viewModel.hotels) { hotel in
                    Text(hotel.name)  // Assuming 'title' is a property of `hotel`
                    Text("test")
                }
                .navigationTitle("Hotels")
                .onAppear {
                    viewModel.loadHotels()
                }
            }
        }
}

#Preview {
    ContentView()
}
