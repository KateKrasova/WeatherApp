//
//  MainView.swift
//  Weather
//
//  Created by Kate on 02.02.2023.
//

import UIKit
import SnapKit
import SwifterSwift
import Then

class MainView: UIView {
    
    // MARK: - Views
    private lazy var findButton = UIButton(type: .system).then{
        $0.setImage(UIImage(named: "find"), for: .normal)
        $0.tintColor = .black
    }
    
    private lazy var dateLabel = UILabel().then{
        $0.font = UIFont(name: "Optima Regular", size: 16)
        $0.text = "Today, May 7th, 2021"
        $0.textColor = .white
    }
    
    private lazy var cityLabel = UILabel().then{
        $0.font = UIFont(name: "Optima Bold", size: 40)
        $0.text = "Barcelona"
        $0.textColor = .white
    }
    
    private lazy var countryLabel = UILabel().then{
        $0.font = UIFont(name: "Optima Regular", size: 20)
        $0.text = "Spain"
        $0.textColor = .white
    }
    
    private lazy var locationStackView = UIStackView(
        arrangedSubviews: [dateLabel, cityLabel, countryLabel],
        axis: .vertical,
        spacing: -10,
        alignment: .center,
        distribution: .fillEqually)
    
    private lazy var roundView = UILabel().then{
        $0.backgroundColor = .white
        $0.layerCornerRadius = 240/2 // вопрос вынести ли в константу высоту?
    }
    
    private lazy var temperatureLabel = UILabel().then{
        $0.text = "10°C"
        $0.textColor = .black
        $0.font = UIFont(name: "Optima Regular", size: 90)
    }
    
    private lazy var weatherImage = UIImageView().then{
        $0.image = UIImage(systemName: "cloud.drizzle.fill")
        $0.tintColor = .black
    }

    private lazy var bottomView = UIView().then {
        $0.backgroundColor = .white
        $0.layerCornerRadius = 60.0
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private lazy var windLabel = UILabel().then{
        $0.text = "Wind Status \n n/n"
        $0.font = UIFont(name: "Optima Regular", size: 16)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    private lazy var visibilityLabel = UILabel().then{
        $0.text = "Visibility \n n/n"
        $0.font = UIFont(name: "Optima Regular", size: 16)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    private lazy var humidityLabel = UILabel().then{
        $0.text = "Humidity \n n/n"
        $0.font = UIFont(name: "Optima Regular", size: 16)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    private lazy var airLabel = UILabel().then{
        $0.text = "Air Pressure \n n/n"
        $0.font = UIFont(name: "Optima Regular", size: 16)
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }
    
    private lazy var infoStackView = UIStackView(
        arrangedSubviews: [
            UIStackView(
                arrangedSubviews: [windLabel, humidityLabel],
                axis: .vertical,
                spacing: 20,
                alignment: .center),
            
            UIStackView(
                arrangedSubviews: [visibilityLabel, airLabel],
                axis: .vertical,
                spacing: 20,
                alignment: .center)
        ],
        axis: .horizontal,
        spacing: 80,
        alignment: .center)
    
    private lazy var next5daysLabel = UILabel().then{
        $0.font = UIFont(name: "Optima Bold", size: 16)
        $0.text = "The Next 5 days"
    }
    
    private lazy var nextDaysStackView = UIStackView(
        arrangedSubviews: [
            createNextDaysView(day: "Sunday"),
            createNextDaysView(day: "Monday"),
            createNextDaysView(day: "Tuesday"),
            createNextDaysView(day: "Wednesday"),
            createNextDaysView(day: "Thursday")
        ]
        ,
        axis: .horizontal,
        spacing: 7,
        alignment: .center,
        distribution: .fill)
    
    // MARK: - LifeCycle
    init() {
        super.init(frame: .zero)
        
        configure()
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
private extension MainView {
    func configure() {
        
        backgroundColor = UIColor(named: "background")
        
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor(named: "backgroundGradient")?.cgColor ?? UIColor.clear,
            UIColor.clear.cgColor
        ]
        gradient.frame = UIScreen.main.bounds
        layer.addSublayer(gradient)
        
    }
    
    func setupViews() {
        addSubviews([
            findButton,
            locationStackView,
            roundView,
            temperatureLabel,
            weatherImage,
            bottomView,
            infoStackView,
            next5daysLabel,
            nextDaysStackView
        ])
    }
    
    func setupConstrains() {
        findButton.snp.makeConstraints{
            $0.width.height.equalTo(23.44)
            $0.top.equalTo(safeAreaLayoutGuide).inset(5)
            $0.right.equalToSuperview().inset(28)
        }
     
        locationStackView.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalToSuperview()
        }
        
        roundView.snp.makeConstraints{
            $0.width.height.equalTo(240)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(locationStackView.snp.bottom).offset(12)
        }
        
        temperatureLabel.snp.makeConstraints{
            $0.centerX.equalTo(roundView)
            $0.bottom.equalTo(roundView.snp.bottom).inset(49)
        }
        
        weatherImage.snp.makeConstraints{
            $0.width.height.equalTo(75)
            $0.centerX.equalTo(roundView)
            $0.top.equalTo(roundView.snp.top).offset(12)
        }
        
        bottomView.snp.makeConstraints{
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(roundView.snp.bottom).offset(179)
        }
        
        infoStackView.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(65)
            $0.top.equalTo(roundView.snp.bottom).offset(20)
        }
        
        next5daysLabel.snp.makeConstraints{
            $0.left.equalTo(bottomView).offset(14)
            $0.top.equalTo(bottomView).offset(40)
        }
        
        nextDaysStackView.snp.makeConstraints{
            $0.centerX.equalTo(bottomView)
            $0.centerY.equalTo(bottomView)
        }
    }
    
    func createNextDaysView(day:  String) -> UIView {
        var backView = UIView().then{
            $0.snp.makeConstraints{
                $0.width.equalTo(70)
                $0.height.equalTo(90)
            }
        }
        
        var mainView = UIView().then{
            $0.layerBorderColor = .gray
            $0.layerBorderWidth = 1
            $0.layerCornerRadius = 20
            backView.addSubview($0)
            $0.snp.makeConstraints{
                $0.width.equalTo(70)
                $0.height.equalTo(75)
                $0.bottom.equalTo(backView)
            }
        }
        
        var dayLabel = UILabel().then{
            $0.font = UIFont(name: "Optima Regular", size: 12)
            $0.text = day
            backView.addSubview($0)

            $0.snp.makeConstraints{
                $0.centerX.equalTo(backView)
                $0.top.equalTo(backView)
            }
        }
        
        var weatherImage = UIImageView().then{
            $0.image = UIImage(systemName: "cloud.drizzle.fill")
            $0.tintColor = .black
            backView.addSubview($0)

            $0.snp.makeConstraints{
                $0.height.width.equalTo(26)
                $0.centerX.equalTo(backView)
                $0.top.equalTo(mainView.snp.top).offset(13)
            }
        }
        
        var temperatureLabel = UILabel().then{
            $0.font = UIFont(name: "Optima Regular", size: 15)
            $0.text = "10° C"
            backView.addSubview($0)

            $0.snp.makeConstraints{
                $0.centerX.equalTo(mainView)
                $0.top.equalTo(weatherImage.snp.bottom).offset(3)
            }
        }
        return backView
    }
}
