//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
class TweetCell: UITableViewCell {
    
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
    @IBOutlet weak var fav_btn: UIButton!
    @IBAction func favorite(_ sender: Any) {
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
    @IBOutlet weak var ret_btn: UIButton!
    @IBOutlet weak var profView: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenname: UILabel!
    @IBOutlet weak var fav_cnt: UILabel!
    @IBOutlet weak var time_stmp: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var ret_cnt: UILabel!
    
    var tweet: Tweet! {
        didSet {
            refreshData()
        }
    }
    func refreshData(){
        tweetTextLabel.text = tweet.text
        let url = URL(string: tweet.user.profilePicutreUrl)!
        profView.af_setImage(withURL: url)
        username.text = tweet.user.name
        screenname.text = tweet.user.screenName
        time_stmp.text = tweet.createdAtString
        ret_cnt.text = "\(tweet.retweetCount)"
        fav_cnt.text = "\(tweet.favoriteCount!)"
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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
