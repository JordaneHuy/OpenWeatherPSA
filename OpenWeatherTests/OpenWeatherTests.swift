//
//  OpenWeatherTests.swift
//  OpenWeatherTests
//
//  Created by Jordane HUY on 28/02/2023.
//

import XCTest
@testable import OpenWeather

final class OpenWeatherTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestLocation() throws {
        let rqLocation = RequestLocation(searchLocation: "Paris")
        let data = "[{\"name\":\"Paris\",\"local_names\":{\"lv\":\"Parīze\",\"bg\":\"Париж\",\"ja\":\"パリ\",\"bo\":\"ཕ་རི།\",\"ha\":\"Pariis\",\"th\":\"ปารีส\",\"km\":\"ប៉ារីស\",\"am\":\"ፓሪስ\",\"my\":\"ပါရီမြို့\",\"yo\":\"Parisi\",\"gn\":\"Parĩ\",\"ps\":\"پاريس\",\"uz\":\"Parij\",\"vi\":\"Paris\",\"ta\":\"பாரிஸ்\",\"gv\":\"Paarys\",\"ug\":\"پارىژ\",\"be\":\"Парыж\",\"tg\":\"Париж\",\"ml\":\"പാരിസ്\",\"ca\":\"París\",\"sl\":\"Pariz\",\"yi\":\"פאריז\",\"eu\":\"Paris\",\"fa\":\"پاریس\",\"sq\":\"Parisi\",\"sk\":\"Paríž\",\"hr\":\"Pariz\",\"cs\":\"Paříž\",\"gl\":\"París\",\"mk\":\"Париз\",\"wa\":\"Paris\",\"bn\":\"প্যারিস\",\"hi\":\"पैरिस\",\"fi\":\"Pariisi\",\"or\":\"ପ୍ୟାରିସ\",\"br\":\"Pariz\",\"mi\":\"Parī\",\"ba\":\"Париж\",\"he\":\"פריז\",\"tt\":\"Париж\",\"an\":\"París\",\"pl\":\"Paryż\",\"ka\":\"პარიზი\",\"ar\":\"باريس\",\"oc\":\"París\",\"ht\":\"Pari\",\"ga\":\"Páras\",\"ko\":\"파리\",\"pa\":\"ਪੈਰਿਸ\",\"wo\":\"Pari\",\"hu\":\"Párizs\",\"ur\":\"پیرس\",\"gu\":\"પૅરિસ\",\"ne\":\"पेरिस\",\"te\":\"పారిస్\",\"la\":\"Lutetia\",\"no\":\"Paris\",\"lt\":\"Paryžius\",\"uk\":\"Париж\",\"tl\":\"Paris\",\"is\":\"París\",\"ru\":\"Париж\",\"ln\":\"Pari\",\"sv\":\"Paris\",\"hy\":\"Փարիզ\",\"za\":\"Bahliz\",\"sr\":\"Париз\",\"bs\":\"Pariz\",\"et\":\"Pariis\",\"ky\":\"Париж\",\"zu\":\"IParisi\",\"sh\":\"Pariz\",\"af\":\"Parys\",\"fy\":\"Parys\",\"es\":\"París\",\"it\":\"Parigi\",\"tk\":\"Pariž\",\"fr\":\"Paris\",\"ku\":\"Parîs\",\"li\":\"Paries\",\"co\":\"Parighji\",\"os\":\"Париж\",\"mr\":\"पॅरिस\",\"lb\":\"Paräis\",\"kn\":\"ಪ್ಯಾರಿಸ್\",\"de\":\"Paris\",\"eo\":\"Parizo\",\"mn\":\"Парис\",\"nl\":\"Parijs\",\"sc\":\"Parigi\",\"so\":\"Baariis\",\"el\":\"Παρίσι\",\"kk\":\"Париж\",\"kv\":\"Париж\",\"zh\":\"巴黎\",\"cu\":\"Парижь\",\"cv\":\"Парис\"},\"lat\":48.8588897,\"lon\":2.3200410217200766,\"country\":\"FR\",\"state\":\"Ile-de-France\"}]".data(using: .utf8)!
        
        do {
            let result = try rqLocation.decode(data)
            
            XCTAssertEqual(1, result.count)

            guard let location = result.first else {
                XCTFail("No location")
                return
            }
            
            XCTAssertEqual("Paris", location.name)
            XCTAssertEqual(48.8588897, location.lat)
            XCTAssertEqual(2.3200410217200766, location.lon)
        } catch {
            XCTFail("Cannot decode: \(error)")
        }
    }
    
    func testRequestLocationDetail() throws {
        let location: Location = Location(name: "Paris", lat: 48.8588897, lon: 2.3200410217200766)
        let rqLocationDetail = RequestLocationDetail(location: location)
        let data = "{\"coord\":{\"lon\":2.3226,\"lat\":48.8638},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":279.73,\"feels_like\":275.99,\"temp_min\":278.74,\"temp_max\":280.54,\"pressure\":1020,\"humidity\":53},\"visibility\":10000,\"wind\":{\"speed\":6.17,\"deg\":30},\"clouds\":{\"all\":0},\"dt\":1677689319,\"sys\":{\"type\":2,\"id\":2012208,\"country\":\"FR\",\"sunrise\":1677652428,\"sunset\":1677691969},\"timezone\":3600,\"id\":6545270,\"name\":\"Palais-Royal\",\"cod\":200}".data(using: .utf8)!
        
        do {
            let result = try rqLocationDetail.decode(data)
            let weathers = result.weather
            let main = result.main
            
            XCTAssertEqual(1, weathers.count)
            
            guard let weather = weathers.first else {
                XCTFail("No weather")
                return
            }
            
            XCTAssertEqual("Clear", weather.main)
            XCTAssertEqual("clear sky", weather.description)
            XCTAssertEqual("01d", weather.icon)
            
            XCTAssertEqual(279.73, main.temp)
            XCTAssertEqual(275.99, main.feelsLike)
            XCTAssertEqual(278.74, main.tempMin)
            XCTAssertEqual(280.54, main.tempMax)
            XCTAssertEqual(1020, main.pressure)
            XCTAssertEqual(53, main.humidity)
        } catch {
            XCTFail("Cannot decode: \(error)")
        }
    }
}
