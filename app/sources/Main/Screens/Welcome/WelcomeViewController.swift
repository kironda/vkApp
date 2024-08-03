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
    
    // MARK: - Configure
    private func configureUI() {
        setupGradientView()
    }
    // MARK: - Setup
    private func setupGradientView() {
        view.addSubview(gradientView)
        
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
