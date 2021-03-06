//
//  PostCell.swift
//  LifeStories
//
//  Created by Alexey on 24.07.2021.
//

import UIKit

typealias buttonTappedBlock = (_ button:UIButton) -> Void

class PostCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shortTextLabel: UILabel!
    @IBOutlet weak var btnShowText: UIButton!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timePostLabel: UILabel!
    
    @IBOutlet weak var shortTextLabelHeight: NSLayoutConstraint!
    
    let font = UIFont(name: "HelveticaNeue", size: 14)
    var height: CGFloat = 0
    var btnShowTextTapped : buttonTappedBlock!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStyleCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupStyleCell() {
        self.backgroundColor = .white
        self.selectionStyle = .none
        
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        titleLabel.tintColor = .black
        
        shortTextLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        shortTextLabel.shadowColor = .clear
        shortTextLabel.tintColor = .black
        shortTextLabel.numberOfLines = 2
        shortTextLabel.layer.borderColor = UIColor.red.cgColor
        shortTextLabel.layer.borderWidth = 1
        
        
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
        if  shortTextLabel.numberOfLines == 2 {
            shortTextLabel.numberOfLines = 0
            shortTextLabel.sizeToFit()
            
            shortTextLabelHeight.constant = shortTextLabel.frame.height
            
            btnShowText.setTitle("Скрыть", for: .normal)
        } else {
            shortTextLabel.numberOfLines = 2
            btnShowText.setTitle("Показать полностью", for: .normal)
        }
        
        if btnShowTextTapped != nil {
            btnShowTextTapped(sender )
        }
        
    }
}
