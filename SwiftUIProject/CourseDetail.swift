//
//  CourseDetail.swift
//  SwiftUIProject
//
//  Created by Kenny Ho on 9/2/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct CourseDetail: View {
    var course: Course
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(course.title)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                            Text(course.subtitle)
                                .foregroundColor(Color.white.opacity(0.7))
                        }
                        
                        Spacer()
                        
                        ZStack {
                            VStack {
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                            }
                                
                            .frame(width: 36, height: 36)
                            .background(Color.black)
                            .clipShape(Circle())
                            
                            .onTapGesture {
                                self.show = false
                                self.active = false
                                self.activeIndex = -1
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Image(uiImage: course.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 140, alignment: .top)
                }
                .padding(show ? 30 : 20)
                .padding(.top, show ? 30 : 0)
                    //        .frame(width: show ? screen.width : screen.width - 60, height:show ? screen.height : 280)
                    .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                    .background(Color(course.color))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color(course.color).opacity(0.3), radius: 20, x: 0, y: 20)
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text("SwiftUI Advanced. Using techniques like API data, packages, and CMS.")
                    
                    Text("About this course")
                        .font(.title).bold()
                    
                    Text("In this article, we are going to explore the different options for using transitions. We’ll discuss several aspects of them. From the basic to the most advanced. How to configure, combine and trigger them. We’ll study what are the pre-existing transitions, but more importantly, how we can create our own. When doing so, the information from “Advanced SwiftUI Animations” will expand immensely the number of effects you can create. But first, the basic concepts, to make sure we are all on the same page:")
                    
                    Text("In this article, we are going to explore the different options for using transitions. We’ll discuss several aspects of them. From the basic to the most advanced.")
                }
                .padding(30.0)
            }
        }
        
        .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(course: courseData[0], show: .constant(true), active: .constant(true), activeIndex: .constant(-1))
    }
}
