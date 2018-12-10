//
//  OlimpiadsViewController.swift
//  Olimpiads_2
//
//  Created by Антон Шуплецов on 08/12/2018.
//  Copyright © 2018 Антон Шуплецов. All rights reserved.
//

import UIKit

class OlympiadsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegat{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
   
    
   
   var olympiads = [Olimpiad]()
    
    
   // let olympiads : [String] = ["Высшая проба", "Олимпиада Ломаносова", "Турлом" ]
  //  let images : [UIImage] = [#imageLiteral(resourceName: "ВысшаяПроба.png"),#imageLiteral(resourceName: "lomonosov.jpg"),#imageLiteral(resourceName: "lom.jpg")]
    

    

 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredOlympiads = [Olimpiad]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        olympiads = [
            Olimpiad(name: "Высшая проба", image:#imageLiteral(resourceName: "ВысшаяПроба.png") ),
            Olimpiad(name: "Олимпиада Ломаносова", image:#imageLiteral(resourceName: "lomonosov.jpg") ),
            Olimpiad(name: "Турлом", image:#imageLiteral(resourceName: "lom.jpg") )
        ]
        
        
        
        
        
        //create SearchBar in head of tableView:
        tableView.tableHeaderView = searchController.searchBar
        
      
    
        //Func of create create search bar:
        //createSearchBar()
        //Delegates for collection view:
        collectionView.dataSource = self
        collectionView.delegate = self
        // Left Swipe:
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        //Right Swipe:
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        right.direction = .right
        self.view.addGestureRecognizer(right)
    }
    //Left Swipe
    @objc func swipeLeft() {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex + 1)
        
    }
    //Right Swipe
    @objc func swipeRight() {
        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }

    //CollectionView Delegates:
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //search controller func:
       if isFiltering()
            {
            return filteredOlympiads.count
        }
       return  olympiads.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let olimpiad : Olimpiad
        //modernize cell:
        //cell.nameOfOlympiadLabel.text = olympiads[indexPath.item]
      if isFiltering(){
            olimpiad = filteredOlympiads[indexPath.item]
        }
        else
        {
           olimpiad = olympiads[indexPath.item]
        }
        cell.nameOfOlympiadLabel.text = olimpiad.name
        cell.olympiadImage.image = olimpiad.image
        return cell
    }
    
    
    //Alert controller:
    @IBAction func infoButton(_ sender: Any) {
        let info = UIAlertController(title: "Инфа об олимпиадках", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) //{ (action) in print("well done")}
        info.addAction(alertAction)
        present(info, animated: true, completion: nil)
    }
    
    // for working searchController:
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText (_ searchText: String, scope: String = "All"){
        filteredOlympiads = olympiads.filter ({ (olympiad : Olimpiad) -> Bool in
            return olympiad.name.lowercased().contains(searchText.lowercased())
        })
        collectionView.reloadData()
        //tableView.reloadData()
        
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    

    //searchBar in Navigation controller in titleView
//    func createSearchBar()
//    {
//        let searchBar = UISearchBar()
//        searchBar.delegate = self
//        searchBar.showsCancelButton = false
//        searchBar.placeholder = "Поиск олимпиады..."
//
//        self.navigationItem.titleView = searchBar
//    }
//
    
    
    
    
}
