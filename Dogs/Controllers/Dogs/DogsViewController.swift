//
//  DogsViewController.swift
//  Dogs
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
        
        service
            .fetchAllBreeds(isSuccess: { [weak self] raw in
                let breeds = BreedsBuilder.build(from: raw)
                self?.breeds = breeds
                DispatchQueue.main.async {
                    self?.tableView?.reloadData()
                }
                },
                            isFailure: { _ in
                                
            })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView?.frame = view.bounds
    }
}

extension DogsViewController {
    private func commonInit() {
        view.backgroundColor = .white
        configureNavigationBar()
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
    
    private func configureNavigationBar() {
        navigationItem.title = "Породы"
    }
}

extension DogsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let performFetchImage = breeds[indexPath.row].imageURL.isEmpty
        guard performFetchImage else { return }
        service
            .fetchBreedImg(for: breeds[indexPath.row].breed,
                           isSuccess: { [weak self] model in
                            self?.breeds[indexPath.row].setImageURL(model.message)
                            DispatchQueue.main.async {
                                self?.tableView?.reloadData()
                            }
                            
                }, isFailure: {_ in
                    
            })
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
