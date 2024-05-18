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
    
    var subTitle1: String = ""
    var subTitle2: String = ""
    var subTitle3: String = ""
    
    var neologisms: [String:String] = [
        "삼귀다": "사귀다의 바로 전단계를 표현",
        "무야호": "무한도전에서 유래된 일종의 밈",
        "국룰": "국민의 룰, 국가의 룰",
        "마상": "\'마음의 상처\'의 줄임말",
        "그 잡채": "그자체에서 변형된 말",
        "갓생": "생산적인 인생",
        "깔미": "깔수록 미운사람 또는 이유없이 미운 사람",
        "꾸안꾸": "꾸민 듯 안 꾸민 듯 즉 자연스러운 스타일",
        "반모": "반말 모드 즉 반말로 대화하는 것",
        "오하운": "오늘 하루 운동",
        "머선129": "무슨 일이야를 사투리처럼 발음한 것"
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    func setView() {
        mainTextField.layer.borderWidth = 3
        mainTextField.layer.borderColor = UIColor.black.cgColor
        mainTextField.frame.size.height = 45
        mainTextField.placeholder = "신조어를 검색해주세요!"
        
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
        mainLabel.text = ""
        
        subViewTitleSet()
        setsubTitle()
        
    }
    
    func setsubView(button: UIButton) {
        button.tintColor = .black
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.titleLabel?.font = button.titleLabel?.font.withSize(14)
        
    }
    func subViewTitleSet() {
        var arr = neologisms
        let a = arr.randomElement()?.key
        arr.removeValue(forKey: a!)
        let b = arr.randomElement()?.key
        arr.removeValue(forKey: b!)
        let c = arr.randomElement()?.key
        arr.removeValue(forKey: c!)
        subTitle1 = a!
        subTitle2 = b!
        subTitle3 = c!
        
    }
    
    func setsubTitle() {
        subSearchButton1.setTitle(subTitle1, for: .normal)
        subSearchButton2.setTitle(subTitle2, for: .normal)
        subSearchButton3.setTitle(subTitle3, for: .normal)
    }
    
    func mainlabelChange(title: String) {
        mainLabel.text = neologisms[title]
    }
    
    
    @IBAction func mainTextFiledDone(_ sender: UITextField) {
        print("1")
    }
    
    
    @IBAction func searchButtonTappend(_ sender: UIButton) {
        mainlabelChange(title: mainTextField.text!)
        
    }
    
    @IBAction func subButton1Tappend(_ sender: UIButton) {
        mainlabelChange(title: subTitle1)
    }
    
    @IBAction func subButton2Tappend(_ sender: UIButton) {
        mainlabelChange(title: subTitle2)
    }
    
    @IBAction func subButton3Tappend(_ sender: UIButton) {
        mainlabelChange(title: subTitle3)
    }
    
//    @IBOutlet var mainTextField: UITextField!
//    @IBOutlet var mainTextFiledButton: UIButton!
//    
//    @IBOutlet var subSearchButton1: UIButton!
//    @IBOutlet var subSearchButton2: UIButton!
//    @IBOutlet var subSearchButton3: UIButton!
//    
//    @IBOutlet var mainbackgroundImage: UIImageView!
//    @IBOutlet var mainLabel: UILabel!
//    
//    var subTitle1: [String] = []
//    var subTitle2: [String] = []
//    var subTitle3: [String] = []
}

