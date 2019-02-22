//
//  ViewController.swift
//  ios
//
//  Created by Sherry on 2019/2/22.
//  Copyright © 2019 Sherry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bt : SSButtom = SSButtom.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        bt.setTitle(title: "默认状态", state: .normal)
        bt.setTitle(title: "选中状态", state: .highlighted)
        bt.setTitleColor(color: .black, state: .normal)
        bt.setBackgroundColor(color: .red, state: .normal)
        bt.setBackgroundColor(color: .green, state: .highlighted)
        bt.setBorderColor(color: .blue, state: .normal)
        bt.setBorderColor(color: .orange, state: .highlighted)
        let image: UIImage = UIImage(named: "no_message_img@2x.png") ?? UIImage()
        bt.setImage(image: image, state: .normal)
        self.view.addSubview(bt)
        bt._imageView!.snp.remakeConstraints { (make) in
            make.centerY.equalTo(bt)
            make.left.equalTo(10)
            make.width.height.equalTo(30)
        }
        bt._imageView?.layer.borderWidth = 1
        
        bt._titleLabel!.snp.remakeConstraints { (make) in
            make.left.equalTo(bt._imageView!.snp_rightMargin).offset(10)
            make.centerY.equalTo(bt)
            make.right.equalTo(-10)
            make.top.bottom.equalTo(0)
        }
    }


}

