//
//  TableViewCell.swift
//  HometaskTable
//
//  Created by Bekarys Sandigali on 12.03.2024.
//

import UIKit
import SnapKit


class TableViewCell: UITableViewCell {
    let alamofire = AlamoNetwork.shared
    lazy var name:UILabel = {
       let label = UILabel()
        label.text = ""
        return label
    }()
    lazy var height:UILabel = {
       let label = UILabel()
        label.text = ""
        return label
    }()
    lazy var mass:UILabel = {
        let label = UILabel()
        label.text = ""
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    func setUp(){
        contentView.addSubview(name)
        contentView.addSubview(height)
        contentView.addSubview(mass)
        
        //constraints
        name.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(12)
        }
        height.snp.makeConstraints { make in
            make.leading.equalTo(name.snp.trailing).offset(12)
            make.top.equalToSuperview().inset(12)
            
        }
        mass.snp.makeConstraints { make in
            make.leading.equalTo(height.snp.trailing).offset(15)
            make.top.equalToSuperview().inset(12)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
