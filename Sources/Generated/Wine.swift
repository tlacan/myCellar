import SwiftyJSON

public struct Wine {
    public let id: String?
    public let name: String
    public let year: String?
    public let grade: Double?
    public let kind: String?
    public let comment: String?
    public let pdo: String?
    public let image: String?

    public init(id: String?, name: String, year: String?, grade: Double?, kind: String?, comment: String?, pdo: String?, image: String?) {
        self.id = id
        self.name = name
        self.year = year
        self.grade = grade
        self.kind = kind
        self.comment = comment
        self.pdo = pdo
        self.image = image
    }

    public init(json: JSON) throws {
        // Required properties
        guard json["name"].exists() else {
            throw ModelError.requiredPropertyMissing(name: "name")
        }
        guard let name = json["name"].string else {
            throw ModelError.propertyTypeMismatch(name: "name", type: "string", value: json["name"].description, valueType: String(describing: json["name"].type))
        }
        self.name = name

        // Optional properties
        if json["id"].exists() &&
           json["id"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "id", type: "string", value: json["id"].description, valueType: String(describing: json["id"].type))
        }
        self.id = json["id"].string
        if json["year"].exists() &&
           json["year"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "year", type: "string", value: json["year"].description, valueType: String(describing: json["year"].type))
        }
        self.year = json["year"].string
        if json["grade"].exists() &&
           json["grade"].type != .number {
            throw ModelError.propertyTypeMismatch(name: "grade", type: "number", value: json["grade"].description, valueType: String(describing: json["grade"].type))
        }
        self.grade = json["grade"].number.map { Double($0) }
        if json["kind"].exists() &&
           json["kind"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "kind", type: "string", value: json["kind"].description, valueType: String(describing: json["kind"].type))
        }
        self.kind = json["kind"].string
        if json["comment"].exists() &&
           json["comment"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "comment", type: "string", value: json["comment"].description, valueType: String(describing: json["comment"].type))
        }
        self.comment = json["comment"].string
        if json["pdo"].exists() &&
           json["pdo"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "pdo", type: "string", value: json["pdo"].description, valueType: String(describing: json["pdo"].type))
        }
        self.pdo = json["pdo"].string
        if json["image"].exists() &&
           json["image"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "image", type: "string", value: json["image"].description, valueType: String(describing: json["image"].type))
        }
        self.image = json["image"].string

        // Check for extraneous properties
        if let jsonProperties = json.dictionary?.keys {
            let properties: [String] = ["id", "name", "year", "grade", "kind", "comment", "pdo", "image"]
            for jsonPropertyName in jsonProperties {
                if !properties.contains(where: { $0 == jsonPropertyName }) {
                    throw ModelError.extraneousProperty(name: jsonPropertyName)
                }
            }
        }
    }

    public func settingID(_ newId: String?) -> Wine {
      return Wine(id: newId, name: name, year: year, grade: grade, kind: kind, comment: comment, pdo: pdo, image: image)
    }

    public func updatingWith(json: JSON) throws -> Wine {
        if json["id"].exists() &&
           json["id"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "id", type: "string", value: json["id"].description, valueType: String(describing: json["id"].type))
        }
        let id = json["id"].string ?? self.id

        if json["name"].exists() &&
           json["name"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "name", type: "string", value: json["name"].description, valueType: String(describing: json["name"].type))
        }
        let name = json["name"].string ?? self.name

        if json["year"].exists() &&
           json["year"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "year", type: "string", value: json["year"].description, valueType: String(describing: json["year"].type))
        }
        let year = json["year"].string ?? self.year

        if json["grade"].exists() &&
           json["grade"].type != .number {
            throw ModelError.propertyTypeMismatch(name: "grade", type: "number", value: json["grade"].description, valueType: String(describing: json["grade"].type))
        }
        let grade = json["grade"].number.map { Double($0) } ?? self.grade

        if json["kind"].exists() &&
           json["kind"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "kind", type: "string", value: json["kind"].description, valueType: String(describing: json["kind"].type))
        }
        let kind = json["kind"].string ?? self.kind

        if json["comment"].exists() &&
           json["comment"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "comment", type: "string", value: json["comment"].description, valueType: String(describing: json["comment"].type))
        }
        let comment = json["comment"].string ?? self.comment

        if json["pdo"].exists() &&
           json["pdo"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "pdo", type: "string", value: json["pdo"].description, valueType: String(describing: json["pdo"].type))
        }
        let pdo = json["pdo"].string ?? self.pdo

        if json["image"].exists() &&
           json["image"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "image", type: "string", value: json["image"].description, valueType: String(describing: json["image"].type))
        }
        let image = json["image"].string ?? self.image

        return Wine(id: id, name: name, year: year, grade: grade, kind: kind, comment: comment, pdo: pdo, image: image)
    }

    public func toJSON() -> JSON {
        var result = JSON([
            "name": JSON(name),
        ])
        if let id = id {
            result["id"] = JSON(id)
        }
        if let year = year {
            result["year"] = JSON(year)
        }
        if let grade = grade {
            result["grade"] = JSON(grade)
        }
        if let kind = kind {
            result["kind"] = JSON(kind)
        }
        if let comment = comment {
            result["comment"] = JSON(comment)
        }
        if let pdo = pdo {
            result["pdo"] = JSON(pdo)
        }
        if let image = image {
            result["image"] = JSON(image)
        }

        return result
    }
}
