//
//  GetTime.swift
//  Old LockScreen
//
//  Created by Austin Suarez on 2/16/22.
//

import Foundation


func getDate()->String{
    let time = Date()
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "K:mm";
    let stringDate = timeFormatter.string(from: time)
    return stringDate
}
