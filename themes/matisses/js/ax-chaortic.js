// Variable global para chaordic
var chaordic_meta;

ax = {
    setChaordic: function (data) {
        var page = data.page;
        var loggeduser = data.loggeduser;

        $(window).load(function () {        
            switch (page) {
                case 'index':
                    page = 'home';
                    break;
                case 'category':
                    page = 'category';
                    break;
                case 'subcategory':
                    page = 'subcategory';
                    break;
                case 'order':
                    page = 'checkout';
                    break;
                case 'search':
                    page = 'search';
                    break;
                default:
                    page = 'other';
                    break;
            }

            if (loggeduser == 'true') {
                chaordic_meta = {
                    "page": {
                        "name": page,
                        "timestamp": new Date()
                    },
                    "user": {
                        "id": data.idcustomer,
                        "name": data.customername,
                        "username": data.username,
                        "email": data.customeremail,
                        "allow_mail_marketing": data.newsletter,
                        "document_id": data.customercharter
                    }
                }

                if (data.page == 'category' || page == 'subcategory') {
                    chaordic_meta.page.categories = [{
                        "name": data.category,
                        "id": data.idcategory
                    }];
                }

                if (page == 'search') {
                    chaordic_meta.search = {};
                    chaordic_meta.search.query = data.search_q;
                }
                console.log(page);
            } 
            else {
                chaordic_meta = {
                    "page": {
                        "name": page,
                        "timestamp": new Date()
                    }
                }

                if (page == 'category' || page == 'subcategory') {
                    chaordic_meta.page.categories = [{
                        "name": data.category,
                        "id": data.idcategory
                    }];
                }

                if (page == 'search') {
                    chaordic_meta.search = {};
                    chaordic_meta.search.query = data.search_q;
                    chaordic_meta.search.items = [];

                    if ($('.category_list .inner-product-list').length > 0) {
                        
                        $('.inner-product-list .product-container').each(function(i,v) {
                            var item = {};
                            var id = String($(this).attr('id'));
                            var p = $(this).find('.product-price').text().trim().replace("$ ","");
                            item.id = id;
                            item.price = Number(p.replace(/\./g , ""));
                            chaordic_meta.search.items.push(item);
                        });
                    }
                }
                console.log(page);
            }
        });
    }
}