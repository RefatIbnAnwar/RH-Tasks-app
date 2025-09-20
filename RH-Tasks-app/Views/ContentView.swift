//
//  ContentView.swift
//  RH-Tasks-app
//
//  Created by Md Refat Hossain on 19/09/2025.
//

import SwiftUI

// MARK: - Main Content View
struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var newTaskText = ""
    @State private var selectedFilter: TaskFilter = .all
    @State private var showingClearAlert = false
    
    var filteredTasks: [Task] {
        switch selectedFilter {
        case .all:
            return tasks
        case .active:
            return tasks.filter { !$0.isCompleted }
        case .completed:
            return tasks.filter { $0.isCompleted }
        }
    }
    
    var totalTasks: Int { tasks.count }
    var activeTasks: Int { tasks.filter { !$0.isCompleted }.count }
    var completedTasks: Int { tasks.filter { $0.isCompleted }.count }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Stats Header
                StatsHeaderView(
                    total: totalTasks,
                    active: activeTasks,
                    completed: completedTasks
                )
                
                // Input Section
                HStack {
                    TextField("What needs to be done today?", text: $newTaskText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onSubmit {
                            addTask()
                        }
                    
                    Button(action: addTask) {
                        Text("Add")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.green, Color.blue]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(8)
                    }
                    .disabled(newTaskText.trim().isEmpty)
                }
                .padding()
                .background(Color(.systemGray6))
                
                // Filter Section
                FilterBarView(selectedFilter: $selectedFilter, onClearAll: {
                    showingClearAlert = true
                })
                
                // Tasks List
                if filteredTasks.isEmpty {
                    EmptyStateView(filter: selectedFilter)
                } else {
                    List {
                        ForEach(filteredTasks) { task in
                            TaskRowView(
                                task: task,
                                onToggle: { toggleTask(task.id) },
                                onDelete: { deleteTask(task.id) }
                            )
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("My Tasks")
            .navigationBarTitleDisplayMode(.large)
        }
        .alert("Clear All Tasks", isPresented: $showingClearAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Clear All", role: .destructive) {
                withAnimation {
                    tasks.removeAll()
                }
            }
        } message: {
            Text("Are you sure you want to clear all tasks? This cannot be undone.")
        }
    }
    
    // MARK: - Functions
    private func addTask() {
        let trimmedText = newTaskText.trim()
        guard !trimmedText.isEmpty else { return }
        
        withAnimation(.spring()) {
            tasks.append(Task(text: trimmedText))
            newTaskText = ""
        }
    }
    
    private func toggleTask(_ id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            withAnimation {
                tasks[index].isCompleted.toggle()
            }
        }
    }
    
    private func deleteTask(_ id: UUID) {
        withAnimation {
            tasks.removeAll { $0.id == id }
        }
    }
}

#Preview {
    ContentView()
}
