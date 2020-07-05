//
//  ContentView.swift
//  WesplitApp
//
//  Created by khaled on 7/5/20.
//  Copyright © 2020 khaledHamdy. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @State private var checkAmount = ""
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 2
  @State private var selectedStudent = 0
  
  let students = ["Harry", "Hermione", "Ron"]
  var tipPercentages = [10, 20, 30, 40, 0]
  
  var totalPerPerson: Double {
      let peopleCount = Double(numberOfPeople + 2)
      let tipSelection = Double(tipPercentages[tipPercentage])
      let orderAmount = Double(checkAmount) ?? 0

      let tipValue = orderAmount / 100 * tipSelection
      let grandTotal = orderAmount + tipValue
      let amountPerPerson = grandTotal / peopleCount

      return amountPerPerson
  }
  
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad)
          
          Picker("NumberofPeople", selection: $numberOfPeople) {
            ForEach(2 ..< 100) { number in
              Text("\(number) People" )
            }
          }
        }
        
        Section(header: Text("How much tip do you want to leave?")) {
          Picker("Tip Percentage", selection: $tipPercentage) {
            ForEach (0 ..< tipPercentages.count) {
              Text("\(self.tipPercentages[$0])%")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section {
          Text("$ \(totalPerPerson, specifier: "%0.2f")")
        }
      }.navigationBarTitle("Wesplit")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
