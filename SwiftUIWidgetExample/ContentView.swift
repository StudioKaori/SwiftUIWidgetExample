//
//  ContentView.swift
//  SwiftUIWidgetExample
//
//  Created by Kaori Persson on 2022-10-16.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
	@State var inputText: String = ""
	@State var displayText: String = ""
	
	var body: some View {
		VStack(alignment: .leading) {
			
			Text("Input Text: \(self.displayText)")
			
			Divider()
			
			TextField("Type something...", text: $inputText)
			
			Button("Save", action: {
				let userDefaults = UserDefaults(suiteName: "group.textWidgetCache")
				if let userDefaults = userDefaults {
					userDefaults.synchronize()
					userDefaults.setValue(inputText, forKey: "text")
				}
				// reload the widget immediately
				WidgetCenter.shared.reloadAllTimelines()
				
				self.displayText = self.inputText
				self.inputText = ""
			})
			
		}
		.padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
