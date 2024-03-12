//
//  TableViewController.swift
//  HometaskTable
//
//  Created by Bekarys Sandigali on 12.03.2024.
//

import UIKit

class TableViewController: UITableViewController {
    let alamofire = AlamoNetwork.shared
    var apiResults: [Apis] = []
    lazy var someTableView :UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        return table
    }()
    lazy var pressButton :UIButton = {
        let button = UIButton()
        button.setTitle("press", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        view.backgroundColor = .white
    }
    func setUp(){
        view.addSubview(someTableView)
        view.addSubview(pressButton)
        
        
        //constraint
       
        pressButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(120)
        }
        someTableView.snp.makeConstraints { make in
            make.top.equalTo(pressButton.snp.bottom).offset(30)
            make.left.right.bottom.equalToSuperview()
        }
        
        view.bringSubviewToFront(pressButton)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiResults.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
                as? TableViewCell else {return UITableViewCell() }
        let apiResult = apiResults[indexPath.row]
        cell.name.text = apiResult.name
        cell.height.text = apiResult.height
        cell.mass.text = apiResult.mass
        return cell
    }
    @objc func tapButton(){
        print("Tapped")
        alamofire.getApi { response in
            if let results = response?.results {
                self.apiResults = results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }
}
