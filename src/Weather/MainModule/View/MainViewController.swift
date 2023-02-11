//
//  MainViewController.swift
//  Weather
//
//  Created by Kate on 02.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var mainView = MainView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let api = ApiService()

        Task {
            do {
                let response = try await api.fetchWeather(city: "Samara")

                DispatchQueue.main.async {
                    self.mainView.render(
                        .init(
                            date: "сегодня",
                            city: response.name ?? "n/n",
                            country: response.sys?.country ?? "n/n",
                            temperature: response.main?.temp?.string ?? "n/n",
                            wind: response.wind?.speed?.string ?? "n/n",
                            visibility: response.visibility?.string ?? "n/n",
                            humidity: response.main?.humidity?.string ?? "n/n",
                            airPressure: response.main?.pressure?.string ?? "n/n",
                            dayOfTheWeek: "n/n",
                            futureTemperature: "n/n"
                        )
                    )
                }
            } catch(let error) {
                debugPrint(error)
            }
        }
    }
}
