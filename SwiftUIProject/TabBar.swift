//
//  TabBar.swift
//  SwiftUIProject
//
//  Created by Kenny Ho on 7/5/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem({
                Image(systemName: "play.circle.fill")
                Text("Home")
            })
            
            ContentView().tabItem({
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            })
        }
        
//        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            TabBar().previewDevice("iPhone 8")
            TabBar().previewDevice("iPhone 11 Pro")
        }
        
    }
}
