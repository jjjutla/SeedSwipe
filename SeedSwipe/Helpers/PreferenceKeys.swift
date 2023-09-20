//
//  PreferenceKeys.swift
//  SeedSwipe
//
//  Created by Artemiy Malyshau on 18/09/2023.
//

import SwiftUI

struct scrollPref: PreferenceKey {
    static var defaultValue: CGFloat = 0.0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        defaultValue = nextValue()
    }
}
