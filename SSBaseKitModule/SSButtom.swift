//
//  SSButtom.swift
//  SSBaseKitSwiftModule
//  带图片文字的按钮
//  Created by Sherry on 2019/2/22.
//  Copyright © 2019 Sherry. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


open class SSButtom: UIControl {
    
    var _imageView: UIImageView?   //按钮图片
    var _titleLabel: UILabel?   //文字label
        
    //背景色相关
    private var _selectBackgroundColor : UIColor?    //选中的背景背景色
    private var _normalBackgroundColor : UIColor?    //正常时候的背景颜色
    private var _higlhtedBackgroundColor : UIColor?     //点击时候的背景颜色
    private var _disabledBackgroundColor : UIColor?     //不可用时候的背景色
    //字体颜色
    private var _normalTitleColor : UIColor?        //正常时候的字体颜色
    private var _selectTitleColor : UIColor?        //选中时候的字体颜色
    private var _higlhtedTitleColor : UIColor?      //点击时候的背景颜色
    private var _disabledTitleColor : UIColor?      //不可用时候的背景色
    //设置图片
    private var _normalImage : UIImage?     //正常的图片
    private var _selectImage : UIImage?     //选中的图片
    private var _higlhtedImage : UIImage?       //高亮的图片
    private var _disabledImage : UIImage?       //不可用的图片
    //字体文字
    private var _normalTitle : String?      //正常时候的文字
    private var _higlhtedTitle : String?        //高亮时候的文字
    private var _selectTitle : String?      //选中时候的文字
    private var _disabledTitle : String?        //不可用时候的文字
    //描边颜色
    private var _normalBorderColor : UIColor?       //正常的时候显示的描边颜色
    private var _higlhtedBorderColor : UIColor?     //高亮的时候显示的描边颜色
    private var _disabledBorderColor : UIColor?     //选中的时候显示的描边颜色
    private var _selectBorderColor : UIColor?       //不可用的时候显示的描边颜色
    
    override init(frame: CGRect) {
        super.init(frame: frame);
         self.initContentView()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //搭建内容视图
    func initContentView() -> Void {
        
        //图片
        _imageView = UIImageView.init()
        self.addSubview(_imageView!);
        _imageView?.snp.makeConstraints({ (make) in
            make.left.right.top.bottom.equalToSuperview()
        })
        
        //文字
        _titleLabel = UILabel.init()
        _titleLabel?.textAlignment = .center
        _titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(_titleLabel!)
        _titleLabel?.snp.makeConstraints({ (make) in
            make.left.right.top.bottom.equalToSuperview()
        })
    }
    
    override open var isSelected: Bool{
        didSet{
            if (_selectImage != nil) {
                _imageView?.image = isSelected ? _selectImage : _normalImage
            }
            
            if (_selectBackgroundColor != nil) {
                self.backgroundColor = isSelected ? _selectBackgroundColor : _normalBackgroundColor
            }
            
            if (_selectTitleColor != nil) {
                _titleLabel?.textColor = isSelected ? _selectTitleColor : _normalTitleColor
            }
            
            if (_selectTitle != nil) {
                _titleLabel?.text = isSelected ? _selectTitle : _normalTitle
            }
            
            if (_selectBorderColor != nil) {
                self.layer.borderColor = isSelected ? _selectBorderColor?.cgColor : _normalBorderColor?.cgColor
            }
        }
    }

    override open var isHighlighted: Bool{
        didSet{
            switch self.state {
            case UIControl.State.normal:
                _titleLabel?.alpha = 1
                self.backgroundColor = (_normalBackgroundColor != nil) ? _normalBackgroundColor : UIColor.clear
                
                if (_normalTitleColor != nil){
                    _titleLabel?.textColor = _normalTitleColor
                }
                
                if (_normalTitle != nil) {
                    _titleLabel?.text = _normalTitle
                }
                
                if (_normalBorderColor != nil){
                    self.layer.borderColor = _normalBorderColor?.cgColor
                }
            case UIControl.State.highlighted:
                _titleLabel?.alpha = 0.7
                self.backgroundColor = (_higlhtedBackgroundColor != nil) ? _higlhtedBackgroundColor : UIColor.clear
                
                if (_higlhtedTitleColor != nil){
                    _titleLabel?.textColor = _higlhtedTitleColor
                }
                
                if (_higlhtedTitle != nil) {
                    _titleLabel?.text = _higlhtedTitle
                }
                
                if (_higlhtedBorderColor != nil){
                    self.layer.borderColor = _higlhtedBorderColor?.cgColor
                }
                
            case UIControl.State.selected:
                _titleLabel?.alpha = 0.7
                self.backgroundColor = (_selectBackgroundColor != nil) ? _selectBackgroundColor : UIColor.clear
                
                if (_selectTitleColor != nil){
                    _titleLabel?.textColor = _selectTitleColor
                }
                
                if (_selectTitle != nil) {
                    _titleLabel?.text = _selectTitle
                }
                
                if (_selectBorderColor != nil){
                    self.layer.borderColor = _selectBorderColor?.cgColor
                }
                
            case UIControl.State.disabled:
                _titleLabel?.alpha = 0.7
                self.backgroundColor = (_disabledBackgroundColor != nil) ? _disabledBackgroundColor : UIColor.clear
                
                if (_disabledTitleColor != nil){
                    _titleLabel?.textColor = _disabledTitleColor
                }
                
                if (_disabledTitle != nil) {
                    _titleLabel?.text = _disabledTitle
                }
                
                if (_disabledBorderColor != nil){
                    self.layer.borderColor = _disabledBorderColor?.cgColor
                }
            default:
                break;
            }
        }
    }
    
    //根据不同状态配置按钮文字颜色
    func setTitleColor(color : UIColor ,state : UIControl.State) -> Void {
        switch state {
        case UIControl.State.normal:
            _titleLabel?.textColor = color
            _normalTitleColor = color
            
        case UIControl.State.highlighted:
            _higlhtedTitleColor = color
            
        case UIControl.State.selected:
            _selectTitleColor = color
            
        case UIControl.State.disabled:
            _disabledTitleColor = color
            
        default:
            _normalTitleColor = color
        }
    }
    
    //根据不同的状态配置按钮背景颜色
    func setBackgroundColor(color : UIColor, state : UIControl.State) -> Void {
        switch state {
        case UIControl.State.normal:
            self.backgroundColor = color
            _normalBackgroundColor = color
            
        case UIControl.State.highlighted:
            _higlhtedBackgroundColor = color
            
        case UIControl.State.selected:
            _selectBackgroundColor = color
            
        case UIControl.State.disabled:
            _disabledBackgroundColor = color
            
        default:
            _normalBackgroundColor = color
        }
    }
    
    //根据不同的状态配置按钮图片
    func setImage(image : UIImage, state : UIControl.State) -> Void {
        switch state {
        case UIControl.State.normal:
            _imageView?.image = image
            _normalImage = image
            
        case UIControl.State.highlighted:
           _higlhtedImage = image
            
        case UIControl.State.selected:
            _selectImage = image
            
        case UIControl.State.disabled:
            _disabledImage = image
            
        default:
            _normalImage = image
        }
    }
    
    //根据不同的状态配置按钮图片(网络图片、本地图片)
    func setImageWithUrl(url : NSURL, placeHolder : UIImage, completion : () -> Void) -> Void {
        //override
    }
    
    //根据不同的状态配置按钮背景图片(网络图片、本地图片)
    func setBackgroundImageWithUrl(url : NSURL, placeHolder : UIImage, completion : () -> Void) -> Void {
        //override
    }
    
    //根据不同的状态配置标题
    func setTitle(title : String, state : UIControl.State) -> Void {
        switch state {
        case UIControl.State.normal:
            _titleLabel?.text = title
            _normalTitle = title
            
        case UIControl.State.highlighted:
            _higlhtedTitle = title
            
        case UIControl.State.selected:
            _selectTitle = title
            
        case UIControl.State.disabled:
            _disabledTitle = title
            
        default:
            _normalTitle = title
        }
    }
    
    //根据不同的状态配置边框颜色
    func setBorderColor(color : UIColor, state : UIControl.State) -> Void {
        self.layer.borderWidth = 1
        switch state {
        case UIControl.State.normal:
            self.layer.borderColor = color.cgColor
            _normalBorderColor = color
            
        case UIControl.State.highlighted:
            _higlhtedBorderColor = color
            
        case UIControl.State.selected:
           _selectBorderColor = color
            
        case UIControl.State.disabled:
            _disabledBorderColor = color
            
        default:
            _normalBorderColor = color
        }
    }
    
    //支持右上角数字
    func supportRemindNumber(support : Bool) -> Void {
        //暂未支持
    }
    
    //配置未读数量
    func setUnreadCount(unreadCount : NSInteger) -> Void {
        //暂未支持
    }
    
    //获取未读数量
    func unreadCount() -> NSInteger {
        return 0
    }
    

}
