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

        let image = UIImage(named: Icons.avatarButtonIcon)
        avatarButton.setImage(image, for: .normal)
        avatarButton.layer.masksToBounds = true
        avatarButton.layer.cornerRadius = Sizes.avatarButtonCorners

        return avatarButton
    }()
    
    //Создание лейбла с именем и фамилией
    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        
        fullNameLabel.text = Strings.fullNameLabelText
        fullNameLabel.font = .systemFont(ofSize: Sizes.fullNameLabelSize)
        fullNameLabel.textColor = Colors.fullNameTextColor
        fullNameLabel.adjustsFontSizeToFitWidth = true
        
        return fullNameLabel
    }()
    
    //Создание лейбла сетевого статуса
    private lazy var networkStatusLabel: UILabel = {
        let networkStatusLabel = UILabel()
        
        networkStatusLabel.text = Strings.networkStatusLabelText
        networkStatusLabel.font = .systemFont(ofSize: Sizes.networkStatusLabelSize, weight: .medium)
        networkStatusLabel.textColor = Colors.networkStatusLabelTextColor
        networkStatusLabel.adjustsFontSizeToFitWidth = true
        
        //Добавление иконки телефона
        let imageAttachment = NSTextAttachment()
        let smallConfig = UIImage.SymbolConfiguration(pointSize: Sizes.netWorkStatusLabelIconSize, weight: .medium, scale: .small)
        imageAttachment.image = UIImage(systemName: Icons.networkStatusLabelIcon, withConfiguration: smallConfig)?.withTintColor(.white)
        let fullString = NSMutableAttributedString(string: networkStatusLabel.text ?? "")
        fullString.append(NSAttributedString(attachment: imageAttachment))
        networkStatusLabel.attributedText = fullString

        return networkStatusLabel
    }()
    
    //Создание кнопки с установкой статуса
    private lazy var statusButton = createInfoButtons(with: Strings.statusButtonTitle,
                                                      colorTitle: Colors.statusButtonTitleColor,
                                                      icon: nil,
                                                      iconSize: nil)
    
    //Создание кнопки редактировать
    private lazy var editButton: UIButton = {
        let editButton = UIButton(type: .system)
        
        editButton.setTitle(Strings.editButtonTitle, for: .normal)
        editButton.setTitleColor(Colors.editButtonTitleColor, for: .normal)
        editButton.titleLabel?.font = .systemFont(ofSize: Sizes.editButtonTitleSize, weight: .medium)
        editButton.backgroundColor = Colors.editButtonBackColor
        editButton.titleLabel?.textAlignment = .center
        editButton.titleLabel?.adjustsFontSizeToFitWidth = true
        editButton.layer.cornerRadius = Sizes.editButtonCorners
        
        
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
    private lazy var storiesButton = createContentButtons(with: Strings.storiesButtonTitle, icon: Icons.storiesButtonIcon)
    private lazy var postButton = createContentButtons(with: Strings.postButtonTitle, icon: Icons.postButtonIcon)
    private lazy var photoButton = createContentButtons(with: Strings.photoButtonTitle, icon: Icons.photoButtonIcon)
    private lazy var clipButton = createContentButtons(with: Strings.clipButtonTitle, icon: Icons.clipButtonIcon)
    
    //Создание разделителя
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        
        separatorView.backgroundColor = Colors.separatorViewColor
        
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
    
    private lazy var cityButton = createInfoButtons(with: Strings.cityButtonTitle,
                                                    colorTitle: Colors.cityButtonColor,
                                                    icon: Icons.cityButtonIcon,
                                                    iconSize: Sizes.cityButtonIconSize)
    
    private lazy var subscribersButton = createInfoButtons(with: Strings.subscribersButtonTitle,
                                                           colorTitle: Colors.subscribersButtonColor,
                                                           icon: Icons.subscribersButtonIcon,
                                                           iconSize: Sizes.subscribersButtonIconSize)
    
    private lazy var placeOfWorkButton = createInfoButtons(with: Strings.placeOfWorkButtonTitle,
                                                           colorTitle: Colors.placeOfWorkButtonColor,
                                                           icon: Icons.placeOfWorkButtonIcon,
                                                           iconSize: Sizes.placeOfWorkButtonIconSize)
    
    private lazy var giftButton = createInfoButtons(with: Strings.giftButtonTitle,
                                                    colorTitle: Colors.giftButtonColor,
                                                    icon: Icons.giftButtonIcon,
                                                    iconSize: Sizes.giftButtonIconSize)
    
    private lazy var detailedInfoButton = createInfoButtons(with: Strings.detailedInfoButtonTitle,
                                                            colorTitle: Colors.detailedInfoButtonColor,
                                                            icon: Icons.detailedInfoButtonIcon,
                                                            iconSize: Sizes.detailedInfoButtonIconSize)
    
    //Иконка chevron для кнопки giftButton
    private lazy var chevronImage: UIImageView = {
        let chevron = UIImageView()
        
        let mediumConfig = UIImage.SymbolConfiguration(pointSize: 15, weight: .medium, scale: .medium)
        chevron.image = UIImage(systemName: "chevron.right", withConfiguration: mediumConfig)
        chevron.tintColor = UIColor(rgb: 0x6D5EBB)
        return chevron
    }()
    
    
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
        view.addSubview(chevronImage)
        
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
        avatarButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                          constant: Offsets.avatarButtonTopOffset).isActive = true
        avatarButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                           constant: Offsets.avatarButtonLeftOffset).isActive = true
        avatarButton.widthAnchor.constraint(equalTo: view.widthAnchor,
                                            multiplier: Offsets.avatarButtonWidth).isActive = true
        avatarButton.widthAnchor.constraint(equalTo: avatarButton.heightAnchor,
                                            multiplier: Offsets.avatarButtonRatio).isActive = true
        
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: Offsets.fullNameLabelTopOffset).isActive = true
        fullNameLabel.leftAnchor.constraint(equalTo: avatarButton.rightAnchor,
                                            constant: Offsets.fullNameLabelLeftOffset).isActive = true
        fullNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor,
                                             multiplier: Offsets.fullNameLabelWidthOffset).isActive = true
        fullNameLabel.heightAnchor.constraint(equalTo: view.widthAnchor,
                                              multiplier: Offsets.fullNameLabelHeightOffset).isActive = true

        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor,
                                          constant: Offsets.statusButtonTopOffset).isActive = true
        statusButton.leftAnchor.constraint(equalTo: avatarButton.rightAnchor,
                                           constant: Offsets.statusButtonLeftOffset).isActive = true
        statusButton.widthAnchor.constraint(equalTo: view.widthAnchor,
                                            multiplier: Offsets.statusButtonWidthOffset).isActive = true
        statusButton.heightAnchor.constraint(equalTo: view.widthAnchor,
                                             multiplier: Offsets.statusButtonHeightOffset).isActive = true

        networkStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        networkStatusLabel.topAnchor.constraint(equalTo: statusButton.bottomAnchor,
                                                constant: Offsets.networkStatusLabelTopOffset).isActive = true
        networkStatusLabel.leftAnchor.constraint(equalTo: avatarButton.rightAnchor,
                                                 constant: Offsets.networkStatusLabelLeftOffset).isActive = true
        networkStatusLabel.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                  multiplier: Offsets.networkStatusLabelWidthOffset).isActive = true
        networkStatusLabel.heightAnchor.constraint(equalTo: view.widthAnchor,
                                                   multiplier: Offsets.networkStatusLabelHeightOffset).isActive = true
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.topAnchor.constraint(equalTo: networkStatusLabel.bottomAnchor,
                                        constant: Offsets.editButtonTopOffset).isActive = true
        editButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                         constant: Offsets.editButtonLeftOffset).isActive = true
        editButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                          constant: Offsets.editButtonRightOffset).isActive = true
        editButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: Offsets.editButtonHeightOffset).isActive = true
        editButton.titleLabel?.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: Offsets.editButtonLabelOffset).isActive = true
        
        addContentStackView.translatesAutoresizingMaskIntoConstraints = false
        addContentStackView.topAnchor.constraint(equalTo: editButton.bottomAnchor,
                                                 constant: Offsets.contentStackViewTopOffset).isActive = true
        addContentStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                                  constant: Offsets.contentStackViewLeftOffset).isActive = true
        addContentStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                                   constant: Offsets.contentStackViewRightOffset).isActive = true
        addContentStackView.heightAnchor.constraint(equalTo: view.widthAnchor,
                                                    multiplier: Offsets.contentStackViewHeightOffset).isActive = true
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.topAnchor.constraint(equalTo: addContentStackView.bottomAnchor,
                                           constant: Offsets.separatorViewTopOffset).isActive = true
        separatorView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                            constant: Offsets.separatorViewLeftOffset).isActive = true
        separatorView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                             constant: Offsets.separatorViewRightOffset).isActive = true
        separatorView.widthAnchor.constraint(equalTo: view.widthAnchor,
                                             multiplier: Offsets.separatorViewWidthOffset).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: Offsets.separatorViewHeightOffset).isActive = true
        
        infoButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        infoButtonsStackView.topAnchor.constraint(equalTo: separatorView.bottomAnchor,
                                                  constant: Offsets.infoButtonsStackViewTopOffset).isActive = true
        infoButtonsStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                                   constant: Offsets.infoButtonsStackViewLeftOffset).isActive = true
        infoButtonsStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                                    constant: Offsets.infoButtonsStackViewRightOffset).isActive = true
        infoButtonsStackView.widthAnchor.constraint(equalTo: view.widthAnchor,
                                                    multiplier: Offsets.infoButtonsStackViewWidthOffset).isActive = true
        infoButtonsStackView.heightAnchor.constraint(equalTo: view.widthAnchor,
                                                     multiplier: Offsets.infoButtonsStackViewHeightOffset).isActive = true
        
        chevronImage.translatesAutoresizingMaskIntoConstraints = false
        chevronImage.leftAnchor.constraint(equalTo: giftButton.rightAnchor, constant: 5).isActive = true
        chevronImage.topAnchor.constraint(equalTo: placeOfWorkButton.bottomAnchor, constant: 19).isActive = true
    }
    
    //Настройки главной View
    private func setupView() {
        view.backgroundColor = Colors.setupViewBackColor
    }
    
    //MARK: - Create functions
    
    //Функция создания кнопок с информацией о пользователе и кнопки с установкой статуса
    private func createInfoButtons(with title: String, colorTitle: UIColor, icon: String?, iconSize: CGFloat?) -> UIButton {
        let button = UIButton(type: .system)
        
        button.setTitle(title, for: .normal)
        button.setTitleColor(colorTitle, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Sizes.infoButtonsTitleSize, weight: .medium)
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
        container.font = UIFont.systemFont(ofSize: Sizes.contentButtonsTitleSize, weight: .medium)
        let mediumConfig = UIImage.SymbolConfiguration(weight: .medium)
        var configuration = UIButton.Configuration.plain()
        configuration.attributedTitle = AttributedString(title, attributes: container)
        configuration.image = UIImage(systemName: icon, withConfiguration: mediumConfig)
        configuration.imagePlacement = .top
        configuration.imagePadding = 9
        configuration.baseForegroundColor = Colors.contentButtonsColor
        let button = UIButton(configuration: configuration, primaryAction: nil)
        
        return button
    }
    
        
}

// Расширение для кастомного цвета
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && red <= 255, "Invalid green component")
        assert(blue >= 0 && red <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(red: (rgb >> 16) & 0xFF,
                  green: (rgb >> 8) & 0xFF,
                  blue: rgb & 0xFF)
    }
}

//MARK: - Constants

extension ViewController {
    
    enum Sizes {
        static let avatarButtonCorners: CGFloat = 47
        static let fullNameLabelSize: CGFloat = 22
        static let networkStatusLabelSize: CGFloat = 16
        static let netWorkStatusLabelIconSize: CGFloat = 14
        static let editButtonTitleSize: CGFloat = 15
        static let editButtonCorners: CGFloat = 10
        static let cityButtonIconSize: CGFloat = 14
        static let subscribersButtonIconSize: CGFloat = 20
        static let placeOfWorkButtonIconSize: CGFloat = 15
        static let giftButtonIconSize: CGFloat = 19
        static let detailedInfoButtonIconSize: CGFloat = 17
        static let infoButtonsTitleSize: CGFloat = 17
        static let contentButtonsTitleSize: CGFloat = 15
    }
    
    enum Offsets {
        static let avatarButtonTopOffset: CGFloat = 100
        static let avatarButtonLeftOffset: CGFloat = 15
        static let avatarButtonWidth: CGFloat = 0.23
        static let avatarButtonRatio: CGFloat = 1
        static let fullNameLabelTopOffset: CGFloat = 114
        static let fullNameLabelLeftOffset: CGFloat = 15
        static let fullNameLabelWidthOffset: CGFloat = 0.37
        static let fullNameLabelHeightOffset: CGFloat = 0.06
        static let statusButtonTopOffset: CGFloat = 2
        static let statusButtonLeftOffset: CGFloat = 15
        static let statusButtonWidthOffset: CGFloat = 0.33
        static let statusButtonHeightOffset: CGFloat = 0.06
        static let networkStatusLabelTopOffset: CGFloat = 2
        static let networkStatusLabelLeftOffset: CGFloat = 15
        static let networkStatusLabelWidthOffset: CGFloat = 0.157
        static let networkStatusLabelHeightOffset: CGFloat = 0.05
        static let editButtonTopOffset: CGFloat = 32
        static let editButtonLeftOffset: CGFloat = 15
        static let editButtonRightOffset: CGFloat = -15
        static let editButtonHeightOffset: CGFloat = 0.098
        static let editButtonLabelOffset: CGFloat = 0.045
        static let contentStackViewTopOffset: CGFloat = 15
        static let contentStackViewLeftOffset: CGFloat = 20
        static let contentStackViewRightOffset: CGFloat = -20
        static let contentStackViewHeightOffset: CGFloat = 0.15
        static let separatorViewTopOffset: CGFloat = 10
        static let separatorViewLeftOffset: CGFloat = 15
        static let separatorViewRightOffset: CGFloat = 15
        static let separatorViewWidthOffset: CGFloat = 0.92
        static let separatorViewHeightOffset: CGFloat = 0.5
        static let infoButtonsStackViewTopOffset: CGFloat = 15
        static let infoButtonsStackViewLeftOffset: CGFloat = 15
        static let infoButtonsStackViewRightOffset: CGFloat = 15
        static let infoButtonsStackViewWidthOffset: CGFloat = 0.92
        static let infoButtonsStackViewHeightOffset: CGFloat = 0.4
    }
    
    enum Strings {
        static let fullNameLabelText: String = "Алексей Павлов"
        static let networkStatusLabelText: String = "online "
        static let statusButtonTitle: String = "Установить статус"
        static let editButtonTitle: String = "Редактировать"
        static let storiesButtonTitle: String = "История"
        static let postButtonTitle: String = "Запись"
        static let photoButtonTitle: String = "Фото"
        static let clipButtonTitle: String = "Клип"
        static let cityButtonTitle: String = "   Город: Москва"
        static let subscribersButtonTitle: String = "   35 подписчиков"
        static let placeOfWorkButtonTitle: String = "   Указать место работы"
        static let giftButtonTitle: String = "   Получить подарок"
        static let detailedInfoButtonTitle: String = "   Подробная информация"
    }
    
    enum Icons {
        static let avatarButtonIcon: String = "rsq8"
        static let networkStatusLabelIcon: String = "iphone.homebutton"
        static let storiesButtonIcon: String = "camera"
        static let postButtonIcon: String = "square.and.pencil"
        static let photoButtonIcon: String = "photo"
        static let clipButtonIcon: String = "play.square"
        static let cityButtonIcon: String = "house"
        static let subscribersButtonIcon: String = "dot.radiowaves.up.forward"
        static let placeOfWorkButtonIcon: String = "briefcase"
        static let giftButtonIcon: String = "snowflake"
        static let detailedInfoButtonIcon: String = "exclamationmark.circle.fill"
        
        
    }
    
    enum Colors {
        static let fullNameTextColor: UIColor = .white
        static let networkStatusLabelTextColor = UIColor(rgb: 0x707072)
        static let separatorViewColor: UIColor = .darkGray
        static let statusButtonTitleColor = UIColor(rgb: 0x78AAE3)
        static let editButtonTitleColor: UIColor = .white
        static let editButtonBackColor = UIColor(rgb: 0x2C2D2E)
        static let cityButtonColor = UIColor(rgb: 0x969597)
        static let subscribersButtonColor = UIColor(rgb: 0x969597)
        static let placeOfWorkButtonColor = UIColor(rgb: 0x78AAE3)
        static let giftButtonColor = UIColor(rgb: 0x6D5EBB)
        static let detailedInfoButtonColor: UIColor = .lightGray
        static let setupViewBackColor = UIColor(rgb: 0x19191A)
        static let contentButtonsColor = UIColor(rgb: 0x78AAE3)
    }
}
