//
//  ComposeView.swift
//  twitter_alamofire_demo
//
//  Created by Samba on 3/8/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ComposeView: UIViewController,UITextViewDelegate {

    @IBOutlet weak var editText: UITextView!
    @IBOutlet weak var charLeft: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenname: UILabel!
    @IBOutlet weak var profView: UIImageView!
    
    
    weak var delegate: ComposeViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        charLeft.text = "140"
        editText.delegate = self
        username.text = User.current?.screenName
        screenname.text = User.current?.name
        profView.af_setImage(withURL: User.current!.profilePicutreUrl)
        profView.layer.cornerRadius = 35
        profView.clipsToBounds = true
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        charLeft.text = "\(characterLimit - newText.count)"
        // The new text should be allowed? True/False
        return newText.characters.count < characterLimit
    }
    @IBAction func postTweet(_ sender: Any) {
        if(editText.text.count > 140)
        {
            let alertController = UIAlertController(title: "Tweet Error", message: "Tweet character count limit exceeded", preferredStyle: .alert)
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else if(editText.text == ""){
            let alertController = UIAlertController(title: "Tweet Error", message: "Cant post empty tweet", preferredStyle: .alert)
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            APIManager.shared.composeTweet(with: editText.text) { (tweet, error) in
                if let error = error {
                    print("Error composing Tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    self.delegate?.did(post: tweet)
                    print("Compose Tweet Success!")
                }
            }
            dismiss(animated: true, completion: nil)
        }
        
    }
//    func textViewDidChange(_ textView: UITextView) {
//        if(textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || text.text.count < 140){
//            tweetButton.isUserInteractionEnabled = false
//            tweetButton.setTitleColor(UIColor.gray, for: .normal)
//        }
//        else{
//            tweetButton.isUserInteractionEnabled = true
//            tweetButton.setTitleColor(UIColor.white, for: .normal)
//        }
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
protocol ComposeViewControllerDelegate: NSObjectProtocol {
    func did(post: Tweet)
}
