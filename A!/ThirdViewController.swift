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
    @IBOutlet weak var comment: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        
        var voice = ["100点","98点","90点","80点","60点","50点","10点"]
        let r:Int = Int(arc4random() % UInt32(voice.count))
        
        
        var say = ["あなたの声は完璧です","もっと魂を込めると良いかもしれません", "合格点です", "良い叫びですね", "頑張って", "もう一度チャレンジしましょう"]
        let y:Int = Int(arc4random() % UInt32(say.count))
        
        
        
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
        }
        
        //comment結果
        switch(y){
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        case 3:
            print("3")
        case 4:
            print("4")
        case 5:
            print("5")
        case 6:
            print("6")
        default:
            print("7")
            
        }
        print(voice[r])
        point.text = voice[r]
        comment.text = say[y]
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}