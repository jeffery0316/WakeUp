//
//  WUGymInfoViewController.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/21.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import Foundation
import UIKit

final class WUGymInfoViewController: UIViewController
{
	typealias SubNavigator = AppNavigator
	var navigator: SubNavigator

	init(navigator: SubNavigator) {
		self.navigator = navigator
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
