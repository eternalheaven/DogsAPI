//
//  MainViewController.swift
//  Dogs
//
//  Created by Alexandr Khrutskiy on 08/12/2019.
//  Copyright © 2019 Alexandr Khrutskiy. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var allDogsButton: UIButton? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        self.navigationItem.title = "Главная"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        configureNavBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        allDogsButton?.center = view.center
    }
}

extension MainViewController {
    private func commonInit() {
        view.backgroundColor = .white
        addButton()
        
    }
    
    private func addButton() {
        let allDogsButton = UIButton(type: .system)
        allDogsButton.setTitle("Показать все породы", for: .normal)
        allDogsButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        allDogsButton.frame.size = CGSize(width: 200, height: 44)
        allDogsButton.layer.cornerRadius = 12.0
        allDogsButton.tintColor = .white
        allDogsButton.addTarget(self, action: #selector(didTapAllDogsButton),
                                for: .touchDragInside)
        view.addSubview(allDogsButton)
        self.allDogsButton = allDogsButton
    }
//
//    private func configureNavBar() {
//        navigationController?.navigationBar.topItem?.title = "Породы"
//        navigationController?.navigationBar.backItem?.title = "Назад"
//    }
    
    @objc
    private func didTapAllDogsButton() {
        let mainViewController = DogsViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }
}
