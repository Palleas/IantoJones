//
//  ControlPanel.swift
//  IantoJones
//
//  Created by Romain Pouclet on 2015-07-16.
//  Copyright (c) 2015 Perfectly-Cooked. All rights reserved.
//

import UIKit

public protocol Panel {
    var title: String { get }
    var viewController: UIViewController { get }
}

public class ValuesPanel: NSObject, Panel {
    public let title: String
    let values: [String]
    let listViewController = UITableViewController(style: .Grouped)
    
    init(title: String, values: [String]) {
        
        self.title = title
        self.values = values

        super.init()

        listViewController.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "ValueCell")
        listViewController.tableView.dataSource = self
    }
    
    public var viewController: UIViewController {
        return listViewController
    }
}

extension ValuesPanel: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ValueCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = values[indexPath.row]

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
}

public class ControlPanel: NSObject {
    private var panels = [String: Panel]()
    private let listViewController = UITableViewController(style: .Grouped)
    
    var viewController: UIViewController {
        return listViewController
    }

    override public init() {
        
    }
    
    public func registerPanel(panel: Panel, forSettingKey key: String) {
        panels[key] = panel
    }
    
    
}
