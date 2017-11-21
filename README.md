# AuthCodeView
This a auth code View

How To Use:

	use swift code:
		let authView =  AuthView.init(frame: CGRect.init(x: 0, y: 300, width: 300, height: 100))

		authView.delegate = self

		authView.margin = 3

		authView.initialMargin = 5

		authView.inputLineColor = UIColor.green

		authView.didInputLineColor = UIColor.black

		self.view .addSubview(authView)
