//
//  MainTabBarController.swift
//  PhotoGallery
//
//  Created by Зайнал Гереев on 23.10.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())

        
        viewControllers = [
            generateNavigationViewController(rootViewController: photosVC, titleVC: "Photos"),
            generateNavigationViewController(rootViewController: ViewController(), titleVC: "View"),
        ]
    }
    
    private func generateNavigationViewController(rootViewController: UIViewController, titleVC: String/*, imageName: String*/) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = titleVC
        //navigationVC.tabBarItem.image = UIImage(named: imageName) просто лень искать иконки
        return navigationVC
    }
    
}
