function show_tab(obj)
{
	
	//MOSTRA AS LOJAS
	if(jQuery("#Login").hasClass('hide_tab'))
	{
		//MOSTRA
		jQuery("#Login").animate({top:"-15px"},"slow");
		jQuery("#Login").removeClass('hide_tab')
	}
	else
	{
		//ESCONDE
		jQuery("#Login").animate({top:"-114px"},"slow");
		jQuery("#Login").addClass('hide_tab')
	}
	/*MUDA O FUNDO DO BACKGROUND
	if(jQuery(obj).hasClass("tit_case_mais"))
	{	
		//CLICADO
		//alert("fechar");
		jQuery(obj).removeClass('tit_case_mais');
		jQuery(obj).addClass('tit_case_menos')
	}
	else
	{
		//alert("abrir");
		jQuery(obj).removeClass('tit_case_menos');
		jQuery(obj).addClass('tit_case_mais')		
	}
	
	//alert(jQuery(obj).attr("class")); 
	*/
}
