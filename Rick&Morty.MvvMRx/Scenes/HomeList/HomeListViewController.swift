//
//  HomeListViewController.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import UIKit
import RxSwift

final class HomeListViewController : BaseTableViewController {
    lazy var refresher : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = AppColors.primary
         return refreshControl
     }()
    
    var viewModel : HomeListViewModel!
    private let disposeBag = DisposeBag()
    
    

    override func loadView() {
        super.loadView()
        tableView.dataSource = nil
        tableView.separatorStyle = .none
        tableView.refreshControl = refresher
        tableView.register(HomeListTableViewCell.self, forCellReuseIdentifier: "HomeListTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        bindViewModel()
    }
    
    private func setUpView() {
        self.addNavigationBar(title: Constants.App.navTitle, titleColor: AppColors.secondary, titleFont: UIFont.boldSystemFont(ofSize: 16), backgroundColor: AppColors.primary)
    }
    
    private func bindViewModel() {
        viewModel.bind.accept(())
        
        viewModel.characters.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "HomeListTableViewCell", cellType: HomeListTableViewCell.self)) { index, element, cell in
                cell.setUpData(response: element)
            }.disposed(by: disposeBag)

        refresher
            .rx.controlEvent(.valueChanged)
            .subscribe(onNext: { [weak self] in
                self?.viewModel.reloadData.accept(())
                self?.refresher.endRefreshing()
            }, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
        
    }
}
