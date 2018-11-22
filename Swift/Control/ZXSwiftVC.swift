//
//  ZXSwiftVC.swift
//  Control
//
//  Created by 赵庄鑫 on 2018/4/8.
//  Copyright © 2018年 paohon. All rights reserved.
//

import UIKit
import Alamofire

enum Mov {
    case Left
    case Top
}
//声明为整型
enum Season: Int {
    case S = 0
    case D = 1
}
//声明为字符串型
enum House: String {
    case ZS = "I"
    case Li = "l"
}

enum Comp: String {
    case Nor, South
}
//声明为浮点
enum Constants: Double {
    case π = 3.14159
    case e = 2.71828
}
//
enum VNodeFlags : UInt32 {
    case Delete = 0x00000001
    case Write = 0x00000002
}
//----enum嵌套enum
enum Character {
    enum Weapon {
        case Bow
        case Sword
    }
    case Thief
    case Warrior
}
//----struct嵌套enum
struct Scharacter {
    enum CharacterType {
        case Thief
        case Warrior
    }
    let type: CharacterType
}

//值关联
enum Trade {
    //它的意义就在于，把关联值与子选项进行绑定，方便在需要的时候调用
    case Buy(stock: String, amount: Int)
    case Sell(st: String, am: Int)
}

enum Trade0 {
    case Buy(String, Int)
    case Sell(String, Int)
}

//枚举中的函数
enum Wear {
    enum Weight: Int {
        case Light = 2
    }
    case Hel(weight: Weight)
    
    func attribute() -> (Int) {
        switch self {
        case .Hel(let w):
            return (weight: w.rawValue * 2) as! (Int)
        }
    }
}

enum Wearable {
    enum Weight: Int {
        case Light = 2
    }
    enum Armor: Int {
        case Light = 2
    }
    //-----2个参数和上面 Wear 只有一个参数 有区别
    case Helmet(weight: Weight, armor: Armor)
    //-----2个参数和上面 Wear 只有一个参数 有区别
    func attributes() -> (weight: Int, armor: Int) {
        switch self {
        case .Helmet(let w, let a):
            return (weight: w.rawValue * 2, armor: a.rawValue * 4)
            
        }
    }
}

enum Device {
    case iPad, iPhone, AppleTV, AppleWatch
    func introduced() -> String {
        switch self {
        case .AppleTV: return "\(self) was introduced 2006"
        case .iPhone: return "\(self) was introduced 2007"
        case .iPad: return "\(self) was introduced 2010"
        case .AppleWatch: return "\(self) was introduced 2014"
        }
    }
    
    var year: Int {
        switch self {
        case .iPad:
            return 2010
        default:
            return 2000
        }
    }
}

//, UITableViewDelegate, UITableViewDataSource
class ZXSwiftVC: UIViewController{
    
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("你好呀%d", 2)
        NSLog("大家好", "hi")
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
        
        //MARK: - Notifications 通知
        NotificationCenter.default.post(name: Notification.Name.Task.DidComplete,
                                        object: self,
                                        userInfo: [Notification.Key.Task: "task"])
        
        //MARK: - AFError.swift—— Enum枚举
        let aMov = Mov.Left
        switch aMov {
        case .Left:
            print("L")
        default:
            print("O")
        }
        
        if case .Left = aMov {
            print("L")
        }
        if .Left == aMov {
            print("L")
        }
        
        let zs = House.ZS
        print(zs.rawValue)
        
        let n  = Comp.Nor
        print(n.rawValue)
        
        let sdr = Comp(rawValue: "South")
        print(sdr!)
        
        let sc = Scharacter(type: .Thief)
        print(sc.type)
        
        let trade = Trade.Buy(stock: "Car", amount: 100)
        if case let Trade.Buy(stock, amount) = trade {
            print("\(amount) of \(stock)")
        }
        
        let trade0  = Trade0.Buy("Car0", 10)
        if case let Trade0.Buy(stock, amount) = trade0 {
            print("buy \(amount) of \(stock)")
        }
        
        let _ = Wearable.Helmet(weight: .Light, armor: .Light).attributes()
        
        print(Device.iPad.introduced())
        print(Device.iPhone.year)
        
        let _ = AFError.parameterEncodingFailed(reason: .missingURL)
        
        
        
        //MARK: - Alamofire
        let headers: HTTPHeaders = ["Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==","Accept": "application/json"]
        
        
        //监控网络状态
        let manager = NetworkReachabilityManager(host:"www.baidu.com")
        manager?.listener = { status in
            printLog("change: \(status)")
        }
        manager?.startListening()
        
        //请求的适配和重试：RequestAdapter和RequestRetrier这两个协议
        let sessionManage = SessionManager()
        sessionManage.adapter = AccessTokenAdapter.init(accessToken: "123")
        sessionManage.request("https://")
        
        
        
        //---路由请求,URLConvertible和URLRequestConvertible这两个协议来实现路由设计模式
        let urlComponents = URLComponents(url:URL(string: "https://")!, resolvingAgainstBaseURL:true)!
        Alamofire.request(urlComponents, method: .post)
        
        let logSessionURL = LoggingSessionDelegate.init(username: "matt")
        Alamofire.request(logSessionURL)
        
        Alamofire.request(Router.readUser(username: "matt"))
        
        //
        let sessionMgr =  Alamofire.SessionManager(configuration: URLSessionConfiguration.ephemeral)
        
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        defaultHeaders["DNT"] = "1 (Do Not Track Enabled)"

        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = defaultHeaders
        
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        //重写SessionDelegate代理函数
        let delegate = sessionManager.delegate
        delegate.taskWillPerformHTTPRedirection = { session, task, response, request in
            var finalRequest = request

            if
                let originalRequest = task.originalRequest,
                let urlString = originalRequest.url?.absoluteString,
                urlString.contains("apple.com")
            {
                finalRequest = originalRequest
            }
            
            return finalRequest
        }

        
        //上传文件
        let imageData = UIImagePNGRepresentation(UIImage.init(named: "1")!)
        Alamofire.upload(imageData!, to: "https://httpbin.org/post")
            .responseJSON { (response) in
                debugPrint(response)
        }
        let fileURL = Bundle.main.url(forResource: "1", withExtension: "png")
        Alamofire.upload(fileURL!, to: "https://httpbin.org/post")
            .uploadProgress(closure: { (progress) in
                printLog(progress)
            })
            .downloadProgress(closure: { (progress) in
                printLog(progress)
            })
            .responseJSON { (response) in
                printLog(response)
                //观察跟请求相关的时间属性：
//                Latency: 0.428 seconds。--延迟时间
//                Request Duration: 0.428 seconds
//                Serialization Duration: 0.001 seconds
//                Total Duration: 0.429 seconds
                printLog(response.timeline)
                if #available(iOS 10.0, *) {
                    //跟请求响应相关的信息
                    printLog(response.metrics)
                }
        }
        
        //分表单
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(fileURL!, withName: "image")
        }, usingThreshold: 0, to: "https://httpbin.org/post", method: .post, headers: headers) { (encodeingResult) in
            switch encodeingResult {
            case .success(let upload, _, _):
                upload.responseJSON(completionHandler: { (response) in
                    printLog(response)
                })
            case .failure(let error):
                printLog(error)
            }
        }
        
        let req =  Alamofire.request("https://", headers: headers).responseJSON { (response) in
            printLog(response)
        }
//        $ curl -i \
//        -H "User-Agent: Alamofire/4.0.0" \
//        -H "Accept-Encoding: gzip;q=1.0, compress;q=0.5" \
//        -H "Accept-Language: en;q=1.0,fr;q=0.9,de;q=0.8,zh-Hans;q=0.7,zh-Hant;q=0.6,ja;q=0.5" \
//        "https://httpbin.org/get?foo=bar"
        debugPrint(req)

//        Alamofire.request("https://", encoding: JSONStringArrayEncoding(array: ["abc":"ddzx"]), headers: headers)
        
        //下载文件
        Alamofire.download("https://httpbin.org/image/png")
            .downloadProgress(queue: DispatchQueue.global(qos: .utility), closure: { (progress) in
                print("DownLoad :\(progress.fractionCompleted)")
            })
            .responseData { response in
                if let data = response.result.value {
                    let image = UIImage(data: data)
                }
        }
        
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory, in: .allDomainsMask)
        Alamofire.download("https://httpbin.org/image/png", to: destination)
        
        //URLCredential
        let user = "user"
        let pwd = "pwd"
        let credential = URLCredential.init(user: user, password: pwd, persistence: .forSession)
        Alamofire.request("https://httpbin.org/basic-auth/\(user)/\(pwd)")
            .authenticate(usingCredential: credential)
            .responseJSON{ response in
                debugPrint(response)
        }
        
        //手动生成headers
        var heads :HTTPHeaders = [:]
        if let authorHeader = Request.authorizationHeader(user: "user", password: "pwd") {
            heads[authorHeader.key] = authorHeader.value
        }
        Alamofire.request("https://httpbin.org/basic-auth/user/password", headers: headers)
            .responseJSON { response in
                debugPrint(response)
        }
        
        
        //验证
        Alamofire.request("https://httpbin.org/get")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    printLog("SuccessFul: \(data)")
                case .failure(let error):
                    printLog(error)
                }
        }
        
        //MARK: - GCD
        //信号，信号量，锁
//        DispatchSemaphore(value: )：用于创建信号量，可以指定初始化信号量计数值，这里我们默认1.
//        semaphore.wait()：会判断信号量，如果为1，则往下执行。如果是0，则等待。
//        semaphore.signal()：代表运行结束，信号量加1，有等待的任务这个时候才会继续执行。
        //应对场景：当并行执行的任务 更新数据 变量i时， 会产生数据不一致的情况
//        如下：
        let queue = DispatchQueue.global(qos: .default)
        for i in 1...10 {
            queue.async {
                printLog("\(i)") //---i可能输入的是 1，1，2，3，4 ，如果有两条线程并行执行这个代码时
            }
        }
        //---所以为了保证 printLog("\(i)") 这个代码 输出 “1” 只有一次
        let semaphore = DispatchSemaphore(value: 1)
        for i in 1...10 {
            queue.async {
                semaphore.wait()
                printLog("\(i)")
                semaphore.signal()
            }
        }
        
        
        //DispatchQueue.concurrentPerform函数是sync函数和Dispatch Group的关联API。按指定的次数将指定的Block追加到指定的Dispatch Queue中，并等待全部处理执行结束。
        DispatchQueue.global(qos: .default).async {
            DispatchQueue.concurrentPerform(iterations: 6, execute: { (index) in
                printLog("执行index次")
            })
            //执行完上面6次后主线程更新
            DispatchQueue.main.async {
                printLog("done")
            }
        }
        
        
        //多个任务结束后去做一个全部结束的处理
        let group = DispatchGroup()
        //并发任务，顺序执行
        queue.async(group: group) {
            sleep(2)
            print("1")
        }
        queue.async(group: group) {
            printLog("2")
        }
        //-----
        group.notify(queue: queue) {
            printLog("group done")
        }
        //---等待group所有任务执行完，再执行下面语句
        group.wait()
        printLog("group over")
        //---------------
        DispatchQueue.global(qos: .default).asyncAfter(deadline: DispatchTime.now() + 2.0) {
            print("开始加入队列")
        }
        
        
        let task  = DispatchWorkItem {
            print("开始加入队列操作")
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: task)
        //取消任务
        task.cancel()
        
       
    }
    

//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        get { return .lightContent}
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() -> Void {
        view.addSubview(tableView)
        tableView.frame = view.bounds
//        tableView.dataSource = self
//        tableView.delegate = self
    }

    //MARK: - <#UITableViewDataSource#>
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//
//    }
}

//自定义参数编码
struct JSONStringArrayEncoding: ParameterEncoding {
    private let array: [String]
    
    init(array: [String]) {
        self.array = array
    }
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlReq = urlRequest.urlRequest
        let data = try JSONSerialization.data(withJSONObject: array, options: [])
        
        if urlReq?.value(forHTTPHeaderField: "Content-Type") == nil {
            urlReq?.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        urlReq?.httpBody = data
        return urlReq!
    }
}

//除了 重新定义了重定向的函数。还有一种方法是继承代理后，重写父类的方法：
class LoggingSessionDelegate: SessionDelegate {
    var username: String
    
    init(username:String) {
        self.username = username
    }
    
    override func urlSession(
        _ session: URLSession,
        task: URLSessionTask,
        willPerformHTTPRedirection response: HTTPURLResponse,
        newRequest request: URLRequest,
        completionHandler: @escaping (URLRequest?) -> Void)
    {
        print("URLSession will perform HTTP redirection to request: \(request)")
        
        super.urlSession(
            session,
            task: task,
            willPerformHTTPRedirection: response,
            newRequest: request,
            completionHandler: completionHandler
        )
    }
}

extension LoggingSessionDelegate:URLConvertible {
    static let baseURL = "https://"
    func asURL() throws -> URL {
        let urlStr = LoggingSessionDelegate.baseURL + "/users/\(username)"
        return try urlStr.asURL()
    }
}

enum Router: URLRequestConvertible {
    case createUser(parameters: Parameters)
    case readUser(username: String)
    case updateUser(username: String, parameters: Parameters)
    case destroyUser(username: String)
    
    static let baseURLString = "https://example.com"
    
    var method: HTTPMethod {
        switch self {
        case .createUser:
            return .post
        case .readUser:
            return .get
        case .updateUser:
            return .put
        case .destroyUser:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        case .createUser:
            return "/users"
        case .readUser(let username):
            return "/users/\(username)"
        case .updateUser(let username, _):
            return "/users/\(username)"
        case .destroyUser(let username):
            return "/users/\(username)"
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .createUser(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        case .updateUser(_, let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        
        return urlRequest
    }
}

class AccessTokenAdapter: RequestAdapter {
    private let accessToken: String
    init(accessToken: String) {
        self.accessToken = accessToken
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlReq = urlRequest
        
        if let urlStr = urlRequest.url?.absoluteString, urlStr.hasPrefix("https://") {
            urlReq.setValue("Bearer" + accessToken, forHTTPHeaderField: "Authorization")
        }
        
        return urlReq
    }
}

//MARK: - RequestAdapter, RequestRetrier
//客户端发送的每一个请求都要包含一个token，这个token很可能会过期，过期的token不能使用，因此通过adapt方法把token添加到请求的header中
//当使用现有的token请求失败后，如果是token过期导致的请求失败，那么就通过should方法重新申请一个新的token
class OAuth2Handler: RequestAdapter, RequestRetrier {
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: String?, _ refreshToken: String?) -> Void
    
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        return SessionManager(configuration: configuration)
    }()
    
    private let lock = NSLock()
    
    private var clientID: String
    private var baseURLString: String
    private var accessToken: String
    private var refreshToken: String
    
    private var isRefreshing = false
    private var requestsToRetry: [RequestRetryCompletion] = []
    
    // MARK: - Initialization
    
    public init(clientID: String, baseURLString: String, accessToken: String, refreshToken: String) {
        self.clientID = clientID
        self.baseURLString = baseURLString
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
    
    // MARK: - RequestAdapter
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix(baseURLString) {
            var urlRequest = urlRequest
            urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
            return urlRequest
        }
        
        return urlRequest
    }
    
    // MARK: - RequestRetrier
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        lock.lock() ; defer { lock.unlock() }
        
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            requestsToRetry.append(completion)
            
            if !isRefreshing {
                refreshTokens { [weak self] succeeded, accessToken, refreshToken in
                    guard let strongSelf = self else { return }
                    
                    strongSelf.lock.lock() ;
//                    defer block 里的代码会在函数 return 之前执行，无论函数是从哪个分支 return 的，还是有 throw，还是自然而然走到最后一行。
                    defer { strongSelf.lock.unlock() }
                    
                    if let accessToken = accessToken, let refreshToken = refreshToken {
                        strongSelf.accessToken = accessToken
                        strongSelf.refreshToken = refreshToken
                    }
                    
                    strongSelf.requestsToRetry.forEach { $0(succeeded, 0.0) }
                    strongSelf.requestsToRetry.removeAll()
                }
            }
        } else {
            completion(false, 0.0)
        }
    }
    
    // MARK: - Private - Refresh Tokens
    
    private func refreshTokens(completion: @escaping RefreshCompletion) {
        guard !isRefreshing else { return }
        
        isRefreshing = true
        
        let urlString = "\(baseURLString)/oauth2/token"
        
        let parameters: [String: Any] = [
            "access_token": accessToken,
            "refresh_token": refreshToken,
            "client_id": clientID,
            "grant_type": "refresh_token"
        ]
        
        sessionManager.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { [weak self] response in
                guard let strongSelf = self else { return }
                
                if
                    let json = response.result.value as? [String: Any],
                    let accessToken = json["access_token"] as? String,
                    let refreshToken = json["refresh_token"] as? String
                {
                    completion(true, accessToken, refreshToken)
                } else {
                    completion(false, nil, nil)
                }
                
                strongSelf.isRefreshing = false
        }
    }
}
