//
//  textcomitViewController.swift
//  A!
//
//  Created by KadeHina on 2016/03/12.
//  Copyright © 2016年 KadeHina. All rights reserved.
//

import UIKit

class textcomitViewController: UIViewController {
    
    var scSelectedI1ndex = -1;

    @IBOutlet weak var usecomment: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(scSelectedI1ndex == 0){
            print("眠い")
            usecomment.text = "１スタートボタンを押す \n 2 叫ぶ /n 3 上にスライド "
        }
//            //セグエ
            if(scSelectedI1ndex == 1){
            var targetView: AnyObject = self.storyboard!.instantiateViewControllerWithIdentifier( "firstview" )
            self.presentViewController( targetView as! FirstViewController, animated: true, completion: nil)
        }
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
