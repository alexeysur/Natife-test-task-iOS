//
//  FeedViewController.swift
//  LifeStories
//
//  Created by Alexey on 24.07.2021.
//

import UIKit

class FeedViewController: UIViewController {
   
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    let cellIdentifier = "Cell"
    var stories: [ShortPost] = []
    var expandedIndexSet: IndexSet = []
    var isHiddenButtonInCell = false
    
    
    private let jsonParser = JSONParser()
    private let apiConfig = APIConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupStyle()
        
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
                } else {
                    activityIndicator.style = .gray
                }
   }
    
    func setupTableView() {
        let nib = UINib.init(nibName: "PostCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        getPosts()
    }
    
    func setupStyle() {
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        
        self.navigationController?.title = "Главная"
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        tableView.backgroundColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let storyVC = segue.destination as? StoryViewController, let index = tableView.indexPathForSelectedRow?.section else {
            return
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        print("postID = \(stories[index].postId)")
        storyVC.postID = stories[index].postId
    }
    
    @IBAction func sortByDateTapped(_ sender: Any) {
        stories.sort { $0.timeshamp < $1.timeshamp }
        tableView.reloadData()
    }
    
    @IBAction func sortByRatingTapped(_ sender: Any) {
        stories.sort { $0.likesCount < $1.likesCount }
        tableView.reloadData()
    }
    
    private func getPosts() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        let jsonURL = apiConfig.fetchURL(with: .posts, parameter: 0)
      
        jsonParser.downloadData(of: ShortPosts.self, from: jsonURL!) { (result) in
               switch result {
                   case .failure(let error):
                       if error is DataError {
                           print("DataError = \(error)")
                       } else {
                           print(error.localizedDescription)
                       }
                   case .success(let jsonResult):
                    DispatchQueue.main.async {
                        self.stories = jsonResult.posts
                        self.activityIndicator.isHidden = true
                        self.activityIndicator.stopAnimating()
                        self.tableView.reloadData()
                    }
                  
              }
           }
   }

}
    

