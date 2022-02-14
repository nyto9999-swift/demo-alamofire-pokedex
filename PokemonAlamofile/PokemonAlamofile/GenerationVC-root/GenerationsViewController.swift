//
//  GenerationsViewController.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/6.
//

import UIKit
import Alamofire
import Kingfisher

class GenerationsViewController: UIViewController {

    var items: [Displayable] = [] //store fetched data from PokeAPi
    var passingItem: Displayable?
    let tableView = UITableView()

    override func viewDidLoad() {
      super.viewDidLoad()
      setTableView()
      setupConstraints()
      fetchGenerations()
    }
    
    func setTableView(){
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        
        tableView.register(GenerationCell.self, forCellReuseIdentifier: GenerationCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints(){
        tableView.pin(to: view)
    }
}

extension GenerationsViewController {
    
    /// Fetch Pokemon generations
    /// url: https://pokeapi.co/api/v2/generation/
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GenerationCell.identifier, for: indexPath) as! GenerationCell
        cell.configure(for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        passingItem = items[indexPath.row]
        let destinationVC = PokemonsViewController()
        destinationVC.generation = passingItem
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}







