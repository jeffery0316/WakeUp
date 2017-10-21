//
//  AppDelegate.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/19.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		// each tab settings
		let browseNavigationController = UINavigationController.init()
		let browseNavigator = AppNavigator.init(navigationController: browseNavigationController)
		browseNavigationController.viewControllers = [WUBrowseViewController.init(navigator: browseNavigator)]

		let mapNavigationController = UINavigationController.init()
		let mapNavigator = AppNavigator.init(navigationController: mapNavigationController)
		mapNavigationController.viewControllers = [WUMapViewController.init(navigator: mapNavigator)]

		let settingNavigationController = UINavigationController.init()
		let settingNavigator = AppNavigator.init(navigationController: settingNavigationController)
		settingNavigationController.viewControllers = [WUSettingViewController.init(navigator: settingNavigator)]

		// tabBarController settings
		let tabBarController = UITabBarController.init()
		let tabBar = tabBarController.tabBar
		tabBarController.viewControllers = [browseNavigationController, mapNavigationController, settingNavigationController]

		let tabBarHome = tabBar.items![0]
		tabBarHome.title = "GYM"
		tabBarHome.image = UIImage(named: "tab_gym")

		let tabBarMap = tabBar.items![1]
		tabBarMap.title = "GYM Position"
		tabBarMap.image = UIImage(named: "tab_map")

		let tabBarSetting = tabBar.items![2]
		tabBarSetting.title = "Settings"
		tabBarSetting.image = UIImage(named: "tab_settings")

		window?.rootViewController = tabBarController
		window?.makeKeyAndVisible()
		return true
	}
}

