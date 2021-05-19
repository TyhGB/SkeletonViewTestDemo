//
//  TableViewOneCell.swift
//  SkeletonViewTest
//
//  Created by Tao on 2021/5/19.
//

import UIKit

class CellBottomTool: UIView {
    
    var oneBtn: UIButton = UIButton(type: .system)
    var twoBtn: UIButton = UIButton(type: .system)
    var threeBtn: UIButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
//        let btnWidth: CGFloat = frame.width/3
        let btnWidth: CGFloat = UIScreen.main.bounds.width/3
        let btnHeight: CGFloat = 30
        
        oneBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnHeight)
        twoBtn.frame = CGRect(x: btnWidth, y: 0, width: btnWidth, height: btnHeight)
        threeBtn.frame = CGRect(x: btnWidth*2, y: 0, width: btnWidth, height: btnHeight)
        oneBtn.setTitle("转发", for: .normal)
        twoBtn.setTitle("点赞", for: .normal)
        threeBtn.setTitle("收藏", for: .normal)
        
        addSubview(oneBtn)
        addSubview(twoBtn)
        addSubview(threeBtn)
        
    }
    
}


class TableViewOneCell: UITableViewCell {

    var iconImageView: UIImageView = UIImageView()
    var firstLabel: UILabel = UILabel()
    var secondLabel: UILabel = UILabel()
    var bottomTool: CellBottomTool = CellBottomTool()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initUI()
        initSkeletonEnable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        iconImageView.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        iconImageView.backgroundColor = .gray
        
        firstLabel.frame = CGRect(x: iconImageView.frame.maxX+10, y: 10, width: 100, height: 30)
        firstLabel.numberOfLines = 1
        firstLabel.font = UIFont.boldSystemFont(ofSize: 18)
        firstLabel.text = "标题标题"
        firstLabel.sizeToFit()
        
        secondLabel.frame = CGRect(x: firstLabel.frame.minX, y: firstLabel.frame.maxY + 5, width: 300, height: 40)
        secondLabel.numberOfLines = 2
        secondLabel.font = UIFont.systemFont(ofSize: 14)
        secondLabel.text = "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"
        
        bottomTool.frame = CGRect(x: 0, y: 90, width: UIScreen.main.bounds.width, height: 30)
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(bottomTool)
        
    }
    
    func initSkeletonEnable() {
        isSkeletonable = true
        iconImageView.isSkeletonable = true
        firstLabel.isSkeletonable = true
        secondLabel.isSkeletonable = true
        bottomTool.isSkeletonable = true
    }
}
