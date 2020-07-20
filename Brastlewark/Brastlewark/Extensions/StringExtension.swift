//
//  StringExtension.swift
//  Brastlewark
//
//  Created by Gabriel Z on 18/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import Foundation

extension String {

    /// Use to simplify the localized call.
    /// The string to use must be the key on Localizable file.
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

}
