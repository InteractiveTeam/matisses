Module is installed in a regular way – simply upload your archive and click install.

CHANGELOG:
===========================
v 1.1.0 (March 7, 2015)
===========================
Added
-----
- Possibility to import/export carousels 
- Possibility to edit hook exceptions on module settings page
- Added counter to hooks selector in BO

Changed
-----
- Demo content is installed from editable file /democontent/carouselts.txt
- Added 'display' prefix to custom hooks (displayEasyCarousel1, displayEasyCarousel2, displayEasyCarousel3)
- Front-office Hooks are registered only after you add carousels to them
- Minor code fixes

Files modified
-----
- /easycarousels.php
- /views/templates/configure.tpl
- /views/js/back.js
- /views/css/back.css
- /translations/ru.php

Files added
-----
- /Readme.md
- /upgrade/install-1.1.0.php
- /upgrade/install-1.0.1.php
- /views/templates/admin/exceptions-settings-form.tpl
- /views/img/grab.cur
- /views/img/grabbing.cur

Files removed
-----
- /readme_en.txt
- /upgrade/upgrade-1.0.1.php

===========================
v 1.0.1 (February 14, 2015)
===========================
Fixed
-----
- Possibility to override carousel.tpl in theme directory
- Minor code fixes

Updated
-----
- Moved 'css', 'js', 'img' to 'views' basing on validator requirements

Added
-----
- Autoupgrage functionality

Directories moved to /views/: 
-----
- /js
- /css
- /img

Files modified:
-----
- /easycarousels.php
- /views/templates/hook/carousel.tpl
- /views/templates/admin/configure.tpl
- /views/templates/js/back.js 

Files added:
-----
- /upgrade/index.php
- /upgrade/upgrade-1.0.1.php

Files removed:
-----
- /views/templates/hook/product-details.tpl
- /views/templates/hook/manufacturer-details.tpl
- /views/templates/hook/supplier-details.tpl

===========================
v 1.0.0 (February 06, 2015)
===========================
Initial relesase
