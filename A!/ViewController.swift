//
//  ViewController.swift
//  A!
//
//  Created by KadeHina on 2016/02/15.
//  Copyright © 2016年 KadeHina. All rights reserved.
//

import UIKit

//前述のものです。これを入れないと、音楽は鳴らせません。
import AVFoundation

class ViewController: UIViewController {
}

func viewWillAppear(animated: Bool) {
    //音楽ファイルの準備をします。
    let bgm = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("recorder", ofType: "mp3")!)
    
    //音楽プレイヤーの準備をします。
    
    var bgmPlayer: AVAudioPlayer  = try!(AVAudioPlayer(contentsOfURL: bgm, fileTypeHint: nil))
    
    //再生します。
    bgmPlayer.play()
}