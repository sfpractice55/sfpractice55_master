<aura:application extends="force:slds">
    <aura:attribute name="AccountId" type="string" description="Account Id"/>
	Application!!!!!!!!! {!v.AccountId}
    <c:FetchAccountDetails AccountId="{!v.AccountId}"/>
</aura:application>