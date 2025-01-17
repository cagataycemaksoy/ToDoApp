//
//  ContentView.swift
//  ToDoApp
//
//  Created by Cem Aksoy on 17.01.2025.
//

import SwiftUI

struct ContentView: View {
  private let color = Color(red: 0.7, green: 0.8, blue: 0.9)
  private let date = Date.now.formatted(date: .abbreviated, time: .omitted)
  
 
  
    var body: some View {
      NavigationView {
        ZStack {
          LinearGradient(colors: [.white, .gray.opacity(0.3)], startPoint: .topLeading, endPoint: .bottom)
            .ignoresSafeArea()
          VStack(alignment: .leading) {
            Text("\(date)")
              .font(.subheadline)
              .padding(.horizontal)
              
            ScrollView{
              
            }
            
            HStack {
              Spacer()
              Button {
                
              } label: {
                Circle()
                  .fill(color)
                  .frame(maxWidth: 50)
                  .overlay {
                    Image(systemName: "plus")
                      
                      .foregroundStyle(.black)
                  }
              }
            }
            .padding(.horizontal)
          }
        }
        .navigationTitle("To Do's")
        .toolbar{
          ToolbarItemGroup(placement: .topBarLeading) {
            Button{
              
            } label: {
              Text("< Previous Day")
                .foregroundStyle(.black)
                .frame(height: 40)
                .padding(.horizontal)
                .background(
                  RoundedRectangle(cornerRadius: 15)
                    .fill(.gray.opacity(0.3))
                )
            }
            
            
            
          }
          
          ToolbarItemGroup(placement: .topBarTrailing) {
            Button{
              
            } label: {
              Text("Next Day >")
                .foregroundStyle(.black)
                .frame(height: 40)
                .padding(.horizontal)
                .background(
                  RoundedRectangle(cornerRadius: 15)
                    .fill(.gray.opacity(0.3))
                )
            }
          }
        }
      }
    }
}

#Preview {
    ContentView()
}
