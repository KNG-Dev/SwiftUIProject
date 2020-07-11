//
//  CourseList.swift
//  SwiftUIProject
//
//  Created by Kenny Ho on 7/6/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    @State var show = false
    @State var show2 = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                CourseView(show: $show)
                
                GeometryReader { geometry in
                    CourseView(show: self.$show2)
                        .offset(y: self.show2 ? -geometry.frame(in: .global).minY : 0)
                }
                .frame(height: show2 ? screen.height : 280)
                .frame(maxWidth: show2 ? .infinity : screen.width - 60)
            }
            
        }
        
        .frame(width: screen.width)
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 30.0) {
                Text("SwiftUI Advanced. Using techniques like API data, packages, and CMS.")
                
                Text("About this course")
                    .font(.title).bold()
                
                Text("In this article, we are going to explore the different options for using transitions. We’ll discuss several aspects of them. From the basic to the most advanced. How to configure, combine and trigger them. We’ll study what are the pre-existing transitions, but more importantly, how we can create our own. When doing so, the information from “Advanced SwiftUI Animations” will expand immensely the number of effects you can create. But first, the basic concepts, to make sure we are all on the same page:")
                
                Text("In this article, we are going to explore the different options for using transitions. We’ll discuss several aspects of them. From the basic to the most advanced.")
            }
            .padding(30.0)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
            .offset(y: show ? 460 : 0)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .opacity(show ? 1 : 0)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("SwiftUI Advanced")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text("20 Sections")
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Image(uiImage: #imageLiteral(resourceName: "Logo1"))
                            .opacity(show ? 0 : 1)
                        VStack {
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        }
                            
                        .frame(width: 36, height: 36)
                        .background(Color.black)
                        .clipShape(Circle())
                        .opacity(show ? 1 : 0)
                    }
                }
                
                Spacer()
                
                Image(uiImage: #imageLiteral(resourceName: "Card2"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(show ? 30 : 20)
            .padding(.top, show ? 30 : 0)
                //        .frame(width: show ? screen.width : screen.width - 60, height:show ? screen.height : 280)
                .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                
                .onTapGesture {
                    self.show.toggle()
            }
        }
            
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
    }
}
