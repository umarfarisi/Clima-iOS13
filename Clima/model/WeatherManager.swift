
import Foundation

struct WeatherManager {
    
    var delegate : WeatherManagerDelegate? = nil
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=0562fd4722d70bb65b51d7feb3fdc2e4&units=metric"
    
    func fetchWeather(city: String) {
        let urlString = weatherURL + "&q=\(city)"
        performRequest(urlString)
    }
    
    func fetchWeather(_ lat: Double, _ lon: Double) {
        let urlString = weatherURL + "&lat=" + String(lat) + "&lon=" + String(lon)
        performRequest(urlString)
    }
    
    private func performRequest(_ urlString: String) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: completionHandler(data:response:error:))
            
            task.resume()
            
        }
    }
    
    private func completionHandler(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            delegate?.didFail(with: error)
        } else {
            if let dataNotNil = data {
                let jsonDecoder = JSONDecoder()
                
                do {
                    let result = try jsonDecoder.decode(WeatherData.self, from: dataNotNil)
                    let model = WeatherModel(
                        conditionId: result.weather[0].id,
                        cityName: result.name,
                        temperature: result.main.temp
                    )
                    delegate?.updateView(model)
                } catch {
                    delegate?.didFail(with: error)
                }
                
            } else {
                print("error because data is nil")
            }
            
        }
    }
    
}
