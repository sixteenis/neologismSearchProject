//
//  ViewController.swift
//  neologismSearchProject
//
//  Created by 박성민 on 5/17/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var mainTextField: UITextField!
    @IBOutlet var mainTextFiledButton: UIButton!
    
    @IBOutlet var subSearchButton1: UIButton!
    @IBOutlet var subSearchButton2: UIButton!
    @IBOutlet var subSearchButton3: UIButton!
    
    @IBOutlet var mainbackgroundImage: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    func setView() {
        mainTextField.layer.borderWidth = 3
        mainTextField.layer.borderColor = UIColor.black.cgColor
        mainTextField.frame.size.height = 45
        
        mainTextFiledButton.setImage(.init(systemName: "magnifyingglass"), for: .normal)
        mainTextFiledButton.tintColor = .white
        mainTextFiledButton.backgroundColor = .black
        mainTextFiledButton.setTitle("", for: .normal)
        
        setsubView(button: subSearchButton1)
        setsubView(button: subSearchButton2)
        setsubView(button: subSearchButton3)
        
        mainbackgroundImage.image = UIImage(named: "background")
        mainbackgroundImage.contentMode = .scaleAspectFill
        
        mainLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        mainLabel.textAlignment = .center
        
    }
    
    func setsubView(button: UIButton) {
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        
    }


}

