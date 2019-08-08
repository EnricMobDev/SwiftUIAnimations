//
//  HomeList.swift
//  SwiftUIAnimation
//
//  Created by Enric Pou Villanueva on 30/07/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import SwiftUI

struct HomeList: View {
      
    var leadingPadding: CGFloat = 70
    var bottomPadding: CGFloat = 40
    @State var showContent = false
    
    let courseData: [HomeListViewModel] = [
        HomeListViewModel(
            title: "Build and app with SwiftUI",
            image: "Illustration1",
            color: Color("background3"),
            shadowColor: Color("backgroundShadow3")
        ),
        HomeListViewModel(
            title: "DesignCourse",
            image: "Illustration2",
            color: Color("background4"),
            shadowColor: Color("backgroundShadow4")
        ),
        HomeListViewModel(
            title: "SwiftUI Advanced",
            image: "Illustration3",
            color: Color("background7"),
            shadowColor: Color("backgroundShadow3")
        ),
        HomeListViewModel(
            title: "Framer Playground",
            image: "Illustration4",
            color: Color("background8"),
            shadowColor: Color("backgroundShadow4")
        ),
        HomeListViewModel(
            title: "Flutter for designers",
            image: "Illustration5",
            color: Color("background9"),
            shadowColor: Color("backgroundShadow3")
        )
    ]
    
    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Courses")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("22 courses")
                            .foregroundColor(.gray)
                            .fontWeight(.light)
                    }
                    Spacer()
                }
                .padding(.leading, 70.0)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(courseData) { item in
                            Button(action: { self.showContent.toggle() }) {
                                GeometryReader { geometry in
                                    CourseView(
                                        title: item.title,
                                        image: item.image,
                                        color: item.color,
                                        shadowColor: item.shadowColor
                                    )
                                        .rotation3DEffect(Angle(degrees:
                                            Double(geometry.frame(in: .global).minX - 40) / -40
                                        ), axis: (x: 0, y: 10.0, z: 0))
                                }
                                .frame(width: 246, height: 360)
                            }
                            
                        }
                    }
                    .padding(.leading, 40)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    
                    Spacer()
                        .sheet(item: self.$showContent, content: {ContentView()})
                }
                CertificateRow()
            }
            .padding(.top, 78)
        }
    }
}

#if DEBUG
struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
#endif

struct CourseView: View {
    
    @State var isPresented = false

    var title = "Build and app with SwiftUI"
    var image = "Illustration1"
    var color = Color("background3")
    var shadowColor = Color("backgroundShadow3")
    
    var body: some View {
        return VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(30)
                .lineLimit(4)
                .padding(.trailing, 50)
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 150)
                .padding(.bottom, 30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}
