//
//  EmptyDataViewModifier.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 16.10.2022.
//

import SwiftUI

struct EmptyDataViewModifier<Presenting, T>: View where Presenting: View, T: View {
    let presenting: () -> Presenting
    let emptyDataView: () -> T
    var condition: Bool
    
    var body: some View {
        ZStack {
            if condition {
                emptyDataView()
            } else {
               presenting()
            }
        }
    }
}

extension View {
    func emptyDataView<T>(condition: Bool, emptyDataView: @escaping () -> T) -> some View where T: View {
        EmptyDataViewModifier(presenting: { self }, emptyDataView: emptyDataView, condition: condition)
    }
}
