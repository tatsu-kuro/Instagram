//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by kuroda tatsuaki on 2018/02/07.
//  Copyright © 2018年 tatsuaki.kuroda. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    

    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var captionLabel_top: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        let all_caption = postData.caption!
        print("debug_setpostData ")
        if let indexn = all_caption.index(of: "\n") {
            print("debug_setpostData main")
            let indexnA = all_caption.index(indexn, offsetBy:1)
            let indexnB = all_caption.index(indexn, offsetBy:-1)
            self.captionLabel_top.text = "\(postData.name!) : \(all_caption[...indexnB])"
            self.captionLabel.text = "\(all_caption[indexnA...])"
        }else{
            print("debug_setpostData else ")
          self.captionLabel_top.text = "\(postData.name!) : \(postData.caption!)"
        }
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
}
