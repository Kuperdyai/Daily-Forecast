//
//  citiesWeatherCollectionViewCell.swift
//  Daily Forecast
//
//  Created by Александр on 12.11.2022.
//

import UIKit

class citiesWeatherCollectionViewCell: UICollectionViewCell {
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "temp"
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 25)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let minTempLabel: UILabel = {
        let label = UILabel()
        label.text = "minTemp"
        label.textColor = .white
        label.textAlignment = .center
//        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let maxTempLabel: UILabel = {
        let label = UILabel()
        label.text = "maxTemp"
        label.textColor = .white
        label.textAlignment = .center
//        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "City"
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 40)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let minDailyTempLabel: UILabel = {
        let label = UILabel()
        label.text = "min"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let maxDailyTempLabel: UILabel = {
        let label = UILabel()
        label.text = "max"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let weatherImage: UIImageView = {
        let weatherImage = UIImageView()
        weatherImage.image = UIImage(named: "LaunchScreen")
        return weatherImage
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    private func setupCell() {
        
        backgroundColor = .black
        layer.cornerRadius = 10
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 3
        
        addSubview(weatherImage)
        weatherImage.snp.makeConstraints { make in
            make.left.top.equalToSuperview().inset(10)
            make.width.height.equalToSuperview().dividedBy(2)
        }
        
        addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.right.top.equalToSuperview().inset(15)
            make.height.equalTo(weatherImage).dividedBy(2)
            make.left.equalTo(weatherImage.snp.right).offset(20)
        }
        
        addSubview(tempLabel)
        tempLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(15)
//            make.width.equalTo(25)
            make.top.equalTo(cityLabel.snp.bottom).offset(15)
        }
        
        addSubview(minTempLabel)
        minTempLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(weatherImage.snp.bottom).offset(20)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        addSubview(maxTempLabel)
        maxTempLabel.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(minTempLabel.snp.bottom).offset(10)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        addSubview(minDailyTempLabel)
        minDailyTempLabel.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalTo(tempLabel.snp.bottom).offset(16)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        addSubview(maxDailyTempLabel)
        maxDailyTempLabel.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalTo(minDailyTempLabel.snp.bottom).offset(10)
            make.width.equalToSuperview().dividedBy(2)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
