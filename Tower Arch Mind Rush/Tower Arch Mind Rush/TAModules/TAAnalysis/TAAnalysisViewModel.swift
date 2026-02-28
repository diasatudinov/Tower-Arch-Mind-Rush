//
//  TAAnalysisViewModel.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

class TAAnalysisViewModel: ObservableObject {
    // MARK: – Anime
    @Published var analysis: [TAAnalysis] = [
        TAAnalysis(
            name: "Guggenheim",
            questions: [
                Question(question: "", answer: "")
            ],
            rate: 9,
            description: ""),
        TAAnalysis(
            name: "Guggenheim",
            questions: [
                Question(question: "", answer: "")
            ],
            rate: 9,
            description: ""),
        TAAnalysis(
            name: "Guggenheim",
            questions: [
                Question(question: "", answer: "")
            ],
            rate: 9,
            description: ""),
        TAAnalysis(
            name: "Guggenheim",
            questions: [
                Question(question: "", answer: "")
            ],
            rate: 9,
            description: ""),
        TAAnalysis(
            name: "Guggenheim",
            questions: [
                Question(question: "", answer: "")
            ],
            rate: 9,
            description: ""),
        TAAnalysis(
            name: "Guggenheim",
            questions: [
                Question(question: "", answer: "")
            ],
            rate: 9,
            description: ""),
        TAAnalysis(
            name: "Guggenheim",
            questions: [
                Question(question: "", answer: "")
            ],
            rate: 9,
            description: ""),
        TAAnalysis(
            name: "Guggenheim",
            questions: [
                Question(question: "", answer: "")
            ],
            rate: 9,
            description: "")
    ] {
        didSet {
           // saveAnalysis()
        }
    }
    
    @Published var ideas: [TAIdea] = [
        
    ] {
        didSet {
            saveIdeas()
        }
    }
    
    // MARK: – UserDefaults keys
    private var ideasFileURL: URL {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return dir.appendingPathComponent("ideas.json")
    }
    
    private var analysisFileURL: URL {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return dir.appendingPathComponent("analysis.json")
    }
    
    // MARK: – Init
    init() {
       // loadAnalysis()
        loadIdeas()
    }
    
    // MARK: – Save / Load Backgrounds
    
    private func saveAnalysis() {
        let url = analysisFileURL
        do {
            let data = try JSONEncoder().encode(analysis)
            try data.write(to: url, options: [.atomic])
        } catch {
            print("Failed to save myDives:", error)
        }
    }
    
    private func loadAnalysis() {
        let url = analysisFileURL
        guard FileManager.default.fileExists(atPath: url.path) else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let animesData = try JSONDecoder().decode([TAAnalysis].self, from: data)
            analysis = animesData
        } catch {
            print("Failed to load myDives:", error)
        }
    }
    
    // MARK: – Example buy action
    func add(analys: TAAnalysis) {
        guard !analysis.contains(analys) else { return }
        analysis.append(analys)
    }
    
    func delete(analys: TAAnalysis) {
        guard let index = analysis.firstIndex(of: analys) else { return }
        analysis.remove(at: index)
    }
    
    // MARK: – Save / Load Ideas
    
    private func saveIdeas() {
        let url = ideasFileURL
        do {
            let data = try JSONEncoder().encode(ideas)
            try data.write(to: url, options: [.atomic])
        } catch {
            print("Failed to save myDives:", error)
        }
    }
    
    private func loadIdeas() {
        let url = ideasFileURL
        guard FileManager.default.fileExists(atPath: url.path) else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let animesData = try JSONDecoder().decode([TAIdea].self, from: data)
            ideas = animesData
        } catch {
            print("Failed to load myDives:", error)
        }
    }
    
    func add(idea: TAIdea) {
        guard !ideas.contains(idea) else { return }
        ideas.append(idea)
    }
    
    func delete(idea: TAIdea) {
        guard let index = ideas.firstIndex(of: idea) else { return }
        ideas.remove(at: index)
    }
}

