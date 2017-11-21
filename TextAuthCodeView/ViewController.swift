//
//  ViewController.swift
//  TextAuthCodeView
//
//  Created by 谢坚科 on 20/11/2017.
//  Copyright © 2017 xjk. All rights reserved.
//

import UIKit

class ViewController: UIViewController,AuthViewDelegate {

    func didFinishCode(code: NSString) {
        print(code)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let authView =  AuthView.init(frame: CGRect.init(x: 0, y: 300, width: 300, height: 100))
        authView.delegate = self
        authView.margin = 3
        authView.initialMargin = 5
        authView.inputLineColor = UIColor.green
        authView.didInputLineColor = UIColor.black
        self.view .addSubview(authView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

