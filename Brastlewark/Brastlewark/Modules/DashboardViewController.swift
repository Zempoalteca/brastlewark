//
//  DashboardViewController.swift
//  Brastlewark
//
//  Created by Gabriel Z on 18/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import UIKit
import Lottie

class DashboardViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Variables

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initComponents()
    }

    // MARK: - Functions
    private func initComponents() {
        title = "Brastlewark"
    }

    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.register(<#T##nib: UINib?##UINib?#>, forCellWithReuseIdentifier: <#T##String#>)
    }

    // MARK: - Actions

}
// MARK: Extensions
extension DashboardViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

}

extension DashboardViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        print("Tapped!")
    }

}
