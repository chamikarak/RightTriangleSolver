//
//  HistoryView.swift
//  RightTriangleSolver
//
//  Created by Ranul Akmeemana on 2023-03-17.
//

import SwiftUI

struct HistoryView: View {
    @AppStorage("base") private var base: String = ""
    @AppStorage("altitude") private var altitude : String = ""
    @AppStorage("hypotenuse") private var hypotenuse : String = ""
    @AppStorage("areaVal") private var areaVal: String = ""
    @AppStorage("perimeter") private var perimeter: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Altitude")
                    Spacer()
                    Text("\(altitude)")
                }
                HStack {
                    Text("Base")
                    Spacer()
                    Text("\(base)")
                }
                HStack {
                    Text("Hyptonuse")
                    Spacer()
                    Text("\(hypotenuse)")
                }
                HStack {
                    Text("Area")
                    Spacer()
                    Text("\(areaVal)")
                }
                HStack {
                    Text("Perimeter")
                    Spacer()
                    Text("\(perimeter)")
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Last Calculation")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
