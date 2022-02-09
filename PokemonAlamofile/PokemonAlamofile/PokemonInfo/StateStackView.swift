//
//  StateStackView.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/8.
//

import UIKit

final class StateStackView: UIStackView {
    var data: DisplayablePokemon?
    
    private lazy var stateRowStackView1: UIStackView = stateRow()
    private lazy var textLabel1: UILabel = textLabel()
    private lazy var barView1: UIProgressView = stateBar()
    
    private lazy var stateRowStackView2: UIStackView = stateRow()
    private lazy var textLabel2: UILabel = textLabel()
    private lazy var barView2: UIProgressView = stateBar()
    
    private lazy var stateRowStackView3: UIStackView = stateRow()
    private lazy var textLabel3: UILabel = textLabel()
    private lazy var barView3: UIProgressView = stateBar()
    
    private lazy var stateRowStackView4: UIStackView = stateRow()
    private lazy var textLabel4: UILabel = textLabel()
    private lazy var barView4: UIProgressView = stateBar()
    
    private lazy var stateRowStackView5: UIStackView = stateRow()
    private lazy var textLabel5: UILabel = textLabel()
    private lazy var barView5: UIProgressView = stateBar()
    
    private lazy var stateRowStackView6: UIStackView = stateRow()
    private lazy var textLabel6: UILabel = textLabel()
    private lazy var barView6: UIProgressView = stateBar()

    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    public convenience init() {
        self.init(frame: .zero)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addArrangedSubviews(stateRowStackView1, stateRowStackView2, stateRowStackView3, stateRowStackView4, stateRowStackView5, stateRowStackView6)
        stateRowStackView1.addArrangedSubviews(textLabel1, barView1)
        stateRowStackView2.addArrangedSubviews(textLabel2, barView2)
        stateRowStackView3.addArrangedSubviews(textLabel3, barView3)
        stateRowStackView4.addArrangedSubviews(textLabel4, barView4)
        stateRowStackView5.addArrangedSubviews(textLabel5, barView5)
        stateRowStackView6.addArrangedSubviews(textLabel6, barView6)
    }
    
    private func setupConstraints(){
        self.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.isLayoutMarginsRelativeArrangement = true
    }
}

extension StateStackView {
    public func configure(){
        
        guard let data = data else {
            return
        }
        
        textLabel1.text = "HP"
        barView1.progress =  Float(1.0 - (500.0 - Double(data.statsArray[0].s)) / 500.0)
        barView1.progressTintColor = .systemMint
        
        textLabel2.text = "Attack"
        barView2.progress = Float(1.0 - (500.0 - Double(data.statsArray[1].s)) / 500.0)
        barView2.progressTintColor = .systemOrange
        
        textLabel3.text = "Defense"
        barView3.progress = Float(1.0 - (500.0 - Double(data.statsArray[2].s)) / 500.0)
        barView3.progressTintColor = .systemYellow
        
        textLabel4.text = "Special Attack"
        barView4.progress = Float(1.0 - (500.0 - Double(data.statsArray[3].s)) / 500.0)
        barView4.progressTintColor = .systemCyan
        
        textLabel5.text = "Special Defense"
        barView5.progress = Float(1.0 - (500.0 - Double(data.statsArray[4].s)) / 500.0)
        barView5.progressTintColor = .systemGreen
        
        textLabel6.text = "Speed"
        barView6.progress = Float(1.0 - (500.0 - Double(data.statsArray[5].s)) / 500.0)
        barView6.progressTintColor = .systemPink
        
//        print("data\( Float(1.0 - (500.0 - Double(data.statsArray[0].s)) / 500.0))")
    }
}
