//
//  MoveTableViewController.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/12.
//

import UIKit
import Alamofire


class MovesTableViewController: UITableViewController {

    var data: Array<move>? //passed move's name and url

    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        super.viewDidLoad()

        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = data?[indexPath.row].move.name
        cell.contentConfiguration = content
//        print(data?[indexPath.row].move.url)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let destinationVC = MoveDetailsViewController()
        print("move: \(data?[indexPath.row].move.name) URL: \(data?[indexPath.row].move.url)")
        
        
        destinationVC.data = data?[indexPath.row].move
        
        destinationVC.modalTransitionStyle = .crossDissolve
        self.present(destinationVC, animated: true)
    }
}
