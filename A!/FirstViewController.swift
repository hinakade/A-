//
//  FirstViewController.swift
//  A!
//
//  Created by KadeHina on 2016/03/01.
//  Copyright © 2016年 KadeHina. All rights reserved.
//

import UIKit
    import SpriteKit

class FirstViewController: UIViewController {

    @IBOutlet weak var startBtn: SpringButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 背景画像01
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "first_backview.jpg")?.drawInRect(self.view.bounds)
        
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        self.view.backgroundColor = UIColor(patternImage: image)

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    

    
 

    


}
