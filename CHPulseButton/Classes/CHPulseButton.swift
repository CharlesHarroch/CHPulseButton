//
//  CHPulseButton.swift
//  Pods
//
//  Created by Charles HARROCH on 25/05/2016.
//
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable public class CHPulseButton: UIControl {
    
    var pulseView = UIView()
    var button = UIButton()
    var imageView = UIImageView()
    
    public var isAnimate = false
    
    lazy private var pulseAnimation : CABasicAnimation = self.initAnimation()
    
    // MARK: Inspectable properties
    
    @IBInspectable public var contentImageScale : Int = 0 {
        didSet { imageView.contentMode = UIViewContentMode(rawValue: contentImageScale)! }
    }
    
    @IBInspectable public var image: UIImage? {
        get { return imageView.image }
        set(image) { imageView.image = image }
    }
    
    @IBInspectable public var pulseMargin : CGFloat = 5.0
    
    @IBInspectable public var pulseBackgroundColor : UIColor = UIColor.lightGrayColor() {
        didSet { pulseView.backgroundColor = pulseBackgroundColor }
    }
    
    @IBInspectable public var buttonBackgroundColor : UIColor = UIColor.blueColor() {
        didSet { button.backgroundColor = buttonBackgroundColor }
    }
    
    @IBInspectable public var titleColor : UIColor = UIColor.blueColor() {
        didSet { button.setTitleColor(titleColor, forState: .Normal) }
    }
    
    @IBInspectable public var title : String? {
        didSet { button.setTitle(title, forState: UIControlState.Normal) }
    }
    
    @IBInspectable public var pulsePercent: Float = 1.2
    @IBInspectable public var pulseAlpha: Float = 1.0 {
        didSet {
            pulseView.alpha = CGFloat(pulseAlpha)
        }
    }

    @IBInspectable public var circle : Bool = false
    
    @IBInspectable public var cornerRadius : CGFloat = 0.0 {
        didSet {
            if circle == true {
                cornerRadius = 0
            } else {
                button.layer.cornerRadius = cornerRadius - pulseMargin
                imageView.layer.cornerRadius = cornerRadius - pulseMargin
                pulseView.layer.cornerRadius = cornerRadius
            }
        }
    }
    
    // MARK: Initialization
    
    func initAnimation() -> CABasicAnimation {
        let anim  = CABasicAnimation(keyPath: "transform.scale")
        anim.duration = 1
        anim.fromValue = 1
        anim.toValue = 1 * pulsePercent
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        anim.autoreverses = true
        anim.repeatCount = FLT_MAX
        return anim
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        setup()
        
        if circle {
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            pulseView.layer.cornerRadius = 0.5 * pulseView.bounds.size.width
            imageView.layer.cornerRadius = 0.5 * imageView.bounds.size.width

            button.clipsToBounds = true
            pulseView.clipsToBounds = true
            imageView.clipsToBounds = true
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func setup() {
        
        self.backgroundColor = UIColor.clearColor()
        
        pulseView.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height)
        addSubview(pulseView)
        
        button.frame = CGRectMake(pulseMargin/2, pulseMargin/2, bounds.size.width - pulseMargin, bounds.size.height - pulseMargin)
        addSubview(button)
        
        imageView.frame = CGRectMake(pulseMargin/2, pulseMargin/2, bounds.size.width - pulseMargin, bounds.size.height - pulseMargin)
        addSubview(imageView)
        
        for target in allTargets() {
            let actions = actionsForTarget(target, forControlEvent: UIControlEvents.TouchUpInside)
            for action in actions! {
                button.addTarget(target, action:Selector(stringLiteral: action), forControlEvents: UIControlEvents.TouchUpInside)
            }
        }
    }
    
    public func animate(start start : Bool) {
        if start {
            self.pulseView.layer.addAnimation(pulseAnimation, forKey: nil)
        } else {
            self.pulseView.layer.removeAllAnimations()
        }
        isAnimate = start
    }
}