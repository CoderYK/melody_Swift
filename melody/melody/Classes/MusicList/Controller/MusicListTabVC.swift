//
//  MusicListTabVC.swift
//  melody
//
//  Created by yk on 16/6/30.
//  Copyright © 2016年 coderYK. All rights reserved.
//

import UIKit

class MusicListTabVC: UITableViewController {

    var MusicItems = [MusicItem]() {
        didSet {
            // 刷新数据
            tableView.reloadData()
        }
    }
    
}


// MARK:- 主要业务逻辑
extension MusicListTabVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置界面
        setUpView()
        
        // 加载数据
        LoadMusicTool.getMusicItems { (MusicItems) in
            if MusicItems != nil {
                
                self.MusicItems = MusicItems!
            }
        }
    }
}


// MARK:- 功能实现
extension MusicListTabVC {
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // 点击动画
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! MusicListCell
        cell.animation(disPlayCellAnimationType.Scale)
        
        // 1.取出模型数据
        let musicModel = MusicItems[indexPath.row]
        
        // 2.根据数据模型,播放音乐
        MusicOperationTool.shareInstance.playMusic(musicModel)
        
        // 3.跳转到播放详情界面
        performSegueWithIdentifier("listToDetial", sender: nil)
        
    }
}


// MARK:- 设置界面
extension MusicListTabVC {
    
    // 主入口
    func setUpView() -> () {
        setUpBackgroundView()
        setUpTableView()
    }
    
    
    // 设置背景 VIew
    func setUpBackgroundView() -> () {
        let image = UIImage(named: "QQListBack")
        let imageView = UIImageView(image: image)
        tableView.backgroundView = imageView
    }
    
    
    // 设置状态栏样式
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // tableView 设置
    func setUpTableView() -> () {
        tableView.rowHeight = 60
        tableView.separatorStyle = .None
    }
    
}


// MARK:- 展示数据
extension MusicListTabVC {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MusicItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 获取 Cell
        let cell = MusicListCell.cellForTableView(tableView)
        
        // 获取对应的模型数据
        let item = MusicItems[indexPath.row]
        
        // 设置数据
        cell.musicItem = item
        
        return cell
    }
}


// MARK:- Cell 的展示动画
extension MusicListTabVC {
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = cell as! MusicListCell
        
        // 设置 Cell 的动画
        cell.animation(disPlayCellAnimationType.Rotation)
    }
    
}












