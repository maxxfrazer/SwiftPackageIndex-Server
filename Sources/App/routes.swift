import Fluent
import Vapor

func routes(_ app: Application) throws {
    let packageController = PackageController()
    app.get("packages", use: packageController.index)
    app.get("packages", ":id", use: packageController.get)

    app.group("admin") { admin in
        admin.get { req in SPIPage.admin() }
    }

    app.group("api") { api in
        let apiPackageController = API.PackageController()
        api.get("packages", use: apiPackageController.index)
        api.get("packages", ":id", use: apiPackageController.get)
        api.post("packages", use: apiPackageController.create)
        api.put("packages", ":id", use: apiPackageController.replace)
        api.delete("packages", ":id", use: apiPackageController.delete)
        api.get("packages", "run", ":command", use: apiPackageController.run)
    }
}
