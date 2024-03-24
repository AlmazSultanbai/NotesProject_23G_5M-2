//
//  SettingsModel.swift
//  NotesProject_23G_5M
//
//  Created by Sultanbai Almaz on 24/3/24.
//

import Foundation
import UIKit

protocol SettingsModelProtocol{
    
}
class SettingsModel{
    
   weak var controller: SettingsControllerProtocol?
    
    init(controller: SettingsControllerProtocol) {
        self.controller = controller
    }
    
}
extension SettingsModel: SettingsModelProtocol{
    
}
