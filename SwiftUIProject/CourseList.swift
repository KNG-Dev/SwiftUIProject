//
//  CourseList.swift
//  SwiftUIProject
//
//  Created by Kenny Ho on 7/6/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI

struct CourseList: View {
    @State var courses = courseData
    @State var active = false
    @State var activeIndex = -1
    @State var activeView = CGSize.zero
    
    var body: some View {
        ZStack {
            Color.black.opacity(Double(self.activeView.height / 500))
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 30) {
                    Text("Courses")
                        .font(.largeTitle).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                        .padding(.top, 30)
                        .blur(radius: active ? 20 : 0)
                    
                    ForEach(courses.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            CourseView(show: self.$courses[index].show, course: self.courses[index], active: self.$active, index: index, activeIndex: self.$activeIndex, activeView: self.$activeView)
                                .offset(y: self.courses[index].show ? -geometry.frame(in: .global).minY : 0)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 280)
                        .frame(maxWidth: self.courses[index].show ? .infinity : screen.width - 60)
                        .zIndex(self.courses[index].show ? 1 : 0)
                    }
                }
                    
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                
            }
            .statusBar(hidden: active ? true : false)
            .animation(.linear)
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    @Binding var show: Bool
    var course: Course
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
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
                        Text(course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text(course.subtitle)
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Image(uiImage: course.logo)
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
                
                
                
                .gesture(
                    show ?
                        DragGesture().onChanged({value in
                            
                            //While card active, set limit on how small the card gets when dismissing
                            guard value.translation.height < 300 else { return }
                            
                            //Disables dragging up to dismiss
                            guard value.translation.height > 0 else { return }
                            
                            self.activeView = value.translation
                            
                        })
                            .onEnded({ (value) in
                                if self.activeView.height > 50 {
                                    self.show = false
                                    self.active = false
                                    self.activeIndex = -1
                                }
                                self.activeView = .zero
                                
                            })
                        
                        //Disable Hue when dragging in small view
                        : nil
            )
                .onTapGesture {
                    self.show.toggle()
                    self.active.toggle()
                    
                    if self.show {
                        self.activeIndex = self.index
                    } else {
                        self.activeIndex = -1
                    }
            }
            
            if show {
//                CourseDetail(course: course, show: $show, active: $active, activeIndex: $activeIndex)
//                    .background(Color.white)
//                .animation(nil)
            }
        }
            
        .frame(height: show ? screen.height : 280)
        .scaleEffect(1 - self.activeView.height / 1000)
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height / 10)), axis: (x: 0.0, y: 10.0, z: 0.0))
        .hueRotation(Angle(degrees: Double(self.activeView.height)))
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
        .gesture(
            show ?
                DragGesture().onChanged({value in
                    
                    //While card active, set limit on how small the card gets when dismissing
                    guard value.translation.height < 300 else { return }
                    
                    //Disables dragging up to dismiss
                    guard value.translation.height > 0 else { return }
                    
//                    self.activeView = value.translation
                    
                })
                    .onEnded({ (value) in
                        if self.activeView.height > 50 {
                            self.show = false
                            self.active = false
                            self.activeIndex = -1
                        }
                        self.activeView = .zero
                        
                        }
                )
                
                //Disable Hue when dragging in small view
                : nil
        )
            .edgesIgnoringSafeArea(.all)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var image: UIImage
    var logo: UIImage
    var color: UIColor
    var show: Bool
}

var courseData = [
    Course(title: "Prototype designs in Swift UI", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Background1"), logo: #imageLiteral(resourceName: "Logo1"), color: UIColor.systemRed, show: false),
    Course(title: "Build a SwiftUI App", subtitle: "18 Sections", image: #imageLiteral(resourceName: "Card6"), logo: #imageLiteral(resourceName: "Logo2"), color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), show: false),
    Course(title: "UI Design for Developers", subtitle: "25 Sections", image: #imageLiteral(resourceName: "Card1"), logo: #imageLiteral(resourceName: "Logo3"), color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), show: false),
    
]
