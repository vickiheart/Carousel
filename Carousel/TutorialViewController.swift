//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Vicki Tan on 2/15/16.
//  Copyright © 2016 Vicki Tan. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var takeaspinButton: UIButton!
    @IBOutlet weak var takeaspinImage: UIImageView!
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page : Int = Int(round(scrollView.contentOffset.x / 320))

        pageControl.currentPage = page
        
        if page == 3 {
            pageControl.hidden = true
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.takeaspinImage.alpha = 1
            })
        } else {
            pageControl.hidden = false
            takeaspinImage.alpha = 0
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        takeaspinImage.alpha = 0
        
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        

        // Do any additional setup after loading the view.
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
