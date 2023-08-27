//
//  NewPostView.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 20/08/2023.
//
import SwiftUI

struct NewPostView: View {
    @State var postContent : String = ""
    var body: some View {
        //Header
        VStack{
        
            //post info
            HStack(alignment: .top) {
                VStack{
                    AsyncImage(url:URL(string: "https://source.unsplash.com/250x150")!)
                    { result in
                        if let image = result.image {
                            image
                                .resizable()
                                .scaledToFill()
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(width: 50, height: 50)
                    .cornerRadius(25)
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 2)
                }
                VStack(alignment: .leading){
                    Text("Username")
                    TextEditor(text: $postContent)
                        .frame(maxHeight: 56)
                    Button (
                        action: {
                            //
                        } ,label: {
                            
                            Image(systemName: "paperclip")
                                .foregroundColor(.gray)
                        }
                    )
                    .buttonStyle(.plain)
                }
                .frame(maxWidth: .infinity)
            }
            
            .frame(maxHeight: 200)
            .padding()
            Spacer()
            HStack {
                Button (
                    action: {
                        //
                    }, label: {
                        Text("Anyone can replay")
                            .foregroundColor(.gray)
                    }
                )
                .buttonStyle(.plain)
                
                Spacer()
                
                Button (
                    action: {
                        //
                    }, label: {
                        Text("Post")
                    }
                )
            }
            .padding()
        }
    }
}
struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}

