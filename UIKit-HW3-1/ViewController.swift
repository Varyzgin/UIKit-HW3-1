//
//  ViewController.swift
//  UIKit-HW3-1
//
//  Created by Дима on 11/20/24.
//

import UIKit

class ViewController: UIViewController {
    lazy var upperMargin = (view.frame.width / view.frame.height < 9 / 17) ? 54 : 40

    let margin = 30
    enum textType {
        case megaHeader, header, description
    }
    enum colorSheme {
        case black, white, gray, blue, lightBlue, lightGray
    }
    
    lazy var headerView = {
        $0.backgroundColor = colorizeIn(.blue)
        return $0
    }(UIView(frame: CGRect(x: 0, y: 0, width: Int(view.frame.width), height: 320 + upperMargin)))
    
    lazy var logoImageView = {
        $0.image = UIImage(named: "logo")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: CGRect(x: margin, y: upperMargin, width: Int(headerView.frame.width) / 4, height: 35)))

    lazy var titleLabel = setupLabel(text: "Сервис квартирных решений от отделки до отделки", style: .megaHeader, color: colorizeIn(.white), frame: CGRect(x: margin, y: Int(logoImageView.frame.maxY) + margin, width: Int(headerView.frame.width) - 2 * margin, height: 60))

    lazy var buyView = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        return $0
    }(UIView(frame: CGRect(x: margin, y: Int(titleLabel.frame.maxY) + margin, width: Int(headerView.frame.width) - 2 * margin, height: 135)))
    
    lazy var buyLabel = setupLabel(text: "Купить", style: .header, color: colorizeIn(.black), frame: CGRect(x: margin / 2, y: margin / 2, width: Int(view.frame.maxX) - 3 * margin, height: 19))
    
    lazy var buyDescriptionLabel = setupLabel(text: "Подберем подходящий объект", style: .description, color: colorizeIn(.gray), frame: CGRect(x: margin / 2, y: Int(buyLabel.frame.maxY) + margin / 3, width: Int(view.frame.maxX) - 3 * margin, height: 34))
    
    lazy var buyButton = {
        let image = UIImage(named: "buy")
        if let image {
            $0.setImage(image, for: .normal)
        }
        return $0
    }(UIButton(frame: CGRect(x: Int(buyView.frame.maxX) - 3 * margin / 2 - 10, y: margin / 2, width: 10, height: 15)))
    
    lazy var serviceLabel = setupLabel(text: "Услуги", style: .megaHeader, color: .black, frame: CGRect(x: margin, y: Int(headerView.frame.maxY) + margin, width: Int(view.frame.maxX) - 2 * margin, height: 20))
    
    lazy var taxesView = {
        $0.backgroundColor = colorizeIn(.lightBlue)
        $0.layer.cornerRadius = 20
        return $0
    }(UIView(frame: CGRect(x: margin, y: Int(serviceLabel.frame.maxY) + 2 * margin / 3, width: Int(view.frame.width) - 2 * margin, height: 135)))
    
    lazy var taxLabel = setupLabel(text: "Страхование", style: .header, color: colorizeIn(.black), frame: CGRect(x: margin / 2, y: margin / 2, width: Int(view.frame.maxX) - 3 * margin, height: 19))
    
    lazy var taxDescriptionLabel = setupLabel(text: "Защитите имущество, здоровье и жизнь", style: .description, color: colorizeIn(.gray), frame: CGRect(x: margin / 2, y: Int(taxLabel.frame.maxY) + margin / 3, width: Int(view.frame.maxX) - 3 * margin, height: 34))
    
    lazy var buildingsLabel = setupLabel(text: "Жилые комплексы", style: .megaHeader, color: .black, frame: CGRect(x: margin, y: Int(taxesView.frame.maxY) + margin, width: Int(view.frame.maxX) - 2 * margin, height: 20))

    lazy var buildingsView = {
        $0.backgroundColor = colorizeIn(.lightGray)
        $0.layer.cornerRadius = 20
        return $0
    }(UIView(frame: CGRect(x: margin, y: Int(buildingsLabel.frame.maxY) + 2 * margin / 3, width: Int(view.frame.width) - 2 * margin, height: 135)))
    
    lazy var buildingsTitleLabel = setupLabel(text: "Ольховский Квартал", style: .header, color: colorizeIn(.black), frame: CGRect(x: margin / 2, y: margin / 2, width: Int(view.frame.maxX) - 3 * margin, height: 19))
    lazy var buildingsPriceLabel = setupLabel(text: "от 8 029 445 ₽", style: .header, color: colorizeIn(.black), frame: CGRect(x: margin / 2, y: Int(buildingsTitleLabel.frame.maxY) + margin / 3, width: Int(view.frame.maxX) - 3 * margin, height: 19))
    
    lazy var buildingsDescriptionLabel = setupLabel(text: "Москва, поселенение Сосенское, деревня Столбово", style: .description, color: colorizeIn(.gray), frame: CGRect(x: margin / 2, y: Int(buildingsPriceLabel.frame.maxY) + margin / 3, width: Int(view.frame.maxX) - 3 * margin, height: 34))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(headerView)
        headerView.addSubview(logoImageView)
        headerView.addSubview(titleLabel)
        headerView.addSubview(buyView)
        buyView.addSubview(buyLabel)
        buyView.addSubview(buyDescriptionLabel)
        buyView.addSubview(buyButton)
        view.addSubview(serviceLabel)
        view.addSubview(taxesView)
        taxesView.addSubview(taxLabel)
        taxesView.addSubview(taxDescriptionLabel)
        view.addSubview(buildingsLabel)
        view.addSubview(buildingsView)
        buildingsView.addSubview(buildingsTitleLabel)
        buildingsView.addSubview(buildingsPriceLabel)
        buildingsView.addSubview(buildingsDescriptionLabel)
        
        view.backgroundColor = .white

        
        // Do any additional setup after loading the view.
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

