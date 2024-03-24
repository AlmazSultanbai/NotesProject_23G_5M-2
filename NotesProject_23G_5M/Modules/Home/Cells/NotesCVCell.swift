//
//  NotesCollectionViewCell.swift
//  NotesProject_23G_5M
//
//  Created by Sultanbai Almaz on 24/3/24.
//

import UIKit

protocol NoteCVCellDelegate: AnyObject {
    
    func didremoveButton(index: Int)
    
}

class NotesCVCell: UICollectionViewCell {
    
    
    
 static let reuseID = "note_cell"
    
    var view: HomeView?
    
    var index: Int?
    
    let colors: [UIColor] = [.systemBlue, .lightGray, .systemMint, .systemCyan]
    
    weak var delegate: NoteCVCellDelegate?
    
    private lazy var cellLabel: UILabel = {
        let view = UILabel()
        view.text = "School Notes"
        view.textColor = .black
        return view
    }()
    
    private lazy var deleteButton: UIButton = {
        let view = UIButton(type: .system)
        view.tintColor = .black
        view.setImage(UIImage(systemName: "trash"), for: .normal)
        view.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        backgroundColor = colors.randomElement()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func deleteButtonTapped() {
        guard let index = index else { return }
        delegate?.didremoveButton(index: index)
    }
    
    
    func setupConstraints() {
        addSubview(cellLabel)
        contentView.addSubview(deleteButton)
        
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
            deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: 40),
            deleteButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    func fill (title: String) {
        cellLabel.text = title
        
    }
}

