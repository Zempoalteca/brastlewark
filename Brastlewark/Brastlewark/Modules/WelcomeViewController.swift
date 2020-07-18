//
//  WelcomeViewController.swift
//  Brastlewark
//
//  Created by Gabriel Z on 18/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import UIKit
import Lottie

class WelcomeViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var trollingView: AnimationView!
    @IBOutlet weak var wavesView: AnimationView!
    @IBOutlet weak var lblWelcome: UILabel!

    // MARK: - Variables

    var animationView: AnimationView?
    var backgroundWaves: AnimationView?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initComponents()
    }

    // MARK: - Functions

    private func initComponents() {
        lblWelcome.text = "wlcm_title".localized
        trollingView.play()
        trollingView.loopMode = .loop
        backgroundWaves?.play()
        backgroundWaves?.loopMode = .loop
    }

}
