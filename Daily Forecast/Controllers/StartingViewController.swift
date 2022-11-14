//
//  StartingViewController.swift
//  Daily Forecast
//
//  Created by Александр on 08.11.2022.
//

import UIKit
import SnapKit

class StartingViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let fetchWeatherButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.setTitle("fetch weather", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rockwell", size: 33)
        button.titleLabel?.textColor = .white
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.alpha = 0
        button.layer.cornerRadius = 10
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
    }
    
    func setupUi() {
        
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        view.addSubview(fetchWeatherButton)
        fetchWeatherButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(100)
        }
        
        fetchWeatherButton.fadeIn()

        fetchWeatherButton.addTarget(self, action: #selector(fetchWeather), for: .touchUpInside)
    }
      
    @objc private func fetchWeather() {
        navigationController?.pushViewController(WeatherViewController(), animated: true)
    }
}

extension UIView {
    
    func fadeIn(duration: TimeInterval = 3.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
    
}
