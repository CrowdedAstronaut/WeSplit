//
//  ContentView.swift
//  WeSplit
//
//  Created by Ross Phillips on 3/7/22.
//

import SwiftUI

struct ContentView: View {
	let students = ["Harry", "Hermione", "Ron"]
	@State private var selectedStudent = "Harry"

	var body: some View {
		NavigationView {
			Form {
				Picker("Select your student", selection: $selectedStudent) {
					ForEach(students, id: \.self) {
						Text($0)
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
