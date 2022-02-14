//
//  MoveDetailsViewController.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/13.
//

import UIKit
import Alamofire

class MoveDetailsViewController: UIViewController {

    var data: moveName? //passed url and name
    var details: DisplayableMove?
    
    private lazy var moveNameLabel: UILabel = textLabel()
    private lazy var powerLabel: UILabel = textLabel()
    private lazy var accuracyLabel: UILabel = textLabel()
    private lazy var typeLabel: UILabel = textLabel()
    private lazy var ppLabel: UILabel = textLabel()
    private lazy var descriptionLabel: UILabel = textLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.moveNameLabel.text = "Move: \(self.data?.name ?? "")"
        fetchMoveDetails(for: data?.url)
        setupViews()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
              self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupViews(){
        let centeredView = UIView(frame: CGRect(x: 0, y: view.frame.height/2, width:view.frame.width, height: view.frame.height/2))
        self.view.addSubview(centeredView)
        centeredView.addSubviews(moveNameLabel, powerLabel, accuracyLabel, typeLabel, ppLabel, moveNameLabel, descriptionLabel)
        
        centeredView.backgroundColor = .white
        centeredView.layer.cornerRadius = 20
        
        moveNameLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        NSLayoutConstraint.activate([
            moveNameLabel.topAnchor.constraint(equalTo: centeredView.topAnchor, constant: 5),
            moveNameLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 10),
            moveNameLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: 10),
        ])
        
        powerLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        NSLayoutConstraint.activate([
            powerLabel.topAnchor.constraint(equalTo: moveNameLabel.bottomAnchor, constant: 5),
            powerLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 10),
            powerLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: 10),
        ])
        
        accuracyLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        NSLayoutConstraint.activate([
            accuracyLabel.topAnchor.constraint(equalTo: powerLabel.bottomAnchor, constant: 5),
            accuracyLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 10),
            accuracyLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: 10),
            
        ])
        
        typeLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: accuracyLabel.bottomAnchor, constant: 5),
            typeLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: 10),
        ])
        
        ppLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        NSLayoutConstraint.activate([
            ppLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 5),
            ppLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 10),
            ppLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: 10),
        ])
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: ppLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: centeredView.trailingAnchor, constant: 20),
        ])
    }
    
    func fetchMoveDetails(for url: String?){
        
        AF.request(url!)
            .validate()
            .responseDecodable(of: MoveDetails.self) { [weak self] (response) in
                
                guard let moveDetails = response.value,
                      let self = self
                else { return }
                
                self.details = moveDetails
                
                DispatchQueue.main.async {
                    
                    self.powerLabel.text =    "Power: \(self.details?.powerLabel ?? "")"
                    self.accuracyLabel.text = "Accuracy: \(self.details?.accuracyLabel ?? "")"
                    self.ppLabel.text =       "PP: \(self.details?.ppLabel ?? "")"
                    self.typeLabel.text =     "Type: \(self.details?.typeLabel ?? "")"
                    self.descriptionLabel.text = "\(self.details?.moveDescription.description.replacingOccurrences(of: "\n", with: " ") ?? "")"
                    print(self.descriptionLabel.text)
                }
            }
    }
}
