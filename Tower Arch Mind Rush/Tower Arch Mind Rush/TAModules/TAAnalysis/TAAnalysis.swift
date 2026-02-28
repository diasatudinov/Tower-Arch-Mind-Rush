//
//  TAAnalysis.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

struct TAAnalysis: Codable, Hashable, Identifiable {
    let id = UUID()
    var name: String
    var questions: [Question]
    var rate: Int
    var description: String
    
    var imageData: Data?
    
    var image: UIImage? {
        get {
            guard let imageData else { return nil }
            return UIImage(data: imageData)
        }
        set {
            imageData = newValue?.jpegData(compressionQuality: 0.8)
        }
    }
    
}

struct Question: Codable, Hashable, Identifiable {
    let id = UUID()
    var question: String
    var answer: String
}
