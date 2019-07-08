//
//  TutorialViewController.swift
//  TutorialScreen
//
//  Created by Jony on 01/07/19.
//  Copyright © 2019 Jony. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    var pageIndex : Int = 0
    var imgFile   : String = ""
    var lblTitle  : String = ""
    
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var lblTitleTutorialScreenOne: UILabel!
    @IBOutlet weak var imgTutorialScreenOne: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("\(pageIndex)")
        
        if (pageIndex == 0) {
            lblTitleTutorialScreenOne.backgroundColor = UIColor.lightGray
        }
        if (pageIndex == 1) {
            lblTitleTutorialScreenOne.backgroundColor = UIColor.green
        }
        if (pageIndex == 2) {
            lblTitleTutorialScreenOne.backgroundColor = UIColor.white
            btnSkip.isHidden = true
        }
        imgTutorialScreenOne.image = UIImage(named: imgFile)
        lblTitleTutorialScreenOne.text = lblTitle
    }
    
    @IBAction func btnSkipAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btnStartAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}
