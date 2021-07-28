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
    
    var fullPost: FullPost?
    var postID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPost()
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
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
     
   //     let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
  //      navigationItem.backBarButtonItem = backBarButton
        
    }
    
    private func setupPost() {
        guard let path = Bundle.main.url(forResource: "post112", withExtension: "json") else {
            print("Error finding JSON file")
            return
        }
        do {
            let data = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            let jsonResult = try decoder.decode(FullPost.self, from: data)

            fullPost = jsonResult
            DispatchQueue.main.async {
                self.titleStoryLabel.text = self.fullPost?.title
                self.storyTextView.text = self.fullPost?.text
  //              self.likeCountLabel.text = String(fullPost?.likesCount)
                self.timePostLabel.text = self.fullPost?.timeshamp.toDate()
            }
       
        } catch {
            print("Error while decoding JSON")
        }

        
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
