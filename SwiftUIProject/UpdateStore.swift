//
//  UpdateStore.swift
//  SwiftUIProject
//
//  Created by Kenny Ho on 7/5/20.
//  Copyright © 2020 Kenny Ho. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

