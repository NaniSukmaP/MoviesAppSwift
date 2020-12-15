//
//  ViewController.swift
//  MoviesApp
//
//  Created by Nani Sukma Putri Pratama on 14/12/20.
//

import UIKit
class ViewController: UIViewController , UIActionSheetDelegate{
    
    var movies  = MoviesModel()
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MoviesCell.self, forCellReuseIdentifier: MoviesCell.identifier)
        return tableView
    }()
    
    lazy var categoryButton : UIButton = {
        let category = UIButton(type: .roundedRect)
        category.setTitle("Category", for: .normal)
        category.setTitleColor(.white, for: .highlighted)
        
        category.addTarget(self, action: #selector(ViewController.categoryTap), for: .touchUpInside)
        return category
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Movies App"
        let button1 = UIBarButtonItem(image: UIImage(systemName:"heart"), style: .plain, target: self, action: #selector(heartButtonTap)) //
        navigationItem.rightBarButtonItem  = button1
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        view.addSubview(categoryButton)
    }
    override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
            categoryButton.anchor(top: tableView.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, marginTop: 0, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: 40, height: 30, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
            
            tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: categoryButton.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, marginTop: 10, marginBottom: 0, marginLeading: 0, marginTrailing: 0, width: view.frame.width, height: 100, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
        
            }

    @objc func heartButtonTap(){
        let navController: UINavigationController = UINavigationController()
        navController.viewControllers = [DetailViewController()]
        UIApplication.shared.windows.first?.rootViewController = navController
    }
//
    @objc func categoryTap(){
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Category", message: "Please select your category", preferredStyle: .actionSheet)

        let popularActionButton = UIAlertAction(title: "Popular", style: .default) { _ in
                print("Popular")
            }
            actionSheetControllerIOS8.addAction(popularActionButton)

            let upcomingActionButton = UIAlertAction(title: "Upcoming", style: .default)
                { _ in
                   print("Upcoming")
            }
            actionSheetControllerIOS8.addAction(upcomingActionButton)

            let topRatedActionButton = UIAlertAction(title: "Top Rated", style: .default)
                { _ in
                    print("Top Rated")
            }
            actionSheetControllerIOS8.addAction(topRatedActionButton)
            let nowPlayingActionButton = UIAlertAction(title: "Now Playing", style: .default)
            { _ in
                print("Now Playing")
            }
            actionSheetControllerIOS8.addAction(nowPlayingActionButton)
            self.present(actionSheetControllerIOS8, animated: true, completion: nil)
    }
    
    
    
}
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(movies.movie.count)
        return movies.movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviesCell.identifier, for: indexPath) as? MoviesCell else {return UITableViewCell()}
        let currentLastItem = movies.movie[indexPath.row]
        cell.moviesData = currentLastItem
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//
}
   
