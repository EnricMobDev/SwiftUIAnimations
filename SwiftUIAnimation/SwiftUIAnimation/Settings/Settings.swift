//
//  Settings.swift
//  SwiftUIAnimation
//
//  Created by Enric Pou Villanueva on 06/08/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import SwiftUI

struct Settings: View {
    
    @State private var receive = false
    @State private var number = 1
    @State private var selection = 1
    @State private var date = Date()
    @State private var email = ""
    @State private var submit = false

    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $receive) {
                    Text("Receive Notifications")
                }
                
                Stepper(value: $number, in: 1...10) {
                    Text("Notifications per week")
                }
                
                Picker(selection: $selection, label: Text("Favourite Course")) {
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }
                
                DatePicker(selection: $date, label: { Text("Date")
                    
                })
                
                Section(header: Text("Email")) {
                    TextField("Your Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: { self.submit.toggle() }) {
                    Text("Submit")
                }
                .sheet(item: self.$submit, content: {Alert(title: Text("Thanks!!"), message: Text("See you"))
                    
                })
                
            }
        .navigationBarTitle("Settings")
        }
    }
}

#if DEBUG
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
#endif
