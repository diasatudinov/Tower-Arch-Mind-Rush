//
//  WWAnime.swift
//  Tower Arch Mind Rush
//
//  Created by Dias Atudinov on 28.02.2026.
//


struct WWAnime: Codable, Hashable, Identifiable {
    let id = UUID()
    var title: String
    var year: String
    var seasons: Int
    var totalEpisodes: Int
    var episodeDuration: Int
    var status: ObjectStatus
    var currentEpisode: Int
    var rating: Int
    var note: String
    
    var totalTime: Int {
        return totalEpisodes * episodeDuration
    }
    
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