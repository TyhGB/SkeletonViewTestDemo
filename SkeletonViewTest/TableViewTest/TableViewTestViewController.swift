//
//  TableViewTestViewController.swift
//  SkeletonViewTest
//
//  Created by Tao on 2021/5/19.
//

import UIKit
import SkeletonView

class TableViewTestViewController: UIViewController {

    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: self.view.bounds, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(TableViewOneCell.self, forCellReuseIdentifier: "secondCell")
        return table
    }()
    
    deinit {
        print("deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        view.isSkeletonable = true
        view.addSubview(tableView)
        tableView.isSkeletonable = true
        
        
        tableView.showAnimatedSkeleton()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.tableView.hideSkeleton()
        }
    }
    
}


extension TableViewTestViewController: UITableViewDelegate, SkeletonTableViewDataSource {
    //skelentonView
    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 3
    }

    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "secondCell"
    }
    
    //tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as? TableViewOneCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
