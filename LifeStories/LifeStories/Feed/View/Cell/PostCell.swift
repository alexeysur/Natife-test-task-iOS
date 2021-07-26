//
//  PostCell.swift
//  LifeStories
//
//  Created by Alexey on 24.07.2021.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shotTextLabel: UILabel!
    @IBOutlet weak var btnShowText: UIButton!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timePostLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyleCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupStyleCell() {
        self.backgroundColor = .white
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        titleLabel.tintColor = .black
        
        shotTextLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        shotTextLabel.shadowColor = .clear
        shotTextLabel.tintColor = .black
        shotTextLabel.numberOfLines = 2
        shotTextLabel.layer.borderColor = UIColor.red.cgColor
        shotTextLabel.layer.borderWidth = 1
        
        
        btnShowText.backgroundColor = .black
        btnShowText.setTitle("Показать полностью", for: .normal)
        btnShowText.tintColor = .white
        btnShowText.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14)
        
        likeCountLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        likeCountLabel.tintColor = .black
        
        timePostLabel.font = UIFont(name: "HelveticaNeue", size: 10)
        titleLabel.tintColor = .black
    }
    
    @IBAction func btnShowTextTapped(_ sender: UIButton) {
    }
}
