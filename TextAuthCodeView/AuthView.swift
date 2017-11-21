//
//  AuthView.swift
//  TextAuthCodeView
//
//  Created by 谢坚科 on 20/11/2017.
//  Copyright © 2017 xjk. All rights reserved.
//

protocol AuthViewDelegate {
    func didFinishCode(code:NSString)
}

import UIKit

class AuthView: UIView,UITextFieldDelegate,AuthTextfieldDelegate {
    
    
    func authTextFieldWillDeleteBackward(textField: AuthTextField) {
        
    }
    
    func authTextFieldDidDeleteBackward(textField: AuthTextField) {
        if (0 == textField.tag) {return}
        
        let lastTextField:AuthTextField = self.textFieldArray[textField.tag - 1] as! AuthTextField
        lastTextField.text = ""
        self.canEditingTag = textField.tag - 1
        lastTextField.becomeFirstResponder()
    }
    
    var textFieldArray:NSMutableArray = []
    var authCodeLenght:Int = 6
    var canEditingTag:Int = 0
    var margin:Int = 15
    var initialMargin:Int = 20
    var delegate:AuthViewDelegate?
    var inputLineColor:UIColor = UIColor.orange
    var didInputLineColor:UIColor = UIColor.gray
    var inputKeyboardType:UIKeyboardType = UIKeyboardType.namePhonePad
    var inputKeyboardApperance:UIKeyboardAppearance = UIKeyboardAppearance.default
    override func layoutSubviews() {
        self.setupSubView()
    }
    func setupSubView() {
        self.textFieldArray = NSMutableArray.init(capacity: 6)
        for index in 0...self.authCodeLenght - 1 {
            let textField = AuthTextField.init()
            textField.delegate = self
            textField.authTextFieldDelegate = self
            textField.tag = index
            textField.textAlignment = NSTextAlignment.center
            textField.clearButtonMode = UITextFieldViewMode.never
            textField.frame = CGRect.init(x: index * (self.margin + 24) + self.initialMargin, y: 10, width: 24, height: 30)
            textField.keyboardType = self.inputKeyboardType
            textField.keyboardAppearance = self.inputKeyboardApperance
            textField.inputLineColor = self.inputLineColor
            textField.didInputLineColor = self.didInputLineColor
            textField.addTarget(self, action: #selector(AuthView.textfieldValueDidChange(textfiled:)), for: UIControlEvents.editingChanged)
            self.addSubview(textField)
            self.textFieldArray.add(textField)
        }
    }
    @objc func textfieldValueDidChange(textfiled:AuthTextField) {
        //reload line view
        textfiled.setNeedsDisplay()
        self.moveTextFields(textField: textfiled)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else{
            return true
        }
        let textLength = text.characters.count + string.characters.count - range.length
        return textLength <= 1
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if(textField.tag == self.canEditingTag){
            return true
        }
        return false
    }
    
    func moveTextFields(textField:AuthTextField)  {
        if 0 == textField.text?.characters.count {
            return;
        }
        
        //cancel keyboard
        textField.resignFirstResponder()
        
        //judge the last textField
        if(!(textField.tag + 1 < self.authCodeLenght)){
            self.delegate?.didFinishCode(code: self.getCode())
            return
        }
        
        let nextTextField:AuthTextField = self.textFieldArray[textField.tag + 1] as! AuthTextField
        self.canEditingTag = textField.tag + 1
        nextTextField.becomeFirstResponder()
    }
    func getCode() -> NSString {
        let code = NSMutableString.init()
        
        for textfield in self.textFieldArray {
            code.append((textfield as AnyObject).text)
        }
        return code
    }
}
