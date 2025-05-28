//
//  FeedCell.swift
//  Travlz
//
//  Created by Krishen Sharma on 4/9/24.
//

import SwiftUI
import AudioToolbox

struct FeedCell: View {
    @ObservedObject var pixabayHelper = PixabayHelper()
    @State var imageLoaded: Bool = false
    @State var heartVisible: Bool = false
    @State var heartScale: Double = 1.0
    @State var heartPos: CGPoint = CGPoint()
    let countryList = CountryNames.init().countryList.shuffled()
    let post: Int
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .containerRelativeFrame([.horizontal,.vertical])
                .overlay {
                    AsyncImage(url: URL(string: pixabayHelper.imageData.first!.largeImageURL)){ result in
                        result
                            .resizable()
                            .scaledToFill()
                            .opacity(imageLoaded ? 1 : 0)
                            .animation(.easeInOut(duration: 0.5), value: imageLoaded)
                            .onAppear {
                                imageLoaded = true
                            }
                            .onDisappear {
                                imageLoaded = false
                            }
                    } placeholder: {
                        ProgressView().progressViewStyle(.circular)
                    }
                }
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    VStack {
                        Text("\(countryList[post])")
                            .fontWeight(.semibold)
                        
                        Text("Wouldn't you love to see this?")
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .background(.black)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 100)
                }
            }
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 50*heartScale, height: 50*heartScale)
                .position(x: heartPos.x, y: heartPos.y)
                .opacity(heartVisible ? 1 : 0)
                .foregroundStyle(.red)
        }
        .task {
            await self.pixabayHelper.loadImages(searchFor: countryList[post])
        }
        .ignoresSafeArea()
        .onTapGesture(count: 2, coordinateSpace: .global) { location in
            var saved: [String] = UserDefaults.standard.value(forKey: "Saved") as? [String] ?? []
            if !saved.contains(countryList[post]) {
                saved.append(countryList[post])
                UserDefaults.standard.setValue(saved, forKey: "Saved")
            }
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            heartPos = location
            heartVisible = true
            withAnimation(.easeInOut(duration: 0.1)) {
                heartScale = 2.0
            }
            withAnimation(.easeIn(duration: 0.7).delay(0.1)) {
                heartVisible = false
                heartPos.y = -50
            }
            heartScale = 1.0
        }
    }
}


