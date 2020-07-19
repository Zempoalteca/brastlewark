//
//  UIFontExtension.swift
//  Brastlewark
//
//  Created by Gabriel Z on 19/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import UIKit

// MARK: - UIFont extension
extension UIFont {

    class func getExoRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Exo2-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }

}
