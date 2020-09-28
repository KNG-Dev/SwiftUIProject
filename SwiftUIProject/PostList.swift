//
//  PostList.swift
//  SwiftUIProject
//
//  Created by Kenny Ho on 9/28/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct PostList: View {
    @State var posts: [Post] = []
    
    var body: some View {
        List(posts) { post in
            Text(post.title)
            
        } .onAppear(perform: {
            API().getPosts { (posts) in
                self.posts = posts
            }
        })
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
