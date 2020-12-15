//
//  DetailView.swift
//  MoviesApp
//
//  Created by Nani Sukma Putri Pratama on 14/12/20.
//

import UIKit
class DetailView: UIView {
    
    
    private let titleMoviesLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "moviesData.movie[0].titleMovies"
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let releaseMoviesLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "moviesData.movie[0].releaseMovies"
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let reviewMoviesLabel : UILabel =  {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "moviesData.movie[0].reviewMovies"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
        
    }()
    
    private let imageMovies : UIImageView = {
        let imgView = UIImageView()
        imgView.image = #imageLiteral(resourceName: "Fizka1")
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    lazy var verticalStcak : UIStackView = {
        let vertical = UIStackView(arrangedSubviews: [titleMoviesLabel,releaseMoviesLabel,reviewMoviesLabel])
        vertical.axis = .vertical
        vertical.spacing = 4
        vertical.distribution = .fillProportionally
        return vertical
    }()
    lazy var horizontalStack : UIStackView = {
        let horizontal = UIStackView(arrangedSubviews: [imageMovies, verticalStcak])
        horizontal.axis = .horizontal
        horizontal.spacing = 4
        horizontal.distribution = .fillProportionally
        return horizontal
    }()
    
    private func setUpView(){
        self.addSubview(horizontalStack)
        self.addSubview(imageMovies)
    }
    private func setUpConstraint(){
        setupImageMovies()
        setupVerticalStack()
        setupHorizontalStack()
        
    }
    private func setupImageMovies(){
        imageMovies.anchor(top: horizontalStack.topAnchor, bottom: horizontalStack.bottomAnchor, leading: horizontalStack.leadingAnchor, trailing: nil, marginTop: 5, marginBottom: 0, marginLeading: 10, marginTrailing: 5, width: 100, height: 100, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    private func setupVerticalStack(){
        verticalStcak.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([verticalStcak.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                                     verticalStcak.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                                     verticalStcak.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                                     verticalStcak.leadingAnchor.constraint(equalTo: imageMovies.trailingAnchor, constant: 20),
                                     verticalStcak.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
                                     verticalStcak.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6)])
//
    }
    private func setupHorizontalStack(){
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([horizontalStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                                     horizontalStack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
                                     horizontalStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                                     horizontalStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
                                     horizontalStack.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
                                     horizontalStack.widthAnchor.constraint(equalTo: widthAnchor)])

    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
