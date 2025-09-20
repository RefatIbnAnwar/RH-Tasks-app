//
//  FilterBarView.swift
//  RH-Tasks-app
//
//  Created by Md Refat Hossain on 20/09/2025.
//

import SwiftUI

// MARK: - Filter Bar View
struct FilterBarView: View {
    @Binding var selectedFilter: TaskFilter
    let onClearAll: () -> Void
    
    var body: some View {
        HStack {
            ForEach(TaskFilter.allCases, id: \.self) { filter in
                Button(action: {
                    withAnimation {
                        selectedFilter = filter
                    }
                }) {
                    Text(filter.rawValue)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        .foregroundColor(selectedFilter == filter ? .white : .primary)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            selectedFilter == filter ?
                            AnyView(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.green, Color.blue]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            ) :
                            AnyView(Color(.systemGray5))
                        )
                        .cornerRadius(8)
                }
            }
            
            Spacer()
            
            Button(action: onClearAll) {
                Text("Clear All")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.red)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.systemBackground))
    }
}
