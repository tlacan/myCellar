import SwiftyJSON

public struct User {
    public let id: String?
    public let email: String
    public let password: String

    public init(id: String?, email: String, password: String) {
        self.id = id
        self.email = email
        self.password = password
    }

    public init(json: JSON) throws {
        // Required properties
        guard json["email"].exists() else {
            throw ModelError.requiredPropertyMissing(name: "email")
        }
        guard let email = json["email"].string else {
            throw ModelError.propertyTypeMismatch(name: "email", type: "string", value: json["email"].description, valueType: String(describing: json["email"].type))
        }
        self.email = email
        guard json["password"].exists() else {
            throw ModelError.requiredPropertyMissing(name: "password")
        }
        guard let password = json["password"].string else {
            throw ModelError.propertyTypeMismatch(name: "password", type: "string", value: json["password"].description, valueType: String(describing: json["password"].type))
        }
        self.password = password

        // Optional properties
        if json["id"].exists() &&
           json["id"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "id", type: "string", value: json["id"].description, valueType: String(describing: json["id"].type))
        }
        self.id = json["id"].string

        // Check for extraneous properties
        if let jsonProperties = json.dictionary?.keys {
            let properties: [String] = ["id", "email", "password"]
            for jsonPropertyName in jsonProperties {
                if !properties.contains(where: { $0 == jsonPropertyName }) {
                    throw ModelError.extraneousProperty(name: jsonPropertyName)
                }
            }
        }
    }

    public func settingID(_ newId: String?) -> User {
      return User(id: newId, email: email, password: password)
    }

    public func updatingWith(json: JSON) throws -> User {
        if json["id"].exists() &&
           json["id"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "id", type: "string", value: json["id"].description, valueType: String(describing: json["id"].type))
        }
        let id = json["id"].string ?? self.id

        if json["email"].exists() &&
           json["email"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "email", type: "string", value: json["email"].description, valueType: String(describing: json["email"].type))
        }
        let email = json["email"].string ?? self.email

        if json["password"].exists() &&
           json["password"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "password", type: "string", value: json["password"].description, valueType: String(describing: json["password"].type))
        }
        let password = json["password"].string ?? self.password

        return User(id: id, email: email, password: password)
    }

    public func toJSON() -> JSON {
        var result = JSON([
            "email": JSON(email),
            "password": JSON(password),
        ])
        if let id = id {
            result["id"] = JSON(id)
        }

        return result
    }
}
