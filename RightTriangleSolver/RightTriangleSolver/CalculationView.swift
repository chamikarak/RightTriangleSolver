//
//  CalculationView.swift
//  RightTriangleSolver
//
//  Created by Ranul Akmeemana on 2023-03-17.
//

import SwiftUI

struct CalculationView: View {
    @State private var rightAngleSides: [String] = ["Base", "Altitude", "Hypotenuse" ]
    
    @State private var selectedUnknownEdge: String = "Base"
    @State private var calculatedUnknownValue: String = ""
    @State private var displayMode: Bool = false
    
    
    //Inputs
    @State private var baseInput : String = ""
    @State private var altitudeInput : String = ""
    @State private var hypotenuseInput : String = ""
    
    //Store Values
    //Outputs
    @AppStorage("base") private var base: String = ""
    @AppStorage("altitude") private var altitude : String = ""
    @AppStorage("hypotenuse") private var hypotenuse : String = ""
    @AppStorage("areaVal") private var areaVal: String = ""
    @AppStorage("perimeter") private var perimeter: String = ""
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (spacing: 20) {
                    Image("right_triangle")
                    
                    HStack {
                        Text ("Choose the Unknown length").fontWeight(.bold)
                        
                        Picker("select", selection: $selectedUnknownEdge) {
                            ForEach(rightAngleSides, id:\.self) { item in
                                Text("\(item)")
                            }
                        }
                        .pickerStyle(.wheel)
                        .onChange(of: selectedUnknownEdge) { _ in
                            displayMode = false
                            baseInput = ""
                            altitudeInput = ""
                            hypotenuseInput = ""
                        }
                        
                        
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Enter Known Length Values").fontWeight(.bold)
                        if selectedUnknownEdge != "Base" {
                            TextField("Base", text: $baseInput)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.numberPad)
                        }
                        if selectedUnknownEdge != "Altitude" {
                            TextField("Altitude", text: $altitudeInput)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.numberPad)
                            
                        }
                        if selectedUnknownEdge != "Hypotenuse" {
                            TextField("Hypotenuse", text: $hypotenuseInput)
                                .textFieldStyle(.roundedBorder)
                                .keyboardType(.numberPad)
                            
                        }
                        
                    }
                    .padding()
                    
                    Button {
                        displayMode = true
                        calculateUnknownValue()
                    } label: {
                        Text ("Calculate")
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.green)
                    .cornerRadius(40)
                    //                    .buttonStyle(.borderedProminent)
                    //                    .tint(.green)
                    
                    if displayMode {
                        VStack(spacing: 20) {
                            HStack {
                                Text("\(selectedUnknownEdge):")
                                Spacer()
                                Text("\(calculatedUnknownValue)")
                            }
                            
                            HStack {
                                Text("Area:")
                                Spacer()
                                Text("\(areaVal)")
                            }
                            
                            HStack {
                                Text("Perimter:")
                                Spacer()
                                Text("\(perimeter)")
                            }
                            
                            
                        }
                    }
                    
                    
                    
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Triangle Calculator")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
    func calculateUnknownValue() {
        if selectedUnknownEdge == "Base" {
            guard let a = Double(altitudeInput),let c = Double(hypotenuseInput) else {
                return
            }
//            let a = Double(altitudeInput)!
//            let c = Double(hypotenuseInput)!
            
            let formula1 = (pow(c, 2) - pow(a, 2)).squareRoot()
            
            base = String(format: "%.2f", formula1)
            altitude = altitudeInput
            hypotenuse = hypotenuseInput
            
            calculatedUnknownValue = base
            
            
        } else if selectedUnknownEdge == "Altitude" {
            guard let b = Double(baseInput), let c = Double(hypotenuseInput) else {
                return
            }
//            let b = Double(baseInput)!
//            let c = Double(hypotenuseInput)!
            
            let formula2 = (pow(c,2) - pow(b, 2)).squareRoot()
            
            base = baseInput
            altitude = String(format: "%.2f", formula2)
            hypotenuse = hypotenuseInput
            
            calculatedUnknownValue = altitude
            
        } else {
            guard let a = Double(altitudeInput),  let b = Double(baseInput) else {
                return
            }
//            let a = Double(altitudeInput)!
//            let b = Double(baseInput)!
            
            let formula3 = (pow(a, 2) + pow(b, 2)).squareRoot()
            
            base = baseInput
            altitude = altitudeInput
            hypotenuse = String(format: "%.2f", formula3)
            
            calculatedUnknownValue = hypotenuse
        }
        
        calculateArea(altitudeParam: altitude, baseParam: base)
        
    }
    
    
    func calculateArea(altitudeParam: String, baseParam: String) {
        let a = Double(altitudeParam)!
        let b = Double(baseParam)!
        
        let formula1 = a * b
        let formula2 = formula1 / 2
        
        areaVal = String(format: "%.2f", formula2)
        
        calculatePerimeter(altitudeParam: a, baseParam: b)
    }
    
    func calculatePerimeter(altitudeParam: Double, baseParam: Double) {
        let a =  altitudeParam
        let b = baseParam
        
        let formula1 = (pow(a, 2) + pow(b, 2)).squareRoot()
        let formula2 = a + b + formula1
        
        perimeter = String(format: "%.2f", formula2)
    }
}



struct CalculationView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView()
    }
}
