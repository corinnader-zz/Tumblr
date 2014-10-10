//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Corin Nader on 10/9/14.
//  Copyright (c) 2014 Corin Nader. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var composeButton: UIButton!
    
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
        
        // Why? How do you know when to have as UIViewController?
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }

    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // TODO: animate the transition in Step 3 below
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
       
        if (isPresenting) {
             // Intro segue
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
             // Outro segue
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    } 

    
    @IBAction func onHomeButton(sender: UIButton) {
        containerView.addSubview(homeViewController.view)
        // Set the frame size of the children view controllers to be same size of the parent containerview
        homeViewController.view.frame = containerView.frame
    }
    
    @IBAction func onSearchButton(sender: UIButton) {
        containerView.addSubview(searchViewController.view)
        searchViewController.view.frame = containerView.frame
    }

    
    @IBAction func onAccountButton(sender: UIButton) {
        containerView.addSubview(accountViewController.view)
        accountViewController.view.frame = containerView.frame
    }
    
    @IBAction func onTrendingButton(sender: UIButton) {
        containerView.addSubview(trendingViewController.view)
        trendingViewController.view.frame = containerView.frame
    }
    
    @IBAction func onComposeButton(sender: UIButton) {
        performSegueWithIdentifier("composeSegue", sender: self)
        
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
