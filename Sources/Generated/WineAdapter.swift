public protocol WineAdapter {
    func findAll(onCompletion: @escaping ([Wine], Error?) -> Void)
    func create(_ model: Wine, onCompletion: @escaping (Wine?, Error?) -> Void)
    func deleteAll(onCompletion: @escaping (Error?) -> Void)

    func findOne(_ maybeID: String?, onCompletion: @escaping (Wine?, Error?) -> Void)
    func update(_ maybeID: String?, with model: Wine, onCompletion: @escaping (Wine?, Error?) -> Void)
    func delete(_ maybeID: String?, onCompletion: @escaping (Wine?, Error?) -> Void)
}
