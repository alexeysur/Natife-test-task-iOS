//
//  FeedViewController+Delegate.swift
//  LifeStories
//
//  Created by Alexey on 30.07.2021.
//

import UIKit

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "storyViewController", sender: indexPath)
    }
}

