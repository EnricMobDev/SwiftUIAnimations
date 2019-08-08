//
//  UpdateStore.swift
//  SwiftUIAnimation
//
//  Created by Enric Pou Villanueva on 31/07/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
        
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    var updates: [Update] {
        didSet {
            objectWillChange.send()
        }
    }
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
}

