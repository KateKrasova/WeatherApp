//
//  NextDaysView.swift
//  Weather
//
//  Created by Kate on 08.02.2023.
//

import UIKit

final class NextDaysView: UIView {
    
    // MARK: Props

    struct Props: Equatable {
        let dayOfTheWeek: String
        let tempValue: String
    }

    // MARK: - Private Props

    private var props: Props?
    
    //MARK: - Views
    private lazy var mainView = UIView().then{
        $0.layerBorderColor = .gray
        $0.layerBorderWidth = 1
        $0.layerCornerRadius = 20
    }

    private lazy var dayLabel = UILabel().then{
        $0.font = UIFont(name: "Optima Regular", size: 12)
        $0.text = "Text"
    }

    private lazy var weatherImage = UIImageView().then{
        $0.image = UIImage(systemName: "cloud.drizzle.fill")
        $0.tintColor = .black
    }

    private lazy var temperatureLabel = UILabel().then{
        $0.font = UIFont(name: "Optima Regular", size: 15)
        $0.text = "10° C"
        $0.textColor = .black
    }
    
    //MARK: - LifeCycle
    init() {
        super.init(frame: CGRect(x: .zero, y: .zero, width: Constants.viewSize.width, height: Constants.viewSize.height))
        configure()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public Methods

extension NextDaysView {
    func render(_ props: Props) {
        guard self.props != props else { return }
        self.props = props
        dayLabel.text = props.dayOfTheWeek
        temperatureLabel.text = "\(props.tempValue)°C"
    }
}



// MARK: - Private Methods

private extension NextDaysView {
    func configure () {
        addSubviews([
            mainView,
            dayLabel,
            weatherImage,
            temperatureLabel
        ])
    }
    
    func setupConstrains() {
        mainView.snp.makeConstraints{
            $0.width.equalTo(Constants.mainViewSize.width)
            $0.height.equalTo(Constants.mainViewSize.height)
            $0.bottom.equalToSuperview()
        }

        dayLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(mainView.snp.top)
        }

        weatherImage.snp.makeConstraints{
            $0.height.width.equalTo(26)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mainView.snp.top).offset(13)
        }

        temperatureLabel.snp.makeConstraints{
            $0.centerX.equalTo(mainView)
            $0.top.equalTo(weatherImage.snp.bottom).offset(3)
        }
    }
}

// MARK: - Constans

private extension NextDaysView {
    struct Constants {
        static let viewSize = CGSize(width: 70, height: 90)
        static let mainViewSize = CGSize(width: 70, height: 75)
    }
}
