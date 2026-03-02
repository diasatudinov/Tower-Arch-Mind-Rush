//
//  TAAnalysisCellView.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

struct TAAnalysisCellView: View {
    let analysis: TAAnalysis
    var body: some View {
        VStack {
            if let image = analysis.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()  // <= растягиваем по ширине контейнера
                    .frame(width: UIScreen.main.bounds.width / 2 - 50, height: 122)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    
                
            } else {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Gradients.imgPlaceholder.color)
                    .frame(maxWidth: .infinity)
                    .frame(width: UIScreen.main.bounds.width / 2 - 50, height: 122)
                    
            }
            
            VStack {
                Text(analysis.name)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.black)
                Text("\(analysis.rate)/10")
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundStyle(.black)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .padding(.bottom, 30)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    TAAnalysisCellView(analysis: TAAnalysis(
        name: "Guggenheim",
        questions: [
            Question(question: "", answer: "")
        ],
        rate: 9,
        description: "")
    )
}
