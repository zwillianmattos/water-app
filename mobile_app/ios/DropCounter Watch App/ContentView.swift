//
//  ContentView.swift
//  DropCounter Watch App
//
//  Created by Willian Mattos on 04/05/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: WatchViewModel = WatchViewModel()
    let currentDate = Date()
    
    func formatDate(date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EE, d MMM yyyy"
           return dateFormatter.string(from: date)
       }
      var body: some View {
          VStack {
              Text("\(viewModel.counter) BPM")
                  .padding().font(.title)
              Text("\(formatDate(date: currentDate))")
          }


      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

