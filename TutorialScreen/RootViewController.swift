//
//  RootViewController.swift
//  TutorialScreen
//
//  Created by Jony on 01/07/19.
//  Copyright © 2019 Jony. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
   
    var pageViewController: UIPageViewController?
    var arrPageTitles : [Any] = []
    var arrPageImages : [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.navigationController?.isNavigationBarHidden = true
//        arrPageTitles = ["This is The App Guruz", "This is Table Tennis 3D", "This is Hide Secrets"]
        arrPageTitles = ["Tutorial Screen One", "Tutorial Screen Two", "Tutorial Screen Three"]
        arrPageImages = ["1.jpg", "2.jpg", "3.jpg"]     // this will not be display because image view is hidden in story board.
        
        initializingUIPageViewController()
        
    }

    func initializingUIPageViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        pageViewController = storyboard.instantiateViewController(withIdentifier: "PageViewController") as! PageViewController
        
        let startingViewController = orderedViewControllers(index: 0)
        let viewControllers = [startingViewController]
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController?.setViewControllers(viewControllers.compactMap { $0 }, direction: .forward, animated: false)
        pageViewController?.dataSource = self
        
//        let subviews = pageViewController?.view.subviews
//        var thisControl: UIPageControl? = nil
//        for i in 0..<subviews!.count {
//            if (subviews![i] is UIPageControl) {
//                thisControl = subviews![i] as? UIPageControl
//            }
//        }
//
//        thisControl?.isHidden = true
//        pageViewController?.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height + 40)

        pageViewController?.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height + 37 )
        addChild(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController?.view.frame = view.bounds        // Issue here for showing bottom space, if we reomve then dot not showing
        pageViewController?.didMove(toParent: self)
        
        // Add the page view controller's gesture recognizers to the view controller's view so that the gestures are started more easily.
        view.gestureRecognizers = pageViewController?.gestureRecognizers
    }
    
    
    // MARK: - UIPageViewController Data Source Metohds
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as? TutorialViewController)?.pageIndex
        if (index == 0) || (index == NSNotFound) {
            return nil
        }

        index = (index ?? 0) - 1
        return orderedViewControllers(index: index!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as? TutorialViewController)?.pageIndex
        if index == NSNotFound {
            return nil
        }
        index = (index ?? 0) + 1
        if index == arrPageTitles.count {
            return nil
        }
        return orderedViewControllers(index: index!)
    }
    
    // MARK: -  Other Methods
    func orderedViewControllers(index: Int) -> TutorialViewController? {
        if (arrPageTitles.count == 0) || (index >= arrPageTitles.count) {
            return nil
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tutorialOneViewController = storyboard.instantiateViewController(withIdentifier: "TutorialViewController") as! TutorialViewController
        tutorialOneViewController.imgFile = arrPageImages[index] as! String
        tutorialOneViewController.lblTitle = arrPageTitles[index] as! String
        tutorialOneViewController.pageIndex = index
        return tutorialOneViewController
    }
   
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrPageTitles.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

}

