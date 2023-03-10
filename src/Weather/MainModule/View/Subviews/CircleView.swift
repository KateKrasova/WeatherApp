//
//  CircleView.swift
//  Weather
//
//  Created by Kate on 08.02.2023.
//

import UIKit

final class CircleView: UIView {
    // MARK: Props

    struct Props: Equatable {
        let tempValue: String
    }

    // MARK: - Private Props

    private var props: Props?
    
    //MARK: - Views
    
    private lazy var temperatureLabel = UILabel().then{
        $0.textColor = .black
        $0.font = UIFont(name: "Optima Regular", size: 50)
        $0.text = "10 °C"
    }
    
    private lazy var weatherImage = UIImageView().then{
        $0.image = UIImage(systemName: "cloud.drizzle.fill")
        $0.tintColor = .black
    }
    
    
    //MARK: - LifeCycle

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

extension CircleView {
    func render(_ props: Props) {
        guard self.props != props else { return }
        self.props = props

        temperatureLabel.text = "\(props.tempValue)°C"
    }
}

// MARK: - Private Methods
private extension CircleView {
   
    func configure() {
        backgroundColor = .white
        
        addSubviews([
            temperatureLabel,
            weatherImage
        ])
    }
    
    func setupConstraints() {
        temperatureLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(49)
        }
        
        weatherImage.snp.makeConstraints{
            $0.width.height.equalTo(75)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(12)
        }
    }
}
