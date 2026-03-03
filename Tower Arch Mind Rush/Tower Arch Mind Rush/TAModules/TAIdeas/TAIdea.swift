//
//  TAIdea.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

struct TAIdea: Codable, Hashable, Identifiable {
    let id = UUID()
    var name: String
    var type: ObjectType
    var floorNum: String
    var questions: [Question]
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

enum ObjectType: String, Codable, CaseIterable, Identifiable {
    case residental
    case office
    
    var id: String { rawValue }
    
    var text: String {
        switch self {
        case .residental:
            "Residential Building"
        case .office:
            "Office Building"
        }
    }
}
