//
//  UnderlinedTextView.swift
//  NotePad
//
//  Created by Si-Yang Wu on 2018-04-19.
//  Copyright © 2018 Si-Yang Wu. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class UnderlinedTextView: UITextView {
    var lineHeight: CGFloat = 13.8
    
//    func setup() {
//        view = loadViewFromNib() as! UITextView!
//        view.frame = bounds
//        
//        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth,
//                                 UIViewAutoresizing.flexibleHeight]
//        
//        addSubview(view)
//        
//         Add our border here and every custom setup
//                view.layer.borderWidth = 2
//                view.layer.borderColor = UIColor.white.cgColor
//                view.titleLabel!.font = UIFont.systemFont(ofSize: 40)
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setup()
//    }
//    
//    func loadViewFromNib() -> UITextView! {
//        let bundle = Bundle(for: type(of: self))
//        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
//        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UITextView
//        
//        return view
//    }
    
    override var font: UIFont? {
        didSet {
            if let newFont = font {
                lineHeight = newFont.lineHeight
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        
        let numberOfLines = Int(rect.height / lineHeight)
        let topInset = textContainerInset.top
        
        for i in 1...numberOfLines {
            let y = topInset + CGFloat(i) * lineHeight
            
            let line = CGMutablePath()
            line.move(to: CGPoint(x: 0.0, y: y))
            line.addLine(to: CGPoint(x: rect.width, y: y))
            ctx?.addPath(line)
        }
        
        ctx?.strokePath()
        
        super.draw(rect)
    }
}
