//
//  SettingsController.swift
//  NotesProject_23G_5M
//
//  Created by Sultanbai Almaz on 24/3/24.
//

import Foundation

protocol SettingsControllerProtocol: AnyObject{
    
}

class SettingsController{
    
    var view: SettingsViewProtocol?
    
    var model: SettingsModelProtocol?
    
    
    init(view: SettingsViewProtocol) {
        self.view = view
        self.model = SettingsModel(controller: self)
        
    }
    
}

extension SettingsController: SettingsControllerProtocol{
    
}
