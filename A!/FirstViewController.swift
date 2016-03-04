//
//  FirstViewController.swift
//  A!
//
//  Created by KadeHina on 2016/03/01.
//  Copyright © 2016年 KadeHina. All rights reserved.
//

import UIKit
import SpriteKit
//AVFoundationを追加
import AVFoundation

class FirstViewController: UIViewController,AVAudioPlayerDelegate {

    @IBOutlet weak var startBtn: SpringButton!
    

    @IBAction func BtnTap(sender: UIButton) {
        print("ボタンタップ")
        soundPlay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 背景画像01
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "first_backview.jpg")?.drawInRect(self.view.bounds)
        
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        self.view.backgroundColor = UIColor(patternImage: image)

    
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }

    func soundPlay() {
        let sound_data = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("recorder", ofType: "mp3")!)
        print(sound_data)
        do {
            var audioPlayer: AVAudioPlayer = try AVAudioPlayer(contentsOfURL: sound_data)
            audioPlayer.play()
        }catch let error as NSError{
            print("error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    

    
 

    


}
