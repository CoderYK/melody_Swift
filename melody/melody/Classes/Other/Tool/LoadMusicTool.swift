//
//  LoadMusicTool.swift
//  melody
//
//  Created by yk on 16/6/30.
//  Copyright © 2016年 coderYK. All rights reserved.
//

import UIKit

class LoadMusicTool: NSObject {
    
    class func getMusicItems( result: (MusicItems: [MusicItem]?)->()) {
        
        // 解析数据
        // 1.加载 plist 文件
        guard let path = NSBundle.mainBundle().pathForResource("Musics.plist", ofType: nil) else {
            result(MusicItems: nil)
            return
        }
        
        guard let dictArray = NSArray(contentsOfFile: path) else {
            result(MusicItems: nil)
            return
        }
        

        // 遍历字典数组
        var itemArr = [MusicItem]()
        
        for dict in dictArray {
            // 2.字典转模型
            let item = MusicItem.init(dict: dict as! [String : AnyObject])
            
            itemArr.append(item)
        }
        
        // 返回结果
        result(MusicItems: itemArr)
        
    }

}
