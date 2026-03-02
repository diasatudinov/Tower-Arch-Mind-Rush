//
//  TAAnalysisView.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

struct TAAnalysisView: View {
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
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.analysis, id: \.id) { analysis in
                        NavigationLink {
                            TAAnalysisDetailsView(viewModel: viewModel, analysis: analysis)
                                .navigationBarBackButtonHidden()
                        } label: {
                            TAAnalysisCellView(analysis: analysis)
                        }
                    }
                }
                .padding(.horizontal, 35)
                .padding(.top, 50)
                .padding(.bottom, 150)
                
            }
            .overlay(alignment: .bottomTrailing) {
                NavigationLink {
                    TANewAnalysisView(viewModel: viewModel)
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
    TAAnalysisView(viewModel: TAAnalysisViewModel())
}
