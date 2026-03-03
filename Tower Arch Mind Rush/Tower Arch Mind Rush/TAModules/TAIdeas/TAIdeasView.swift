//
//  TAIdeasView.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

struct TAIdeasView: View {
    @ObservedObject var viewModel: TAAnalysisViewModel
    let columns = Array(repeating: GridItem(.flexible(), spacing: 30), count: 2)
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 2) {
                Image(.menuLogoTA)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 110)
                
                Image(.laneTA)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 13)
            }
            
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(viewModel.ideas, id: \.id) { idea in
                        NavigationLink {
                            TAIdeasDetailsView(viewModel: viewModel, idea: idea)
                                .navigationBarBackButtonHidden()
                        } label: {
                            TAIdeasCellView(idea: idea)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 25)
                .padding(.top, 50)
                .padding(.bottom, 150)
                
            }
            .overlay(alignment: .bottomTrailing) {
                NavigationLink {
                    TANewIdeaView(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    Circle()
                        .foregroundStyle(.white)
                        .overlay(content: {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                                .bold()
                                .foregroundStyle(.black)
                        })
                        .frame(height: 50)
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 150)
            }
        }
        .background(Gradients.bg.color)
    }
}


#Preview {
    TAIdeasView(viewModel: TAAnalysisViewModel())
}
