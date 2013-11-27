/**
 * ロールバックサンプル
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class RollbackSampleControllerTest {

    /**
     * コンストラクタ
     */
    static testMethod void RollbackSampleControllerTest() {
            
        Test.startTest();
        
        // コンストラクタ
        RollbackSampleController cls = new RollbackSampleController();
        
        Test.stopTest();
    }
    
    /**
     * 登録ボタン処理
     */
    static testMethod void doSaveTest() {
            
        Test.startTest();
        
        // コンストラクタ
        RollbackSampleController cls = new RollbackSampleController();
        // 登録ボタン処理
        cls.doSave();
        
        // 商談名
        cls.opportunityName = 'TEST';
        
        // 登録ボタン処理
        cls.doSave();
        
        Test.stopTest();
    }
}