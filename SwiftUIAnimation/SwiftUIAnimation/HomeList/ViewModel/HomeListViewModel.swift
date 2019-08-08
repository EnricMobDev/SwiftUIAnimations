//
//  HomeListViewModel.swift
//  SwiftUIAnimation
//
//  Created by Enric Pou Villanueva on 31/07/2019.
//  Copyright © 2019 Enric Pou Villanueva. All rights reserved.
//

import SwiftUI

struct HomeListViewModel: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}
