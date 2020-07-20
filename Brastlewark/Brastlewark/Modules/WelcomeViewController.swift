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

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initComponents()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.goToDashboard()
            }
        }
    }

    // MARK: - Functions

    private func initComponents() {
        lblWelcome.text = "wlcm_title".localized
        trollingView.play()
        trollingView.loopMode = .loop
        wavesView?.play()
        wavesView?.loopMode = .loop
    }

}
