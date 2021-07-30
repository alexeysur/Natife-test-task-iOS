//
//  StoryViewController.swift
//  LifeStories
//
//  Created by Alexey on 24.07.2021.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleStoryLabel: UILabel!
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timePostLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var storyTextViewHeight: NSLayoutConstraint!
    @IBOutlet weak var titleStoryLabelHeight: NSLayoutConstraint!
    

    let cellIdentifier = "imageCell"
    
    var fullPost: FullPost?
    var postID: Int = 0
    let jsonParser = JSONParser()
    let apiConfig = APIConfig()
    var postImages: [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyTextView.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImagePost", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        self.collectionView.isHidden = false
        getFullPost()
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
     
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton
    }
    
    private func getFullPost() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        let jsonURL = apiConfig.fetchURL(with: .postID, parameter: postID)
        print("url = \(jsonURL!)")
      
        jsonParser.downloadData(of: FullPosts.self, from: jsonURL!) { (result) in
               switch result {
                   case .failure(let error):
                       if error is DataError {
                           print("DataError = \(error)")
                       } else {
                           print(error.localizedDescription)
                       }
                   case .success(let jsonResult):
                    DispatchQueue.main.async {
                        self.fullPost = jsonResult.post
                       
                        self.title = jsonResult.post.title
                        self.titleStoryLabel.text = jsonResult.post.title
                        self.storyTextView.text = jsonResult.post.text
                        self.likeCountLabel.text = String(jsonResult.post.likesCount)
                        self.timePostLabel.text = jsonResult.post.timeshamp.toDate()
                        
                        self.textViewChange(arg : self.storyTextView)
                        
                        if jsonResult.post.images.isEmpty {
                            self.collectionView.isHidden = true
                        } else {
                            self.collectionView.isHidden = false
                        }
                        
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                      
                    }
                  
              }
           }
    }
    
    func textViewChange(arg : UITextView) {
            arg.translatesAutoresizingMaskIntoConstraints = true
            arg.sizeToFit()
            arg.isScrollEnabled = false

            let calHeight = arg.frame.size.height
            arg.frame = CGRect(x: 32, y: 75, width: self.view.frame.size.width - 32, height: calHeight)
    }
    
    private func setupStyle() {
        titleStoryLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        titleStoryLabel.tintColor = .black
        
        storyTextView.font = UIFont(name: "HelveticaNeue", size: 14)
        storyTextView.tintColor = .black
        storyTextView.layer.borderColor = UIColor.red.cgColor
        storyTextView.layer.borderWidth = 1
        
        storyTextView.isScrollEnabled = false
        
        likeCountLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        likeCountLabel.tintColor = .black
        
        timePostLabel.font = UIFont(name: "HelveticaNeue", size: 10)
        timePostLabel.tintColor = .black
    }
}

extension StoryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        storyTextViewHeight.constant = storyTextView.contentSize.height + 10
        print(storyTextView.contentSize.height)
    }
}
