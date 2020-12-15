//
//  MainView.swift
//  MoviesApp
//
//  Created by Nani Sukma Putri Pratama on 13/12/20.
//

import UIKit
class MainView: UIView {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MoviesCell.superclass(), forCellReuseIdentifier: MoviesCell.identifier)
        return tableView
    }()
    
    lazy var categoryButton : UIButton = {
        let category = UIButton(type: .roundedRect)
        category.setTitle("Category", for: .normal)
        category.setTitleColor(.black, for: .highlighted)
        
        category.addTarget(self, action: #selector(ViewController.categoryTap), for: .touchUpInside)
        return category
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUpView()
        setUpConstraint()
    }
    
    private func setUpView(){

        self.addSubview(tableView)
        self.addSubview(categoryButton)
    }
    private func setUpConstraint(){

        setupTableCell()
        setUpCategory()
        
    }
    private func setUpCategory(){

        categoryButton.anchor(top: tableView.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 40, height: 30, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    private func setupTableCell(){
        tableView.anchor(top: safeAreaLayoutGuide.topAnchor, bottom: categoryButton.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, marginTop: 10, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: frame.width, height: 100, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
