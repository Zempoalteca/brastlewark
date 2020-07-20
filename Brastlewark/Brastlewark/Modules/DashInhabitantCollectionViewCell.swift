//
//  DashInhabitantCollectionViewCell.swift
//  Brastlewark
//
//  Created by Gabriel Z on 18/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import UIKit

class DashInhabitantCollectionViewCell: UICollectionViewCell {

    // MARK: - Identifier

    static let identifier: String = "DashInhabitantCollectionViewCell"

    // MARK: - IBOutlets

    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMoreInfo: UILabel!

    // MARK: - Functions

    func configure() {
        container.layer.cornerRadius = 5
    }

    func setInfo(for inhabitant: Inhabitant) {
        lblName.text = inhabitant.name
        lblMoreInfo.text = "dshbrd_lbl_age".localized + String(inhabitant.ageInhabitant)
        if let thumbnail = inhabitant.image {
            imgThumbnail.image = UIImage(data: thumbnail)
        } else {
            imgThumbnail.image = nil
        }
    }

    func setThumbnail(data: Data?) {
        if let dataInfo = data {
            imgThumbnail.image = UIImage(data: dataInfo)
        }
    }

}
