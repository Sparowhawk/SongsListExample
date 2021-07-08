//
//  SearchBarView.swift
//  MusicList (iOS)
//
//  Created by Dylan Nienberg on 7/8/21.
//

import Foundation
import UIKit
import PureLayout


class SearchBarView: UIView, UITextFieldDelegate {
    
    private let artistNameTextField:UITextField = UITextField(forAutoLayout: ())
    private let searchArtistButton:UIButton = UIButton(forAutoLayout: ())
    @objc public var searchDelegate:SearchDelegate!
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupSearchView(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupSearchView(frame:CGRect) {
        
        searchArtistButton.setTitle("Search Artist", for: .normal)
        searchArtistButton.setTitleColor(.black, for: .normal)
        searchArtistButton.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        self.addSubview(searchArtistButton)
        searchArtistButton.autoPinEdge(.top, to: .top, of: self, withOffset: 0)
        searchArtistButton.autoPinEdge(.right, to: .right, of: self, withOffset: -10)
        searchArtistButton.autoSetDimension(.width, toSize: 140)
        searchArtistButton.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: 0)
        
        artistNameTextField.placeholder = "Artist Name"
        artistNameTextField.textColor = .black
        artistNameTextField.autocapitalizationType = .words
        artistNameTextField.keyboardType = .alphabet
        self.addSubview(artistNameTextField)
        artistNameTextField.delegate = self
        artistNameTextField.autoPinEdge(.top, to: .top, of: self, withOffset: 0)
        artistNameTextField.autoPinEdge(.left, to: .left, of: self, withOffset: 10)
        artistNameTextField.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: 0)
        artistNameTextField.autoPinEdge(.right, to: .left, of: searchArtistButton, withOffset: 0)
    }
    
    @objc func searchPressed() {
        if artistNameTextField.text != "" {
            searchDelegate.artistNameToSearch(artistName: artistNameTextField.text ?? "")
        }
    }
}
