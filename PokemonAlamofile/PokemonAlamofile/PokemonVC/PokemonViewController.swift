//
//  PokemonViewController.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/6.
//

import UIKit
import Alamofire

class PokemonViewController: UIViewController {
    
    var url: String? //passed data
    var data: DisplayablePokemon?
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var profileStackView: ProfileStackView = {
        let view = ProfileStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var statStackView: StatStackView = {
        let view = StatStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var abilityCollectionView: AbilityCollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 40)
        layout.sectionInset = UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 10);
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 1
        
        let view = AbilityCollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var moveTableView: MoveTableView = {
        let view = MoveTableView()
        view.estimatedRowHeight = 44
        view.isUserInteractionEnabled = true
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        fetchPokemonInfo(with: url!)
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubviews(profileStackView, statStackView, abilityCollectionView, moveTableView)
        
        abilityCollectionView.delegate = self
        abilityCollectionView.dataSource = self
        abilityCollectionView.register(AbilityCollectionViewCell.self, forCellWithReuseIdentifier: AbilityCollectionViewCell.identifier)
        
        moveTableView.delegate = self
        moveTableView.dataSource = self
        moveTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            // this is important for scrolling
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
        
    
    /// Fetch Pokemon details from PokeAPi
    /// - Parameter url: "https://pokeapi.co/api/v2/pokemon/{id}"
        
    func fetchPokemonInfo(with url: String?){
        guard let url = url else { return }
        
        let pokeUrl = url.replacingOccurrences(of: "-species", with: "", options: NSString.CompareOptions.literal, range: nil)
        
        print("PokemonViewController Before url fetched by AF : \(pokeUrl)")
        
        
        /*
         PokemonDetails Model
         {
             "abilities":[...],     ✓
             "base_experience":64,  ✓
             "forms":[...],
             "game_indices":[...],
             "height":7,            ✓
             "held_items":[...],
             "id":1,
             "is_default":true,
             "location_area_encounters",
             "moves":[...],
             "name":"bulbasaur",
             "order":1,
             "past_types":[...],
             "species":{...},
             "sprites":{...},       ✓ poke image url
             "stats":[...],         ✓
             "types":[...],         ✓
             "weight":69,           ✓
         }
         */
        
        AF.request(pokeUrl)
            .validate()
            .responseDecodable(of: PokemonDetails.self) { [weak self] (response) in
                
                guard let pokeDetails = response.value,
                      let self = self
                else { return }
                
                self.data = pokeDetails
                
                DispatchQueue.main.async {
                    self.profileStackView.data = self.data
                    self.profileStackView.configure()
                    self.statStackView.data = self.data
                    self.statStackView.configure()
                    self.abilityCollectionView.reloadData()
                    self.moveTableView.invalidateIntrinsicContentSize()
                    self.moveTableView.reloadData()
                }
            }
    }
}

//MARK: collection view
extension PokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data?.abilitiesButton.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = abilityCollectionView.dequeueReusableCell(withReuseIdentifier: AbilityCollectionViewCell.identifier, for: indexPath) as! AbilityCollectionViewCell
        
        cell.data = self.data?.abilitiesButton[indexPath.row].ability.name
        print(self.data?.abilitiesButton[indexPath.row].ability.name)
        cell.configure()
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

//MARK: table view
extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.movesCell.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = data?.movesCell[indexPath.row].move.name
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

