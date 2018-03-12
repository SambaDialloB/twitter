//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Samba on 3/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var screenname: UILabel!
    
    @IBOutlet weak var num_fi: UILabel!
    @IBOutlet weak var num_fol: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var num_tweets: UILabel!
    @IBOutlet weak var profImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        backImage.af_setImage(withURL: User.current!.coverPictureUrl)
        profImage.af_setImage(withURL:User.current!.profilePicutreUrl)
        profImage.clipsToBounds = true
        username.text = User.current!.name
        screenname.text = User.current!.screenName
        desc.text = User.current!.desc
        num_tweets.text = String(User.current!.num_tweets)
        num_fol.text = "\(User.current?.num_fol  ?? 0)"
        num_fi.text = "\(User.current?.num_fi  ?? 0)"
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
