//
//  ViewController.swift
//  A!
//
//  Created by KadeHina on 2016/02/15.
//  Copyright © 2016年 KadeHina. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    
    var omikuji = ["大吉","吉","凶","中吉","末吉","大凶"]
    var r = Int(arc4random()) % omikuji.count
        
   
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

