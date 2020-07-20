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
    @IBOutlet weak var loadingView: AnimationView!

    // MARK: - Variables
    private var viewModel: DashboardViewModel = DashboardViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initComponents()
    }

    // MARK: - Functions

    private func initComponents() {
        title = Utils.nameApp
        loadingView.play()
        loadingView.loopMode = .loop
        loadingView.isHidden = true
        configureCollectionView()
        viewModel.showLoader = showLoaderinView
        viewModel.hideLoader = hideLoaderInView
        viewModel.reloadInfo = reloadInfoInCollection
        viewModel.fetchInhabitants()
    }

    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: DashInhabitantCollectionViewCell.identifier,
                                      bundle: .main),
                                forCellWithReuseIdentifier: DashInhabitantCollectionViewCell.identifier)
    }

    private func showLoaderinView() {
        // Show loader view
        loadingView.isHidden = false
    }

    private func hideLoaderInView() {
        // Hide loade view
        loadingView.isHidden = true
    }

    private func reloadInfoInCollection() {
        collectionView.reloadData()
    }

    // MARK: - Actions

}
// MARK: Extensions
extension DashboardViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.getSizeInhabitants()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DashInhabitantCollectionViewCell.identifier,
            for: indexPath) as? DashInhabitantCollectionViewCell else {
                return UICollectionViewCell()
        }
        cell.configure()
        let inhabitant = viewModel.arrayInhabitants[indexPath.row]
        cell.setInfo(for: inhabitant)
        if inhabitant.image == nil {
            viewModel.downloadThumbnail(path: inhabitant.thumbnail) { [weak self] imageData in
                self?.viewModel.arrayInhabitants[indexPath.row].image =
                    imageData?.resizeImageData(compressionQuality: 0.1)
                cell.setThumbnail(data: imageData)
            }
        }
        return cell
    }

}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.width - 20) / 2
        return CGSize(width: width, height: 150)
    }

}

extension DashboardViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        let controller = DetailInhabitantViewController()
        controller.inhabitant = viewModel.arrayInhabitants[indexPath.row]
        self.navigationController?.pushViewController(controller,
                                                      animated: true)
    }

}
