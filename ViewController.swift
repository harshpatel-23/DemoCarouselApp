//
//  ViewController.swift
//  DemoCarouselApp
//
//  Created by harsh patel on 22/11/16.
//  Copyright © 2016 harsh patel. All rights reserved.
//

import UIKit

class ProjectPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        dataSource = self
        
        //setting internal view controllers for PageViewController.
        let frameViewController = FrameViewController()
        frameViewController.imageName = imageNames.first
        let viewControllers = [frameViewController]
        setViewControllers(viewControllers, direction: .Forward, animated: true, completion: nil)
    }
    
    let imageNames = ["BAPS_SwamiNarayan_1","BAPS_Swaminarayan_2","baps1","Jay-Swaminarayan-bhagwan"]
    
    // AterViewController for getting images as we swipe right.
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        // get the index value of image.
        let currentImageName = (viewController as! FrameViewController).imageName
        let currentIndex = imageNames.indexOf(currentImageName!)
        
        // check if the index value is greater then number of images in array.
        if currentIndex < imageNames.count - 1 {
            let frameViewController = FrameViewController()
            frameViewController.imageName = imageNames[currentIndex! + 1]
            return frameViewController
        }
        return nil
    }
    
    // BeforeViewController for getting images as we swipe left.
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
       
        // get the index value of image.
        let currentImageName = (viewController as! FrameViewController).imageName
        let currentIndex = imageNames.indexOf(currentImageName!)
        
        // check if the index value is greater then number of images in array.
        if currentIndex > 0 {
            let frameViewController = FrameViewController()
            frameViewController.imageName = imageNames[currentIndex! - 1]
            return frameViewController
        }
        return nil
    }
    
}

class FrameViewController: UIViewController {
    
    // will set the image name for frameViewController.
    var imageName: String? {
        didSet {
            imageView.image = UIImage(named: imageName!)
        }
    }
    
    
    //creating 
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .ScaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting background color to white for the screen.
        view.backgroundColor = UIColor.whiteColor()
        
        //adding imageview to root view.
        view.addSubview(imageView)
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageView]))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}