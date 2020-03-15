//
//  ASCAPI+JWT.swift
//  
//
//  Created by Zach Eriksen
//

import JWT

extension ASCAPI {
    enum Constants {
        static let signerKey = "PRIVATE_KEY"
        static let header = JWTHeader(alg: "ES256", typ: "JWT", kid: "PRIVATE_ID")
        // TODO: JWTSigner.es256(key: ASCAPI.Constants.signerKey)
        static let signer = JWTSigner.hs256(key: ASCAPI.Constants.signerKey)
        static let expirationTime: TimeInterval = 60 * 10
        static let issuer = IssuerClaim(value: "ISSUER_ID")
    }

    @discardableResult
    func configure() -> Self {
        let payload = ASCJWTPayload()
        let header = ASCAPI.Constants.header
        let signer = ASCAPI.Constants.signer
        let jwt = JWT<ASCJWTPayload>(header: header, payload: payload)

        guard let tokenData = try? signer.sign(jwt),
            let token = String(data: tokenData, encoding: .utf8) else {
                print("Error Signing JWT!")
                return self
        }

        print("Made Token")

        self.token = token

        print("Token: \(token)")

        return self
    }
}