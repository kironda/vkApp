//
//  CommonViewCell.swift
//  VkApp
//
//  Created by Mac on 02.09.2024.
//  Copyright © 2024 Mikhail_K. All rights reserved.
//

import UIKit

class CommonViewCell: UITableViewCell {
    static let reuseId = "CommonViewCell"
    
    // MARK: - UI
    private lazy var iconView: UIImageView = {
        iconViewSettings()
    }()
    
    private lazy var titleLabel: UILabel = {
        titleSettings()
    }()
    
    private lazy var subtitleLabel: UILabel = {
        subtitleSettings()
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.layer.cornerRadius = iconView.bounds.size.width * 0.5
    }
    
    // MARK: - Interface
    func configure(with model: Configurable) {
        iconView.image = model.icon.uiImage
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
}

// MARK: - UI
extension CommonViewCell {
    // MARK: - Settings
    private func iconViewSettings() -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = view.bounds.size.width * 0.5
        view.layer.masksToBounds = true
        
        return view
    }
    
    private func titleSettings() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = Color.Main.text
        return label
    }
    
    private func subtitleSettings() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = Color.Main.tint
        return label
    }
    
    // MARK: - Configure
    private func configureUI() {
        setupIconView()
        setupTitleLabel()
        setupSubtitleLabel()
    }
    
    // MARK: - Setup
    private func setupIconView() {
        contentView.addSubview(iconView)
        
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0),
            iconView.widthAnchor.constraint(equalToConstant: 50.0),
            iconView.heightAnchor.constraint(equalToConstant: 50.0),
            iconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: iconView.topAnchor, constant: 4.0),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10.0),
        ])
    }
    
    private func setupSubtitleLabel() {
        contentView.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4.0),
            subtitleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 10.0),
        ])
    }
}
