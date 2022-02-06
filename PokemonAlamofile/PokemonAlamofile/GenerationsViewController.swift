//
//  GenerationsViewController.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/6.
//

import UIKit

class GenerationsViewController: UIViewController {

    private var label: UILabel = {
      let label = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.height/2, width: UIScreen.main.bounds.width, height: 50))
      label.textAlignment = .center
      label.text = "No Storyboard!"
      return label
    }()
    
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .lightGray
      view.addSubview(label)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
