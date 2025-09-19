//
//  Task.swift
//  RH-Tasks-app
//
//  Created by Md Refat Hossain on 20/09/2025.
//

import Foundation

// MARK: - Task Model
struct Task: Identifiable {
    let id = UUID()
    var text: String
    var isCompleted: Bool = false
    var createdDate: Date = Date()
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: createdDate)
    }
}


// MARK: - Filter Enum
enum TaskFilter: String, CaseIterable {
    case all = "All"
    case active = "Active"
    case completed = "Completed"
}

// MARK: - String Extension
extension String {
    func trim() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
