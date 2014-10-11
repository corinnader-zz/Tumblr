//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Corin Nader on 10/10/14.
//  Copyright (c) 2014 Corin Nader. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    @IBOutlet weak var composeView: UIView!
    @IBOutlet weak var textImage: UIImageView!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var quoteImage: UIImageView!
    @IBOutlet weak var linkImage: UIImageView!
    @IBOutlet weak var chatImage: UIImageView!
    @IBOutlet weak var videoImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onNevermindButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
        //Animate out icons
        UIView.animateWithDuration(0.7, animations: { () -> Void in
            self.textImage.transform = CGAffineTransformMakeTranslation( 0, -200)
        })
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.photoImage.transform = CGAffineTransformMakeTranslation( 0, -200)
        })
        
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.quoteImage.transform = CGAffineTransformMakeTranslation( 0, -200)
        })
        
        UIView.animateWithDuration(0.7, animations: { () -> Void in
            self.linkImage.transform = CGAffineTransformMakeTranslation( 0, -200)
        })
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.chatImage.transform = CGAffineTransformMakeTranslation( 0, -200)
        })
        
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.videoImage.transform = CGAffineTransformMakeTranslation( 0, -200)
        })

        
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
