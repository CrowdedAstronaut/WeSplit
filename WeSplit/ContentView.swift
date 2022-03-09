//
//  ContentView.swift
//  WeSplit
//
//  Created by Ross Phillips on 3/7/22.
//

import SwiftUI

struct ContentView: View {
	@FocusState private var amountIsFocused: Bool
	@State private var checkAmount = 0.0
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 20
	let tipPercentages = [10, 15, 20, 25, 0]
	
	var grandTotal: Double {
		let tipSelection = Double(tipPercentage)
		let tipValue = checkAmount / 100 * tipSelection
		return checkAmount + tipValue
	}
	
	var totalPerPerson: Double {
		grandTotal / Double(numberOfPeople + 2)
	}
	
	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
						.keyboardType(.numberPad)
						.focused($amountIsFocused)
					
					Picker("Number of people", selection: $numberOfPeople) {
						ForEach(2 ..< 100) {
							Text("\($0) people")
						}
					}
				}
				
				Section {
					Picker("Tip percentage", selection: $tipPercentage) {
						ForEach(tipPercentages, id: \.self){
							Text($0, format: .percent)
						}
					}
					.pickerStyle(.segmented)
				} header: {
					Text("How much tip do you want to leave?")
				}
				
				Section {
					Text(grandTotal, format: .currency(code: Locale.current.currencyCode ?? "USD"))
				} header: {
					Text("Total amount")
				}
				
				Section {
					Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
				} header: {
					Text("Amount per person")
				}
				.navigationTitle("WeSplit")
				.toolbar {
					ToolbarItemGroup(placement: .keyboard) {
						Button("Done") {
							amountIsFocused = false
						}
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
}

