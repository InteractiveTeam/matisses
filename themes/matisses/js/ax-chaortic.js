var chaordic_meta;

    ax = {
        setChaordic: function (data) {
            var page = data.page;
            var loggeduser = data.loggeduser;

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
                    }
                }
                if (data.page == 'category') {
                    chaordic_meta.page.categories = [{"name": data.category,"id": data.idcategory}];
                }
                console.log(data.page+' '+data.category+' '+data.idcategory);
            } else {
                chaordic_meta = {
                    "page": {
                        "name": page,
                        "timestamp": new Date()
                    }
                }
                if (page == 'category' || page == 'subcategory') {
                    chaordic_meta.page.categories = [{"name": data.category,"id": data.idcategory}];
                }
                console.log(data.page+' '+data.category+' '+data.idcategory);
            }
        }
    }