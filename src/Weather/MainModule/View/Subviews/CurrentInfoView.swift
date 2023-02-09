//
//  CurrentInfoView.swift
//  Weather
//
//  Created by Kate on 08.02.2023.
//

import UIKit

class CurrentInfoView: UIView {
    // MARK: - Views
    
    private lazy var titleLabel = UILabel().then{
        $0.text = "Info"
        $0.font = UIFont(name: "Optima Regular", size: 16)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var valueLabel = UILabel().then{
        $0.text = "n/n"
        $0.font = UIFont(name: "Optima Regular", size: 16)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private lazy var stackView = UIStackView(
        arrangedSubviews: [titleLabel, valueLabel],
        axis: .vertical,
        spacing: 8)
    
    // MARK: - LifeCycle

    init() {
        super.init(frame: .zero)
        configure()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
private extension CurrentInfoView {
    
    func configure() {
        addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
