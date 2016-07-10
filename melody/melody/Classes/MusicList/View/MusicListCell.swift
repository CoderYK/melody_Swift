//
//  MusicListCell.swift
//  melody
//
//  Created by yk on 16/7/1.
//  Copyright © 2016年 coderYK. All rights reserved.
//

import UIKit
let cellID = "MusicCell"

/**
 cell 的展示动画
 
 - Rotation: 旋转动画
 - Scale:    缩放动画
 */
enum disPlayCellAnimationType: Int {
    case Rotation
    case Scale
}

class MusicListCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var musicNameLabel: UILabel!
    
    @IBOutlet weak var singerNameLabel: UILabel!
    
    
    // 监听属性的变化,当外界传模型数据时给属性赋值
    var musicItem: MusicItem? {
        didSet {
            if musicItem?.singerIcon != nil {
                iconImageView.image = UIImage(named: (musicItem?.singerIcon)!)
            }
        
            musicNameLabel.text = musicItem?.name
            singerNameLabel.text = musicItem?.singer
        }
    }
    
    
    // 快速获取 Cell
    class func cellForTableView(tableView: UITableView) -> (MusicListCell) {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? MusicListCell
        
        if cell == nil {
             cell = NSBundle.mainBundle().loadNibNamed("MusicListCell", owner: nil, options: nil).first as? MusicListCell
        }
        
        return cell!
    }
    
    
    // 干掉系统的高亮模式
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .None
        
        // 设置圆形头像
        iconImageView.layer.cornerRadius = iconImageView.width * 0.5
        iconImageView.clipsToBounds = true
    }


    // Cell 的动画实现
    func animation(type: disPlayCellAnimationType) -> () {
        
        if type == .Rotation {
            self.layer.removeAnimationForKey("rotation")
            let animation = CAKeyframeAnimation(keyPath: "transform.rotation.x")
            animation.values = [-M_PI * 0.4, 0, M_PI * 0.4, 0]
            animation.duration = 0.5
            self.layer.addAnimation(animation, forKey: "rotation")
            
        } else if type == .Scale {
            self.layer.removeAnimationForKey("scale")
            let animation = CAKeyframeAnimation(keyPath: "transform.scale.x")
            animation.values = [0.5, 1, 0.5, 1]
            animation.duration = 0.5
            self.layer.addAnimation(animation, forKey: "scale")
            
        }
    }
    
    
    
}
