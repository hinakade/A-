//
//  002ViewController.swift
//  A!
//
//  Created by KadeHina on 2016/02/16.
//  Copyright © 2016年 KadeHina. All rights reserved.
//

import UIKit
import AVFoundation

class _02ViewController: UIViewController{
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var object: UIImageView!
    @IBOutlet weak var kekka: UIButton!
    
    
    var recorder: AVAudioRecorder!
    var meterTimer: NSTimer!
    var audioPlayer:AVAudioPlayer!
    var picture = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.stopButton.enabled = false
       self.stopButton.hidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //写真のアニメーション
    @IBAction func swpimg(sender: UISwipeGestureRecognizer) {
        print("写真が動く")
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.object.frame = CGRectMake(200, 0, 0, 0)
            self.picture = false}
,
            completion: { finished in
                self.stopButton.hidden = false
            })
    }
    //音再生
//    If(){
    
    @IBAction func tapPlay(sender: AnyObject) {
    let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask,true)
    var docsDir: AnyObject = dirPaths[0]
    var soundFilePath = docsDir.stringByAppendingPathComponent("Recorded.m4a")
    let soundFileURL = NSURL(fileURLWithPath: soundFilePath)
    
    }
//}

    
    @IBAction func pushRecord(sender: AnyObject) {
       
        
        //鳥表示
        if  self.stopButton.enabled == true{
            print("鳥写真表示")
            object.image = UIImage(named: "tori.jpg")
            
        }else{
            object.image = UIImage(named: "")
        }
        
        
        //録音
        if recorder != nil && recorder.recording {
            self.recorder.pause()
            self.recordButton.setTitle("もう一度叫ぶ？", forState:.Normal)
            print("こんてにゅー")
            
        } else {
            
            self.stopButton.enabled = true
            self.recordButton.setTitle("叫び終わり", forState:.Normal)
            self.recordWithPermission(true)
            
        }
        
       

    }
    
    //録音止める
    @IBAction func pushStop(sender: UIButton) {
        
        
        if recorder == nil {
            return
        }
        
        print("stop")
        self.recorder.stop()
        self.meterTimer.invalidate()
        
        self.recordButton.setTitle("終了", forState:.Normal)
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
        self.recordButton.enabled = true
    }
    
   
    
    
    
   ////////////////////////////////////////////////////////////////////////////////////
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
        var docsDir: AnyObject = dirPaths[0]
        var soundFilePath = docsDir.stringByAppendingPathComponent("Recorded.m4a")
        let soundFileURL = NSURL(fileURLWithPath: soundFilePath)
        
        var recordSettings:[String: AnyObject] = [
            AVFormatIDKey: UInt(kAudioFormatAppleLossless),
            AVEncoderAudioQualityKey : AVAudioQuality.Max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey : 44100.0
        ]
        
        var error: NSError?
        do {
            self.recorder = try AVAudioRecorder(URL: soundFileURL, settings: recordSettings as [String : AnyObject])
        } catch var error1 as NSError {
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
    

}





