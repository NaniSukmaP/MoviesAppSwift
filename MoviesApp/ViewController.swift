//
//  ViewController.swift
//  MoviesApp
//
//  Created by Nani Sukma Putri Pratama on 14/12/20.
//

import UIKit
class ViewController: UIViewController , UIActionSheetDelegate{
    
    var movies  = MoviesModel()
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(MoviesCell.self, forCellReuseIdentifier: MoviesCell.identifier)
//        return tableView
//    }()
    
    let display = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Movies App"
        let button1 = UIBarButtonItem(image: UIImage(systemName:"heart"), style: .plain, target: self, action: #selector(heartButtonTap)) //
        navigationItem.rightBarButtonItem  = button1

        view = MainView()
        display.tableView.dataSource = self
        display.tableView.delegate = self
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
        display.tableView.frame = view.bounds
    
        }
    @objc func heartButtonTap(){
        let navController: UINavigationController = UINavigationController()
        navController.viewControllers = [DetailViewController()]
        UIApplication.shared.windows.first?.rootViewController = navController
    }
//
    @objc func categoryTap(){
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Please select", message: "Option to select", preferredStyle: .actionSheet)

            let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
                print("Cancel")
            }
            actionSheetControllerIOS8.addAction(cancelActionButton)

            let saveActionButton = UIAlertAction(title: "Save", style: .default)
                { _ in
                   print("Save")
            }
            actionSheetControllerIOS8.addAction(saveActionButton)

            let deleteActionButton = UIAlertAction(title: "Delete", style: .default)
                { _ in
                    print("Delete")
            }
            actionSheetControllerIOS8.addAction(deleteActionButton)
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
    
}
   
