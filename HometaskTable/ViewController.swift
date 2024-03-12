//
//  ViewController.swift
//  HometaskTable
//
//  Created by Bekarys Sandigali on 12.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let button:UIButton = {
       let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.backgroundColor = .white
        button.snp.makeConstraints { make in
            button.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
                make.height.equalTo(70)
                make.width.equalTo(180)
            }
        }
    }
    
    @objc func nextTap(){
        navigationController?.pushViewController(TableViewController(), animated: true)
    }


}

