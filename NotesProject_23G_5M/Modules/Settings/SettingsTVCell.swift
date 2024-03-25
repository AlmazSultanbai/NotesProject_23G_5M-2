//
//  File.swift
//  NotesProject_23G_5M
//
//  Created by Sultanbai Almaz on 25/3/24.
//

import UIKit

enum SettingsType {
    case none
    case withSwitch
    case withButton
}

struct SettingsData {  // описание модели
    let leftImage: String
    let title: String
    let type: SettingsType
    let describtion: String
}



protocol SettingsCellDelegate: AnyObject {
    
    func didSwitchOn (isOn: Bool)
}

class SettingsTVCell: UITableViewCell {
    
    static let reuseID = "settings_cell"
    
    weak var delegate: SettingsCellDelegate?
    
   private lazy var leftImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        return view
        
    }()
   
    private lazy var rightButton:UIButton = {
        let view = UIButton(type: .system)
        return view
    }()
    
    private lazy var switchView: UISwitch = {
        let view = UISwitch()
        view.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        return view
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func switchValueChanged() {
        delegate?.didSwitchOn(isOn: switchView.isOn)
    }
    
    func setup(settings: SettingsData){  // обозначили
        
        leftImageView.image = UIImage(systemName: settings.leftImage)
        titleLabel.text = settings.title
        switch settings.type {
        case .none:
            rightButton.isHidden = true
            switchView.isHidden = true
        case .withSwitch:
            rightButton.isHidden = true
        case .withButton:
            switchView.isHidden = true
            rightButton.setTitle(settings.describtion, for: .normal)
            
        }
    }
    
    func setupConstraints() {
        addSubview(leftImageView)
        addSubview(titleLabel)
        contentView.addSubview(rightButton)
        contentView.addSubview(switchView)
        
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        switchView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        leftImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
        leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
        leftImageView.heightAnchor.constraint(equalToConstant: 24),
        leftImageView.widthAnchor.constraint(equalToConstant: 24),
        
        titleLabel.leftAnchor.constraint(equalTo: leftImageView.rightAnchor, constant: 13),
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
        titleLabel.heightAnchor.constraint(equalToConstant: 40),
        
        rightButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        rightButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
        rightButton.heightAnchor.constraint(equalToConstant: 40),
        
        
        switchView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        switchView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
        switchView.heightAnchor.constraint(equalToConstant: 40)
        
        
        ])
    }
}

