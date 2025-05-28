//
//  FeedView.swift
//  Travlz
//
//  Created by Krishen Sharma on 4/9/24.
//

import SwiftUI

struct FeedView: View {
    let countryList = CountryNames.init().countryList
    @State var refresh: Bool = false
    var body: some View {
        VStack {
            if(!refresh) {
                ScrollView {
                    LazyVStack(spacing:0) {
                        ForEach(0..<countryList.count, id: \.self) { post in
                            FeedCell(post:post)
                        }
                        
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .ignoresSafeArea()
                .refreshable {
                    withAnimation(.easeIn(duration: 0.3)) {
                        refresh = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        withAnimation(.easeIn(duration: 0.3)) {
                            refresh = false
                        }
                    }
                }
            }
        }
    }
}
