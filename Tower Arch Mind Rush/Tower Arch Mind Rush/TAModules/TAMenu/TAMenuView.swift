//
//  TAMenuView.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

struct BBMenuContainer: View {
    
    @AppStorage("firstOpenBB") var firstOpen: Bool = true
    var body: some View {
        NavigationStack {
            ZStack {
                TAMenuView()
            }
        }
    }
}

struct TAMenuView: View {
    @State var selectedTab = 0
    @StateObject var viewModel = TAAnalysisViewModel()
    private let tabs = ["My dives", "Calendar"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedTab) {
                TAAnalysisView(viewModel: viewModel)
                    .tag(0)
                
                Color.blue
                    .tag(1)
            }
            // если не хочешь системный таббар:
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            customTabBar
        }
        .background(Gradients.bg.color)
        .ignoresSafeArea()
    }
    
    private var customTabBar: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabs.count, id: \.self) { index in
                Button {
                    selectedTab = index
                } label: {
                    Text(tabs[index])
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(selectedTab == index ? .black : .white)
                        .frame(maxWidth: .infinity, alignment: index == 0 ? .leading : .trailing)
                        .padding(.vertical, 44)
                        .padding(.horizontal, 33)
                        .background(selectedTab == index ? Gradients.orange.color : Gradients.clear.color)
                        .clipShape(RoundedRectangle(cornerRadius: 26))
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Gradients.blue.color)
        .clipShape(RoundedRectangle(cornerRadius: 26))
        .padding(.bottom, 5)
    }
    
    private func icon(for index: Int) -> String {
        switch index {
        case 0: return "tab1Icon"
        case 1: return "tab2Icon"
        case 2: return "tab3Icon"
        default: return ""
        }
    }
    
    private func selectedIcon(for index: Int) -> String {
        switch index {
        case 0: return "tab1IconSelected"
        case 1: return "tab2IconSelected"
        case 2: return "tab3IconSelected"
        default: return ""
        }
    }
    
    private func text(for index: Int) -> String {
        switch index {
        case 0: return "Analysis"
        case 1: return "Ideas"
        default: return ""
        }
    }
}

#Preview {
    BBMenuContainer()
}
