//
//  MainTabView.swift
//  Travlz
//
//  Created by Krishen Sharma on 4/9/24.
//

import SwiftUI

struct MainTabView: View {
    @AppStorage("FirstStart") var infoAlert: Bool = true
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    }
                }
                .tag(0)
            
            My_Plans()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 1 ? "person.fill" : "person")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                    }
                }
                .tag(1)
        }
        .tint(.gray)
        .alert(isPresented: $infoAlert, content: {
            Alert(title: Text("How to use"),
                message: Text("Swipe down to see a new country, double tap to save it to favorites!"),
                dismissButton: Alert.Button.default(
                    Text("Got It!"), action: {
                        infoAlert = false
                    })
                )
        })
        .blur(radius: infoAlert ? 10 : 0)
        .gesture(
            DragGesture(minimumDistance: 50)
                .onEnded { value in
                    if value.translation.width >= 50
                    {
                        if(selectedTab > 0) {
                            selectedTab -= 1
                        }
                    }
                    if value.translation.width <= -50 {
                        if(selectedTab < 1) {
                            selectedTab += 1
                        }
                    }
                }
            )
    }
}

struct CountryNames {
    public let countryList = ["Afghanistan","Albania","Algeria","Andorra","Angola","Antigua and Barbuda","Argentina","Armenia","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia and Herzegovina","Botswana","Brazil","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Chad","Chile","China","Colombia","Congo","Costa Rica","Cote D Ivoire","Croatia","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Fiji","Finland","France","Gabon","Gambia","Georgia","Germany","Ghana","Greece","Greenland","Guam","Guatemala","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Morocco","Mozambique","Namibia","Nepal","Netherlands","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Romania","Russia","Rwanda","Samoa","San Marino","Saudi Arabia","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts and Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor Leste","Togo","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Yemen","Zambia","Zimbabwe"]
}
