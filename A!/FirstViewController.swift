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

class FirstViewController: UIViewController,AVAudioPlayerDelegate,UITableViewDelegate {
    
    
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
//        UIGraphicsBeginImageContext(self.view.frame.size)
//        UIImage(named: "first_backview.jpg")?.drawInRect(self.view.bounds)
//        
//        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
//        
//        UIGraphicsEndImageContext()
//        
//        
//        
//        self.view.backgroundColor = UIColor(patternImage: image)
        
        

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
    
    
    
    //---------------------------------------------
    
    
    
    
    
    
    //データの受け取り
    class nextViewCountller: UIViewController{
        //受け取り用の変数
        var MyCount = 0
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    var selectedIndex = -1
    
    
    //-----------------------------
    
    //データ配列を用意する
    var select = ["アプリの使い方","作者について"]
    
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        
    }
    //tableViewの下に貼り付け
    //店長の指示　何行だすん？
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) ->Int{
        return select.count
    }
    //表示するセルの中身
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //
        //表示するセルの中身
        //cellオブジェクトに名前をつける
        var cell = UITableViewCell(style: .Default, reuseIdentifier: "myCell")
        //一行ごとの四角のことをcellという。
        //
        //        cell.textLabel!.text = "\(indexPath.row)行目"
        cell.textLabel!.text = "\(select[indexPath.row])"
        //テーブル型のオブジェクトを返す
        return cell
        
    }
    //選択されたときにおこなう処理　なくてもおk
    //何行目が押されたか感知する処理
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        print("\(indexPath.row)行目を選択")
        
        //2  selectid.indexに値が入る
        selectedIndex = indexPath.row
        
        //次のページに表示 教科書にないよ↓
        performSegueWithIdentifier("showSecondView", sender: nil)
    }
    //1  segueで画面処理するとき
    //次の画面に情報を渡す
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        var secondVC = segue.destinationViewController as! SecondViewController
//        secondVC.scSelectedIndex = selectedIndex
        //次の画面に値を送る
//    }
}