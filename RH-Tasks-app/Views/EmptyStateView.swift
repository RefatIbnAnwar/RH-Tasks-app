//
//  EmptyStateView.swift
//  RH-Tasks-app
//
//  Created by Md Refat Hossain on 20/09/2025.
//

import SwiftUI

// MARK: - Empty State View
struct EmptyStateView: View {
    let filter: TaskFilter
    
    var message: String {
        switch filter {
        case .all:
            return "Add your first task to get started"
        case .active:
            return "No active tasks to show"
        case .completed:
            return "No completed tasks yet"
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image(systemName: "checklist")
                .font(.system(size: 60))
                .foregroundColor(.gray.opacity(0.3))
            
            VStack(spacing: 8) {
                Text("No \(filter == .all ? "" : filter.rawValue.lowercased()) tasks")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                Text(message)
                    .font(.body)
                    .foregroundColor(.gray.opacity(0.8))
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}
