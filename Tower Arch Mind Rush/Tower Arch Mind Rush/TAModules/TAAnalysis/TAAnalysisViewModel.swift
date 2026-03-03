//
//  TAAnalysisViewModel.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

class TAAnalysisViewModel: ObservableObject {
    // MARK: – Anime
    @Published var analysis: [TAAnalysis] = [] {
        didSet {
            saveAnalysis()
        }
    }
    
    @Published var ideas: [TAIdea] = [] {
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
        return dir.appendingPathComponent("analysisTest.json")
    }
    
    // MARK: – Init
    init() {
        loadAnalysis()
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
    
    func edit(analys: TAAnalysis, newAnalys: TAAnalysis) {
        guard let index = analysis.firstIndex(of: analys) else { return }
        analysis[index].image = newAnalys.image
        analysis[index].name = newAnalys.name
        analysis[index].questions = newAnalys.questions
        analysis[index].rate = newAnalys.rate
        analysis[index].description = newAnalys.description
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
    
    func edit(idea: TAIdea, newIdea: TAIdea) {
        guard let index = ideas.firstIndex(of: idea) else { return }
        ideas[index].image = newIdea.image
        ideas[index].name = newIdea.name
        ideas[index].type = newIdea.type
        ideas[index].floorNum = newIdea.floorNum
        ideas[index].questions = newIdea.questions
        ideas[index].description = newIdea.description
    }
}

