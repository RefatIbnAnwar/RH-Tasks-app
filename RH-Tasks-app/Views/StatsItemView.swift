//
//  StatsItemView.swift
//  RH-Tasks-app
//
//  Created by Md Refat Hossain on 20/09/2025.
//

import SwiftUI


// MARK: - Stat Item View
struct StatItemView: View {
    let value: Int
    let label: String
    var color: Color = .white
    
    var body: some View {
        VStack(spacing: 4) {
            Text("\(value)")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
            Text(label)
                .font(.caption)
                .foregroundColor(.white.opacity(0.9))
        }
    }
}
