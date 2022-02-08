//
//  PokemonsViewController.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/6.
//

import UIKit
import Alamofire

class PokemonsViewController: UIViewController {
    
    var items: [Displayable] = []
    var generation: Displayable?
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        fetchPokemons(for: generation!.subtitleLabelText)
    }
    
    func setTableView(){
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    

}

extension PokemonsViewController {
    func fetchPokemons(for url: String) {
      AF.request(url).validate().responseDecodable(of: Pokemons.self) { (response) in
        guard let pokemons = response.value else { return }
        
        self.items = pokemons.all
        self.tableView.reloadData()
      }
    }
}

extension PokemonsViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        
        let destinationVC = PokemonViewController()
        destinationVC.url = items[indexPath.row].subtitleLabelText
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    
}
