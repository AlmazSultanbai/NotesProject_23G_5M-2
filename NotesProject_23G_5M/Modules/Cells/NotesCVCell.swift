//
//  NotesCollectionViewCell.swift
//  NotesProject_23G_5M
//
//  Created by Sultanbai Almaz on 24/3/24.
//

import UIKit

class NotesCVCell: UICollectionViewCell {
    
    
 static let reuseID = "note_cell"
    
    let colors: [UIColor] = [.systemBlue, .lightGray, .systemMint, .systemCyan]
    
    private lazy var cellLabel: UILabel = {
        let view = UILabel()
        view.text = "School Notes"
        view.textColor = .white
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        backgroundColor = colors.randomElement()
        setupConstraints()
    }
    
    func setupConstraints() {
       addSubview(cellLabel)
       
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
        ])
    }
    func fill (title: String) {
        cellLabel.text = title
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
