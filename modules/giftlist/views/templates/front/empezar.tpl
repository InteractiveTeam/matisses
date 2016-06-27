{capture name=path}
<a href="#">{l s='giftlist' mod='giftlist'}</a> <span class="bread">{l s='giftlist' mod='giftlist'}</span>
{/capture}
{if version_compare($smarty.const._PS_VERSION_,'1.6.0.0','<')}{include file="$tpl_dir./breadcrumb.tpl"}{/if}