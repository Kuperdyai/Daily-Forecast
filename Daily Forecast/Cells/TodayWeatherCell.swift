//
//  TodayWeatherCell.swift
//  Daily Forecast
//
//  Created by Александр on 09.11.2022.
//

import UIKit
import SnapKit

class TodayWeatherCell: UICollectionViewCell {
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 25)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let tempView: UIImageView = {
        let tempView = UIImageView()
        tempView.backgroundColor = .black
        return tempView
    }()
    
    let minTempLabel: UILabel = {
        let label = UILabel()
        label.text = "min t°: "
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let maxTempLabel: UILabel = {
        let label = UILabel()
        label.text = "max t°: "
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let minDailyTempLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let maxDailyTempLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let weatherImageView: UIImageView = {
        let weatherView = UIImageView()
        weatherView.backgroundColor = .black
        return weatherView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    func setupCell() {
        
        backgroundColor = .black
        layer.cornerRadius = 10
        
        self.addSubview(tempLabel)
        tempLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(5)
            make.width.height.equalToSuperview().dividedBy(2)
        }
        
        self.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview().inset(5)
            make.width.height.equalToSuperview().dividedBy(2)
        }
        
        self.addSubview(tempView)
        tempView.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview().inset(2)
            make.width.equalToSuperview().dividedBy(4)
        }
        
        self.addSubview(weatherImageView)
        weatherImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(2)
            make.right.equalTo(tempView.snp.left)
            make.width.equalToSuperview().dividedBy(4)
        }
        
        tempView.addSubview(minTempLabel)
        minTempLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        tempView.addSubview(maxTempLabel)
        maxTempLabel.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        tempView.addSubview(minDailyTempLabel)
        minDailyTempLabel.snp.makeConstraints { make in
            make.left.equalTo(minTempLabel.snp.right)
            make.right.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        tempView.addSubview(maxDailyTempLabel)
        maxDailyTempLabel.snp.makeConstraints { make in
            make.left.equalTo(maxTempLabel.snp.right)
            make.right.equalToSuperview().offset(2)
            make.bottom.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
