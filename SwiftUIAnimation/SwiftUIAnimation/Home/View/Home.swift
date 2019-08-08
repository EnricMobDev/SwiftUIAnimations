//
//  Home.swift
//  SwiftUIAnimation
//
//  Created by Enric Pou Villanueva on 30/07/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileRow(profileImage: "person.crop.circle", profileText: "My Account")
            ProfileRow(profileImage: "creditcard", profileText: "Billing")
            ProfileRow(profileImage: "person.and.person", profileText: "Team")
            ProfileRow(profileImage: "arrow.uturn.down", profileText: "Sign out")
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        
    }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
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
