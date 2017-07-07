import Foundation
import Configuration
import CloudFoundryConfig
import CouchDB

public class AdapterFactory {
    let manager: ConfigurationManager

    init(manager: ConfigurationManager) {
        self.manager = manager
    }

    public func getUserAdapter() throws -> UserAdapter {
      let service = try manager.getCloudantService(name: "crudDataStore")
      return UserCloudantAdapter(ConnectionProperties(
          host:     service.host,
          port:     Int16(service.port),
          secured:  service.secured,
          username: service.username,
          password: service.password
      ))
    }
    public func getWineAdapter() throws -> WineAdapter {
      let service = try manager.getCloudantService(name: "crudDataStore")
      return WineCloudantAdapter(ConnectionProperties(
          host:     service.host,
          port:     Int16(service.port),
          secured:  service.secured,
          username: service.username,
          password: service.password
      ))
    }

}
