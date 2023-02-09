//
//  CurrentInfoView.swift
//  Weather
//
//  Created by Kate on 08.02.2023.
//

import UIKit

final class CurrentInfoView: UIView {
    
    // MARK: Props

    struct Props: Equatable {
        let title: String
        let value: String
    }

    // MARK: - Private Props

    private var props: Props?
    
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

// MARK: - Public Methods

extension CurrentInfoView {
    func render(_ props: Props) {
        guard self.props != props else { return }
        self.props = props

        titleLabel.text = props.title
        valueLabel.text = props.value
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
