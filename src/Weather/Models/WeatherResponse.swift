//
//  WeatherResponse.swift
//  Weather
//
//  Created by Kate on 09.02.2023.
//

public struct WeatherResponse: Codable {
    public let coord: Coord?
    public let weather: [Weather]?
    public let base: String?
    public let main: Main?
    public let visibility: Int?
    public let wind: Wind?
    public let rain: Rain?
    public let clouds: Clouds?
    public let dt: Int?
    public let sys: Sys?
    public let timezone: Int?
    public let id: Int?
    public let name: String?
    public let cod: Int?

    public init(coord: Coord?, weather: [Weather]?, base: String?, main: Main?, visibility: Int?, wind: Wind?, rain: Rain?, clouds: Clouds?, dt: Int?, sys: Sys?, timezone: Int?, id: Int?, name: String?, cod: Int?) {
        self.coord = coord
        self.weather = weather
        self.base = base
        self.main = main
        self.visibility = visibility
        self.wind = wind
        self.rain = rain
        self.clouds = clouds
        self.dt = dt
        self.sys = sys
        self.timezone = timezone
        self.id = id
        self.name = name
        self.cod = cod
    }
}

// MARK: - Clouds
public struct Clouds: Codable {
    public let all: Int?

    public init(all: Int?) {
        self.all = all
    }
}

// MARK: - Coord
public struct Coord: Codable {
    public let lon: Double?
    public let lat: Double?

    public init(lon: Double?, lat: Double?) {
        self.lon = lon
        self.lat = lat
    }
}

// MARK: - Main
public struct Main: Codable {
    public let temp: Double?
    public let feelsLike: Double?
    public let tempMin: Double?
    public let tempMax: Double?
    public let pressure: Int?
    public let humidity: Int?
    public let seaLevel: Int?
    public let grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }

    public init(temp: Double?, feelsLike: Double?, tempMin: Double?, tempMax: Double?, pressure: Int?, humidity: Int?, seaLevel: Int?, grndLevel: Int?) {
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax = tempMax
        self.pressure = pressure
        self.humidity = humidity
        self.seaLevel = seaLevel
        self.grndLevel = grndLevel
    }
}

// MARK: - Rain
public struct Rain: Codable {
    public let the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }

    public init(the1H: Double?) {
        self.the1H = the1H
    }
}

// MARK: - Sys
public struct Sys: Codable {
    public let type: Int?
    public let id: Int?
    public let country: String?
    public let sunrise: Int?
    public let sunset: Int?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }

    public init(type: Int?, id: Int?, country: String?, sunrise: Int?, sunset: Int?) {
        self.type = type
        self.id = id
        self.country = country
        self.sunrise = sunrise
        self.sunset = sunset
    }
}

// MARK: - Weather
public struct Weather: Codable {
    public let id: Int?
    public let main: String?
    public let description: String?
    public let icon: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }

    public init(id: Int?, main: String?, description: String?, icon: String?) {
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}

// MARK: - Wind
public struct Wind: Codable {
    public let speed: Double?
    public let deg: Int?
    public let gust: Double?

    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
        case gust = "gust"
    }

    public init(speed: Double?, deg: Int?, gust: Double?) {
        self.speed = speed
        self.deg = deg
        self.gust = gust
    }
}

