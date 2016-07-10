//
//  MusicDetailedVC.swift
//  melody
//
//  Created by yk on 16/7/4.
//  Copyright © 2016年 coderYK. All rights reserved.
//

import UIKit

class MusicDetailedVC: UIViewController {
    
    @IBOutlet weak var musicIconView: UIImageView!
    
    @IBOutlet weak var progressView: UISlider!

    @IBOutlet weak var IrcView: UILabel!
    

 


}


// MARK:- 处理主要业务逻辑
extension MusicDetailedVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置界面
        setUpView()
    }
    
    
}


// MARK:- 设置界面
extension MusicDetailedVC {
    
    // 主入口
    func setUpView() -> () {
       setUpSingerIcon()
    }
    
    // 设置歌手图片
    func setUpSingerIcon() -> () {
        musicIconView.layer.cornerRadius = musicIconView.width * 0.5
        musicIconView.clipsToBounds = true
    }
    
    // 状态栏
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
