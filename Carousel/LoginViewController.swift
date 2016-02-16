//
//  LoginViewController.swift
//  Carousel
//
//  Created by Vicki Tan on 2/15/16.
//  Copyright © 2016 Vicki Tan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    let alertController = UIAlertController(title: "Agh!", message: "You must enter an email and password", preferredStyle: .Alert)
    let alertController1 = UIAlertController(title: "Something's wrong", message: "Check your email and password", preferredStyle: .Alert)
    let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
    }

    
    @IBAction func didPressSignin(sender: AnyObject) {
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            presentViewController(alertController, animated: true) {
            }
        } else {
            activityIndicator.startAnimating()
            if emailField.text == "Vicki" && passwordField.text == "hello" {
                delay(2, closure: { () -> () in
                    self.activityIndicator.stopAnimating()
                    self.performSegueWithIdentifier("signinSegue", sender: nil)
                })
            } else {
                delay(2, closure: { () -> () in
                    self.activityIndicator.stopAnimating()
                    self.presentViewController(self.alertController1, animated: true) {
                    }
                })
            }
        }
    }

    func keyboardWillShow(notification: NSNotification) {
        print("keyboardWillShow")
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        scrollView.contentOffset.y = scrollView.contentInset.bottom
        }
    
    func keyboardWillHide(notification: NSNotification!) {
        func keyboardWillHide(notification: NSNotification) {
            buttonParentView.frame.origin.y = buttonInitialY
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alertController.addAction(cancelAction)
        alertController1.addAction(cancelAction)
        
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        func scrollViewDidScroll(scrollView: UIScrollView) {
            if scrollView.contentOffset.y <= -50 {
                view.endEditing(true)
            }
        }

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
