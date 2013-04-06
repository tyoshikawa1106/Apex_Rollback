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
public with sharing class RollbackSampleController {
	
	public Account account {get; set;}
	public Opportunity opportunity {get; set;}
	public String opportunityName {get; set;}
	
	/*
	 * コンストラクタ
	 * @param	: なし
	 * @return	: なし
	 */
	public RollbackSampleController() {
		System.debug('◆◆◆◆RollbackSampleController:START');
		
		this.account = new Account(
							Name='Account Name'
						);
		this.opportunity = new Opportunity();
		this.opportunityName = '';
		
		System.debug('◆◆◆◆RollbackSampleController:END');
	}
	
	/*
	 * 登録ボタン処理
	 * @param	: なし
	 * @return	: なし
	 */
	public void doSave() {
		System.debug('◆◆◆◆doSave:START');
		
		Savepoint sp = Database.setSavepoint();
		
		Account upsertAccount = this.account.clone(true, true, true, true);
        upsert upsertAccount;
        
        this.opportunity = getOpportunity(upsertAccount,opportunityName);
        if (String.isEmpty(this.opportunity.Name) == true) {
        	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, 'Not Opportunity Name!!'));
        	Database.rollback(sp);
        	return;
        }
        
        upsert this.opportunity;
        
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Save!!'));
		
		System.debug('◆◆◆◆doSave:END');
	}
	
	/*
     * 商談データ取得
     * @param	: 取引先        [prmAccount]
     * @param	: 商談名        [prmOpportunityName]
     * @return	: 商談
     */
    private Opportunity getOpportunity(Account prmAccount, String prmOpportunityName) {
        return new Opportunity(
	         AccountId	= prmAccount.Id
	        ,Name		= prmOpportunityName
	        ,CloseDate	= date.newInstance(2011, 10, 5)
	        ,StageName	= '提案'
        );
    }
}