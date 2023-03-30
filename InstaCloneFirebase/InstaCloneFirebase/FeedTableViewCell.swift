//
//  FeedTableViewCell.swift
//  InstaCloneFirebase
//
//  Created by Zeliha Uslu on 30.03.2023.
//

import UIKit
import Firebase

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var documentIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func likeButtonClicked(_ sender: Any) {
        let fireStoreDatabase = Firestore.firestore()
                
                if let likeCount = Int(likeLabel.text!) {
                    
                    let likeStore = ["likes" : likeCount + 1] as [String : Any]
                    
                    //update
                    fireStoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)

                }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
