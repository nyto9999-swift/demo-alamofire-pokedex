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
    var moveData: [DisplayableMove] = []
    
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
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
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
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 1
        
        
        let view = AbilityCollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.sizeToFit()
        
        return view
    }()
    
    lazy var moveButton: UIButton = {
        let view = UIButton()
        view.setTitle("Moves:", for: .normal)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addTarget(self, action: #selector(pressedMove), for: .touchUpInside)
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = textLabel()
    
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
        scrollViewContainer.addArrangedSubviews(profileStackView, statStackView, abilityCollectionView, moveButton, descriptionLabel)
        
        abilityCollectionView.delegate = self
        abilityCollectionView.dataSource = self
        abilityCollectionView.register(AbilityCollectionViewCell.self, forCellWithReuseIdentifier: AbilityCollectionViewCell.identifier)
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
    
    @objc func pressedMove(){
        let destinationVC = MovesTableViewController()
        destinationVC.data = self.data?.movesCell
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
        
    func fetchPokemonInfo(with url: String?){
        guard let url = url else { return }
        
        /// Fetch Pokemon details from PokeAPi
        /// - Parameter url: "https://pokeapi.co/api/v2/pokemon-species/{id}/"
        AF.request(url)
            .validate()
            .responseDecodable(of: PokemonDescriptions.self) { [weak self] (response) in
                
                guard let pokeDescriptions = response.value,
                      let self = self
                else { return }
                
                
                self.descriptionLabel.text = pokeDescriptions.text.description.replacingOccurrences(of: "\n", with: " ")
                
            }
        
        

        
        
        let detailsUrl = url.replacingOccurrences(of: "-species", with: "", options: NSString.CompareOptions.literal, range: nil)
        
        print("PokemonViewController Before url fetched by AF : \(detailsUrl)")
    
        
        /// Fetch Pokemon details from PokeAPi
        /// - Parameter url: "https://pokeapi.co/api/v2/pokemon/{id}"
        AF.request(detailsUrl)
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
                    self.moveButton.setTitle("Moves: \(pokeDetails.movesCell.count)", for: .normal)
                    self.abilityCollectionView.reloadData()
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



