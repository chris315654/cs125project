//
//  ContentView.swift
//  cs125project
//
//  Created by Alvin Chen on 2/6/23.
//
// TODO: planner page
// TODO: switcher between summary and planner pages

import SwiftUI

struct ContentView: View {
    @State private var isShowingPopover = false
    @State private var date = Date()
    
    var body: some View {
        NavigationView{
            VStack {
                Text("You slept ____ hours last night")
                Text("This week on average you slept 5 hours")
                
                Text("This month on average you slept 6 hours")
                
                Text("Since you started tracking sleep, you slept an average of 6 hours")
                
                Text("You should sleep at 1:00 AM if you want to make it to ____ tomorrow.")
                    .padding()
                HStack {
                    Button("Sleep"){
                        print("tapped")
                    }
                    Button("Calendar"){
                        print("tapped")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { // <2>
                ToolbarItem(placement: .principal) { // <3>
                    HStack{
                        Text("Zzzot").font(.system(size: 45, weight: .bold, design: .default))
                            .padding(.horizontal,50)
                        Button(action:{self.isShowingPopover = true}){
                            Image(systemName: "calendar")
                            .font(Font.system(.largeTitle))
                        }
                        .popover(isPresented: $isShowingPopover) {
                            DatePicker(
                                    "Pick a date to view:",
                            selection: $date,
                                    displayedComponents: [.date]
                                )
                                        .padding()
                                }
                    }
                        
                    
                }
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
