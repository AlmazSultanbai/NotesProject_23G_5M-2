//
//  ViewController.swift
//  NotesProject_23G_5M
//
//  Created by Sultanbai Almaz on 23/3/24.
//

import UIKit
protocol HomeViewProtocol {
    
    func succesNotes(notes: [String])
}

class HomeView: UIViewController  {
    
   
    
    private var controller: HomeControllerProtocol?
    
    private var notes: [String] = []
    
    private lazy var noteSearchBar: UISearchBar = {
        let view = UISearchBar()
        view.text = "Search"
        return view
    }()
    
    
    
    private lazy var noteLabel: UILabel = {
        let view = UILabel()
        view.text = "Notes"
        return view
    }()
    
    private lazy var notesCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(NotesCVCell.self, forCellWithReuseIdentifier: NotesCVCell.reuseID)
        return view
    }()
    
    private lazy  var addButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("+", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 42 / 2
        view.titleLabel?.font = .boldSystemFont(ofSize: 20)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupConstraints()
        controller = HomeController(view: self)
        controller?.onGetNotes()
        setupNavigationItem()
        
        
        
    }

    func setupNavigationItem() {
        navigationItem.title = "Home"
        var rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
    }
    
    @objc func settingsButtonTapped() {
        let vc = SettingsView()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func setupConstraints() {
        view.addSubview(noteSearchBar)
        view.addSubview(noteLabel)
        view.addSubview(notesCollectionView)
        view.addSubview(addButton)
        
        noteSearchBar.translatesAutoresizingMaskIntoConstraints = false
        noteLabel.translatesAutoresizingMaskIntoConstraints = false
        notesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noteSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            noteSearchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            noteSearchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            noteSearchBar.heightAnchor.constraint(equalToConstant: 36),
           
            noteLabel.topAnchor.constraint(equalTo: noteSearchBar.bottomAnchor, constant: 22),
            noteLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 39),
            
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 42),
            addButton.heightAnchor.constraint(equalToConstant: 42),
            
            notesCollectionView.topAnchor.constraint(equalTo: noteLabel.bottomAnchor, constant: 30),
            notesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            notesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            notesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
     ])
    }
}
extension HomeView: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NotesCVCell.reuseID, for: indexPath) as! NotesCVCell
        cell.fill(title: notes[indexPath.row])
        return cell
    }
}
extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 12) / 2, height: 100)
    }
}
extension HomeView: HomeViewProtocol {
    
    
    func succesNotes(notes: [String]) {
        self.notes = notes
        notesCollectionView.reloadData() //отрисоваться заново
    }
}
