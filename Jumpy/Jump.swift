//
//  JumpValue.swift
//  Jumpy
//
//  Created by Eddie Kaiger on 6/17/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import Foundation

enum Jump: String {
    case upShort = "UpShort"
    case downShort = "DownShort"
    case upLong = "UpLong"
    case downLong = "DownLong"

    static var shortValue: Int = 10
    static var longValue: Int = 20
}
