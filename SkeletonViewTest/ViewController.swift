//
//  ViewController.swift
//  SkeletonViewTest
//
//  Created by Tao on 2021/5/18.
//

import UIKit

class ViewController: UIViewController {

    let dataArr: [String] = ["tableview1","tableview2","tableview3","tableview4","collectionView1","collectionView2","collectionView3","collectionView4"]
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: self.view.bounds, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "firstCell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell") {
            cell.textLabel?.text = dataArr[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let text = dataArr[indexPath.row]
        if text.contains("tableview") {
            let vc = TableViewTestViewController()
            vc.title = text
            navigationController?.pushViewController(vc, animated: true)
        } else if text.contains("collectionView") {
            let vc = CollectionViewTestViewController()
            vc.title = text
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
