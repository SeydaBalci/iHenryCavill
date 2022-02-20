//
//  henryResponse.swift
//  iHenryCavill
//
//  Created by Şeyda Şeyma Balcı on 20.02.2022.
//
import Foundation

func getHenryResponse(message: String) -> String{
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello"){
        return "Hey there, i love you🖤"
    }else if tempMessage.contains("how are you"){
        return "staring at your picture, i love you🖤"
    }else if tempMessage.contains("do you really  though?"){
        return "let's get married, i love you🖤"
    }else if tempMessage.contains("no"){
        return "i'll wait for you forever, i love you🖤"
    }else if tempMessage.contains("so?"){
        return "soooo, when is our wedding? i love you🖤"
    }
    else {
        return "please don't leave me i love you🖤"
    }
}
