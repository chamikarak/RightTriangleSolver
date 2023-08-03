//
//  ContentView.swift
//  RightTriangleSolver
//
//  Created by Ranul Akmeemana on 2023-03-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            CalculationView()
                .tabItem {
                    VStack {
                        Image(systemName: "sum")
                        Text("Calculations")
                        
                    }
                }
            HistoryView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("History")
                        
                    }
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
