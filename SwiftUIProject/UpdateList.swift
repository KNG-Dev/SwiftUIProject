//
//  UpdateList.swift
//  SwiftUIProject
//
//  Created by Kenny Ho on 7/5/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    var body: some View {
        NavigationView {
            List(updateData) { update in
                NavigationLink(destination: UpdateDetail(update: update)) {
                    HStack {
                        Image(update.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color.black)
                            .cornerRadius(20)
                            .padding(.trailing, 4)
                        
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(update.title)
                                .font(.system(size: 20, weight: .bold))
                            
                            Text(update.text)
                                .lineLimit(2)
                                .font(.subheadline)
                            .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                            
                            Text(update.date)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                    
                }
            }
            .navigationBarTitle(Text("Updates"))
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI", text: "Learn how to build your app using Swift UI.", date: "Jan 1"),
    Update(image: "Card2", title: "UIKit", text: "Learn UIKIT", date: "Feb 1"),
    Update(image: "Card3", title: "Front-End Design", text: "Learn basic design principles such as color, proper layout, and fonts.", date: "Mar 1"),
    Update(image: "Card4", title: "Cloud Firestore", text: "Cloud Firestore tutorial. Cloud Firestore is a flexible, scalable database for mobile, web, and server development from Firebase and Google Cloud Platform.", date: "Apr 1"),
    Update(image: "Card5", title: "Core Data", text: "Core Data with CloudKit integration. Core Data is a framework that you use to manage the model layer objects in your application.", date: "May 1"),
]
