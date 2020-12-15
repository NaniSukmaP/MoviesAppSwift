//
//  MoviesCell.swift
//  MoviesApp
//
//  Created by Nani Sukma Putri Pratama on 13/12/20.
//

import UIKit
class MoviesCell : UITableViewCell {

    static let identifier = "MoviesCell"
    var moviesData : MoviesData? {
        didSet {
            
            titleMoviesLabel.text = moviesData?.titleMovies
            releaseMoviesLabel.text = moviesData?.releaseMovies
            reviewMoviesLabel.text = moviesData?.reviewMovies
            imageMovies.image = moviesData?.imageMovies
        }
    }
    
    
    private let titleMoviesLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let releaseMoviesLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let reviewMoviesLabel : UILabel =  {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
        
    }()
    
    private let imageMovies : UIImageView = {
        let imgView = UIImageView()
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
        contentView.addSubview(horizontalStack)
        contentView.addSubview(imageMovies)
    }
    private func setUpConstraint(){
        setupImageMovies()
        setupVerticalStack()
        setupHorizontalStack()
        
    }
    private func setupImageMovies(){
        imageMovies.anchor(top: horizontalStack.topAnchor, bottom: horizontalStack.bottomAnchor, leading: horizontalStack.leadingAnchor, trailing: nil, marginTop: 5, marginBottom: 5, marginLeading: 10, marginTrailing: 5, width: 100, height: 100, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    private func setupVerticalStack(){
        verticalStcak.anchor(top: topAnchor, bottom: bottomAnchor, leading: imageMovies.trailingAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, marginTop: 5, marginBottom: 0, marginLeading: 10, marginTrailing: -10, width: frame.width * 0.6, height: 80, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    private func setupHorizontalStack(){
        horizontalStack.anchor(top: topAnchor, bottom: bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, marginTop: 5, marginBottom: 0, marginLeading: 10, marginTrailing: -10, width: frame.width, height: 100, centerX: nil, centerY: nil, marginFromCenterX: 0, marginFromCenterY: 0)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
}
