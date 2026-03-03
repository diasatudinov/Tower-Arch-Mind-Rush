//
//  TAIdeasDetailsView.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

struct TAIdeasDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: TAAnalysisViewModel
    let idea: TAIdea
    
    var body: some View {
        VStack {
            VStack {
                if let image = idea.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                } else {
                    Rectangle()
                        .fill(Gradients.imgPlaceholder.color)
                        .frame(height: UIScreen.main.bounds.height / 2.5)
                }
            }
            
            
            VStack(alignment: .leading, spacing: 30) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 14) {
                        
                        HStack(spacing: 8) {
                            Text(idea.name)
                                .font(.system(size: 32, weight: .semibold))
                                .foregroundStyle(.black)
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            NavigationLink {
                                TAEditIdeasView(viewModel: viewModel, idea: idea)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text("Edit")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 40)
                                    .background(.starOff)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
                            Button {
                                viewModel.delete(idea: idea)
                                dismiss()
                            } label: {
                                Image(systemName: "trash")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 10)
                                    .background(.red)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            
                        }
                        
                        
                        Text("Number of Floors: \(idea.floorNum)")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 25)
                    }
                    
                    .padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Key questions")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.black)
                        
                        VStack(alignment: .leading, spacing: 24) {
                            ForEach(idea.questions, id: \.id) { question in
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(question.question)
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundStyle(.black.opacity(0.5))
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(question.answer)
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundStyle(.black.opacity(0.5))
                                }
                            }
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Description ")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.black)
                        
                        Text(idea.description)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(.black.opacity(0.5))
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding(.bottom, 30)
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30))
            .padding(.bottom, -40)
            .offset(y: -40)
            
        }
        .ignoresSafeArea()
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                Image(.backBtnTA)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TAIdeasDetailsView(viewModel: TAAnalysisViewModel(),
                       idea: TAIdea(
                        name: "Forest Silence",
                        type: .office,
                        floorNum: "12",
                        questions: [
                            Question(question: "What is the soul of this place?", answer: "Silence and Contemplation"),
                            Question(question: "What should a person feel here?", answer: "Security and Inspiration"),
                            Question(question: "What material speaks for me?", answer: "Wood and Concrete - a Warm Contrast"),
                        ],
                        description: "Add a courtyard with a tree. Explore Frank Gehry's work in context. Explore Frank Gehry's work in context. Explore Frank Gehry's work in context Explore Frank Gehry's work in context Explore Frank Gehry's work in context. Explore Frank Gehry's work in context Explore Frank Gehry's work in context Explore Frank Gehry's work in context . Explore Frank Gehry's work in context"
                       ))
}
