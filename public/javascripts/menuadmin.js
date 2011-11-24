function check_text_onfocus(obj)
{
    if(obj.value == obj.defaultValue)
        obj.value = '';
}
function check_text_onblur(obj)
{
    if(obj.value=='')
        obj.value = obj.defaultValue;
}

jQuery(function() {
    // Evento de clique do elemento: ul#menu li.parent > a
    jQuery('ul#menu li.parent > a').click(function() {
        // Expande ou retrai o elemento ul.sub-menu dentro do elemento pai (ul#menu li.parent)
        jQuery('ul.sub-menu', jQuery(this).parent()).slideToggle('fast', function() {
            // Depois de expandir ou retrair, troca a classe 'aberto' do <a> clicado
            jQuery(this).parent().toggleClass('aberto');
        });
        return false;
    });
});
