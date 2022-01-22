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
    private lazy var statusButton = createInfoButtons(with: "Установить статус", colorTitle: UIColor(red: 106/255.0, green: 160/255.0, blue: 220/255.0, alpha: 1), icon: nil, iconSize: nil)
    
    //Создание кнопки редактировать
    private lazy var editButton: UIButton = {
        let editButton = UIButton()
        
        editButton.setTitle("Редактировать", for: .normal)
        editButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        editButton.titleLabel?.textColor = .white
        editButton.backgroundColor = UIColor(red: 44/255.0, green: 45/255.0, blue: 46/255.0, alpha: 1)
        editButton.titleLabel?.textAlignment = .center
        editButton.titleLabel?.adjustsFontSizeToFitWidth = true
        editButton.layer.cornerRadius = 10
        
        
        return editButton
    }()
    
    //Создание StackView с кнопками добавления контента
    private lazy var addContentStackView: UIStackView = {
        let addContentStackView = UIStackView()
        
        addContentStackView.axis = .horizontal
        addContentStackView.distribution = .equalSpacing
        
        return addContentStackView
    }()
        
    //Создание кнопок с добавлением контента
    private lazy var storiesButton = createContentButtons(with: "История", icon: "camera")
    private lazy var postButton = createContentButtons(with: "Запись", icon: "square.and.pencil")
    private lazy var photoButton = createContentButtons(with: "Фото", icon: "photo")
    private lazy var clipButton = createContentButtons(with: "Клип", icon: "play.square")
    
    //Создание разделителя
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        
        separatorView.backgroundColor = .darkGray
        
        return separatorView
    }()
    
    //Создание StackView с кнопками информации о пользователе
    private lazy var infoButtonsStackView: UIStackView = {
        let infoButtonsStackView = UIStackView()
        
        infoButtonsStackView.axis = .vertical
        infoButtonsStackView.alignment = .leading
        infoButtonsStackView.distribution = .equalSpacing
        
        return infoButtonsStackView
    }()
    
    private lazy var cityButton = createInfoButtons(with: "   Город: Москва", colorTitle: UIColor(red: 141/255.0, green: 140/255.0, blue: 142/255.0, alpha: 1), icon: "house", iconSize: 12)
    private lazy var subscribersButton = createInfoButtons(with: "   35 подписчиков", colorTitle: UIColor(red: 141/255.0, green: 140/255.0, blue: 142/255.0, alpha: 1), icon: "dot.radiowaves.up.forward", iconSize: 16)
    private lazy var placeOfWorkButton = createInfoButtons(with: "   Указать место работы", colorTitle: UIColor(red: 106/255.0, green: 160/255.0, blue: 220/255.0, alpha: 1), icon: "briefcase", iconSize: 13)
    private lazy var giftButton = createInfoButtons(with: "   Получить подарок", colorTitle: UIColor(red: 81/255.0, green: 65/255.0, blue: 164/255.0, alpha: 1), icon: "snowflake", iconSize: 16)
    private lazy var detailedInfoButton = createInfoButtons(with: "   Подробная информация", colorTitle: .lightGray, icon: "exclamationmark.circle.fill", iconSize: 15)
    
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
        view.addSubview(editButton)
        
        view.addSubview(addContentStackView)
        addContentStackView.addArrangedSubview(storiesButton)
        addContentStackView.addArrangedSubview(postButton)
        addContentStackView.addArrangedSubview(photoButton)
        addContentStackView.addArrangedSubview(clipButton)
        
        view.addSubview(separatorView)
        
        view.addSubview(infoButtonsStackView)
        infoButtonsStackView.addArrangedSubview(cityButton)
        infoButtonsStackView.addArrangedSubview(subscribersButton)
        infoButtonsStackView.addArrangedSubview(placeOfWorkButton)
        infoButtonsStackView.addArrangedSubview(giftButton)
        infoButtonsStackView.addArrangedSubview(detailedInfoButton)
        
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
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.topAnchor.constraint(equalTo: networkStatusLabel.bottomAnchor, constant: 32).isActive = true
        editButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        editButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15).isActive = true
        editButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.098).isActive = true
        editButton.titleLabel?.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.045).isActive = true
        
        addContentStackView.translatesAutoresizingMaskIntoConstraints = false
        addContentStackView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 15).isActive = true
        addContentStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        addContentStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        addContentStackView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.15).isActive = true
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.topAnchor.constraint(equalTo: addContentStackView.bottomAnchor, constant: 10).isActive = true
        separatorView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        separatorView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 15).isActive = true
        separatorView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.92).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        infoButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        infoButtonsStackView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 15).isActive = true
        infoButtonsStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15).isActive = true
        infoButtonsStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 15).isActive = true
        infoButtonsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.92).isActive = true
        infoButtonsStackView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
    }
    
    //Настройки главной View
    private func setupView() {
        view.backgroundColor = UIColor(red: 25/255.0, green: 25/255.0, blue: 26/255.0, alpha: 1)
    }
    
    //MARK: - Create functions
    
    //Функция создания кнопок с информацией о пользователе и кнопки с установкой статуса
    private func createInfoButtons(with title: String, colorTitle: UIColor, icon: String?, iconSize: CGFloat?) -> UIButton {
        let button = UIButton(type: .system)
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(colorTitle, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        if icon != nil {
            let mediumConfig = UIImage.SymbolConfiguration(pointSize: iconSize ?? 0, weight: .medium, scale: .medium)
            button.setImage(UIImage(systemName: icon ?? "", withConfiguration: mediumConfig), for: .normal)
            button.tintColor = colorTitle
        }
    
        return button
    }
    
    //Создание кнопок с добавлением контента
    private func createContentButtons(with title: String, icon: String) -> UIButton {
        
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString(title, attributes: container)
        configuration.image = UIImage(systemName: icon)
        configuration.imagePlacement = .top
        configuration.imagePadding = 7
        configuration.baseForegroundColor = UIColor(red: 106/255.0, green: 160/255.0, blue: 220/255.0, alpha: 1)
        let button = UIButton(configuration: configuration, primaryAction: nil)
        
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
