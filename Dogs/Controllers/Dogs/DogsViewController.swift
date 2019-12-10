//
//  DogsViewController.swift
//  Khrutskiy DZ 2 Dogs
//
//  Created by Alexandr Khrutskiy on 08/12/2019.
//  Copyright © 2019 Alexandr Khrutskiy. All rights reserved.
//

import UIKit

class DogsViewController: UIViewController {
    
    private var service = DogService.instance
    private var breeds = [Breed]()
    private var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        self.navigationItem.title = "Породы"
        
        service
            .fetchAllBreeds(isSuccess: { (raw) in
                let breeds = BreedsBuilder.build(from: raw)
                self.breeds = breeds
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
            },
                            isFailure: { _ in
                                
            })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        configureNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView?.frame = view.bounds
    }
}

extension DogsViewController {
    private func commonInit() {
        view.backgroundColor = .white
//        configureNavigationBar()
        addTableView()
    }
    
    private func addTableView() {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(UINib(nibName: "BreedTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "BreedTableViewCell")
        
        self.tableView = tableView
    }
    
//    private func configureNavigationBar() {
//
//        self.navigationController?.navigationBar.backItem?.title = "Назад"
//        self.navigationController?.navigationBar.topItem?.title = "Породы"
//    }
}

extension DogsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DogsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreedTableViewCell",
                                                 for: indexPath) as! BreedTableViewCell
        cell.configure(breed: breeds[indexPath.row])
        return cell
    }
}
