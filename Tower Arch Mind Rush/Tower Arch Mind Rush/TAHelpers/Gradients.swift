//
//  Gradients.swift
//  Tower Arch Mind Rush
//
//


import SwiftUI

enum Gradients {
    case clear
    case orange
    case blue
    case bg
    case imgPlaceholder
    
    var color: Gradient {
        switch self {
        case .clear:
            Gradient(colors: [.clear])
        case .orange:
            Gradient(colors: [.orangeTop, .orangeBottom])
        case .blue:
            Gradient(colors: [.blueTop, .blueBottom])
        case .bg:
            Gradient(colors: [.bgTop, .bgBottom])
        case .imgPlaceholder:
            Gradient(colors: [.imgPlaceholderTop, .imgPlaceholderBottom])
        }
    }
    
}
