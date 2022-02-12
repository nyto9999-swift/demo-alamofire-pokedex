//
//  PokemonsViewController.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/6.
//

import UIKit
import Alamofire
import Kingfisher

class PokemonsViewController: UIViewController {
    
    var generation: Displayable? //passed data
    var items: [Displayable] = []
    var filterItems: [Displayable] = []
    var isSearch: Bool = false
    
    lazy var tableView = UITableView()
        
    lazy var searchBar:UISearchBar = {
       let view = UISearchBar()
        view.searchBarStyle = UISearchBar.Style.default
        view.isUserInteractionEnabled = true
        view.showsCancelButton = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
        fetchPokeNameAndUrl(for: generation!.subtitleLabelText) //url
    }
    
    func setViews(){
        view.addSubview(tableView)
        
        self.navigationItem.titleView = searchBar
        searchBar.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PokemonCell.self, forCellReuseIdentifier: PokemonCell.identifier)
    }
    
    func setupConstraints(){
        tableView.rowHeight = 96.5
        tableView.pin(to: view)
    }
}

// MARK: AF call
extension PokemonsViewController {
    
    
    /// Fetch Pokemon name and urlString from PokeAPi
    /// - Parameter url: https://pokeapi.co/api/v2/generation/{id}
    
    func fetchPokeNameAndUrl(for url: String) {
        
      /*
       Pokemons Model
       {
           "abilities":[...],
           "id":1,
           "main_region":{...},
           "moves":[...],
           "name":"generation-i",
           "names":[...],
           "pokemon_species":[
               {
                   "name":"bulbasaur",                                   ✓
                   "url":"https://pokeapi.co/api/v2/pokemon-species/1/", ✓
               },
               {...},
               {...},...
           ],
           "types":[...],
           "version_groups":[...])
       }
       */
        
      AF.request(url).validate().responseDecodable(of: Pokemons.self) { [weak self] (response) in
          
        guard let pokemons = response.value,
              let self = self
        else { return }
          
        self.items = pokemons.all
        self.tableView.reloadData()
      }
    }
}

// MARK: tableview view
extension PokemonsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isSearch ? filterItems.count : items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier) as! PokemonCell
        
        let item = isSearch ? filterItems[indexPath.row] : items[indexPath.row]
        
        let urlString = item.subtitleLabelText.replacingOccurrences(of: "-species", with: "", options: NSString.CompareOptions.literal, range: nil)
        cell.configure(for: urlString, title: item.titleLabelText)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = PokemonViewController()
        destinationVC.url = items[indexPath.row].subtitleLabelText
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}

//MARK: search bar
extension PokemonsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" || searchBar.text == nil {
            isSearch = false
            self.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        searchBar.resignFirstResponder()
        
        filterItems = items.filter({
            $0.titleLabelText.contains(text)
        })

        isSearch = true
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.tableView.reloadData()
        isSearch = false
    }
}
