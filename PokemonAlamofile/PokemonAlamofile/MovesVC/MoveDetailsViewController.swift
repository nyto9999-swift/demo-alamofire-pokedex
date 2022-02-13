//
//  MoveDetailsViewController.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/13.
//

import UIKit
import Alamofire

class MoveDetailsViewController: UIViewController {

    var data: moveName? //passed url
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
    }
    
        func setupViews(){
            let centeredView = UIView(frame: CGRect(x: 0, y: view.frame.height/2, width:view.frame.width, height: view.frame.height/2))
            self.view.addSubview(centeredView)
            centeredView.addSubviews(moveNameLabel, powerLabel, accuracyLabel, typeLabel, ppLabel, moveNameLabel, descriptionLabel)
            centeredView.backgroundColor = .white
            
            NSLayoutConstraint.activate([
                moveNameLabel.topAnchor.constraint(equalTo: centeredView.topAnchor, constant: 0),
                moveNameLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 0)
            ])
            
            NSLayoutConstraint.activate([
                powerLabel.topAnchor.constraint(equalTo: moveNameLabel.bottomAnchor, constant: 0),
                powerLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 0)
            ])
            
            NSLayoutConstraint.activate([
                accuracyLabel.topAnchor.constraint(equalTo: powerLabel.bottomAnchor, constant: 0),
                accuracyLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 0)
            ])
            NSLayoutConstraint.activate([
                typeLabel.topAnchor.constraint(equalTo: accuracyLabel.bottomAnchor, constant: 0),
                typeLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 0)
            ])
            NSLayoutConstraint.activate([
                ppLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 0),
                ppLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 0)
            ])
            NSLayoutConstraint.activate([
                descriptionLabel.topAnchor.constraint(equalTo: ppLabel.bottomAnchor, constant: 0),
                descriptionLabel.leadingAnchor.constraint(equalTo: centeredView.leadingAnchor, constant: 0)
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
                    
                    self.powerLabel.text = "Power: \(self.details?.powerLabel ?? "")"
                    self.accuracyLabel.text = "Accuracy: \(self.details?.accuracyLabel ?? "")"
                    self.ppLabel.text = "Accuracy: \(self.details?.ppLabel ?? "")"
                    self.typeLabel.text = "Type: \(self.details?.typeLabel ?? "")"
                    self.descriptionLabel.text = "Description: \(self.details?.moveDescription.description ?? "")"

                }
            }
    }
}
