//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by Enric Pou Villanueva on 26/07/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var backgroundTurquoise = Color("background5")
    var backgroundBlue = Color("background8")
    var backgroundPurple = Color("background9")

    
    @State private var show = false
    @State private var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            BlurView(style: .systemMaterial)
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .background(show ? Color.red : backgroundPurple)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .blendMode(.hardLight)
                .animation(.easeInOut(duration:  0.4)
                .offset(x: viewState.width, y: viewState.height)

            CardView()
                .background(show ? backgroundTurquoise : backgroundBlue)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .animation(.spring())
                .offset(x: viewState.width, y: viewState.height)

            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: /*@START_MENU_TOKEN@*/(x: 10.0, y: 10.0, z: 10.0)/*@END_MENU_TOKEN@*/)
                .animation(.interpolatingSpring(mass: 1, stiffness: 100, damping: 10, initialVelocity: 0))
                .onTapGesture {
                    self.show.toggle()
                }
                  
                .gesture(
                    DragGesture()
                    
                .onChanged { value in
                    self.viewState = value.translation
                    self.show = true
                }
                .onEnded { value in
                    self.viewState = CGSize.zero
                    self.show = false
                }
            )
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct CertificateView: View {
    
    var item = Certificate(title: "UI Design", image: "Background", width: 340, height: 220)
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                        Text(/*@START_MENU_TOKEN@*/"Certificate"/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                    }
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                }
                .padding(.horizontal)
                Spacer()
            Image(item.image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 50)
            }
        .frame(width: CGFloat(item.width), height: CGFloat(item.height))
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                .frame(width: 340, height: 220)
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    Spacer()
                }
                Image("Illustration5")
                Spacer()
                }.padding()
            }
        }
        
        struct CardBottomView: View {
            var body: some View {
                VStack(spacing: 20.0) {
                    Rectangle()
                        .frame(width: 60.0, height: 6.0)
                        .cornerRadius(3.0)
                        .opacity(0.1)
                        
                        Text("This certificate is proof by Enric Pou has achieved the UI Design course with approval from  a Design+Code instructor")
                            .lineLimit(0)
                            Spacer()
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.horizontal)
                .background(BlurView(style: .systemMaterial ))
                        .cornerRadius(30)
                        .shadow(radius: 20)
                .offset(y: UIScreen.main.bounds.width - 170)
                }
            }
