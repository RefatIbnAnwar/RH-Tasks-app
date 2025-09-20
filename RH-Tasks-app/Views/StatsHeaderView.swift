//
//  StatsHeaderView.swift
//  RH-Tasks-app
//
//  Created by Md Refat Hossain on 20/09/2025.
//

import SwiftUI

// MARK: - Stats Header View
struct StatsHeaderView: View {
    let total: Int
    let active: Int
    let completed: Int
    
    var body: some View {
        HStack(spacing: 40) {
            StatItemView(value: total, label: "Total")
            StatItemView(value: active, label: "Active", color: .blue)
            StatItemView(value: completed, label: "Completed", color: .green)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.green.opacity(0.8), Color.blue.opacity(0.8)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}
