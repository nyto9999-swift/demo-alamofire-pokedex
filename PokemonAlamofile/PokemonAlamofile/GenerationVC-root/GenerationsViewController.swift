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

    var items: [Displayable] = []
    var chosenItem: Displayable?
    let tableView = UITableView()
    var imageSet = [UIImage]()


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
        
        tableView.register(GenerationCell.self, forCellReuseIdentifier: GenerationCell.identifier)
    }
    
    func setupConstraints(){
        tableView.pin(to: view)
        tableView.rowHeight = (view.frame.height - 100 ) / 8
    }
}

extension GenerationsViewController {
    
    /// Fetch Pokemon generations
    /// url: https://pokeapi.co/api/v2/generation/
    
    func fetchGenerations() {
        
        /*
         Generations model
         {
             "count":8,
             "next":null,
             "previous":null,
             "results":[
                 {
                     "name":"generation-i",                           ✓
                     "url":"https://pokeapi.co/api/v2/generation/1/", ✓
                 },
                 {
                     "name":"generation-ii",
                     "url":"https://pokeapi.co/api/v2/generation/2/",
                 },
                 {...}(2 hidden elements),
                 {...}...
             ]
         }
        */
        
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
        chosenItem = items[indexPath.row]
        
        let destinationVC = PokemonsViewController()
        destinationVC.generation = chosenItem
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}







