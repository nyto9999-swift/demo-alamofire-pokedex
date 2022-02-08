//
//  StateStackView.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/8.
//

import UIKit

final class StateStackView: UIStackView {
    
    private lazy var rowStackView1: UIStackView = stateRow()
    private lazy var textLabel1: UILabel = stateLabel()
    private lazy var barView1: UIProgressView = stateBar()
    
    private lazy var rowStackView2: UIStackView = stateRow()
    private lazy var textLabel2: UILabel = stateLabel()
    private lazy var barView2: UIProgressView = stateBar()
    
    private lazy var rowStackView3: UIStackView = stateRow()
    private lazy var textLabel3: UILabel = stateLabel()
    private lazy var barView3: UIProgressView = stateBar()
    
    private lazy var rowStackView4: UIStackView = stateRow()
    private lazy var textLabel4: UILabel = stateLabel()
    private lazy var barView4: UIProgressView = stateBar()
    
    private lazy var rowStackView5: UIStackView = stateRow()
    private lazy var textLabel5: UILabel = stateLabel()
    private lazy var barView5: UIProgressView = stateBar()
    
    private lazy var rowStackView6: UIStackView = stateRow()
    private lazy var textLabel6: UILabel = stateLabel()
    private lazy var barView6: UIProgressView = stateBar()

    
    private override init(frame: CGRect) {
        super.init(frame: frame)
            
        setupViews()
        setupConstraints()
        configureState()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        self.addArrangedSubviews(rowStackView1, rowStackView2, rowStackView3, rowStackView4, rowStackView5, rowStackView6)
        rowStackView1.addArrangedSubviews(textLabel1, barView1)
        rowStackView2.addArrangedSubviews(textLabel2, barView2)
        rowStackView3.addArrangedSubviews(textLabel3, barView3)
        rowStackView4.addArrangedSubviews(textLabel4, barView4)
        rowStackView5.addArrangedSubviews(textLabel5, barView5)
        rowStackView6.addArrangedSubviews(textLabel6, barView6)
    }
    
    private func setupConstraints(){

    }
}

extension StateStackView {
    public func configureState(){
        textLabel1.text = "HP"
        barView1.progress = 0.03
        textLabel2.text = "Attack"
        barView2.progress = 0.5
        textLabel3.text = "def"
        barView3.progress = 0.4
        textLabel4.text = "sa"
        barView4.progress = 0.2
        textLabel5.text = "sd"
        barView5.progress = 0.6
        textLabel6.text = "speed"
        barView6.progress = 0.3
    }
}
