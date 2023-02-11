//
//  ApiService.swift
//  Weather
//
//  Created by Kate on 09.02.2023.
//

import Networking

struct ApiService: NetworkingService {
    var network = NetworkingClient(baseURL: "https://api.openweathermap.org")

    func fetchWeather(city: String) async throws -> WeatherResponse {
        try await get("/data/2.5/weather", params: ["q": city, "units": "metric", "appid": "6eda98e41b53dde03bf02985c4459550"])
    }
}
