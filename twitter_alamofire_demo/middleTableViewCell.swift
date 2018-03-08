//
//  middleTableViewCell.swift
//  twitter_alamofire_demo
//
//  Created by Samba on 3/7/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class middleTableViewCell: UITableViewCell {

    @IBOutlet weak var fav_cnt: UILabel!
    @IBOutlet weak var ret_cnt: UILabel!
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
       
        ret_cnt.text = "\(tweet.retweetCount)"
        fav_cnt.text = "\(tweet.favoriteCount!)"
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
