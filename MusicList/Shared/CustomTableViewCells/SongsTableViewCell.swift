//
//  SongsTableViewCell.swift
//  MusicList (iOS)
//
//  Created by Dylan Nienberg on 7/8/21.
//

import UIKit

class SongsTableViewCell: UITableViewCell {
    
    static var identifier: String = "SongsTableViewCell"
    var artistName = UILabel(forAutoLayout: ())
    var trackName = UILabel(forAutoLayout: ())
    var releaseDate = UILabel(forAutoLayout: ())
    var trackPrice = UILabel(forAutoLayout: ())
    var primaryGenreName = UILabel(forAutoLayout: ())
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    private func setupView() {
        self.selectionStyle = .none
        
        artistName.textColor = .black
        self.addSubview(artistName)
        artistName.autoPinEdge(.left, to: .left, of: self, withOffset: 10)
        artistName.autoPinEdge(.top, to: .top, of: self, withOffset: 5)
        artistName.autoMatch(.width, to: .width, of: self, withMultiplier: 0.50)
        artistName.autoSetDimension(.height, toSize: 20)
        
        releaseDate.textColor = .black
        releaseDate.textAlignment = .right
        self.addSubview(releaseDate)
        releaseDate.autoPinEdge(.right, to: .right, of: self, withOffset: -10)
        releaseDate.autoPinEdge(.top, to: .top, of: self, withOffset: 5)
        releaseDate.autoMatch(.width, to: .width, of: self, withMultiplier: 0.25)
        releaseDate.autoSetDimension(.height, toSize: 20)
        
        primaryGenreName.textColor = .black
        self.addSubview(primaryGenreName)
        primaryGenreName.autoPinEdge(.left, to: .right, of: artistName, withOffset: 10)
        primaryGenreName.autoPinEdge(.right, to: .left, of: releaseDate, withOffset: 10)
        primaryGenreName.autoPinEdge(.top, to: .top, of: self, withOffset: 5)
        primaryGenreName.autoSetDimension(.height, toSize: 20)
        
        trackName.textColor = .black
        self.addSubview(trackName)
        trackName.autoPinEdge(.left, to: .left, of: self, withOffset: 10)
        trackName.autoPinEdge(.top, to: .bottom, of: artistName, withOffset: 0)
        trackName.autoMatch(.width, to: .width, of: self, withMultiplier: 0.50)
        trackName.autoSetDimension(.height, toSize: 20)
        
        trackPrice.textColor = .black
        trackPrice.textAlignment = .right
        self.addSubview(trackPrice)
        trackPrice.autoPinEdge(.right, to: .right, of: self, withOffset: -10)
        trackPrice.autoPinEdge(.top, to: .bottom, of: artistName, withOffset: 0)
        trackPrice.autoMatch(.width, to: .width, of: self, withMultiplier: 0.50)
        trackPrice.autoSetDimension(.height, toSize: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
