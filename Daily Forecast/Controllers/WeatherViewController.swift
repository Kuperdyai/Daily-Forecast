//
//  WeatherViewController.swift
//  Daily Forecast
//
//  Created by Александр on 09.11.2022.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    let todayCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
                collView.backgroundColor = .black
                collView.showsHorizontalScrollIndicator = false
        collView.register(TodayWeatherCell.self, forCellWithReuseIdentifier: "Cell")
        return collView
    }()
    
    let citiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .black
        collView.showsHorizontalScrollIndicator = false
        collView.register(citiesWeatherCollectionViewCell.self, forCellWithReuseIdentifier: "cityCell")
        return collView
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navigationItem.title = "Weather Forecast"

        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = attributes
        
        todayCollectionView.delegate = self
        todayCollectionView.dataSource = self
        
        citiesCollectionView.delegate = self
        citiesCollectionView.dataSource = self
        
        setup()
    }
    
    private func setup() {
        
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        view.addSubview(todayCollectionView)
        todayCollectionView.snp.makeConstraints { make in
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.height.equalTo(100)
        }
        
        view.addSubview(citiesCollectionView)
        citiesCollectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(UIScreen.main.bounds.width / 2)
        }
    }
}

extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == todayCollectionView {
            return 1
        } else {
            return Network().cities.count
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let network = Network()
        
        if collectionView == todayCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TodayWeatherCell
            let cellUrl = network.cities[0]
            
            DispatchQueue.main.async {
                network.fetchWeather(city: cellUrl) { weather in
                    cell.tempLabel.text = "Сейчас \(WeatherModel.stringTempValue(weather.temperature))°"
                    cell.cityLabel.text = String(weather.cityName)
                    cell.minDailyTempLabel.text = WeatherModel.stringTempValue(weather.tempMin)
                    cell.maxDailyTempLabel.text = WeatherModel.stringTempValue(weather.tempMax)
                    cell.weatherImageView.image = UIImage(systemName: weather.conditionName)
                }
            }
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cityCell", for: indexPath) as! citiesWeatherCollectionViewCell
            let cellUrl = network.cities[indexPath.item]
            
            DispatchQueue.main.async {
                network.fetchWeather(city: cellUrl) { weather in
                    cell.tempLabel.text = WeatherModel.stringTempValue(weather.temperature)
                    cell.cityLabel.text = weather.cityName
                    cell.minDailyTempLabel.text = WeatherModel.stringTempValue(weather.tempMin)
                    cell.maxDailyTempLabel.text = WeatherModel.stringTempValue(weather.tempMax)
                    cell.weatherImage.image = UIImage(systemName: weather.conditionName)
                }
            }
            return cell
        }
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == todayCollectionView {
            return CGSize(width: todayCollectionView.frame.width - 20, height: collectionView.frame.height - 20)
        } else {
            return CGSize(width: citiesCollectionView.frame.width / 2, height: collectionView.frame.height - 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == todayCollectionView {
            return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        } else {
            return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

