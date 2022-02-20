//
//  ContentView.swift
//  iHenryCavill
//
//  Created by Şeyda Şeyma Balcı on 20.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State private var messages: [String] = ["welcome to my heart🖤"]
    
    
    var body: some View {
        VStack{
            HStack{
                Text("iHenry, Cavill")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "bubble.left.fill")
                    .font(.system(size: 26))
                    .foregroundColor(Color.black)
            }
            ScrollView{
                ForEach(messages, id: \.self){
                    message in if message.contains("[USER]") {
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack{
                            Spacer()
                            Text(newMessage)
                                .padding()
                                .foregroundColor(.white)
                                .background(.gray.opacity(0.8))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                        }
                    } else{
                        HStack{
                          
                            Text(message)
                                .padding()
                                .foregroundColor(.white)
                                .background(.black.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }.rotationEffect(.degrees(180))
            }.rotationEffect(.degrees(180))
                .background(Color.gray.opacity(0.10))
            
            HStack{
                TextField("Tell me something", text: $messageText)
                    .padding()
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button{
                    sendMessage(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
                .foregroundColor(Color.black)
            }
            .padding()
        }
    }
    func sendMessage(message: String){
        withAnimation{
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation{
                messages.append(getHenryResponse(message: message))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





