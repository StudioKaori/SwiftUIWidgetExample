//
//  ContentView.swift
//  SwiftUIWidgetExample
//
//  Created by Kaori Persson on 2022-10-16.
//

import SwiftUI

struct ContentView: View {
	@State var inputText: String = ""
	@State var displayText: String = ""
	
    var body: some View {
			VStack(alignment: .leading) {
					
					Text("Input Text: \(self.displayText)")
					
					TextField("Type something...", text: $inputText)
					
					Button("Save", action: {
						UserDefaults.standard.setValue(self.inputText, forKey: "text")
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
