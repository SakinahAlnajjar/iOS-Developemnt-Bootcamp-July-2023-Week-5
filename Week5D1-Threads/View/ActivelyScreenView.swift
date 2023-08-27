//
//  ActivelyScreenView.swift
//  Week5D1-Threads
//
//  Created by سكينه النجار on 22/08/2023.
//

import SwiftUI

struct ActivityScreenView: View {
    enum ActiviteyCategory: String , CaseIterable {
        case all
        case replies
        case mentioed
        case verfied
        
        var title : String{
            switch self {
            case .all : return "All"
            case .replies : return "Replies"
            case .mentioed : return "Mentioed"
            case .verfied : return "Verfied"
            }
        }
    }
    @State var currentSelectedCategory :
    ActiviteyCategory = .all
    var body: some View {
        VStack{
            //top bar item
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(ActiviteyCategory.allCases ,id : \.self) {
                        category in
                        Button (
                            action: {
                                currentSelectedCategory = category
                            },
                            label: {
                                if currentSelectedCategory == category {
                                    Text(category.title)
                                        .frame(width: 84)
                                        .padding(.horizontal , 16)
                                        .padding(.vertical , 8)
                                        .foregroundColor(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12.5)
                                                .fill(.black)
                                        )
                                }
                                else {
                                    Text(category.title)
                                                                        .frame(width: 84)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical , 8)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12.5)
                                                .stroke(.gray.opacity(0.25))
                                        )
                                }
                            }
                        )
                        .buttonStyle(.plain)
                            }
//
//
                }
                }
                .padding(.horizontal)
            
            
//        switch currentSelectedCategory {
//        case .all :
//
//        case .replies :
//        case .mentioed :
//        case .verfied :
//        }
        
            // People to follow
            ScrollView{
                ForEach(0..<10 , id: \.self){ _ in
                    ActivetyComponentView()
                    Divider()
                }
            }
            .padding(.top)
        }
    }
}

struct ActivityScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
