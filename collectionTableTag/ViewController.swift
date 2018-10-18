//
//  ViewController.swift
//  collectionTableTag
//
//  Created by Jhanvi on 17/10/18.
//  Copyright © 2018 Jhanvi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RKTagsViewDelegate,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var radioBtn: UIButton!
    @IBOutlet weak var table: UITableView!
    var selectedIndex = 0
    
    let names = ["Anna", "Sam", "Smith", "qrq", "qwriweir", "wrwerer", "wrwerewr", "wrwer","Anna", "Sam", "Smith", "qrq", "qwriweir", "wrwerer", "wrwerewr", "wrwer","Anna", "Sam", "Smith", "qrq", "qwriweir", "wrwerer", "wrwerewr", "wrwer", "Anna", "Sam", "Smith", "qrq", "qwriweir", "wrwerer", "wrwerewr", "wrwer"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.table.delegate = self
        self.table.dataSource = self
//        self.table.reloadData()
        self.table.tableFooterView = UIView()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.table.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:viewCellTable = self.table.dequeueReusableCell(withIdentifier: "viewCellTable") as! viewCellTable
        cell.radioTagView.removeAllTags()
        cell.tagsViewHeightConstraint.priority = UILayoutPriority(rawValue: 1)
        cell.radioTagView.interitemSpacing = 10
        cell.radioTagView.lineSpacing = 10
        cell.radioTagView.allowsMultipleSelection = false
        cell.radioTagView.editable = false
        cell.radioTagView.delegate = self
        for name in names {
            cell.radioTagView.addTag(name)
        }
        cell.radioTagView.selectTag(at: 0)
        return cell
    }
    
    func tagsView(_ tagsView: RKTagsView, shouldSelectTagAt index: Int) -> Bool {
        print(index)
//        if selectedIndex == index {
//            return false
//        }
        selectedIndex = index
        return true
    }
    
    func tagsView(_ tagsView: RKTagsView, shouldDeselectTagAt index: Int) -> Bool {
        if selectedIndex == index {
            return false
        }
        return true
    }
}

class viewCellTable: UITableViewCell {
    @IBOutlet weak var tagsViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var radioTagView: RKTagsView!
    
}
