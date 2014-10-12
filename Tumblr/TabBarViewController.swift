//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Corin Nader on 10/9/14.
//  Copyright (c) 2014 Corin Nader. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController{
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var tooltipImage: UIImageView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
       
    var isPresenting: Bool = true

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Custom tab controller
        // Main storyboard (nil is default bundle) gives you the storyboard object, handle to things inside
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        containerView.addSubview(homeViewController.view)
        homeButton.selected = true
        
        // Bounce tooltip
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: { () -> Void in
            self.tooltipImage.transform = CGAffineTransformMakeTranslation(0, 5)
            }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = destinationVC as ComposeViewController
        
    }

    
    @IBAction func onHomeButton(sender: UIButton) {
        containerView.addSubview(homeViewController.view)
        homeViewController.view.frame = containerView.frame
        homeButton.selected = true
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        toolTipShow()
    }
    
    @IBAction func onSearchButton(sender: UIButton) {
        containerView.addSubview(searchViewController.view)
        searchViewController.view.frame = containerView.frame
        homeButton.selected = false
        searchButton.selected = true
        accountButton.selected = false
        trendingButton.selected = false
        toolTipShow()
    }

    
    @IBAction func onAccountButton(sender: UIButton) {
        containerView.addSubview(accountViewController.view)
        accountViewController.view.frame = containerView.frame
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = true
        trendingButton.selected = false
        toolTipShow()
    }
    
    @IBAction func onTrendingButton(sender: UIButton) {
        containerView.addSubview(trendingViewController.view)
        trendingViewController.view.frame = containerView.frame
        trendingButton.selected = true
        searchButton.selected = false
        accountButton.selected = false
        homeButton.selected = false
        toolTipShow()
        
    }

    
    @IBAction func onComposeButton(sender: UIButton) {
        performSegueWithIdentifier("composeSegue", sender: self)
        
    }
    
    func toolTipShow(){
        if searchButton.selected == false{
            tooltipImage.hidden = false
        }else{
            tooltipImage.hidden = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
