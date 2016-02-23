//
//  ThirdViewController.swift
//  A!
//
//  Created by KadeHina on 2016/02/22.
//  Copyright © 2016年 KadeHina. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var point: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var voice = ["100","98","90","80","60","50","10"]
        var r = Int(arc4random()) % voice.count
        
        //結果
        switch(r){
        case 0:
            print("100")
        case 1:
            print("98")
        case 2:
            print("90")
        case 3:
            print("80")
        case 4:
            print("60")
        case 5:
            print("50")
        case 6:
            print("10")
        default:
            print("70")
            
        
        point.text = "omikuji[r]"

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
