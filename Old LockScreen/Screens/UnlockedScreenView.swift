//
//  UnlockedScreenView.swift
//  Old LockScreen
//
//  Created by Austin Suarez on 2/24/22.
//

import SwiftUI

struct UnlockedScreenView: View {
    
    @AppStorage("share") var isLocked: Bool = false;

    var body: some View {
        Button(action: { withAnimation{ isLocked = true }})
        {
            Text("Lock.")
        }
        .controlSize(.large)
        .buttonBorderShape(.capsule)
        .buttonStyle(.borderedProminent)
    }
}

struct UnlockedScreenView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockedScreenView()
    }
}
