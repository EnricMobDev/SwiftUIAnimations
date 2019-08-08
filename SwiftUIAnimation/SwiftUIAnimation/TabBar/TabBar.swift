//
//  TabBar.swift
//  SwiftUIAnimation
//
//  Created by Enric Pou Villanueva on 02/08/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        
        TabView {
            Home().tabItem({
                    Image("IconHome")
                    Text("Home")
                })
            ContentView().tabItem({
                    Image("IconCards")
                    Text("Certificates")
                })
            Settings().tabItem({
                    Image("IconSettings")
                    Text("Settings")
                })
        }
    }
}

#if DEBUG
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
            TabBar()
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraLarge)
        }
    }
}
#endif
