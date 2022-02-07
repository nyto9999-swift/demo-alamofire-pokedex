//
//  GenerationsViewController.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/6.
//

import UIKit
import Alamofire

class GenerationsViewController: UIViewController {

    var items: [Displayable] = []
    var chosenItem: Displayable?
    
    let tableView = UITableView()

    override func viewDidLoad() {
      super.viewDidLoad()
      setTableView()
      fetchGenerations()
    }
    
    
    func setTableView(){
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    

    
}

extension GenerationsViewController {
    func fetchGenerations() {
        AF.request("https://pokeapi.co/api/v2/generation/")
          .validate()
          .responseDecodable(of: Generations.self) { (response) in
            guard let generations = response.value else { return }
            self.items = generations.all
            self.tableView.reloadData()
          }
    }
}

extension GenerationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = item.titleLabelText
        content.secondaryText = item.subtitleLabelText
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenItem = items[indexPath.row]
        
        let destinationVC = PokemonsViewController()
        destinationVC.generation = chosenItem
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    

}







