//
//  SavedView.swift
//  Travlz
//
//  Created by Krishen Sharma on 5/17/24.
//

import SwiftUI

struct SavedView: View {
    @State var saved: [String] = (UserDefaults.standard.value(forKey: "Saved") as? [String] ?? [""])
    var body: some View {
        List {
            ForEach(saved, id: \.self) { country in
                Text(country)
            }
            .onDelete { (indexOpt) in
                if let index = indexOpt.first {
                    self.saved.remove(at: index)
                }
                UserDefaults.standard.setValue(saved, forKey: "Saved")
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .navigationTitle("Saved Countries")
        .onAppear {
            saved = UserDefaults.standard.value(forKey: "Saved") as? [String] ?? ["No Countries Saved"]
        }
    }
}

#Preview {
    SavedView()
}
