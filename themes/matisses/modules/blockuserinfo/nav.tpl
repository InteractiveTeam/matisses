<!-- Block user information module nav  -->
<div class="header_user_info">
	<div id="drop_content_user">

		{if $is_logged}
            <a href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" title="{l s='View my customer account' mod='blockuserinfo'}" class="account" rel="nofollow">
                <span>{l s='My account' mod='blockuserinfo'}</span>
            </a>
            
            <a href="{$link->getPageLink('index', true, NULL, "mylogout")|escape:'html'}" title="{l s='Log me out' mod='blockuserinfo'}" class="logout" rel="nofollow">
                {l s='Sign out' mod='blockuserinfo'}
           </a>
            
		{else}
			<a class="login" href="{$link->getPageLink('my-account', true)|escape:'html':'UTF-8'}" rel="nofollow" title="{l s='Log in to your customer account' mod='blockuserinfo'}">
				<span>{l s='Login' mod='blockuserinfo'}</span>
			</a>
		{/if}
        <div class="user-profile">
        
        </div>
	</div>
</div>
<!-- /Block user information module nav -->
