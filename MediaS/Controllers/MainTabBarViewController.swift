//
//  TabBarController.swift
//  MediaS
//
//  Created by Nikolai Eremenko on 28.06.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let imagesVC = ImagesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let favoritesVC = FavoritesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        viewControllers = [
            generateNavigationController(rootViewController: imagesVC, title: "Изображения", image: UIImage(systemName: "photo")!),
            generateNavigationController(rootViewController: favoritesVC, title: "Избранное", image: UIImage(systemName: "star")!)
        ]
    }

    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
