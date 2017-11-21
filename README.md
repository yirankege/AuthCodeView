# AuthCodeView
This a auth code View,can update some properties,
	the properties as follows:(margin,lineColor,keyboard,...) 
这个用于验证码的demo，可以修改一些属性，比如：边距，线的颜色，键盘

How To Use:

	use swift code:
		let authView =  AuthView.init(frame: CGRect.init(x: 0, y: 300, width: 300, height: 100))

		authView.delegate = self

		authView.margin = 3

		authView.initialMargin = 5

		authView.inputLineColor = UIColor.green

		authView.didInputLineColor = UIColor.black

		self.view .addSubview(authView)
