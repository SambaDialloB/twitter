//
//  bottomTableViewCell.swift
//  twitter_alamofire_demo
//
//  Created by Samba on 3/7/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class bottomTableViewCell: UITableViewCell {

    @IBOutlet weak var fav_btn: UIButton!
    @IBOutlet weak var ret_btn: UIButton!
    @IBOutlet weak var rep_btn: UIButton!
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
        if(tweet.favorited)!{
            fav_btn.setImage(#imageLiteral(resourceName: "favor-icon-red"), for: .normal)
        }
        else{
            fav_btn.setImage(#imageLiteral(resourceName: "favor-icon"), for: .normal)
        }
        if(tweet.retweeted){
            ret_btn.setImage(#imageLiteral(resourceName: "retweet-icon-green"), for: .normal)
        }
        else{
            ret_btn.setImage(#imageLiteral(resourceName: "retweet-icon"), for: .normal)
        }
    }
    @IBAction func reply(_ sender: Any) {
        print("is there a reply endpoint?")
    }
    @IBAction func retweet(_ sender: Any) {
        if(tweet.retweeted == false){
            tweet.retweeted = true
            tweet.retweetCount += 1
            refreshData()
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error retweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully retweeted the following Tweet: \n\(tweet.text)")
                }
            }
        }
        else{
            tweet.retweeted = false
            tweet.retweetCount -= 1
            refreshData()
            APIManager.shared.untweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unret tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unret the following Tweet: \n\(tweet.text)")
                }
            }
        }
    }
    @IBAction func liggityLike(_ sender: Any) {
        if(tweet.favorited == false){
            tweet.favorited = true
            tweet.favoriteCount! += 1
            refreshData()
            APIManager.shared.favorite( with: tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        else{
            tweet.favorited = false
            tweet.favoriteCount! -= 1
            refreshData()
            APIManager.shared.unfavorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfav tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfav the following Tweet: \n\(tweet.text)")
                }
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
