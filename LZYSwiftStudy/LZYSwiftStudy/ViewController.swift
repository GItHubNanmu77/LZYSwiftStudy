//
//  ViewController.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/22.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit
import SnapKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var table : UITableView!
    
    var dataSource = Array<String>()
    var subTitleArray = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.navigationItem.title = "home"
        
        table = UITableView(frame: CGRect(x: 0, y: 44, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: UITableView.Style.grouped)
        table.backgroundColor = UIColor.init(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        table.delegate = self
        table.dataSource = self
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(table)
        
        loadData()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.detailTextLabel?.text = subTitleArray[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = .cyan
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vcName = subTitleArray[indexPath.row]
        // 1.动态获取命名空间
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"]as? String else{
            return
        }
        // 2.根据字符串获取对应的Class并转成控制器的类型
        guard let className = NSClassFromString(nameSpace + "." + vcName)as? UIViewController.Type else{
            return
        }
        // 3.创建对应的控制器对象
        let vc = className.init()
        let fontvc = FontViewController()
        self.navigationController?.pushViewController(fontvc, animated: true)
    }
    
    func loadData() {
        dataSource.append("改变字体")
        subTitleArray.append("FontViewController")
        table.reloadData()
    }
}

