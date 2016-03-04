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

class FirstViewController: UIViewController,AVAudioPlayerDelegate,UIViewControllerTransitioningDelegate {

@IBOutlet weak var startBtn: SpringButton!
     var audioPlayer: AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var viewController: MenuViewController = MenuViewController()
        viewController.modalTransitionStyle = UIModalTransitionStyle.CoverVertical // ★ここを適当な値にすればいけると思ってた
        self.presentViewController(viewController, animated: true, completion: nil)

        // 背景画像01
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "first_backview.jpg")?.drawInRect(self.view.bounds)
        
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        //音声
        
        
        let sound_data = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("recorder", ofType: "mp3")!)
        print(sound_data)
        do {
            var audioPlayer: AVAudioPlayer = try AVAudioPlayer(contentsOfURL: sound_data)
            audioPlayer = try AVAudioPlayer(contentsOfURL: sound_data)
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }catch let error as NSError{
            print("error")
        }
    }
    
    func soundPlay() {
    audioPlayer.play()
        
    }
    
    // ページを閉じるときに呼ばれます
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animationController.isClose = true
        return animationController
    }
}

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
