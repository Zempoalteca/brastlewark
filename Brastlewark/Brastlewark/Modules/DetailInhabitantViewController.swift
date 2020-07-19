//
//  DetailInhabitantViewController.swift
//  Brastlewark
//
//  Created by Gabriel Z on 19/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import UIKit
import Lottie

class DetailInhabitantViewController: UIViewController {

    // MARK: - Architecture Properties
    private var viewModel = DetaitInhabitantViewModel()

    // MARK: - IBOutlets
    @IBOutlet weak var imgInhabitant: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblHairColor: UILabel!
    @IBOutlet weak var loadingView: AnimationView!
    @IBOutlet weak var stackViewHabilities: UIStackView!
    @IBOutlet weak var lblTitleSkills: UILabel!
    @IBOutlet weak var stackViewFriends: UIStackView!
    @IBOutlet weak var lbltitleFiends: UILabel!

    // MARK: - Variables
    var inhabitant: Inhabitant?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponents()
    }

    // MARK: - Functions
    private func initComponents() {
        loadingView.play()
        loadingView.loopMode = .loop
        guard let infoInhabitant = inhabitant else {
            return
        }
        lblName.text = infoInhabitant.name
        lblAge.text = "Age: \(infoInhabitant.ageInhabitant)"
        lblWeight.text = "\(infoInhabitant.weight)"
        lblHeight.text = "\(infoInhabitant.height)"
        lblHairColor.text = infoInhabitant.hairColor
        lblTitleSkills.text = "Professions"
        lbltitleFiends.text = "Amigos"
        stackViewHabilities.isHidden = infoInhabitant.professions.isEmpty
        infoInhabitant.professions.forEach({
            stackViewHabilities.addArrangedSubview(createNewLabel(text: $0))
        })
        stackViewFriends.isHidden = infoInhabitant.friends.isEmpty
        infoInhabitant.friends.forEach({
            stackViewFriends.addArrangedSubview(createNewLabel(text: $0))
        })
        configureViewModel(inhabitant: infoInhabitant)
    }

    private func configureViewModel(inhabitant: Inhabitant) {
        viewModel.showLoader = showLoaderInView
        viewModel.hideLoader = hideLoderInView
        viewModel.setImage = setImageInhabitant(data:)
        viewModel.fetchImage(path: inhabitant.thumbnail)
    }

    private func showLoaderInView() {
        loadingView.isHidden = false
    }

    private func hideLoderInView() {
        loadingView.isHidden = true
    }

    private func setImageInhabitant(data: Data?) {
        if let imageData = data {
            imgInhabitant.image = UIImage(data: imageData)
        }
    }

    private func createNewLabel(text: String) -> UILabel {
        let newLabel = UILabel()
        newLabel.font = UIFont.getExoRegular(size: 17)
        newLabel.text = text
        newLabel.adjustsFontSizeToFitWidth = true
        return newLabel
    }

}
