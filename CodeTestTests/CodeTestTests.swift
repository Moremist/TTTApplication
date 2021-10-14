import XCTest
@testable import CodeTest

class TTTappTests: XCTestCase {
    
    var data: [UserElement] = []

    func testDownloadPerfomance() throws {
        measure {
            let vc = MainViewController()
            vc.api.fetchData { fethedArray in
                XCTAssert(fethedArray.count != 0)
            }
        }
    }
    
    func testCorrectDataRecived() throws {
        let vc = MainViewController()
        vc.api.fetchData { fethedArray in
            XCTAssertEqual(fethedArray.count, 10)
        }
    }
    
    func testSaveLoadFuncional() {
        let service = UserDefaultsService()
        
        let dataToSave = Array(repeating: API.shared.errorUser, count: 200)
        service.saveUsersData(data: dataToSave)
        
        let loadedData = service.loadUsersData()
        
        XCTAssertEqual(dataToSave.count, loadedData?.count)
        UserDefaults.standard.removeObject(forKey: "savedData")
    }
    
}
