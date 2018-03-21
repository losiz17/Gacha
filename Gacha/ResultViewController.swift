//
//  ResultViewController.swift
//  Gacha
//
//  Created by 吉川莉央 on 2018/03/21.
//  Copyright © 2018年 RioYoshikawa. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    //一番後ろの背景画像
    @IBOutlet var haikeiImageView: UIImageView!

    //モンスターを表示する画像
    @IBOutlet var monsterImageView: UIImageView!
    
    @IBAction func modoru(){
        self.dismiss(animated: true, completion: nil)
    }

    //モンスター画像を保存しておく配列
    var monsterArray: [UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //0~9でランダムに数字を発生させる
        let number = Int(arc4random_uniform(10))
        
        //モンスターの画像を10枚追加する
        monsterArray = [UIImage(named:"monster001.png")!,
                        UIImage(named:"monster002.png")!,
                        UIImage(named:"monster003.png")!,
                        UIImage(named:"monster004.png")!,
                        UIImage(named:"monster005.png")!,
                        UIImage(named:"monster006.png")!,
                        UIImage(named:"monster007.png")!,
                        UIImage(named:"monster008.png")!,
                        UIImage(named:"monster009.png")!,
                        UIImage(named:"monster010.png")!]
        //ランダムに選んだモンスターを表示させる
        monsterImageView.image = monsterArray[number]
        
        if number == 9{
            haikeiImageView.image = UIImage(named: "bg_gold.png")
            
        }else if number > 6{
            haikeiImageView.image = UIImage(named: "bg_red.png")
        }else{
            haikeiImageView.image = UIImage(named: "bg_blue.png")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        //アニメーションの中で変換させるキーパスを設定
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        //アニメーション開始時の数値
        animation.fromValue = NSNumber(value: 0)
        
        //アニメーション終了時の数値(M_PIとは角度の180度)
        animation.toValue = NSNumber(value: 2 * Double.pi)
        
        //Z軸を中心のアニメーションにする
        animation.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        
        //アニメーションの速さを決定する
        animation.duration = 5
        
        //アニメーションを何回転繰り返すか決める(今回は無限)
        animation.repeatCount = Float.infinity
        
        //どのレイヤーを回転させるか
        haikeiImageView.layer.add(animation, forKey: nil)
        
        
    }

}
