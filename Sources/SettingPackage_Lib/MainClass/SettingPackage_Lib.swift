public struct SettingPackage_Lib {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    public func createSettingVc(data:[SetMnuList])-> SettingVC {
        let settingVC = SettingVC.instantiateFromStoryboard()
        settingVC.dataSoure = data
        return settingVC
    }
    
}
