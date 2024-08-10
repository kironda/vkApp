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
    
    // MARK: - Configure
    private func configureUI() {
        setupGradientView()
        setupLogoImageView()
        setupWelcomeViewStack()
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
}

