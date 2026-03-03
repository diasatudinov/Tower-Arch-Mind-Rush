//
//  TAAnalysisDetailsView.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

struct TAAnalysisDetailsView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: TAAnalysisViewModel
    let analysis: TAAnalysis
    
    var body: some View {
        VStack {
            VStack {
                if let image = analysis.image {
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
                            ForEach(Range(0...9)) { i in
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 25)
                                    .foregroundStyle(analysis.rate > i ? .starYellow : .starOff)
                                
                            }
                        }
                        
                        
                        HStack(spacing: 8) {
                            Text(analysis.name)
                                .font(.system(size: 32, weight: .semibold))
                                .foregroundStyle(.black)
                                .fixedSize(horizontal: false, vertical: true)
                            NavigationLink {
                                TAEditAnalysisView(viewModel: viewModel, analysis: analysis)
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
                                viewModel.delete(analys: analysis)
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
                    }.padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Key questions")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.black)
                        
                        VStack(alignment: .leading, spacing: 24) {
                            ForEach(analysis.questions, id: \.id) { question in
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
                        
                        Text(analysis.description)
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
    TAAnalysisDetailsView(viewModel: TAAnalysisViewModel(), analysis: TAAnalysis(
        name: "GuggenheimGuggenheim Guggenheim v Guggenheim Guggenheim",
        questions: [
            Question(question: "How does the facade work?", answer: "Titanium plates reflect light, creating dynamism"),
            Question(question: "Where is the dominant feature?", answer: "The central atrium is the heart of the building"),
            Question(question: "How does light affect volume?", answer: "Through-holes create a play of shadows"),
        ],
        rate: 6,
        description: "Explore Frank Gehry's work in context, Explore Frank Gehry's work in context. Explore Frank Gehry's work in context. Explore Frank Gehry's work in context Explore Frank Gehry's work in context Explore Frank Gehry's work in context. Explore Frank Gehry's work in context Explore Frank Gehry's work in context Explore Frank Gehry's work in context . Explore Frank Gehry's work in context"))
}
