public struct SettingPackage_Lib {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    public func createSettingVc()-> SettingVC {
        return SettingVC.instantiateFromStoryboard()
    }
    public func setShareConstantData(data:MG002Model.TranResData){
        ShareConstant.shared.mg002Data = data
    }
}
