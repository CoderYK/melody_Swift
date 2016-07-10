//
//  MusicItem.swift
//  melody
//
//  Created by yk on 16/6/30.
//  Copyright © 2016年 coderYK. All rights reserved.
//

import UIKit

class MusicItem: NSObject {

     /// 歌曲名称
    var name: String?
    
     /// 歌曲文件名称
    var filename: String?
    
     /// 歌词名称
    var lrcname: String?
    
     /// 歌手名称
    var singer: String?
    
     /// 歌手头像
    var singerIcon: String?
    
     /// 歌曲图片
    var icon: String?
    
    override init() {
        super.init()
    }
    
    init(dict: [String : AnyObject]) {
        super.init()
        
        setValuesForKeysWithDictionary(dict)
    }
    
    // 容错处理
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
