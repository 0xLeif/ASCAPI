import JWT

struct ASCJWTPayload: JWTPayload {
    var iss: IssuerClaim = ASCAPI.Constants.issuer
    var exp: ExpirationClaim = ExpirationClaim(value: Date().addingTimeInterval(ASCAPI.Constants.expirationTime))
    var aud: String = "appstoreconnect-v1"

    func verify(using signer: JWTSigner) throws {
        try self.exp.verifyNotExpired()
    }
}