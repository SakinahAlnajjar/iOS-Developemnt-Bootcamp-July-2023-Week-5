//
//  ActivelyComponentView.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 22/08/2023.
//

import SwiftUI

struct ActivetyComponentView: View {
    var body: some View {
        HStack(alignment: .top){
            AsyncImage(url:URL(string: "https://source.unsplash.com/250x150"))
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
            
            VStack(alignment: .leading){
                HStack {
                    Text("UserName")
                        .fontWeight(.medium)
                    Text("12S")
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                Text("Follow You")
                    .foregroundColor(.gray)
                
            }
            .frame(maxWidth: .infinity , alignment: .leading)
            Spacer()
            //                    م تنفع لان بتسوي مساحه جهه ف،ولو اكبد من جهه يمين صوره
            
            Button(action: {
                
            },
                   label: { Text("Follow")
                    .padding(.horizontal,16)
                    .padding(.vertical, 8)
                    .background(RoundedRectangle(cornerRadius: 12.5)
                        .stroke(.gray.opacity(0.25))
                    )
            }
            )
            .buttonStyle(.plain)
            
        }  .padding(.horizontal)
        
    }
}

struct ActivetyComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ActivetyComponentView()
    }
}
