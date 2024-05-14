//
//  KeyChainUseCase.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Security
import Foundation

protocol KeyChainUseCaseType {
    func saveString(account: String, value: String)
    func loadString(account: String) -> String?
}

final class KeyChainUseCase: KeyChainUseCaseType {
    func saveString(account: String, value: String) {
        guard let valueData = value.data(using: String.Encoding.utf8) else {
            print("It wasn't possible save the token")
            return
        }

        let keyChainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecValueData as String: valueData
        ]

        SecItemDelete(keyChainQuery as CFDictionary)

        let status = SecItemAdd(keyChainQuery as CFDictionary, nil)
        if status == errSecSuccess {
            print("AccessToken saved successful")
        }
    }

    func loadString(account: String) -> String? {
        let keyChainQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: true
        ]
        
        var tokenData: AnyObject?
        let status = SecItemCopyMatching(keyChainQuery as CFDictionary, &tokenData)

        guard status == errSecSuccess, let data = tokenData as? Data else {
            print("AccessToken load failure")
            return nil
        }
        
        return String(data: data, encoding: String.Encoding.utf8)
    }
}
