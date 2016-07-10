//
//  MusicOperationTool.swift
//  melody
//
//  Created by yk on 16/7/4.
//  Copyright © 2016年 coderYK. All rights reserved.
//

import UIKit

class MusicOperationTool: NSObject {

     /// 音乐操作单例(节省内存/共享数据)
    static let shareInstance = MusicOperationTool()
    
    func playMusic(musicM: MusicItem) {
        
        // 拿到模型数据,播放音乐
        print("拿到模型数据,播放音乐")
    }
    
}
