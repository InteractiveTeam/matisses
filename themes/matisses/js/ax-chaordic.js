
// Global variable Chaordic
var chaordic_meta;

ax = {
    setChaordic: function (data) {
        var page = data.page;
        var loggeduser = data.loggeduser;
        
        $(window).load(function () {   
            
            jQuery('#newsletter').on('submit', function(){ window.chaordic.push(['updateUserEmail', { email: String(jQuery(this).find('[name=email]').val()) }]); });
            
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
                case 'order-confirmation':
                    page = 'confirmation';
                    break;
                default:
                    page = 'other';
                    break;
            }
            
            // Set subcategory page
            if (page == 'category' && data.leveldepth > 3) {
                page = 'subcategory';
            }
            
            // If user is logged set user data
            if (loggeduser == 'true') 
            {
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
                    chaordic_meta.page.categories = [];
                    
                    for (i = data.parents.length-1; i >= 0; i--) { 
                        chaordic_meta.page.categories.push(data.parents[i]);
                    }
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
                    chaordic_meta.product.price = data.priceproduct;
                    chaordic_meta.product.status = data.statusproduct;
                    chaordic_meta.product.specs = {"color": data.productcolors};
                    chaordic_meta.product.specs.skus = data.productskuattr;
                    
                    if (data.tagsproduct.length > 0) {
                        chaordic_meta.product.tags = data.tagsproduct;
                    }
                    
                    if (data.productcondition == 'new') {
                        chaordic_meta.product.details = {"sello_nuevo": true, "sello_otro": false};
                    } else {
                        chaordic_meta.product.details = {"sello_nuevo": false, "sello_otro": true};
                    }
                }
                
                if (page == 'cart') {
                    if (data.idcart) {
                        ax.setCart();
                        
                        if ($('#cart_summary').length > 0) {
                            $('#cart_summary tbody tr').each(function(i,v) {
                                var txtQuant = $(this).find('.quantity_item .cart_quantity_input')
                                txtQuant.change(function(){
                                    ax.setCart();
                                });
                                var dropItem = $(this).find('.cart_delete');
                                dropItem.click(function() {
                                    ax.setCart();
                                });
                            });
                        } else {
                            chaordic_meta.page.name = 'checkout';
                            delete chaordic_meta.cart;
                        }
                    } else {
                        chaordic_meta.page.name = 'checkout';
                        delete chaordic_meta.cart;
                    }
                }
                
                if (page == 'confirmation') {
                    chaordic_meta.transaction = {};
                    var idorder = ax.getUrlVars()['id_order'];
                    var key = ax.getUrlVars()['key'];
                    
                    if (idorder) {
                        chaordic_meta.transaction.id = idorder;
                        chaordic_meta.transaction.items = data.orderproducts;
                    }
                    
                    chaordic_meta.transaction.signature = data.signature;
                }
            } 
            else 
            {
                chaordic_meta = {
                    "page": {
                        "name": page,
                        "timestamp": new Date()
                    }
                }

                // Set categories to this pages
                if (page == 'category' || page == 'subcategory' || page == 'product') {
                    chaordic_meta.page.categories = [];
                    
                    for (i = data.parents.length-1; i >= 0; i--) { 
                        chaordic_meta.page.categories.push(data.parents[i]);
                    }
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
                            var p = $(this).find('.product-price').text().replace("$ ","").trim();
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
                    chaordic_meta.product.price = data.priceproduct;
                    chaordic_meta.product.status = data.statusproduct;
                    chaordic_meta.product.specs = {"color": data.productcolors};
                    chaordic_meta.product.specs.skus = data.productskuattr;
                    
                    if (data.tagsproduct.length > 0) {
                        chaordic_meta.product.tags = data.tagsproduct;
                    }
                    
                    if (data.productcondition == 'new') {
                        chaordic_meta.product.details = {"sello_nuevo": true, "sello_otro": false};
                    } else {
                        chaordic_meta.product.details = {"sello_nuevo": false, "sello_otro": true};
                    }
                }
                
                if (page == 'cart') {
                    if (data.idcart) {
                        ax.setCart();
                        
                        if ($('#cart_summary').length > 0) {
                            $('#cart_summary tbody tr').each(function(i,v) {
                                var txtQuant = $(this).find('.quantity_item input[type="hidden"]');
                                txtQuant.change(function(){
                                    ax.setCart();
                                });
                                var dropItem = $(this).find('.cart_delete');
                                dropItem.click(function() {
                                    ax.setCart();
                                });
                            });
                        } else {
                            chaordic_meta.page.name = 'checkout';
                            delete chaordic_meta.cart;
                        }
                    } else {
                        chaordic_meta.page.name = 'checkout';
                        delete chaordic_meta.cart;
                    }
                }
                
                if (page == 'confirmation') {
                    chaordic_meta.transaction = {};
                    var idorder = ax.getUrlVars()['id_order'];
                    var key = ax.getUrlVars()['key'];
                    
                    if (idorder) {
                        chaordic_meta.transaction.id = idorder;
                        chaordic_meta.transaction.items = data.orderproducts;
                    }
                    
                    chaordic_meta.transaction.signature = data.signature;
                }
            }
            
            if (data.emailsubscribe) {
                chaordic.push(['updateUserEmail', { email: data.emailsubscribe }]);    
            }
        });
    }, setCart: function() {
        chaordic_meta.cart = {};
        chaordic_meta.cart.id = data.idcart;
        var urlpar = "";
        urlpar = ax.getUrlVars()["multi-shipping"];

        if (data.prodincart.length > 0 && urlpar == undefined) {                            
            chaordic_meta.cart.items = data.prodincart;
        } else {
            chaordic_meta.page.name = 'checkout';
            delete chaordic_meta.cart;
        }
    }, 
    getUrlVars: function() {
        var vars = {};
        var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
        });
        return vars;
    },
    addToCart: function (sks) {
        
        if (sks) {
            if (sks.length > 0) {
                var skus = sks;

                $.ajax({
                    url: '../../../modules/matisses/addtocart.php',
                    type: 'post',
                    data: {skus : skus},
                    dataType: "json",
                    success: function(data) { 

                        if (data.length > 0) {
                            var cont = data.length;

                            for (i = 0; i < data.length; i++) {
                                ajaxCart.add(data[i],0,1,1,0);
                            }
                        }
                    },
                    error: function (data){
                        console.log(data);
                    }
                });
            }
        } else {
            return false;
        }
    },
    addToWishList: function (sks) {
        
        if (sks) {
            if (sks.length > 0) {
                var skus = sks;

                $.ajax({
                    url: '../../../modules/matisses/addtocart.php',
                    type: 'post',
                    data: {skus : skus},
                    dataType: "json",
                    success: function(data) { 

                        if (data.length > 0) {
                            var cont = data.length;

                            for (i = 0; i < data.length; i++) {
                               WishlistCart('wishlist_block_list', 'add', data[i], 0, 1);
                            }
                        }
                    },
                    error: function (data){
                        console.log(data);
                    }
                });
            }
        } else {
            return false;
        }
    }
}