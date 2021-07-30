//
//  FeedViewController+DataSource.swift
//  LifeStories
//
//  Created by Alexey on 30.07.2021.
//

import UIKit

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
        cell.shortTextLabel.text = stories[indexPath.section].previewText
        cell.likeCountLabel.text = String(stories[indexPath.section].likesCount)
        cell.timePostLabel.text = stories[indexPath.section].timeshamp.toDate() + " минут назад"
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.clipsToBounds = true
        
        
//        cell.btnShowTextTapped = { (button:UIButton) -> Void in
//            tableView.reloadRows(at: [indexPath], with: .none)
//        }
        
        
        if cell.shortTextLabel.maxNumberOfLines == 1 {
            cell.btnShowText.isHidden = true
            isHiddenButtonInCell = true
            cell.btnShowText.sizeToFit()
            cell.layoutIfNeeded()
        } else {
            cell.btnShowText.isHidden = false
            isHiddenButtonInCell = false
        }
   //            print(String(indexPath.section) + ", lines = " + String(cell.shortTextLabel.maxNumberOfLines))
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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

