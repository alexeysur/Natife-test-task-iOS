//
//  FeedViewController.swift
//  LifeStories
//
//  Created by Alexey on 24.07.2021.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStyle()
   }
    
    func setupStyle() {
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        self.navigationController?.title = "Главная"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
    }
 

}

extension UINavigationBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 60)
    }
}
