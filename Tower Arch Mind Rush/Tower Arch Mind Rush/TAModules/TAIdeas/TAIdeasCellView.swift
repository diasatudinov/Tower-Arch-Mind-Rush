//
//  TAIdeasCellView.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

struct TAIdeasCellView: View {
    let idea: TAIdea
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 10) {
                Text(idea.name)
                    .font(.system(size: 16, weight: .semibold))
                    
                    .foregroundStyle(.black)
                Text("\(idea.type.text)")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 20)
            .padding(.leading, 30)
            .padding(.trailing)
            
            if let image = idea.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()  // <= растягиваем по ширине контейнера
                    .frame(height: 93)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
            } else {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Gradients.imgPlaceholder.color)
                    .frame(maxWidth: .infinity)
                    
            }
        }
        .frame(height: 93)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    TAIdeasCellView(idea:
                        TAIdea(
                            name: "Forest Silence",
                            type: .office,
                            floorNum: "12",
                            questions: [
                                Question(question: "What is the soul of this place?", answer: "Silence and Contemplation"),
                                Question(question: "What should a person feel here?", answer: "Security and Inspiration"),
                                Question(question: "What material speaks for me?", answer: "Wood and Concrete - a Warm Contrast"),
                            ],
                            description: "Add a courtyard with a tree. Explore Frank Gehry's work in context. Explore Frank Gehry's work in context. Explore Frank Gehry's work in context Explore Frank Gehry's work in context Explore Frank Gehry's work in context. Explore Frank Gehry's work in context Explore Frank Gehry's work in context Explore Frank Gehry's work in context . Explore Frank Gehry's work in context"
                        )
    )
}
