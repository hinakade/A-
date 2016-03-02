//
//  002ViewController.swift
//  A!
//
//  Created by KadeHina on 2016/02/16.
//  Copyright © 2016年 KadeHina. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit


class _02ViewController: UIViewController{
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var object: UIImageView!
    @IBOutlet weak var kekka: UIButton!
    
    @IBOutlet weak var resetBtn: UIButton!
    var recorder: AVAudioRecorder!
    var meterTimer: NSTimer!
    var audioPlayer:AVAudioPlayer!
    var picture = false
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        object.hidden = true
        resetBtn.hidden = true
        self.object.layer.masksToBounds = true
        
        //画像を丸く
        self.object.layer.cornerRadius = 50
        
        // 背景画像01の設定
        var backView: [String] = ["yama.jpg","火山.jpg"]

        
        UIGraphicsBeginImageContext(self.view.frame.size)
         var randomInt = Int(arc4random_uniform(UInt32(backView.count)))
        UIImage(named: backView[randomInt])?.drawInRect(self.view.bounds)
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        

        
       self.stopButton.enabled = false
       self.stopButton.hidden = true
        
        
        
        //2Dパーティクル使う
//        var myFire = SKEmitterNode(fileNamed: "frower.sks")
//        myFire!.position = CGPoint(x: 400, y: 800)
//        self.addchild(myFire)
//        
//        myFire?.position = CGPoint(x: 0, y: 0)
        
        
        
        
        
        ////////////////////////////////////
        
        class GameScene: SKScene {
            /** 画面が表示された時に実行される */
            override func didMoveToView(view: SKView) {
            }
            
            /** フレーム毎に実行される */
            override func update(currentTime: CFTimeInterval) {
            }
            
            /** 画面をタッチしたときに実行される */
             func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
                for touch: AnyObject in touches {
                    // タッチされた位置を取得
                    let location = touch.locationInNode(self)
                }
            }
        }

        
        ////////////////////////////////////
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //写真のアニメーション
    @IBAction func swpimg(sender: UISwipeGestureRecognizer) {
        
        //録音再生
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask,true)
        var docsDir: AnyObject = dirPaths[0]
        var soundFilePath = docsDir.stringByAppendingPathComponent("Recorded.m4a")
        let soundFileURL = NSURL(fileURLWithPath: soundFilePath)
        
        var audioError:NSError!
        
        do{
            self.audioPlayer = try AVAudioPlayer(contentsOfURL: soundFileURL)
        } catch var error1 as NSError {
            
            self.audioPlayer = nil
        }
        
        
        self.audioPlayer.prepareToPlay()
        self.audioPlayer.play()
        

        //アニメーション動く
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.object.frame = CGRectMake(170, 0, 0, 0);
            self.picture = false
                       },
            completion: { finished in
                self.stopButton.hidden = false
                
                //前の状態 強制的に採点結果に移動させる。
                self.stopButton.hidden = false
                self.recordButton.hidden = true
                self.stopButton.enabled = true
//                self.recordButton.setTitle("叫ぶ", forState:.Normal)
                self.resetBtn.hidden = false
                self.resetBtn.hidden = true
                
            })
    }
    
    
    
//////////////////////////////////////////////////////////////////////
   
    @IBAction func tapPlay(sender: AnyObject) {
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask,true)
        var docsDir: AnyObject = dirPaths[0]
        var soundFilePath = docsDir.stringByAppendingPathComponent("Recorded.m4a")
        let soundFileURL = NSURL(fileURLWithPath: soundFilePath)
        
        
        
        // auido を再生するプレイヤーを作成する
        var audioError:NSError!
        
        //        audioPlayer = try AVAudioPlayer(contentsOfURL: soundFileURL, error:&audioError)
        do{
            audioPlayer = try AVAudioPlayer(contentsOfURL: soundFileURL)
        } catch var error1 as NSError {
            
            self.audioPlayer = nil
        }
        
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    //////////////////////////////////////////////////////////////////////
    
    
    
    
    @IBAction func pushRecord(sender: AnyObject) {
       
        
        //画像表示
        if  self.stopButton.enabled == true{
            print("鳥写真表示")
            object.image = UIImage(named: "Myapp.jpg")
            
            
            //録音終了
            print("stop")
            self.recorder.stop()
            self.meterTimer.invalidate()
            //りせっとぼたんを表示
            resetBtn.hidden = false
            stopButton.hidden = false
            //self.recordButton.setTitle("叫び直し", forState:.Normal)
            let session:AVAudioSession = AVAudioSession.sharedInstance()
            var error: NSError?
            do {
                try session.setActive(false)
            } catch let error1 as NSError {
                error = error1
                print("could not make session inactive")
                if let e = error {
                    print(e.localizedDescription)
                    return
                }
            }
            self.stopButton.enabled = false
            
        }else{
            object.hidden = false
            object.image = UIImage(named: "")
            self.recordButton.setTitle("叫び終わり", forState:.Normal)
            self.stopButton.enabled = true
//            録音
            self.recordWithPermission(true)
            
        }
        
        
    
        
        //録音
        
//        if recorder != nil && recorder.recording {
//            self.recorder.pause()
//            self.recordButton.setTitle("もう一度叫ぶ？", forState:.Normal)
//            print("こんてにゅー")
//            
////        } else {
//            


    }
    
    //録音止める
//    @IBAction func pushStop(sender: UIButton) {
//        
//        
//        if recorder == nil {
//            return
//        }
//        
//        print("stop")
//        self.recorder.stop()
//        self.meterTimer.invalidate()
//        
//        self.recordButton.setTitle("終了", forState:.Normal)
//        let session:AVAudioSession = AVAudioSession.sharedInstance()
//        var error: NSError?
//        do {
//            try session.setActive(false)
//        } catch let error1 as NSError {
//            error = error1
//            print("could not make session inactive")
//            if let e = error {
//                print(e.localizedDescription)
//                return
//            }
//        }
//        self.stopButton.enabled = false
//        self.recordButton.enabled = true
//    }
//    
   
    
    
    
   ////////////////////////////////////////////////////////////////////////////////////
    //resetぼたん
    
    @IBAction func tapReset(sender: AnyObject) {
        
        stopButton.hidden = true
        recordButton.hidden = false
        stopButton.enabled = false
        self.recordButton.setTitle("叫ぶ", forState:.Normal)
        resetBtn.hidden = true
        
        self.object.frame = CGRectMake(86, 152, 149, 128)
        self.object.hidden = false
        object.image = UIImage(named: "")
        
    }
    
    func recordWithPermission(setup:Bool) {
        let session:AVAudioSession = AVAudioSession.sharedInstance()
        // ios 8 and later
        if (session.respondsToSelector("requestRecordPermission:")) {
            AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool)-> Void in
                if granted {
                    print("Permission to record granted")
                    self.setSessionPlayAndRecord()
                    if setup {
                        self.setupRecorder()
                    }
                    self.recorder.record()
                    self.meterTimer = NSTimer.scheduledTimerWithTimeInterval(0.1,
                        target:self,
                        selector:"updateAudioMeter:",
                        userInfo:nil,
                        repeats:true)
                } else {
                    print("Permission to record not granted")
                }
            })
        } else {
            print("requestRecordPermission unrecognized")
        }
    }
    
    //setupRecorde
    
    func setupRecorder() {
        
        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask,true)
        let docsDir: AnyObject = dirPaths[0]
        let soundFilePath = docsDir.stringByAppendingPathComponent("Recorded.m4a")
        let soundFileURL = NSURL(fileURLWithPath: soundFilePath)
        
        let recordSettings:[String: AnyObject] = [
            AVFormatIDKey: UInt(kAudioFormatAppleLossless),
            AVEncoderAudioQualityKey : AVAudioQuality.Max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey : 44100.0
        ]
        
        var error: NSError?
        do {
            self.recorder = try AVAudioRecorder(URL: soundFileURL, settings: recordSettings as [String : AnyObject])
        } catch let error1 as NSError {
            error = error1
            self.recorder = nil
        }
        if let e = error {
            print(e.localizedDescription)
        } else {
//            self.recorder.delegate = self
            self.recorder.meteringEnabled = true
            self.recorder.prepareToRecord() // creates/overwrites the file at soundFileURL
            
        }
    } //setupRecorde終わり
    
    //setSessionPlayAndRecord始め
    func setSessionPlayAndRecord() {
        let session:AVAudioSession = AVAudioSession.sharedInstance()
        var error: NSError?
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch let error1 as NSError {
            error = error1
            print("could not set session category")
            if let e = error {
                print(e.localizedDescription)
            }
        }
        do {
            try session.setActive(true)
        } catch let error1 as NSError {
            error = error1
            print("could not make session active")
            if let e = error {
                print(e.localizedDescription)
            }
        }
    }    //setSessionPlayAndRecord 終了
    
    //始め
    func updateAudioMeter(timer:NSTimer) {
        
        if recorder.recording {
            let dFormat = "%02d"
            let min:Int = Int(recorder.currentTime / 60)
            let sec:Int = Int(recorder.currentTime % 60)
            let s = "\(String(format: dFormat, min)):\(String(format: dFormat, sec))"
//            statusLabel.text = s
            recorder.updateMeters()
            let apc0 = recorder.averagePowerForChannel(0)
            let peak0 = recorder.peakPowerForChannel(0)
            
            let peak = String(format:"Peak:%@", peak0.description)
//            peakLabel.text = peak
            
            let apc = String(format:"Avg:%@", apc0.description)
//            apcLabel.text = apc
            
        }
        
    
        
    }
    

    
//終わり
//飛ばす画像の角を丸くるする
 
//self.tori.jpg.cornerRadius = 10
    

}





