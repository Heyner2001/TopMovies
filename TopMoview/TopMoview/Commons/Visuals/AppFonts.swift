//
//  AppFonts.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import UIKit

enum FontWeidth: String {
    case light = " Light"
    case regular = ""
    case bold = " Bold"
}

extension UIFont {
    static func elegantTypeWriterFont(weidth: FontWeidth, size: CGFloat) -> UIFont? {
        UIFont(name: "ELEGANT TYPEWRITER\(weidth.rawValue)", size: size)
    }
}
