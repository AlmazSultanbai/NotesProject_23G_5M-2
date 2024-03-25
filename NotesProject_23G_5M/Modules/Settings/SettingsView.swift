//
//  File.swift
//  NotesProject_23G_5M
//
//  Created by Sultanbai Almaz on 24/3/24.
//

import UIKit
protocol SettingsViewProtocol{
    
}
class SettingsView: UIViewController, SettingsViewProtocol {
    
    private var settingsArray: [SettingsData] = [SettingsData(leftImage: "globe", title: "Язык", type: .withButton, describtion: "русский"),
                                                 SettingsData(leftImage: "moon", title: "Темная тема", type: .withSwitch, describtion: ""),
                                                 SettingsData(leftImage: "trash", title: "Очистить данные", type: .none, describtion: ""),]
    
   weak var controller: SettingsControllerProtocol?
    
    
    
    private lazy var settingsTableView: UITableView = {
        let view = UITableView()
        view.register(SettingsTVCell.self, forCellReuseIdentifier: SettingsTVCell.reuseID)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
   override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .systemBackground
        controller? = SettingsController(view: self)
       setupConstraits()
       
    }
    
    func setupConstraits() {
        view.addSubview(settingsTableView)
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            settingsTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            settingsTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
    }
    
    deinit {print("исчез")}
}

extension SettingsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTVCell.reuseID, for: indexPath) as? SettingsTVCell
        cell?.setup(settings: settingsArray[indexPath.row])
        cell?.delegate = self
        return cell!
    }
    
    
}

extension SettingsView: UITableViewDelegate { //  в делегате настраивается высота
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension SettingsView: SettingsCellDelegate {
    func didSwitchOn(isOn: Bool) {
        if isOn {
            view.overrideUserInterfaceStyle = .dark
        } else {
            view.overrideUserInterfaceStyle = .light
        }
    }
    
    
}

//extension SettingsView
