//
//  FirstViewController.swift
//  A!
//
//  Created by KadeHina on 2016/03/01.
//  Copyright © 2016年 KadeHina. All rights reserved.

import UIKit
import SpriteKit
//AVFoundationを追加
import AVFoundation

class FirstViewController: UIViewController, AVAudioPlayerDelegate,UITableViewDelegate {
    
    
    //音声クラス宣言
    var myAudioPlayer : AVAudioPlayer!
    var myButton : UIButton!
    
    
    @IBOutlet weak var startBtn: SpringButton!
    var audioPlayer: AVAudioPlayer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //音声流す
        
        //再生する音源のURLを生成.
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("recorder", ofType: "mp3")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath as String)
        
        //AVAudioPlayerのインスタンス化.
        myAudioPlayer = try!(AVAudioPlayer(contentsOfURL: fileURL, fileTypeHint: nil))
        
        //AVAudioPlayerのデリゲートをセット.
        myAudioPlayer.delegate = self
        
        myAudioPlayer.play()
        
        //音声終わり
        
        
        
        
//        // 背景画像01
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "first_backview.jpg")?.drawInRect(self.view.bounds)
        
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        

    }
    
    func soundPlay() {
        myAudioPlayer.play()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //音楽を止める
        //myAudioPlayer.stop()
        //音楽を止める
        
    }
    

    @IBAction func startBtnTap(sender: AnyObject) {
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
        // Dispose of any resources that can be recreated.
    }
    
}

