//
//  ContentView.swift
//  TabBar&ChartsSwiftUi
//
//  Created by Devesh Pandey on 26/04/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm : HomeViewModel = HomeViewModel()
    
    var body: some View {
        TabView {
            Links().tabItem {
                ZStack(){
                    VStack(){
                        Image(systemName: "link")
                        Text("Links")
                    }
                }
                
            }.onAppear(perform: {
                debugPrint("Inside the on Appear function of Links")
                vm.getData()
            })
            Courses().tabItem {
                VStack(content: {
                    Image(systemName: "books.vertical.fill")
                    Text("Courses")
                })
            }
            Add().tabItem {  
                VStack(content: {
                    Image(systemName: "plus.circle.fill").frame(width: 40,height: 40)
                Text("Add")
            }) }
            Compaign().tabItem {
                VStack(content: {
                Image(systemName: "speaker.wave.3.fill")
                Text("Compaign")
            }) }
            Profile().tabItem {
                VStack(content: {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }) }
        }.onAppear{ vm.getData()}
    }
}

#Preview {
   HomeView()
}
