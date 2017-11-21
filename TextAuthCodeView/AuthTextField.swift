//
//  AuthTextField.swift
//  TextAuthCodeView
//
//  Created by 谢坚科 on 20/11/2017.
//  Copyright © 2017 xjk. All rights reserved.
//

protocol AuthTextfieldDelegate {
    func authTextFieldWillDeleteBackward(textField:AuthTextField)
    func authTextFieldDidDeleteBackward(textField:AuthTextField)
}
import UIKit

class AuthTextField: UITextField {

    var authTextFieldDelegate: AuthTextfieldDelegate?
    var inputLineColor:UIColor = UIColor.orange
    var didInputLineColor:UIColor = UIColor.gray
    var lineWidth:CGFloat = 2.0
    var textFont:UIFont = UIFont.init()
    var limitLenght:Int = 1
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     //   fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
       
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let context = UIGraphicsGetCurrentContext()
        let path = CGMutablePath()
        path.move(to: CGPoint.init(x: rect.origin.x, y: rect.height))
        path.addLine(to: CGPoint.init(x: rect.width, y: rect.height))
        context?.addPath(path)
        
        context?.setStrokeColor(self.text?.isEmpty == true ? self.inputLineColor.cgColor : self.didInputLineColor.cgColor)
        context?.setLineWidth(self.lineWidth)
        
        context?.strokePath()
    }
    
    override func deleteBackward() {
        let str = self.text;
        
        self.authTextFieldDelegate?.authTextFieldWillDeleteBackward(textField: self)
        
        super .deleteBackward()
        //reload  lineView color
        self.setNeedsDisplay()
        if (str?.isEmpty == false) {
            return;
        }
        self.authTextFieldDelegate?.authTextFieldDidDeleteBackward(textField: self)
    }
}
