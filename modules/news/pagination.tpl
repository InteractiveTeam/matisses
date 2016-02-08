{if $comments}
<ul class="col-md-12">
	{foreach from=$comments item=comment}
    <li>
    	<h3>{$comment.date} - {$comment.id_customer}</h3>
     	<p>{$comment.comment}</p>
    </li>
    {/foreach}
</ul>


{if $paginador}
<div class="newsAjaxContent">
  <div class="newsPager">
    <ul class="newsPagination">
      {if ($cpage > 0)}
      	<li id="newsPagination_next"> <a href="#" id="{$cpage -1}"> <i class="fa fa-angle-double-left"></i> </a> </li>
      {/if}
      {foreach from=$paginador item=page}
      {if $page.current}
      	<li class="current"> <span>{$page.page}</span> </li>
      {else}
      	<li> <a href="#" id="{$page.value}"> {$page.page}</a> </li>
      {/if}
      {/foreach}
      {if ($cpage != (($paginador|count)-1))}
      	<li id="newsPagination_next"><a href="#" id="{$cpage +1}"> <i class="fa fa-angle-double-right"></i> </a> </li>
      {/if}
    </ul>
  </div>
</div>
{/if}
{/if}
 