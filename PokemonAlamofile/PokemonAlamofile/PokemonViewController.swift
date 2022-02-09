//
//  PokemonViewController.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/6.
//

import UIKit
import Alamofire

class PokemonViewController: UIViewController {
    
    var url: String?
    var data: DisplayablePokemon?
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var profileStackView: ProfileStackView = {
        let view = ProfileStackView()
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    lazy var stateStackView: StateStackView = {
        let view = StateStackView()
        view.axis = .vertical
        view.spacing = 10
        view.distribution = .fillProportionally
        return view
    }()
    
    lazy var abilityCollectionView: AbilityCollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 45, height: 45)
        let view = AbilityCollectionView(frame: self.view.frame, collectionViewLayout: layout)
        view.backgroundColor = .red
        view.layoutIfNeeded()
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 45).isActive = true
        view.isScrollEnabled = true
        
        return view
    }()
    
    lazy var moveTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .darkGray
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPokemonInfo(with: url!)
        
        setupViews()
        setupConstraints()
    
    }
    
 
    func setupViews(){
        
        abilityCollectionView.delegate = self
        abilityCollectionView.dataSource = self
        abilityCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        moveTableView.delegate = self
        moveTableView.dataSource = self
        moveTableView.register(UITableViewCell.self, forCellReuseIdentifier: "tcell")
        
        view.addSubview(scrollView)
        
        
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addArrangedSubviews(profileStackView, stateStackView, abilityCollectionView, moveTableView)
        
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
    
    func fetchPokemonInfo(with url: String?){
        guard let url = url else { return }
        
        let pokeUrl = url.replacingOccurrences(of: "-species", with: "", options: NSString.CompareOptions.literal, range: nil)
        print(pokeUrl)
        AF.request(pokeUrl)
          .validate()
          .responseDecodable(of: PokemonDetails.self) { (response) in
            guard let pokeDetails = response.value else { return }
              self.data = pokeDetails
              print(self.data?.statsArray[0].s)
              DispatchQueue.main.async {
                  self.profileStackView.data = self.data
                  self.profileStackView.configure()
                  self.stateStackView.data = self.data
                  self.stateStackView.configure()
              }
          }
        
    }
}

extension PokemonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = abilityCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green


        NSLayoutConstraint.activate([
            moveTableView.heightAnchor.constraint(equalToConstant: moveTableView.contentSize.height)
        ])
        return cell
    }
}

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tcell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "swords-dance"
        cell.contentConfiguration = content
        return cell
    }

}

