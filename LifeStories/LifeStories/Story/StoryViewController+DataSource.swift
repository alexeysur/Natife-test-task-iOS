//
//  StoryViewController+DataSource.swift
//  LifeStories
//
//  Created by Alexey on 29.07.2021.
//

import UIKit

extension StoryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ImagePost else {
            return UICollectionViewCell()
        }
        
        let urlString = fullPost?.images[indexPath.row]
        cell.activityIndicator.startAnimating()
        cell.activityIndicator.isHidden = false
        
        jsonParser.fetchImage(from: urlString!) { (imageData, error) in
            if let data = imageData {
                DispatchQueue.main.async {
                    cell.imageView.image = data
                    cell.imageView.contentMode = .scaleAspectFit
                    cell.activityIndicator.stopAnimating()
                    cell.activityIndicator.isHidden = true
                    print("image = \(indexPath.row)")
                }
            } else {
                cell.imageView.image = UIImage(named: "imagePlaceholder")
                cell.activityIndicator.stopAnimating()
                cell.activityIndicator.isHidden = true
            }
            
        }
        cell.imageView.image = postImages[indexPath.row]
        return cell
    }
    
}
