aajjajaja que bien


{assign var=params value=['id_experiencia' => 14,
    'name' => 'experiencia-tres'
]}
    <a class="link-img" href="{$link->getModuleLink('matisses','experiencia',$params,true)}">
        <img src="{$link->getImageLink($exp.id_experience|cat:'-slider','img/experiences')}" class="img-responsive">
        <h5>{$exp.name}</h5>
    </a>