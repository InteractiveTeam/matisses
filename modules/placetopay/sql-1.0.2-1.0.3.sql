-- agrega el campo de direccion ip
alter table ps_payment_placetopay add ipaddress varchar(15);
-- elimina el hook de invoice
delete from ps_hook_module where id_module = (SELECT id_module from ps_module where name='placetopay') AND id_hook = (SELECT id_hook FROM ps_hook WHERE name='invoice');
-- crea el hook de orderDetailDisplayed
insert into ps_hook_module select id_module, id_hook, 1 from ps_module, ps_hook where ps_module.name='placetopay' and ps_hook.name='orderDetailDisplayed';
-- crea el hook de adminOrder
insert into ps_hook_module select id_module, id_hook, 1 from ps_module, ps_hook where ps_module.name='placetopay' and ps_hook.name='adminOrder';
-- verifica que los hooks requeridos existan
-- debe mostar: payment, paymentReturn, adminOrder, orderDetailDisplayed
select h.name, hm.position
from ps_hook_module hm
inner join ps_hook h on h.id_hook = hm.id_hook
inner join ps_module m on m.id_module = hm.id_module
where m.name='placetopay';
