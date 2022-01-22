//
//  ViewController.swift
//  VKProfileScreenLayout
//
//  Created by Ilya Volkov on 18.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Elements
    
    //Создание кнопки аватарки
    private lazy var avatarButton: UIButton = {
        let avatarButton = UIButton()

        let image = UIImage(named: "photo.png")
        avatarButton.setImage(image, for: .normal)
        avatarButton.layer.cornerRadius = 50

        return avatarButton
    }()
    
    //Создание лейбла с именем и фамилией
    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        
        fullNameLabel.text = "Алексей Павлов"
        fullNameLabel.font = .systemFont(ofSize: 20)
        fullNameLabel.textColor = .white
        fullNameLabel.adjustsFontSizeToFitWidth = true
        
        return fullNameLabel
    }()
    
    //Создание лейбла сетевого статуса
    private lazy var networkStatusLabel: UILabel = {
        let networkStatusLabel = UILabel()
        
        networkStatusLabel.text = "online "
        networkStatusLabel.font = .systemFont(ofSize: 15, weight: .medium)
        networkStatusLabel.textColor = .darkGray
        networkStatusLabel.adjustsFontSizeToFitWidth = true
        
        //Добавление иконки телефона
        let imageAttachment = NSTextAttachment()
        let smallConfig = UIImage.SymbolConfiguration(pointSize: 13, weight: .medium, scale: .small)
        imageAttachment.image = UIImage(systemName: "iphone.homebutton", withConfiguration: smallConfig)?.withTintColor(.white)
        let fullString = NSMutableAttributedString(string: networkStatusLabel.text ?? "")
        fullString.append(NSAttributedString(attachment: imageAttachment))
        networkStatusLabel.attributedText = fullString

        return networkStatusLabel
    }()
    
    //Создание кнопки с установкой статуса
    private lazy var statusButton = createButtons(with: "Установить статус", colorTitle: UIColor(red: 106/255.0, green: 160/255.0, blue: 220/255.0, alpha: 1), icon: nil, secondIcon: nil)

    //MARK: - Lifecycle
    
    //Вызов настроек после того как View появится на экране
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    //MARK: - Settings
    
    //Добавление элементов на главную View
    private func setupHierarchy() {
        view.addSubview(avatarButton)
        view.addSubview(fullNameLabel)
        view.addSubview(statusButton)
        view.addSubview(networkStatusLabel)
    }
    
    //Установка констрейнтов
    private func setupLayout() {
        avatarButton.translatesAutoresizingMaskIntoConstraints = false
        avatarButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        avatarButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        avatarButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        avatarButton.widthAnchor.constraint(equalTo: avatarButton.heightAnchor, multiplier: 1).isActive = true
        
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 117).isActive = true
        fullNameLabel.leftAnchor.constraint(equalTo: avatarButton.rightAnchor, constant: 15).isActive = true
        fullNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.37).isActive = true
        fullNameLabel.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.06).isActive = true

        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 0).isActive = true
        statusButton.leftAnchor.constraint(equalTo: avatarButton.rightAnchor, constant: 15).isActive = true
        statusButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33).isActive = true
        statusButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.06).isActive = true

        networkStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        networkStatusLabel.topAnchor.constraint(equalTo: statusButton.bottomAnchor, constant: 0).isActive = true
        networkStatusLabel.leftAnchor.constraint(equalTo: avatarButton.rightAnchor, constant: 15).isActive = true
        networkStatusLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.157).isActive = true
        networkStatusLabel.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.05).isActive = true
        

    }
    
    //Настройки главной View
    private func setupView() {
        view.backgroundColor = UIColor(red: 25/255.0, green: 25/255.0, blue: 26/255.0, alpha: 1)
    }
    
    //MARK: - Create functions
    
    //Функция создания кнопок с информацией о пользователе и кнопки с установкой статуса
    private func createButtons(with title: String, colorTitle: UIColor, icon: String?, secondIcon: String?) -> UIButton {
        let button = UIButton(type: .system)
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(colorTitle, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        if icon != nil {
            button.setImage(UIImage(systemName: icon ?? ""), for: .normal)
            button.tintColor = colorTitle
            
            if secondIcon != nil {
                button.setImage(UIImage(systemName: secondIcon ?? ""), for: .normal)
                button.tintColor = colorTitle
            }
        }
    
        return button
    }
    
}

//MARK: - Constants
//TODO: - Add values
extension ViewController {
    enum Metric {
        
    }
    
    enum Strings {
        
    }
}
