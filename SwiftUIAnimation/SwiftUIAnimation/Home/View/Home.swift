//
//  Home.swift
//  SwiftUIAnimation
//
//  Created by Enric Pou Villanueva on 30/07/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @State private var show = false
    @State private var showProfile = false

    var body: some View {
        ZStack {
            
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ?  0.95 : 1)
                .animation(.default)
            
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 10)
                .animation(.spring())
                .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 80)
                .animation(.spring())

            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.spring())

            MenuView(show: $show)
        }
        .background(Color("background"))
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Home().previewDevice("iPhone Xs")
            Home().previewDevice("iPhone Xs Max")
            Home().previewDevice("iPad Pro (11-inch)")
        }
    }
}
#endif

struct ProfileRow: View {
    
    var profileImage = "creditcard"
    var profileText = "My Account"
    
    var body: some View {
        HStack {
            Image(systemName: profileImage)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            Text(profileText)
                .font(.headline)
            Spacer()
        }
    }
}


struct MenuView: View {
    
    @Binding var show: Bool
    
    let profileIcons: [Menu] = [
        Menu(title: "My Account", icon: "person.crop.circle"),
        Menu(title: "Settings", icon: "gear"),
        Menu(title: "Billing", icon: "creditcard"),
        Menu(title: "Team", icon: "person.and.person"),
        Menu(title: "Sign out", icon: "arrow.uturn.down")]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            ForEach(profileIcons) { item in
                ProfileRow(profileImage: item.icon, profileText: item.title)
            }
            
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0 , y: 10.0, z: 0))
        .animation(.spring())
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .onTapGesture {
            self.show.toggle()
        }
    }
}

struct CircleButton: View {
    
    var icon = "person.crop.circle"
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.primary)
        }
        .frame(width: 44, height: 44)
        .background(BlurView(style: .systemThickMaterial))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
    }
}

struct MenuButton: View {
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Button(action: { self.show.toggle() }) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.primary)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(BlurView(style: .systemThickMaterial))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
        }
        Spacer()
    }
}
}

struct MenuRight: View {
    
    @Binding var show: Bool

    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack {
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "person.crop.circle")
                }
                
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "bell")
                }
            }
            Spacer()
        }
    }
}
