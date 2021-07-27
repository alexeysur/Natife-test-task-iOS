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
    var isHiddenButtonInCell = false
    
    private let jsonParser = JSONParser()
    let apiConfig = APIConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupStyle()
   }
    
    func setupTableView() {
        let nib = UINib.init(nibName: "PostCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        tableView.allowsSelectionDuringEditing = false
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
        
        tableView.backgroundColor = UIColor.init(red: 221/255, green: 221/255, blue: 221/255)
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
      //  parseStoryFromJSON()
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
    }
    
    @IBAction func sortByRatingTapped(_ sender: Any) {
    }
    
    private func getPosts() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
   //     let jsonURL = apiConfig.fetchURL(with: .posts, parameter: 0)
  //      print("url = \(jsonURL!)")
      
        let url: URL = URL(string: "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/main.json")!
        
        jsonParser.downloadData(of: ShortPost.self, from: url) { (result) in
               switch result {
               case .failure(let error):
                   if error is DataError {
                       print("DataError = \(error)")
                   } else {
                       print(error.localizedDescription)
                   }
               case .success(let jsonResult):
                DispatchQueue.main.async {
                    self.stories = jsonResult
                    self.activityIndicator.isHidden = true
                    self.activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                     
                }
                   
               }
               
           }

    }
    
    
    private func parseStoryFromJSON() {
        guard let path = Bundle.main.url(forResource: "feedPosts", withExtension: "json") else {
            print("Error finding JSON file")
            return
        }
        do {
            let data = try Data(contentsOf: path)
            let decoder = JSONDecoder()
            let jsonResult = try decoder.decode(ShortPosts.self, from: data)
      
            
            stories = jsonResult.shortPosts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        } catch {
            print("Error while decoding JSON")
        }
        
    }
    
   
    
}

extension UINavigationBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 60)
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "storyViewController", sender: indexPath)
        
    }
    
//    private func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = stories[indexPath.section].title
        cell.shotTextLabel.text = stories[indexPath.section].previewText
        cell.likeCountLabel.text = String(stories[indexPath.section].likesCount)
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.clipsToBounds = true
        
        if cell.shotTextLabel.maxNumberOfLines == 1 {
            cell.btnShowText.isHidden = true
            isHiddenButtonInCell = true
       //     cell.shotTextLabel.heightAnchor.constraint(equalToConstant: 16) = true
            cell.btnShowText.sizeToFit()
            cell.layoutIfNeeded()
        } else {
            cell.btnShowText.isHidden = false
            isHiddenButtonInCell = false
        }
 //       print(String(indexPath.section) + ", lines = " + String(cell.shotTextLabel.maxNumberOfLines))
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isHiddenButtonInCell {
            return 118
        } else {
        return 189
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
}
