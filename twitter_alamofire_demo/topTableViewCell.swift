//
//  topTableViewCell.swift
//  twitter_alamofire_demo
//
//  Created by Samba on 3/7/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class topTableViewCell: UITableViewCell {
    
    @IBOutlet weak var time_stmp: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenNamre: UILabel!
    @IBOutlet weak var profView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var tweet: Tweet! {
        didSet {
            refreshData()
        }
    }
    func refreshData(){
        tweetTextLabel.text = tweet.text
        profView.af_setImage(withURL: tweet.user.profilePicutreUrl)
        username.text = tweet.user.name
        screenNamre.text = tweet.user.screenName
        time_stmp.text = tweet.createdAtString
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
