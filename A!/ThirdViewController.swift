//
//  ThirdViewController.swift
//  A!
//
//  Created by KadeHina on 2016/02/22.
//  Copyright © 2016年 KadeHina. All rights reserved.
//

import UIKit
//AVFoundationを追加
import AVFoundation

//音声クラス宣言
var myAudioPlayer : AVAudioPlayer!
var myButton : UIButton!


class ThirdViewController: UIViewController,AVAudioPlayerDelegate  {
    @IBOutlet weak var point: UITextField!
    @IBOutlet weak var comment: UITextField!
    @IBOutlet weak var backTitleBtn: SpringButton!
    
    
    override func viewWillAppear(animated: Bool) {
        
        var voice = ["100点","98点","90点","80点","60点","50点","10点"]
        let r:Int = Int(arc4random() % UInt32(voice.count))
        
        
        var say = ["あなたの声は完璧です","もっと魂を込めると良いかもしれません", "合格点です", "良い叫びですね", "頑張って", "もう一度チャレンジしましょう"]
        let y:Int = Int(arc4random() % UInt32(say.count))
        
        //表示
        print(voice[r])
        point.text = voice[r]
        comment.text = say[y]
        comment.font = UIFont.systemFontOfSize(15)
        //common.表示をセンターにする。
        point.textAlignment = NSTextAlignment.Center
        comment.textAlignment = NSTextAlignment.Center
        
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景画像
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "finalview.jpg")?.drawInRect(self.view.bounds)
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    
    
        
    }
    
    @IBAction func backBtnTap(sender: AnyObject) {
        //再生する音源のURLを生成.
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("btnstart", ofType: "mp3")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)
        
        //AVAudioPlayerのインスタンス化.
        myAudioPlayer = try!(AVAudioPlayer(contentsOfURL: fileURL, fileTypeHint: nil))
        
        //AVAudioPlayerのデリゲートをセット.
        myAudioPlayer.delegate = self
        
        myAudioPlayer.play()
        print("ボタンタップ")
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}