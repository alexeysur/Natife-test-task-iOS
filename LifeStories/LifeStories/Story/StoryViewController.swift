//
//  StoryViewController.swift
//  LifeStories
//
//  Created by Alexey on 24.07.2021.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var titleStoryLabel: UILabel!
    @IBOutlet weak var storyTextView: UITextView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timePostLabel: UILabel!
    
    var post: FullPost?
    var postID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupNavigationStyle()
        setupStyle()
    }
    
    private func setupNavigationStyle() {
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        self.navigationController?.title = "Text"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
     
    }
    
    private func setupStyle() {
      
        titleStoryLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        titleStoryLabel.tintColor = .black
        
        storyTextView.font = UIFont(name: "HelveticaNeue", size: 14)
        storyTextView.tintColor = .black
        storyTextView.layer.borderColor = UIColor.red.cgColor
        storyTextView.layer.borderWidth = 1
        
        likeCountLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        likeCountLabel.tintColor = .black
        
        timePostLabel.font = UIFont(name: "HelveticaNeue", size: 10)
        timePostLabel.tintColor = .black
    }
}
