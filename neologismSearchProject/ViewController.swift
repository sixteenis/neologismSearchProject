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
    
    @IBOutlet var subButtonList: [UIButton]!
    
    @IBOutlet var mainbackgroundImage: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var unknownTextFiled: UITextField!
    @IBOutlet var unknownTextFiledImage: UIButton!
    
    
    
    var subTitleList = Array(repeating: "", count: 3)
    
    
    var unownedTitle = ""
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
        self.hideKeyboardWhenTappedAround()
        setView()
    }
    func setView() {
        mainTextField.layer.borderWidth = 3
        mainTextField.layer.borderColor = UIColor.black.cgColor
        mainTextField.frame.size.height = 45
        mainTextField.placeholder = "신조어를 검색해주세요!"
        //mainTextField.keyboardType = .numbersAndPunctuation
        
        mainTextFiledButton.setImage(.init(systemName: "magnifyingglass"), for: .normal)
        mainTextFiledButton.tintColor = .white
        mainTextFiledButton.backgroundColor = .black
        mainTextFiledButton.setTitle("", for: .normal)
        
        for i in 0...2{
            setsubView(button: subButtonList[i])
        }
        
        
        mainbackgroundImage.image = UIImage(named: "background")
        mainbackgroundImage.contentMode = .scaleAspectFill
        
        mainLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        mainLabel.textAlignment = .center
        mainLabel.text = ""
        mainLabel.numberOfLines = 0
        
        subViewTitleSet()
        setsubTitle()
        
        unknownTextFiled.layer.borderWidth = 3
        unknownTextFiled.layer.borderColor = UIColor.black.cgColor
        unknownTextFiled.frame.size.height = 45
        //unknownTextFiled.keyboardType = .default
        
        unknownTextFiledImage.setImage(.init(systemName: "plus"), for: .normal)
        unknownTextFiledImage.tintColor = .white
        unknownTextFiledImage.backgroundColor = .black
        unknownTextFiledImage.setTitle("", for: .normal)
        
        unknownTextFiled.isHidden = true
        unknownTextFiledImage.isHidden = true
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
        subTitleList[0] = a!
        subTitleList[1] = b!
        subTitleList[2] = c!
        
        
    }
    
    func setsubTitle() {
        for i in 0...2{
            subButtonList[i].setTitle(subTitleList[i], for: .normal)
            subButtonList[i].contentEdgeInsets =  UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            subButtonList[i].tag
        }
    }
    
    func mainlabelChange(title: String) {
        if neologisms[title] == nil {
            mainLabel.text = "↑↑↑↑↑↑↑↑↑↑↑\n처음 들어보는 신조어에요!!\n  혹시 의미를 아셨다면 알려주세요!\n"
            unownedTitle = title
            unknownTextFiled.placeholder = "\(title)에 의미를 알려주세요!"
            unknownTextFiled.isHidden = false
            unknownTextFiledImage.isHidden = false
            
        }else{
            mainLabel.text = neologisms[title]
            mainTextField.text = ""
            unknownTextFiled.isHidden = true
            unknownTextFiledImage.isHidden = true
            subViewTitleSet()
            setsubTitle()
        }
        //랜덤으로 단어 선택하고 서브뷰에 나타내줌
        
        
    }
    
    
    
    @IBAction func mainTextFiledDone(_ sender: UITextField) {
        if mainTextField.text! == ""{
            mainLabel.text = "아시는 신조어가 없으면 위에 신조어에 의미를 보세요!"
            
        }else{
            mainlabelChange(title: mainTextField.text!)
        }
    }
    
    @IBAction func searchButtonTappend(_ sender: UIButton) {
        if mainTextField.text! == ""{
            mainLabel.text = "아시는 신조어가 없으면 위에 신조어에 의미를 보세요!"
            
        }else{
            mainlabelChange(title: mainTextField.text!)
        }
    }
    
//    @IBAction func subButton1Tappend(_ sender: UIButton) {
//        mainlabelChange(title: subTitle1)
//    }
//    
//    @IBAction func subButton2Tappend(_ sender: UIButton) {
//        mainlabelChange(title: subTitle2)
//    }
//    
//    @IBAction func subButton3Tappend(_ sender: UIButton) {
//        mainlabelChange(title: subTitle3)
//    }
//    

    
    @IBAction func unknownTextFiledDone(_ sender: UITextField) {
        if unknownTextFiled.text! == "" {
            mainLabel.text = "알려주세요 ㅠㅠ"
        }else{
            neologisms[unownedTitle] = unknownTextFiled.text!
            mainLabel.text = "알려주셔서 감사합니다!!!!"
            mainTextField.text = ""
            unknownTextFiled.text = ""
            subViewTitleSet()
            setsubTitle()
            unknownTextFiled.isHidden = true
            unknownTextFiledImage.isHidden = true

        }
    }
    
    @IBAction func unknownButtonTappend(_ sender: UIButton) {
        if unknownTextFiled.text! == "" {
            mainLabel.text = "알려주세요 ㅠㅠ"
        }else{
            neologisms[unownedTitle] = unknownTextFiled.text!
            mainLabel.text = "알려주셔서 감사합니다!!!!"
            mainTextField.text = ""
            unknownTextFiled.text = ""
            subViewTitleSet()
            setsubTitle()
            unknownTextFiled.isHidden = true
            unknownTextFiledImage.isHidden = true
            
        }
    
        
    }

    
    @IBAction func subButtonTapped(_ sender: UIButton) {
        mainlabelChange(title: subTitleList[sender.tag])
    }
    

}

//키보드 내리기
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
