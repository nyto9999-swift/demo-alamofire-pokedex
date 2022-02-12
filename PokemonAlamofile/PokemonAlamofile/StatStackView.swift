//
//  StateStackView.swift
//  PokemonAlamofile
//
//  Created by 宇宣 Chen on 2022/2/8.
//

import UIKit

final class StatStackView: UIStackView {
    var data: DisplayablePokemon?
    
    private lazy var statRowStackView1: UIStackView = statRow()
    private lazy var textLabel1: UILabel = textLabel()
    private lazy var barView1: UIProgressView = stateBar()
    
    private lazy var statRowStackView2: UIStackView = statRow()
    private lazy var textLabel2: UILabel = textLabel()
    private lazy var barView2: UIProgressView = stateBar()
    
    private lazy var statRowStackView3: UIStackView = statRow()
    private lazy var textLabel3: UILabel = textLabel()
    private lazy var barView3: UIProgressView = stateBar()
    
    private lazy var statRowStackView4: UIStackView = statRow()
    private lazy var textLabel4: UILabel = textLabel()
    private lazy var barView4: UIProgressView = stateBar()
    
    private lazy var statRowStackView5: UIStackView = statRow()
    private lazy var textLabel5: UILabel = textLabel()
    private lazy var barView5: UIProgressView = stateBar()
    
    private lazy var statRowStackView6: UIStackView = statRow()
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
        self.addArrangedSubviews(statRowStackView1, statRowStackView2, statRowStackView3, statRowStackView4, statRowStackView5, statRowStackView6)
        statRowStackView1.addArrangedSubviews(textLabel1, barView1)
        statRowStackView2.addArrangedSubviews(textLabel2, barView2)
        statRowStackView3.addArrangedSubviews(textLabel3, barView3)
        statRowStackView4.addArrangedSubviews(textLabel4, barView4)
        statRowStackView5.addArrangedSubviews(textLabel5, barView5)
        statRowStackView6.addArrangedSubviews(textLabel6, barView6)
    }
    
    private func setupConstraints(){
        self.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.isLayoutMarginsRelativeArrangement = true
    }
}

extension StatStackView {
    public func configure(){
        
        guard let data = data else {
            return
        }
        
        textLabel1.text = "HP: \(data.statsArray[0].value)"
        textLabel2.text = "Attack: \(data.statsArray[1].value)"
        textLabel3.text = "Defense: \(data.statsArray[2].value)"
        textLabel4.text = "Special Attack: \(data.statsArray[3].value)"
        textLabel5.text = "Special Defense: \(data.statsArray[4].value)"
        textLabel6.text = "Speed: \(data.statsArray[5].value)"
        barView1.progressTintColor = .systemMint
        barView2.progressTintColor = .systemOrange
        barView3.progressTintColor = .systemYellow
        barView4.progressTintColor = .systemCyan
        barView5.progressTintColor = .systemGreen
        barView6.progressTintColor = .systemPink
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            self.barView1.setProgress(Float(1.0 - (160.0 - Double(data.statsArray[0].value)) / 160.0), animated: false)
            self.barView2.setProgress(Float(1.0 - (160.0 - Double(data.statsArray[1].value)) / 160.0), animated: false)
            self.barView3.setProgress(Float(1.0 - (160.0 - Double(data.statsArray[2].value)) / 160.0), animated: false)
            self.barView4.setProgress(Float(1.0 - (160.0 - Double(data.statsArray[3].value)) / 160.0), animated: false)
            self.barView5.setProgress(Float(1.0 - (160.0 - Double(data.statsArray[4].value)) / 160.0), animated: false)
            self.barView6.setProgress(Float(1.0 - (160.0 - Double(data.statsArray[5].value)) / 160.0), animated: false)
            
            UIViewPropertyAnimator.runningPropertyAnimator(
                withDuration: 0.65, delay: 0,
                options: [
                    .curveEaseIn,
                    .preferredFramesPerSecond60
                ], animations: {
                    
                self.barView1.layoutIfNeeded()
                self.barView2.layoutIfNeeded()
                self.barView3.layoutIfNeeded()
                self.barView4.layoutIfNeeded()
                self.barView5.layoutIfNeeded()
                self.barView6.layoutIfNeeded()
                    
            })
        }
//        print("data\( Float(1.0 - (500.0 - Double(data.statsArray[0].s)) / 500.0))")
    }
}
