//
//  TAEditIdeasView.swift
//  Tower Arch Mind Rush
//
//

import SwiftUI

struct TAEditIdeasView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: TAAnalysisViewModel
    let idea: TAIdea
    
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false
    @State private var name = ""
    @State private var floorNum = ""
    @State private var question = 0
    @State private var answer1 = ""
    @State private var answer2 = ""
    @State private var answer3 = ""
    @State private var description = ""
    @State private var questions: [Question] = []
    @State private var type: ObjectType?
    var body: some View {
        VStack {
            VStack {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                        .overlay {
                            Text("upload a photo")
                                .font(.system(size: 20, weight: .regular))
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .onTapGesture {
                            withAnimation {
                                showingImagePicker = true
                            }
                        }
                } else {
                    Rectangle()
                        .fill(Gradients.imgPlaceholder.color)
                        .frame(height: UIScreen.main.bounds.height / 2.5)
                        .overlay {
                            Text("upload a photo")
                                .font(.system(size: 20, weight: .regular))
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .onTapGesture {
                            withAnimation {
                                showingImagePicker = true
                            }
                        }
                }
            }
            
            
            VStack(alignment: .leading, spacing: 30) {
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 14) {
                        textFiled(title: "Name") {
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
                        }
                        
                        textFiled(title: "Enter the number of floors") {
                            TextField("Number of floors", text: $floorNum)
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
                        
                    }.padding(.top, 30)
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        HStack(spacing: 15) {
                            
                            Button {
                                if question > 0 {
                                    question -= 1
                                }
                            } label: {
                                Image(systemName: "chevron.left")
                                    .bold()
                                    .foregroundStyle(.black)
                            }
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Question \(question + 1)")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundStyle(.black)
                                
                                switch question {
                                case 0:
                                    Text("How does the facade work?")
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundStyle(.black)
                                case 1:
                                    Text("Where is the dominant feature?")
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundStyle(.black)
                                case 2:
                                    Text("How does light affect volume?")
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundStyle(.black)
                                default:
                                    Text("How does the facade work?")
                                        .font(.system(size: 16, weight: .regular))
                                        .foregroundStyle(.black)
                                    
                                }
                                
                                switch question {
                                case 0:
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
                                case 1:
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
                                    
                                case 2:
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
                                default:
                                    Text("sad")
                                    
                                }
                            }
                            
                            Button {
                                if question < 2 {
                                    question += 1
                                }
                            } label: {
                                Image(systemName: "chevron.right")
                                    .bold()
                                    .foregroundStyle(.black)
                            }
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
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
                    }
                    
                    Button {
                        let newIdea = TAIdea(
                            name: name,
                            type: type ?? .office,
                            floorNum: floorNum,
                            questions: [
                                Question(question: idea.questions[0].question, answer: answer1),
                                Question(question: idea.questions[1].question, answer: answer2),
                                Question(question: idea.questions[2].question, answer: answer3)
                            ],
                            description: description,
                            imageData: selectedImage?.pngData()
                        )
                        viewModel.edit(idea: idea, newIdea: newIdea)
                        dismiss()
                    } label: {
                        Text("Save")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 35)
                            .background(.starOff)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            .padding(.bottom, 50)
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
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $showingImagePicker)
        }
        .onAppear {
            fetchData()
        }
    }
    
    private func fetchData() {
        name = idea.name
        selectedImage = idea.image
        floorNum = idea.floorNum
        description = idea.description
        answer1 = idea.questions[0].answer
        answer2 = idea.questions[1].answer
        answer3 = idea.questions[2].answer
        type = idea.type
    }
    
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
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
    TAEditIdeasView(viewModel: TAAnalysisViewModel(),
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
                    )
    )
}
