//
//  DataExtension.swift
//  Brastlewark
//
//  Created by Gabriel Z on 19/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import UIKit

extension Data {

    /// Check if data is an image, and compress it to specified value
    /// - Parameter compressionQuality: quaity to compress
    /// - Returns: Data representation of an image compressed
    func resizeImageData(compressionQuality: CGFloat) -> Data? {
        guard let image = UIImage(data: self) else {
            return nil
        }
        return image.jpegData(compressionQuality: compressionQuality)
    }

}
