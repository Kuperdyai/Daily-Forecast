//
//  Network.swift
//  Daily Forecast
//
//  Created by Александр on 10.11.2022.
//

import Foundation

final class Network {
        
    enum cityNames: String {
        case Moscow = "Moscow"
        case Kirov = "Kirov"
        case Pskov = "Pskov"
        case Kazan = "Kazan"
        case Volgograd = "Volgograd"
    }
    
    let cities = [cityNames.Moscow.rawValue, cityNames.Kirov.rawValue, cityNames.Pskov.rawValue, cityNames.Kazan.rawValue, cityNames.Volgograd.rawValue]
    
    func fetchWeather(city: String, completion: @escaping (_ weather: WeatherModel) -> ()) {
       
                let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?appid=edb5aafd8e1938cdc945e7d8828980f1&units=metric&q=\(city)")!
                    
                URLSession.shared.dataTask(with: url) { data, response, error in
                    
                    if let error = error {
                        print(error.localizedDescription)
                        
                    } else if let safeData = data {
                        if let weather = self.parseJSON(safeData) {
                            DispatchQueue.main.async {
                                completion(weather)
                            }
                        }
                        
                    }
                }.resume()
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedData = try decoder.decode(Weather.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let tempMin = decodedData.main.tempMin
            let tempMax = decodedData.main.tempMax
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, tempMax: tempMax, tempMin: tempMin)
            return weather
            
        } catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
}
