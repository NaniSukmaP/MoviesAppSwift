//
//  MoviesManager.swift
//  MoviesApp
//
//  Created by Nani Sukma Putri Pratama on 13/12/20.
//

import Foundation

//struct Manager {
//    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=414cfefc80f757ff2ea6fa1dd1837be7&units=metric"
//    var delegate : WeatherManagerDelegate?
//    func fetchURL(cityName: String){
//        let urlString = "\(weatherURL)&q=\(cityName)"
//        print("ini link \(urlString)\n\n\n ini nama kotanya : \(cityName)")
//        performRequest(with: urlString)
//    }
//    func fetchWeather(latitude : CLLocationDegrees, longitude: CLLocationDegrees){
//        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
//        performRequest(with: urlString)
//    }
//
//    func performRequest(with urlString: String){
//        //1. Create URL
//        if let url = URL(string: urlString){
//            // 2. Create URL Session
//            let session = URLSession(configuration: .default)
//
//            // 3. Give the session task
//            let task = session.dataTask(with: url) { (data, response, error) in
//                // ini sudah pakai closure
//                if error != nil{
//                    self.delegate?.didFailWithError(error: error!)
//                    return
//                }
//
//                if let safeData = data {
//                    if let weather = self.parseJSON(safeData){
//                        self.delegate?.didUpdateWeather(self, weather: weather)
//                    }
//                }
//            }
//
//            // 4. Start the task
//            task.resume()
//        }
//    }
//
//    func parseJSON(_ weatherData : Data) -> WeatherModel? {
//        let decoder = JSONDecoder()
//        do {
//           let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
//            let temp = decodedData.main.temp
//            let city = decodedData.name
//            let id = decodedData.weather[0].id
//            let weather = WeatherModel(conditionId: id, cityName: city, temperature: temp)
//            print(weather.conditionName)
//            print(weather.temperatureString)
//            return weather
//        } catch{
//            delegate?.didFailWithError(error: error)
//            return nil
//        }
//
//    }
//

    //tanpa closure
//    func handle(data : Data?, response : URLResponse?, error : Error?){
//        if error != nil{
//            print(error!)
//            return
//        }
//
//        if let safeData = data {
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString)
//        }
//
//    }
//}
