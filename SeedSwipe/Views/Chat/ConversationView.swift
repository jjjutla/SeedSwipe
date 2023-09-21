//
//  ConversationView.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 20/09/2023.
//

import SwiftUI

struct ConversationView: View {
    
    @EnvironmentObject var chatViewModel: ChatViewModel
    @State private var text: String = ""
    @State private var isPayingView: Bool = false
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    ScrollView {
                        ScrollViewReader { proxy in
                            VStack(spacing: 0) {
                                Spacer(minLength: 10)
                                ForEach(chatViewModel.messages, id: \.id) { message in
                                    messageView(message: message).id(message.id)
                                }
                            }
                            .onChange(of: chatViewModel.messages) { _ in
                                if let lastMessage = chatViewModel.messages.last {
                                    proxy.scrollTo(lastMessage.id, anchor: .bottom)
                                }
                            }
                        }
                    }
                }
                
                HStack(spacing: 6) {
                    TextField("Enter a message", text: $chatViewModel.currentInput)
                        .lineLimit(6)
                        .padding([.leading, .trailing], 14)
                        .padding([.top, .bottom], 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                    Button {
                        chatViewModel.sendMessage()
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .foregroundColor(.blue)
                            .font(Font.system(size: 30, weight: .regular))
                    }
                    Button {
                        isPayingView.toggle()
                    } label: {
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.accentColor.opacity(0.8))
                            .font(Font.system(size: 30, weight: .regular))
                    }
                }
                .padding()
                .padding(.bottom, 8)
            }
            .navigationBarTitle("Fastgen", displayMode: .inline)
            .sheet(isPresented: $isPayingView) {
                PaymentView()
                    .presentationDetents([.fraction(0.3)])
            }
        }
    }
    
    func messageView(message: Message) -> some View {
        VStack(alignment: message.role == .user ? .trailing : .leading) {
            ChatBubble(direction: message.role == .user ? .right : .left) {
                if message.role == .user {
                    Text(message.content)
                        .padding(.trailing, 18)
                        .padding(.leading, 14)
                        .padding([.top, .bottom], 8)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                } else {
                    Text(message.content)
                        .padding(.trailing, 14)
                        .padding(.leading, 18)
                        .padding([.top, .bottom], 8)
                        .foregroundColor(Color.white)
                        .background(Color.gray.opacity(0.4))
                }
            }
            
            Text(formatter.string(from: message.createAt))
                .font(.caption)
                .foregroundColor(.gray)
                .padding([.leading, .trailing], 4)
        }
        .padding(.bottom, 2)
    }
}

#Preview {
    ConversationView()
        .preferredColorScheme(.dark)
}

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ChatBubble<Content>: View where Content: View {
    let direction: ChatBubbleShape.Direction
    let content: () -> Content
    init(direction: ChatBubbleShape.Direction, @ViewBuilder content: @escaping () -> Content) {
            self.content = content
            self.direction = direction
    }
    
    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }
            content().clipShape(ChatBubbleShape(direction: direction))
            if direction == .left {
                Spacer()
            }
        }.padding([(direction == .left) ? .leading : .trailing, .top, .bottom], 4)
        .padding((direction == .right) ? .leading : .trailing, 16)
    }
}

struct ChatBubbleShape: Shape {
    enum Direction {
        case left
        case right
    }
    
    let direction: Direction
    
    func path(in rect: CGRect) -> Path {
        return (direction == .left) ? getLeftBubblePath(in: rect) : getRightBubblePath(in: rect)
    }
    
    private func getLeftBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x: width - 20, y: height))
            p.addCurve(to: CGPoint(x: width, y: height - 20),
                       control1: CGPoint(x: width - 8, y: height),
                       control2: CGPoint(x: width, y: height - 8))
            p.addLine(to: CGPoint(x: width, y: 20))
            p.addCurve(to: CGPoint(x: width - 20, y: 0),
                       control1: CGPoint(x: width, y: 8),
                       control2: CGPoint(x: width - 8, y: 0))
            p.addLine(to: CGPoint(x: 21, y: 0))
            p.addCurve(to: CGPoint(x: 4, y: 20),
                       control1: CGPoint(x: 12, y: 0),
                       control2: CGPoint(x: 4, y: 8))
            p.addLine(to: CGPoint(x: 4, y: height - 11))
            p.addCurve(to: CGPoint(x: 0, y: height),
                       control1: CGPoint(x: 4, y: height - 1),
                       control2: CGPoint(x: 0, y: height))
            p.addLine(to: CGPoint(x: -0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: 11.0, y: height - 4.0),
                       control1: CGPoint(x: 4.0, y: height + 0.5),
                       control2: CGPoint(x: 8, y: height - 1))
            p.addCurve(to: CGPoint(x: 25, y: height),
                       control1: CGPoint(x: 16, y: height),
                       control2: CGPoint(x: 20, y: height))
            
        }
        return path
    }
    
    private func getRightBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x:  20, y: height))
            p.addCurve(to: CGPoint(x: 0, y: height - 20),
                       control1: CGPoint(x: 8, y: height),
                       control2: CGPoint(x: 0, y: height - 8))
            p.addLine(to: CGPoint(x: 0, y: 20))
            p.addCurve(to: CGPoint(x: 20, y: 0),
                       control1: CGPoint(x: 0, y: 8),
                       control2: CGPoint(x: 8, y: 0))
            p.addLine(to: CGPoint(x: width - 21, y: 0))
            p.addCurve(to: CGPoint(x: width - 4, y: 20),
                       control1: CGPoint(x: width - 12, y: 0),
                       control2: CGPoint(x: width - 4, y: 8))
            p.addLine(to: CGPoint(x: width - 4, y: height - 11))
            p.addCurve(to: CGPoint(x: width, y: height),
                       control1: CGPoint(x: width - 4, y: height - 1),
                       control2: CGPoint(x: width, y: height))
            p.addLine(to: CGPoint(x: width + 0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: width - 11, y: height - 4),
                       control1: CGPoint(x: width - 4, y: height + 0.5),
                       control2: CGPoint(x: width - 8, y: height - 1))
            p.addCurve(to: CGPoint(x: width - 25, y: height),
                       control1: CGPoint(x: width - 16, y: height),
                       control2: CGPoint(x: width - 20, y: height))
            
        }
        return path
    }
}
