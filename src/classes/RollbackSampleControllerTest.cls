/*
 * ロールバックサンプル
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdDate      : 2013/01/01
 * @createdName      : TAIKI,YOSHIKAWA
 * ----------------------------------------
 * @lastModifiedDate : 2013/01/01
 * @lastModifiedName : TAIKI,YOSHIKAWA
 * ----------------------------------------
 */
@isTest
private class RollbackSampleControllerTest {

    /*
	 * コンストラクタ・テスト
	 */
    static testMethod void RollbackSampleControllerTest() {
        System.debug('◆◆◆◆RollbackSampleControllerTest:START');
        
        // ユーザ取得
        User user = getUser();
        
        // テスト実施
        System.RunAs(user) {
            
            // カレントページにパラメータを設定
            PageReference pageRef = getPageReference();
            Test.setCurrentPage(pageRef);
            
            // テスト開始
            Test.startTest();
            
            // コンストラクタ
            RollbackSampleController cls = new RollbackSampleController();
            
            // テスト終了
            Test.stopTest();
        }
        
        System.debug('◆◆◆◆RollbackSampleControllerTest:END');
    }
    
    /*
	 * 登録ボタン処理・テスト
	 */
    static testMethod void doSaveTest() {
        System.debug('◆◆◆◆doSaveTest:START');
        
        // ユーザ取得
        User user = getUser();
        
        // テスト実施
        System.RunAs(user) {
            
            // カレントページにパラメータを設定
            PageReference pageRef = getPageReference();
            Test.setCurrentPage(pageRef);
            
            // テスト開始
            Test.startTest();
            
            // コンストラクタ
            RollbackSampleController cls = new RollbackSampleController();
            // 登録ボタン処理
            cls.doSave();
            
            // 商談名
            cls.opportunityName = 'TEST';
            
            // 登録ボタン処理
            cls.doSave();
            
            // テスト終了
            Test.stopTest();
        }
        
        System.debug('◆◆◆◆doSaveTest:END');
    }
    
    /*
     * ログインユーザの情報取得
     * @param	: なし
     * @return	: ユーザ
     */
    private static User getUser() {
    	return [
    		select
    			Id
    		from
    			User
    		where
    			Id =: UserInfo.getUserId()
    		limit 1
    	];
    }
    
    /*
     * テスト用ページの取得
     * @param	: なし
     * @return	: テスト用ページ
     */
    private static PageReference getPageReference() {
    	return new PageReference('TestPage');
    }
}