//
//  CollectionOneCell.swift
//  SkeletonViewTest
//
//  Created by Tao on 2021/5/19.
//

import UIKit

class CollectionOneCell: UICollectionViewCell {
    
    var firstLabel: UILabel = UILabel()
    var secondLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        initSkeletonEnable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI() {
        firstLabel.frame = CGRect(x: 10, y: 5, width: frame.width, height: 30)
        firstLabel.numberOfLines = 1
        firstLabel.font = UIFont.boldSystemFont(ofSize: 18)
        firstLabel.text = "标题标题"
        firstLabel.sizeToFit()
        
        secondLabel.frame = CGRect(x: firstLabel.frame.minX, y: firstLabel.frame.maxY + 5, width: frame.width - 10, height: 80)
        secondLabel.numberOfLines = 4
        secondLabel.font = UIFont.systemFont(ofSize: 14)
        secondLabel.text = "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容"
        
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
    }
    
    func initSkeletonEnable() {
        isSkeletonable = true
        firstLabel.isSkeletonable = true
        secondLabel.isSkeletonable = true
    }
    
}
