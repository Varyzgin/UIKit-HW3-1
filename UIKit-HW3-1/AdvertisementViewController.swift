//
//  AdvertisementViewController.swift
//  UIKit-HW3-1
//
//  Created by Дима on 11/21/24.
//

import UIKit

class AdvertisementViewController: UIViewController {
    lazy var upperMargin = (view.frame.width / view.frame.height < 9 / 17) ? 54 : 40
    let margin = 30
    enum textType {
        case megaHeader, header, description
    }
    enum colorSheme {
        case black, white, gray, blue, lightBlue, lightGray
    }
    
    lazy var logoImageView = {
        $0.image = UIImage(named: "logo")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: margin, y: upperMargin, width: Int(view.frame.width) / 4, height: 35)))
    
    lazy var titleLabel = setupLabel(text: "Ольховский Квартал", style: .megaHeader, color: colorizeIn(.white), frame: CGRect(x: margin, y: Int(logoImageView.frame.maxY) + margin, width: Int(view.frame.width) - 2 * margin, height: 30))
 
    lazy var buildingsImageView = {
        $0.image = UIImage(named: "canvas")
        $0.layer.cornerRadius = 20
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: 2 * margin / 3, y: Int(titleLabel.frame.maxY) + 2 * margin / 3, width: Int(view.frame.maxX) - 4 * margin / 3, height: (Int(view.frame.maxX) - 2 * margin) * 3 / 4)))

    lazy var buildingsPriceLabel = setupLabel(text: "от 8 029 445 ₽", style: .header, color: colorizeIn(.white), frame: CGRect(x: margin, y: Int(buildingsImageView.frame.maxY) + 2 * margin / 3, width: Int(view.frame.maxX) - 2 * margin, height: 19))
    lazy var buildingsDescriptionLabel = setupLabel(text: "Москва, поселенение Сосенское, деревня Столбово", style: .description, color: colorizeIn(.white), frame: CGRect(x: margin, y: Int(buildingsPriceLabel.frame.maxY) + margin / 3, width: Int(view.frame.maxX) - 2 * margin, height: 34))
    
    override func viewDidLoad() {
        view.backgroundColor = colorizeIn(.blue)
        
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(buildingsImageView)
        view.addSubview(buildingsPriceLabel)
        view.addSubview(buildingsDescriptionLabel)
    }
    
    func setupLabel(text: String, style: textType, color: UIColor, frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        
        label.text = text
        label.textColor = color
        label.numberOfLines = 0
        
        switch style {
        case .megaHeader:
            label.font = .boldSystemFont(ofSize: 23)
        case .header:
            label.font = .boldSystemFont(ofSize: 16)
        case .description:
            label.font = .systemFont(ofSize: 14)

        }
        
        return label
    }
    
    func colorizeIn(_ color: colorSheme) -> UIColor {
        switch color {
        case .black:
            return .black
        case .white:
            return .white
        case .blue:
            return UIColor(red: 0, green: 123/255, blue: 252/255, alpha: 1)
        case .gray:
            return UIColor(red: 123/255, green: 109/255, blue: 109/255, alpha: 1)
        case .lightBlue:
            return UIColor(red: 230/255, green: 237/255, blue: 1, alpha: 1)
        case .lightGray: return UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        }
    }
}
