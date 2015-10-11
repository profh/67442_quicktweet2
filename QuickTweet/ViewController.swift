//
//  ViewController.swift
//  QuickTweet
//
//  Created by Larry Heimann on 10/11/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

  @IBOutlet weak var accountName: UITextField!
  @IBOutlet weak var twitterWebView: UIWebView!
  
  var account: String?
  var url = NSURL (string:"http://www.twitter.com/profh")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func sendTweet(sender: UIButton) {
    if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
      let tweetVC = SLComposeViewController (forServiceType: SLServiceTypeTwitter)
      tweetVC.setInitialText(
        "Testing a twitter app for 67-442")
      self.presentViewController(tweetVC, animated: true, completion: nil)
    } else {
      println ("Can't send tweet")
    }
  }
  
  @IBAction func setAccount() {
    if accountName != nil {
      account = accountName.text
      println(account!)
      url = NSURL (string:"http://www.twitter.com/\(account!)")
    }
  }
  
  @IBAction func showTweets(sender: UIButton) {
    let urlRequest = NSURLRequest (URL: url!)
    twitterWebView.loadRequest(urlRequest)
  }

}

