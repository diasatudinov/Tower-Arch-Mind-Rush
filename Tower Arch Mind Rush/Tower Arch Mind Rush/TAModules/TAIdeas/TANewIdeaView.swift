//
//  TANewIdeaView.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

struct TANewIdeaView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: TAAnalysisViewModel
    
    @State private var name = ""
    @State private var floorsNum = ""
    @State private var question = 0
    @State private var answer1 = ""
    @State private var answer2 = ""
    @State private var answer3 = ""
    @State private var description = ""
    @State private var type: ObjectType?
    @State private var step = 0
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
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
                VStack(alignment: .leading, spacing: 8) {
                    switch step {
                    case 0:
                        step1()
                    case 1:
                        step2()
                    case 2:
                        step3()
                    case 3:
                        step4()
                    case 4:
                        step5()
                    case 5:
                        step6()
                    default:
                        Text("error")
                    }
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            }
        }
        .background(Gradients.bg.color)
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
    
    @ViewBuilder func step1() -> some View {
        VStack(alignment: .leading, spacing: 38)  {
            VStack(alignment: .leading, spacing: 20) {
                Text("New Project Concept")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("Step \(step + 1)")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.gray)
                
                Text("Select the building type")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.black)
            }
            
            Menu {
                ForEach(ObjectType.allCases, id: \.id) { type in
                    Button {
                        self.type = type
                    } label: {
                        if type == self.type {
                            Label(type.text, systemImage: "checkmark")
                        } else {
                            Text(type.text)
                            
                        }
                    }
                }
                
            } label: {
                
                Text(type?.text ?? "")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.black)
                    .frame(height: 55)
                    .padding(.horizontal, 16)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay(alignment: .trailing) {
                        Image(systemName: "pencil")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 20)
                            .bold()
                            .foregroundStyle(.pencilField)
                            .padding()
                    }
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.textFieldBg)
                        
                    })
                    .padding(.horizontal, 2)
            }
            
            Button {
                if step < 4 {
                    step += 1
                }
                
            } label: {
                Text(step == 4 ? "Save" : "Next")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(.starOff)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 150)
        }
    }
    
    
    @ViewBuilder func step2() -> some View {
        VStack(alignment: .leading, spacing: 38)  {
            VStack(alignment: .leading, spacing: 20) {
                Text("New Project Concept")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("Step \(step + 1)")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.gray)
                
                Text("Enter the number of floors")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.black)
            }
            
            
            TextField("Number of floors", text: $floorsNum)
                .font(.system(size: 20, weight: .semibold))
                .keyboardType(.numberPad)
                .padding(.vertical, 11).padding(.horizontal, 16)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(alignment: .trailing) {
                    Image(systemName: "pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .bold()
                        .foregroundStyle(.pencilField)
                        .padding()
                }
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.textFieldBg)
                    
                })
                .padding(.horizontal, 2)
            
            Button {
                if step < 4 {
                    step += 1
                }
            } label: {
                Text(step == 4 ? "Save" : "Next")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(.starOff)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 150)
        }
    }
    
    @ViewBuilder func step3() -> some View {
        VStack(alignment: .leading, spacing: 38)  {
            VStack(alignment: .leading, spacing: 20) {
                Text("New Project Concept")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("Step \(step + 1)")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.gray)
                
                Text("Answer the questions")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.black)
            }
            
            
            VStack(alignment: .leading) {
                Text("Question 1")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("What is the soul of this place?")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.black)
                
                TextEditor(text: $answer1)
                    .font(.system(size: 14, weight: .light))
                    .frame(height: 120)
                    .foregroundStyle(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.textEditorBg)
                    )
                    .scrollContentBackground(.hidden)
                    .overlay(alignment: .topLeading) {
                        if answer1.isEmpty {
                            Text("Enter the answer...")
                                .font(.system(size: 14, weight: .light))
                                .foregroundStyle(.secondary)
                                .allowsHitTesting(false)
                                .padding(.top, 10)
                                .padding(.leading, 4)
                        }
                    }
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.textEditorBorder)
                    })
            }
            .padding(.horizontal)
            
            Button {
                if step < 4 {
                    step += 1
                }
                
            } label: {
                Text(step == 4 ? "Save" : "Next")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(.starOff)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 75)
        }
    }
    
    @ViewBuilder func step4() -> some View {
        VStack(alignment: .leading, spacing: 38)  {
            VStack(alignment: .leading, spacing: 20) {
                Text("New Project Concept")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("Step \(step + 1)")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.gray)
                
                Text("Answer the questions")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.black)
            }
            
            
            VStack(alignment: .leading) {
                Text("Question 2")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("What should a person feel here?")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.black)
                
                TextEditor(text: $answer2)
                    .font(.system(size: 14, weight: .light))
                    .frame(height: 120)
                    .foregroundStyle(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.textEditorBg)
                    )
                    .scrollContentBackground(.hidden)
                    .overlay(alignment: .topLeading) {
                        if answer2.isEmpty {
                            Text("Enter the answer...")
                                .font(.system(size: 14, weight: .light))
                                .foregroundStyle(.secondary)
                                .allowsHitTesting(false)
                                .padding(.top, 10)
                                .padding(.leading, 4)
                        }
                    }
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.textEditorBorder)
                    })
            }
            .padding(.horizontal)
            
            Button {
                if step < 4 {
                    step += 1
                }
                
            } label: {
                Text(step == 4 ? "Save" : "Next")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(.starOff)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 75)
        }
    }
    
    
    @ViewBuilder func step5() -> some View {
        VStack(alignment: .leading, spacing: 38)  {
            VStack(alignment: .leading, spacing: 20) {
                Text("New Project Concept")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("Step \(step + 1)")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.gray)
                
                Text("Answer the questions")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.black)
            }
            
            
            VStack(alignment: .leading) {
                Text("Question 3")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("What material speaks for me?")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.black)
                
                TextEditor(text: $answer3)
                    .font(.system(size: 14, weight: .light))
                    .frame(height: 120)
                    .foregroundStyle(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.textEditorBg)
                    )
                    .scrollContentBackground(.hidden)
                    .overlay(alignment: .topLeading) {
                        if answer3.isEmpty {
                            Text("Enter the answer...")
                                .font(.system(size: 14, weight: .light))
                                .foregroundStyle(.secondary)
                                .allowsHitTesting(false)
                                .padding(.top, 10)
                                .padding(.leading, 4)
                        }
                    }
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.textEditorBorder)
                    })
            }
            .padding(.horizontal)
            
            Button {
                if step < 5 {
                    step += 1
                }
                
            } label: {
                Text(step == 5 ? "Save" : "Next")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(.starOff)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 75)
        }
    }
    
    @ViewBuilder func step6() -> some View {
        VStack(alignment: .leading, spacing: 20)  {
            VStack(alignment: .leading, spacing: 20) {
                Text("New Project Concept")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.black)
                
                Text("Step \(step + 1)")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(.gray)
                
                Text("Name")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.black)
            }
            
            
            TextField("Name", text: $name)
                .font(.system(size: 20, weight: .semibold))
                .padding(.vertical, 11).padding(.horizontal, 16)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(alignment: .trailing) {
                    Image(systemName: "pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                        .bold()
                        .foregroundStyle(.pencilField)
                        .padding()
                }
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(.textFieldBg)
                    
                })
                .padding(.horizontal, 2)
            
            textFiled(title: "Description") {
                TextEditor(text: $description)
                    .font(.system(size: 14, weight: .light))
                    .frame(height: 120)
                    .foregroundStyle(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.textEditorBg)
                    )
                    .scrollContentBackground(.hidden)
                    .overlay(alignment: .topLeading) {
                        if description.isEmpty {
                            Text("Enter a description...")
                                .font(.system(size: 14, weight: .light))
                                .foregroundStyle(.secondary)
                                .allowsHitTesting(false)
                                .padding(.top, 10)
                                .padding(.leading, 4)
                        }
                    }
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.textEditorBorder)
                        
                    })
            }
            
            Button {
                if step == 5 {
                    let idea = TAIdea(
                        name: name,
                        type: type ?? .office,
                        floorNum: floorsNum,
                        questions: [
                            Question(question: "What is the soul of this place?", answer: answer1),
                            Question(question: "What should a person feel here?", answer: answer2),
                            Question(question: "What material speaks for me?", answer: answer3)
                        ],
                        description: description, imageData: nil
                    )
                    
                    viewModel.add(idea: idea)
                    dismiss()
                } else {
                    step += 1
                }
                
            } label: {
                Text(step == 5 ? "Save" : "Next")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(.starOff)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 25)
        }
    }
    
    @ViewBuilder func textFiled<Content: View>(
        title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 8)  {
            Text(title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(.black)
            
            content()
        }
    }
}

#Preview {
    TANewIdeaView(viewModel: TAAnalysisViewModel())
}
