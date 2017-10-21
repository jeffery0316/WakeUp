//
//  WUGymListViewController.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/20.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import Foundation
import UIKit

class WUGymListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
	let kWUGymCell = "WUGymTableViewCell"
	var didSelect: (String) -> () = { _ in }
	var tableView: UITableView!
	var gyms: Array<String>!

	init() {
		super.init(nibName: nil, bundle: nil)
		self.tableView = UITableView.init()
		self.gyms = ["Daan", "XinYi", "RenAi"]
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad()
	{
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.red

		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: kWUGymCell)
		self.tableView.estimatedRowHeight = 44
		self.view.addSubview(self.tableView)

		var tableViewConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: [], metrics: nil, views: ["tableView": tableView])
		tableViewConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: ["tableView": tableView]))
		NSLayoutConstraint.activate(tableViewConstraints)

		// select action
		self.didSelect = { gym in
			self.navigationController?.pushViewController(WUGymViewController.init(), animated: true)
		}
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let gym = self.gyms[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: kWUGymCell, for: indexPath)
		cell.textLabel?.text = gym
		return cell
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return gyms.count
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let gym = self.gyms[indexPath.row]
		didSelect(gym)
	}
}
