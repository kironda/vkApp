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
    
    private lazy var startButtonView: UIButton = {
        startButtonViewSettings()
    }()
    
    private lazy var termsButtonView: UIButton = {
        termsButtonViewSettings()
    }()
    
    // MARK: - LiveCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Private
    @objc private func startButtonTapped() {
        print(#function)
    }
    
    @objc private func termsButtonTapped() {
        print(#function)
    }
}

// MARK: - UI
extension WelcomeViewController {
    // MARK: - Settings
    private func gradientViewSettings() -> GradientView {
        let view = GradientView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.startColor = Color.Gradient.start
        view.endColor = Color.Gradient.end
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
    
    private func startButtonViewSettings() -> UIButton {
        let button = CustomButton(title: "GET STARTED")
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }
    
    private func termsButtonViewSettings() -> UIButton {
        let termsButton = UIButton(type: .system)
        
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        termsButton.setTitle("Terms of using the VK", for: .normal)
        termsButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        termsButton.setTitleColor(Color.Brand.tint, for: .normal)
        
        termsButton.addTarget(self, action: #selector(termsButtonTapped), for: .touchUpInside)
        return termsButton
    }
    
    // MARK: - Configure
    private func configureUI() {
        setupGradientView()
        setupLogoImageView()
        setupWelcomeViewStack()
        setupTermsButtonView()
        setupStartButtonView()
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
    
    private func setupStartButtonView() {
        gradientView.addSubview(startButtonView)
        
        NSLayoutConstraint.activate([
            startButtonView.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            startButtonView.bottomAnchor.constraint(equalTo: termsButtonView.bottomAnchor, constant: -35.0),
            startButtonView.widthAnchor.constraint(equalToConstant: 286),
            startButtonView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupTermsButtonView() {
        gradientView.addSubview(termsButtonView)
        
        NSLayoutConstraint.activate([
            termsButtonView.centerXAnchor.constraint(equalTo: gradientView.centerXAnchor),
            termsButtonView.bottomAnchor.constraint(equalTo: gradientView.bottomAnchor, constant: -40.0),
            termsButtonView.widthAnchor.constraint(equalToConstant: 286),
            termsButtonView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}

