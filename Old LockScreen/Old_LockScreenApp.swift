//
//  Old_LockScreenApp.swift
//  Old LockScreen
//
//  Created by Austin Suarez on 2/16/22.
//

import SwiftUI

@main
struct Old_LockScreenApp: App {
    @AppStorage("share") var isLocked:Bool =  true;
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                if isLocked{
                    ContentView()
                }
                else{
                    UnlockedScreenView()

                }
            }
        }
    }
}
