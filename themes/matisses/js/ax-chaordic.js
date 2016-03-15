// Global variable Chaordic
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
                case 'order':
                    page = 'cart';
                    break;
                case 'search':
                    page = 'search';
                    break;
                case 'product':
                    page = 'product';
                    break;
                default:
                    page = 'other';
                    break;
            }
            
            // Set subcategory page
            if (page == 'category' && data.leveldepth == 5) {
                page = 'subcategory';
            }
            
            // If user is logged set user data
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
                
                // Set categories to this pages
                if (page == 'category' || page == 'subcategory' || page == 'product') {
                    chaordic_meta.page.categories = [{
                        "name": data.category,
                        "id": data.idcategory
                    }];
                }

                // Set query and items of a search
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
                
                // Set product data in a product page
                if (page == 'product') {
                    chaordic_meta.product = {};
                    chaordic_meta.product.id = data.idproduct;
                    chaordic_meta.product.name = data.nameproduct;
                    chaordic_meta.product.url = data.linkproduct;
                    chaordic_meta.product.description = data.descproduct;
                    chaordic_meta.product.images_ssl = {"default": data.imageproduct};
                    chaordic_meta.product.price = data.priceproduct;
                    chaordic_meta.product.status = data.statusproduct;
                }
                
                //console.log(page);
                
            } 
            else {
                chaordic_meta = {
                    "page": {
                        "name": page,
                        "timestamp": new Date()
                    }
                }

                // Set categories to this pages
                if (page == 'category' || page == 'subcategory' || page == 'product') {
                    chaordic_meta.page.categories = [{
                        "name": data.category,
                        "id": data.idcategory
                    }];
                }

                // Set query and items of a search
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
                
                // Set product data in a product page
                if (page == 'product') {
                    chaordic_meta.product = {};
                    chaordic_meta.product.id = data.idproduct;
                    chaordic_meta.product.name = data.nameproduct;
                    chaordic_meta.product.url = data.linkproduct;
                    chaordic_meta.product.description = data.descproduct;
                    chaordic_meta.product.images = {"default": data.imageproduct};
                    chaordic_meta.product.categories = data.categoriesp;
                    chaordic_meta.product.tags = data.tagsproduct;
                    chaordic_meta.product.price = data.priceproduct;
                    chaordic_meta.product.status = data.statusproduct;
                }
                //console.log(page);
                
            }
        });
    }
}