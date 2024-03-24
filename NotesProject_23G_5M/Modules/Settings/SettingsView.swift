//
//  File.swift
//  NotesProject_23G_5M
//
//  Created by Sultanbai Almaz on 24/3/24.
//

import UIKit
protocol SettingsViewProtocol{
    
}
class SettingsView: UIViewController {
    
   weak var controller: SettingsControllerProtocol?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        controller = SettingsController(view: self)
    }
    deinit {print("исчез")}
}

extension SettingsView: SettingsViewProtocol {
    
}
