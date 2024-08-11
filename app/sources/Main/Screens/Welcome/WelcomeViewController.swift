//
//  WelcomeViewController.swift
//  VkApp
//
//  Created by Mac on 20.07.2024.
//  Copyright © 2024 Mikhail_K. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - UI
    private lazy var gradientView: GradientView = {
        gradientViewSettings()
    }()
    
    private lazy var logoImageView: UIImageView = {
        logoImageViewSettings()
    }()
    
    private lazy var welcomeStackView: UIStackView = {
        welcomeStackViewSettings()
    }()
    
    private lazy var welcomeButtonView: UIButton = {
        welcomeButtonViewSettings()
    }()
    
    private lazy var secondButtonView: UIButton = {
        secondButtonViewSettings()
    }()
    
    // MARK: - LiveCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

// MARK: - UI
extension WelcomeViewController {
    // MARK: - Settings
    private func gradientViewSettings() -> GradientView {
        let view = GradientView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.startColor = Color.Gradient.startColor
        view.endColor = Color.Gradient.endColor
        
        return view
    }
    
    private func logoImageViewSettings() -> UIImageView {
        let view = UIImageView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = "logo".uiImage
        
        return view
    }
    
    private func labelSettings(string: String, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: fontSize)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = string
        
        return label
    }
    
    private func welcomeStackViewSettings() -> UIStackView {
        let titleLabel = labelSettings(string: "Welcome", fontSize: 30.0)
        let descriptionLabel = labelSettings(string: "VK is the best social network on the planet", fontSize: 18.0)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10.0
        
        return stackView
    }
    
    private func welcomeButtonViewSettings() -> UIButton {
        let button = UIButton(type: .system)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GET STARTED", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 17)
        button.clipsToBounds = true
        button.backgroundColor = .vkButtonEnd
        button.layer.cornerRadius = 10
        
        return button
    }
    
    private func secondButtonViewSettings() -> UIButton {
        let secondButton = UIButton(type: .system)
        
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.setTitle("Terms of using the VK", for: .normal)
        secondButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        secondButton.setTitleColor(.vkTextSecondButton, for: .normal)
        
        return secondButton
    }
    
    // MARK: - Configure
    private func configureUI() {
        setupGradientView()
        setupLogoImageView()
        setupWelcomeViewStack()
        setupWelcomeButtonView()
        setupSecondButtonView()
    }
    
    // MARK: - Setups
    private func setupGradientView() {
        view.addSubview(gradientView)
        
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func setupLogoImageView() {
        gradientView.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: gradientView.topAnchor, constant: 100.0),
            logoImageView.widthAnchor.constraint(equalToConstant: 154.0),
            logoImageView.heightAnchor.constraint(equalToConstant: 128.0),
            logoImageView.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor)
        ])
    }
    
    private func setupWelcomeViewStack() {
        gradientView.addSubview(welcomeStackView)
        
        NSLayoutConstraint.activate([
            welcomeStackView.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            welcomeStackView.centerYAnchor.constraint(equalTo: gradientView.centerYAnchor),
            welcomeStackView.widthAnchor.constraint(equalToConstant: 240.0)
        ])
    }
    
    private func setupWelcomeButtonView() {
        gradientView.addSubview(welcomeButtonView)
        
        NSLayoutConstraint.activate([
            welcomeButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeButtonView.bottomAnchor.constraint(equalTo: welcomeStackView.bottomAnchor, constant: 290.0),
            welcomeButtonView.widthAnchor.constraint(equalToConstant: 286),
            welcomeButtonView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupSecondButtonView() {
        gradientView.addSubview(secondButtonView)
        
        NSLayoutConstraint.activate([
            secondButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButtonView.bottomAnchor.constraint(equalTo: welcomeButtonView.bottomAnchor, constant: 35.0),
            secondButtonView.widthAnchor.constraint(equalToConstant: 286),
            secondButtonView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

