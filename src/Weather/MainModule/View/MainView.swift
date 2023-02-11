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

final class MainView: UIView {
    // MARK: Props

    struct Props: Equatable {
        let date: String
        let city: String
        let country: String

        let temperature: String

        let wind: String
        let visibility: String
        let humidity: String
        let airPressure: String
        
        let dayOfTheWeek: String
        let futureTemperature: String 
    }

    // MARK: - Private Props

    private var props: Props?
    
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
    
    private lazy var circleView = CircleView().then{
        $0.layerCornerRadius = Constants.circleSize / 2
    }
    
    private lazy var windLabel = CurrentInfoView()
    private lazy var visibilityLabel = CurrentInfoView()
    private lazy var humidityLabel = CurrentInfoView()
    private lazy var airLabel = CurrentInfoView()
    
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
        alignment: .center,
        distribution: .fillEqually)
    
    private lazy var bottomView = UIView().then {
        $0.backgroundColor = .white
        $0.layerCornerRadius = 60.0
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private lazy var next5daysLabel = UILabel().then{
        $0.font = UIFont(name: "Optima Bold", size: 16)
        $0.text = "The Next 5 days"
        $0.textColor = .black
    }
    
    private lazy var view1 = NextDaysView()
    private lazy var view2 = NextDaysView()
    private lazy var view3 = NextDaysView()
    private lazy var view4 = NextDaysView()
    private lazy var view5 = NextDaysView()
 
    private lazy var nextDaysStackView = UIStackView(
        arrangedSubviews: [
            view1, view2, view3, view4, view5
        ],
        axis: .horizontal,
        spacing: 7,
        alignment: .center,
        distribution: .fillEqually
    )
    
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

// MARK: - Public Methods

extension MainView {
    func render (_ props: Props) {
        guard self.props != props else { return }
        self.props = props
        
        dateLabel.text = "Today, \(props.date)"
        cityLabel.text = props.city
        countryLabel.text = props.country
        
        circleView.render(.init(tempValue: props.temperature))
        
        windLabel.render(.init(title: "Wind Status", value: props.wind))
        visibilityLabel.render(.init(title: "Visibility", value: props.visibility))
        humidityLabel.render(.init(title: "Humidity", value: props.humidity))
        airLabel.render(.init(title: "Air Pressure", value: props.airPressure))
        
        let all5days = [view1, view2, view3, view4, view5]
        
        all5days.forEach { day in
            day.render(.init(dayOfTheWeek: props.dayOfTheWeek, tempValue: props.futureTemperature))
        }
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
            circleView,
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
        
        circleView.snp.makeConstraints{
            $0.width.height.equalTo(Constants.circleSize)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(locationStackView.snp.bottom).offset(12)
        }
        
        infoStackView.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(65)
            $0.top.equalTo(circleView.snp.bottom).offset(20)
        }
        
        bottomView.snp.makeConstraints{
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(circleView.snp.bottom).offset(179)
        }
        
        next5daysLabel.snp.makeConstraints{
            $0.left.equalTo(bottomView).offset(14)
            $0.top.equalTo(bottomView).offset(40)
        }
        
        nextDaysStackView.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(75)
            $0.left.right.equalTo(bottomView).inset(8)
        }
    }
}


// MARK: - Constans
private extension MainView {
    struct Constants {
        static let circleSize = 240.0
    }
}
