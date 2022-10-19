// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Abuyin_EXIT(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 999;
	condition	= DIA_Abuyin_EXIT_Condition;
	information	= DIA_Abuyin_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Abuyin_EXIT_Condition()
{
	
	return TRUE;
};
FUNC VOID DIA_Abuyin_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Abuyin_PICKPOCKET (C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 900;
	condition	= DIA_Abuyin_PICKPOCKET_Condition;
	information	= DIA_Abuyin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Abuyin_PICKPOCKET_Condition()
{
	C_Beklauen (75, 200);
};
 
FUNC VOID DIA_Abuyin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Abuyin_PICKPOCKET);
	Info_AddChoice		(DIA_Abuyin_PICKPOCKET, DIALOG_BACK 		,DIA_Abuyin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Abuyin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Abuyin_PICKPOCKET_DoIt);
};

func void DIA_Abuyin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Abuyin_PICKPOCKET);
};
	
func void DIA_Abuyin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Abuyin_PICKPOCKET);
};
// ************************************************************
// 			  		Hallo
// ************************************************************
INSTANCE DIA_Abuyin_Hallo(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Hallo_Condition;
	information	= DIA_Abuyin_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       
FUNC INT DIA_Abuyin_Hallo_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_00");//(pensando)… Qué raro. Es como si ya te conociera, viajero
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_01");//Bueno… los misterios del tiempo y del espacio son inescrutables… Oh, perdona, qué paciencia, ni siquiera te he saludado.
	AI_Output (self, other,"DIA_Addon_Abuyin_Hallo_13_02");//Bienvenido, amigo, toma asiento en mis humildes alfombras y disfruta de un pipa en paz.
};
// ************************************************************
// 			  		Wer bist du?
// ************************************************************
INSTANCE DIA_Abuyin_du(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_du_Condition;
	information	= DIA_Abuyin_du_Info;
	permanent	= FALSE;
	description	= "¿Quién eres tú?";
};                       
FUNC INT DIA_Abuyin_du_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Abuyin_du_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_du_15_00");//¿Quién eres tú?
	AI_Output (self, other,"DIA_Abuyin_du_13_01");//Me llamo Abuyin ibn Djadir ibn Omar Kalid ben Hadji al Sharidi. Soy vidente y profeta, astrólogo y proveedor de tabaco.
};
// ************************************************************
// 			  		Kraut
// ************************************************************
INSTANCE DIA_Abuyin_Kraut(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Kraut_Condition;
	information	= DIA_Abuyin_Kraut_Info;
	permanent	= FALSE;
	description	= "¿Qué clase de tabaco ofreces?";
};                       
FUNC INT DIA_Abuyin_Kraut_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_du)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Kraut_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Kraut_15_00");//¿Qué clase de tabaco ofreces?
	AI_Output (self, other,"DIA_Abuyin_Kraut_13_01");//Mis pipas están llenas de tabaco de manzana, refrescante y especiado.
	AI_Output (self, other,"DIA_Abuyin_Kraut_13_02");//Sírvete cuando quieras, Hijo de la Aventura.
};
// ************************************************************
// 			  	anderen Tabak?
// ************************************************************
INSTANCE DIA_Abuyin_anderen(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_anderen_Condition;
	information	= DIA_Abuyin_anderen_Info;
	permanent	= FALSE;
	description	= "¿Tienes también otros tabacos?";
};                       
FUNC INT DIA_Abuyin_anderen_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_Kraut)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_anderen_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_anderen_15_00");//¿Tienes también otros tabacos?
	AI_Output (self, other,"DIA_Abuyin_anderen_13_01");//Solo ofrezco el mejor. Esta mezcla de manzana es una sinfonía de mi tierra natal, las Islas del Sur.
	AI_Output (self, other,"DIA_Abuyin_anderen_13_02");//Pero, naturalmente, siempre estoy abierto a probar otros tipos de tabaco, si alguien consigue cultivar uno suficientemente bueno.
	AI_Output (other, self,"DIA_Abuyin_anderen_15_03");//¿Cómo se hace eso?
	AI_Output (self, other,"DIA_Abuyin_anderen_13_04");//Comienza con mi tabaco de manzana como base. Y luego prueba a combinarlo con otro ingrediente.
	AI_Output (self, other,"DIA_Abuyin_anderen_13_05");//Esto se hace en un banco de alquimista, siempre que conozcas los fundamentos de la alquimia.
};
// ************************************************************
// 			  	Woher 
// ************************************************************
INSTANCE DIA_Abuyin_Woher(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Woher_Condition;
	information	= DIA_Abuyin_Woher_Info;
	permanent	= FALSE;
	description	= "¿Dónde puedo conseguir tabaco de manzana?";
};                       
FUNC INT DIA_Abuyin_Woher_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_anderen)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Woher_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Woher_15_00");//¿Dónde puedo conseguir tabaco de manzana?
	AI_Output (self, other,"DIA_Abuyin_Woher_13_01");//Te daré dos porciones. De tú sabiduría depende hacer con ellas lo que quieras.
	AI_Output (self, other,"DIA_Abuyin_Woher_13_02");//Si deseas más, dirige tus pasos hacia Zuris, el maestro de pociones. Cultiva su propio tabaco y también lo vende.
	
	B_GiveInvItems (self, other, ItMi_ApfelTabak,2);
};
// ************************************************************
FUNC VOID B_TabakProbieren()
{
	AI_Output (self, other,"DIA_Abuyin_Mischung_Nichts_13_00");//Déjame probar tu tabaco.
	CreateInvItems (self, ItMi_Joint,1);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_Abuyin_Mischung_Nichts_13_01");//No, me temo que esta mezcla no va bien conmigo. Pero quizá encuentres a alguien que aprecie su... esto... delicadeza.
};
// ************************************************************
// 			  	Mischung 
// ************************************************************
INSTANCE DIA_Abuyin_Mischung(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 10;
	condition	= DIA_Abuyin_Mischung_Condition;
	information	= DIA_Abuyin_Mischung_Info;
	permanent	= TRUE;
	description	= "Tengo una nueva mezcla de tabaco...";
};                       
FUNC INT DIA_Abuyin_Mischung_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Abuyin_anderen)
	&& (Abuyin_Honigtabak == FALSE)
	&& ((Npc_HasItems (other, ItMi_SumpfTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_PilzTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_DoppelTabak) >= 1)
	|| (Npc_HasItems (other, ItMi_Honigtabak) >= 1))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Mischung_Info()
{	
	
	AI_Output (other, self,"DIA_Abuyin_Mischung_15_00");//Tengo una nueva mezcla de tabaco...
	
	Info_ClearChoices (DIA_Abuyin_Mischung);
	Info_AddChoice (DIA_Abuyin_Mischung,DIALOG_BACK,DIA_Abuyin_Mischung_BACK);
	
	if (Npc_HasItems (other, ItMi_SumpfTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_KRAUT,DIA_Abuyin_Mischung_Sumpf);
	};
	if (Npc_HasItems (other, ItMi_PilzTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_PILZ,DIA_Abuyin_Mischung_Pilz);
	};
	if (Npc_HasItems (other, ItMi_DoppelTabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_DOPPEL,DIA_Abuyin_Mischung_Doppel);
	};
	if (Npc_HasItems (other, ItMi_Honigtabak) >= 1)
	{
		Info_AddChoice (DIA_Abuyin_Mischung,PRINT_HONIG,DIA_Abuyin_Mischung_Super);
	};
};	
FUNC VOID DIA_Abuyin_Mischung_BACK()
{
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Sumpf ()
{
	B_GiveInvItems (other, self, ItMi_SumpfTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Pilz ()
{
	B_GiveInvItems (other, self, ItMi_PilzTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Doppel ()
{
	B_GiveInvItems (other, self, ItMi_DoppelTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices (DIA_Abuyin_Mischung);
};
FUNC VOID DIA_Abuyin_Mischung_Super ()
{
	
	B_GiveInvItems (other, self, ItMi_Honigtabak, 1);
		
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_00");//Déjame probar tu tabaco.
	CreateInvItems (self, ItMi_Joint,1);
	B_UseItem (self, ItMi_Joint);
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_01");//¡Éste sabe genial! ¡No había fumado nada mejor en mi vida!
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_02");//¿Cómo preparaste esta mezcla?
	AI_Output (other, self,"DIA_Abuyin_Mischung_Super_15_03");//Mezclé el tabaco con miel.
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_04");//Lo has hecho muy bien, Padre del Arte de la Mezcla. Me encantaría llenar mis miserables pipas con esto.
	AI_Output (other, self,"DIA_Abuyin_Mischung_Super_15_05");//Pues entonces llénalas.
	AI_Output (self, other,"DIA_Abuyin_Mischung_Super_13_06");//Gracias, Hijo de la Generosidad. Ninguna otra mezcla podría ser tan buena como ésta. Te compraré todo lo que me traigas de esto.
	
	Abuyin_Honigtabak = TRUE;
	B_GivePlayerXP ((XP_Ambient)*2);
	
	Info_ClearChoices (DIA_Abuyin_Mischung);
};	
// ************************************************************
// 			  Honigtabak verkaufen 
// ************************************************************
INSTANCE DIA_Abuyin_Trade(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Trade_Condition;
	information	= DIA_Abuyin_Trade_Info;
	permanent	= TRUE;
	description	= "Tengo tabaco de miel para ti.";
};                       
FUNC INT DIA_Abuyin_Trade_Condition()
{	
	if (Abuyin_Honigtabak == TRUE)
	&& (Npc_HasItems (other, ItMi_HonigTabak) >= 1) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Trade_Info()
{	
	Abuyin_Score = 0;
	
	Abuyin_Score = (Npc_HasItems (other, Itmi_Honigtabak)* Value_Itmi_Honigtabak);
	
	AI_Output (other, self,"DIA_Abuyin_Trade_15_00");//Tengo tabaco de miel para ti.
	
	B_GiveInvItems (other, self, ItmI_HonigTabak, Npc_HasItems (other, Itmi_Honigtabak));
	B_GiveInvItems (self, other, ItmI_Gold, Abuyin_Score);
	
	AI_Output (self, other,"DIA_Abuyin_Trade_13_01");//Hacer negocios contigo es un gran placer.
};
// ************************************************************
// 			  		Herb - KrautPaket
// ************************************************************
INSTANCE DIA_Abuyin_Herb(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Herb_Condition;
	information	= DIA_Abuyin_Herb_Info;
	permanent	= FALSE;
	description	= "¿Estás interesado en este paquete de hierbas?";
};                       
FUNC INT DIA_Abuyin_Herb_Condition()
{	
	if (Npc_HasItems (other, Itmi_Herbpaket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Herb_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Herb_15_00");//¿Estás interesado en este paquete de hierbas?
	AI_Output (self, other,"DIA_Abuyin_Herb_13_01");//Un paquete de hierbas. ¿Eso no es hierba de ciénaga, no? Oh, llévatelo, Hijo de la Imprevisión.
	AI_Output (self, other,"DIA_Abuyin_Herb_13_02");//Si los guardias de la ciudad me pillan con eso, me meterán en la cárcel. ¡Y a ti te pasará lo mismo!
	AI_Output (self, other,"DIA_Abuyin_Herb_13_03");//Si pretendes vender esto, te recomiendo que abandones esta ciudad.
	AI_Output (self, other,"DIA_Abuyin_Herb_13_04");//Intenta librarte de ello fuera de la muralla de la ciudad. Aquí dentro, todo lo que obtendrás a cambio de esto serán problemas a montones.
};
// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung_Condition;
	information	= DIA_Abuyin_Weissagung_Info;
	permanent	= FALSE;
	description	= "¿Puedes hacerme una profecía?";
};                       
FUNC INT DIA_Abuyin_Weissagung_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Weissagung_15_00");//¿Puedes hacerme una profecía?
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_01");//Mis servicios son tuyos por un pequeño importe, oh Padre de la Generosidad.
	AI_Output (other, self,"DIA_Abuyin_Weissagung_15_02");//¿Cuánto quieres?
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_03");//Por unas míseras 25 monedas de oro, me arriesgaré a mirar en el tiempo para ti.
	AI_Output (self, other,"DIA_Abuyin_Weissagung_13_04");//Pero recuerda: el futuro es siempre incierto. Lo único que puedo hacer es vislumbrar algunos fragmentos de tiempo.
};
// ************************************************************
// 			Weisagen lassen Kapitel 1
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft_Condition;
	information	= DIA_Abuyin_Zukunft_Info;
	permanent	= TRUE;
	description	= "Háblame del futuro (pagar 25 de oro).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung)
	&& (DIA_Abuyin_Zukunft_permanent == FALSE)
	&& (Kapitel == 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft_15_00");//Háblame del futuro.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 25)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft_13_01");//De acuerdo, Buscador de Conocimiento. Ahora entraré en un estado de trance. ¿Estás preparado?
		Info_ClearChoices (DIA_Abuyin_Zukunft);
		Info_AddChoice (DIA_Abuyin_Zukunft,"¡Estoy listo!",DIA_Abuyin_Zukunft_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft_13_02");//Oh, Padre de las Monedas, te pido 25 monedas de oro a cambio de un atisbo del futuro.
	};

};
FUNC VOID DIA_Abuyin_Zukunft_Trance()
{
		AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
		Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
		
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_00");//(En trance)… Orcos... protegen una entrada... un viejo túnel... el Valle de las Minas...
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_01");//(En trance)… Hombres con armadura brillante... un mago... tu amigo está con ellos... está esperándote...
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_02");//(En trance)… ¡Fuego! Un ataque... una criatura poderosa... las llamas... muchos... morirán...
		
		AI_Output (self, other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");//(En trance) ... ¿qué es eso... ? Una ciudad... Ruinas ... Quarhodron en Jharkendar ...
		AI_Output (self, other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");//(En trance) ... Lo han invocado... ¡Quarhodron en Jharkendar!
		
		AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
		AI_Output (self, other,"DIA_Abuyin_Zukunft_Trance_13_03");//… Lo siento, la visión ha terminado. No puedo ver nada más.
		
		DIA_Abuyin_Zukunft_permanent = TRUE; 
		Abuyin_Zukunft = 1;
		Info_ClearChoices (DIA_Abuyin_Zukunft);
		
		B_GivePlayerXP ((XP_Ambient*4));
};
// ************************************************************
// 		Kannst du mir noch eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Nochmal(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Nochmal_Condition;
	information	= DIA_Abuyin_Nochmal_Info;
	permanent	= TRUE;
	description	= "¿Puedes hacerme otra profecía?";
};                       
FUNC INT DIA_Abuyin_Nochmal_Condition()
{	
	if (Kapitel == Abuyin_Zukunft)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Nochmal_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Nochmal_15_00");//¿Puedes hacerme otra profecía?
	AI_Output (self, other,"DIA_Abuyin_Nochmal_13_01");//Oh, Hijo del Misterioso Futuro, no está en mis manos levantar el velo del tiempo.
	AI_Output (self, other,"DIA_Abuyin_Nochmal_13_02");//Solo cuando el tiempo me envíe otro vaticinio, podré verlo de nuevo para ti.
	
	if (Abuyin_Erzaehlt == FALSE)
	{
		AI_Output (other, self,"DIA_Abuyin_Nochmal_15_03");//¿Cuándo ocurrirá eso?
		AI_Output (self, other,"DIA_Abuyin_Nochmal_13_04");//Cuando el futuro se haya hecho presente y tú hayas continuado tu viaje.
		Abuyin_Erzaehlt = TRUE;
	};
};

//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

FUNC void B_Abuyin_Weissagung ()
{	
	AI_Output (other, self,"B_Abuyin_Weissagung_15_00");//¿Puedes hacerme una profecía?
	AI_Output (self, other,"B_Abuyin_Weissagung_13_01");//Sí, el tiempo ha progresado y te daré una profecía a cambio de unas pocas monedas.
	AI_Output (other, self,"B_Abuyin_Weissagung_15_02");//¿Cuánto?
};


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung2(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung2_Condition;
	information	= DIA_Abuyin_Weissagung2_Info;
	permanent	= FALSE;
	description	= "¿Puedes hacerme una profecía?";
};                       
FUNC INT DIA_Abuyin_Weissagung2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung2_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung2_13_00");//Por unas míseras 100 monedas, me arriesgaré a mirar en el tiempo para ti.
};
// ************************************************************
// 			Weisagen lassen Kapitel 2
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft2(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft2_Condition;
	information	= DIA_Abuyin_Zukunft2_Info;
	permanent	= TRUE;
	description	= "Háblame del futuro (pagar 100 de oro).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft2_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft2_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung2)
	&& (DIA_Abuyin_Zukunft2_permanent == FALSE)
	&& (Kapitel == 2)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft2_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft2_15_00");//Háblame del futuro.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 100)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft2_13_01");//De acuerdo, Hijo del Coraje. Ahora entraré en un estado de trance. ¿Estás preparado?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft2);
		Info_AddChoice (DIA_Abuyin_Zukunft2,"¡Estoy listo!",DIA_Abuyin_Zukunft2_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft2_13_02");//Oh, Padre de las Monedas, te pido 100 monedas de oro a cambio de un atisbo del futuro.
	};

};	
FUNC VOID DIA_Abuyin_Zukunft2_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_00");//(En trance)… Un mercenario... te necesitará... un terrible asesinato... el Ojo...
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_01");//(En trance)… los siniestros secuaces... vienen... a buscarte... un guardián caerá...
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_02");//(En trance)… pero los tres se unirán... solo entonces recibirás lo que es tuyo...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft2_Trance_13_03");//Eso es todo. No hay nada más que pueda ver.
	
	DIA_Abuyin_Zukunft2_permanent = TRUE; 
	Abuyin_Zukunft = 2;
	Info_ClearChoices (DIA_Abuyin_Zukunft2);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung3(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung3_Condition;
	information	= DIA_Abuyin_Weissagung3_Info;
	permanent	= FALSE;
	description	= "¿Puedes hacerme una profecía?";
};                       
FUNC INT DIA_Abuyin_Weissagung3_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 3)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung3_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung3_13_00");//Por unas míseras 250 monedas, me arriesgaré a mirar en el tiempo para ti.
};
// ************************************************************
// 			Weisagen lassen Kapitel 3
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft3(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft3_Condition;
	information	= DIA_Abuyin_Zukunft3_Info;
	permanent	= TRUE;
	description	= "Háblame del futuro (pagar 250 de oro).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft3_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft3_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung3)
	&& (DIA_Abuyin_Zukunft3_permanent == FALSE)
	&& (Kapitel == 3)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft3_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft3_15_00");//Háblame del futuro.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 250)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft3_13_01");//De acuerdo, Hijo del Conocimiento. Ahora entraré en un estado de trance. ¿Estás preparado?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft3);
		Info_AddChoice (DIA_Abuyin_Zukunft3,"¡Estoy listo!",DIA_Abuyin_Zukunft3_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft3_13_02");//Oh, Padre de las Monedas, te pido 250 monedas de oro a cambio de un atisbo del futuro.
	};

};	
FUNC VOID  DIA_Abuyin_Zukunft3_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_00");//(En trance)… forzarás... el destino que solo a ti te pertenece...
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_01");//(En trance)… a través de fuego y nieve... a través de hielo y llamas...
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_02");//(En trance)… Hombre con armadura extranjera... un pantano... lagartos... te esperan...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft3_Trance_13_03");//Eso es todo. No hay nada más que pueda ver.
	
	DIA_Abuyin_Zukunft3_permanent = TRUE; 
	Abuyin_Zukunft = 3;
	Info_ClearChoices (DIA_Abuyin_Zukunft3);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung4(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung4_Condition;
	information	= DIA_Abuyin_Weissagung4_Info;
	permanent	= FALSE;
	description	= "¿Puedes hacerme una profecía?";
};                       
FUNC INT DIA_Abuyin_Weissagung4_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 4)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung4_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung4_13_00");//Por unas míseras 500 monedas, me arriesgaré a mirar en el tiempo para ti.
};
// ************************************************************
// 			Weisagen lassen Kapitel 4
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft4(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft4_Condition;
	information	= DIA_Abuyin_Zukunft4_Info;
	permanent	= TRUE;
	description	= "Háblame del futuro (pagar 500 de oro).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft4_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft4_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung4)
	&& (DIA_Abuyin_Zukunft4_permanent == FALSE)
	&& (Kapitel == 4)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft4_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft4_15_00");//Háblame del futuro.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 500)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft4_13_01");//De acuerdo, Hijo del Conocimiento. Ahora entraré en un estado de trance. ¿Estás preparado?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft4);
		Info_AddChoice (DIA_Abuyin_Zukunft4,"¡Estoy listo!",DIA_Abuyin_Zukunft4_Trance);	
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft4_13_02");//Oh, Padre de las Monedas, te pido 500 monedas de oro a cambio de un atisbo del futuro.
	};

};
FUNC VOID DIA_Abuyin_Zukunft4_Trance()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_00");//(En trance)… el lugar del conocimiento... otro país... un lugar oscuro y lejano...
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_01");//(En trance)… compañeros valientes... tomarás una decisión...
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_02");//(En trance)… un templo... aislado en el reino de Adanos... oculto en la niebla...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft4_Trance_13_03");//Eso es todo. No hay nada más que pueda ver.
	
	DIA_Abuyin_Zukunft4_permanent = TRUE; 
	Abuyin_Zukunft = 4;
	Info_ClearChoices (DIA_Abuyin_Zukunft4);
	
	B_GivePlayerXP ((XP_Ambient*4));
};
//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################


// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
INSTANCE DIA_Abuyin_Weissagung5(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Weissagung5_Condition;
	information	= DIA_Abuyin_Weissagung5_Info;
	permanent	= FALSE;
	description	= "¿Puedes hacerme una profecía?";
};                       
FUNC INT DIA_Abuyin_Weissagung5_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_du)
	&& (Kapitel == 5)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Weissagung5_Info()
{	
	B_Abuyin_Weissagung ();
	AI_Output (self, other,"DIA_Abuyin_Weissagung5_13_00");//Por unas míseras 1000 monedas, me arriesgaré a mirar en el tiempo para ti.
};
// ************************************************************
// 			Weisagen lassen Kapitel 5
// ************************************************************
INSTANCE DIA_Abuyin_Zukunft5(C_INFO)
{
	npc			= VLK_456_Abuyin;
	nr			= 2;
	condition	= DIA_Abuyin_Zukunft5_Condition;
	information	= DIA_Abuyin_Zukunft5_Info;
	permanent	= TRUE;
	description	= "Háblame del futuro (pagar 1000 de oro).";
};                    
//---------------------------------------   
var int DIA_Abuyin_Zukunft5_permanent;
//---------------------------------------
FUNC INT DIA_Abuyin_Zukunft5_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Abuyin_Weissagung5)
	&& (DIA_Abuyin_Zukunft5_permanent == FALSE)
	&& (Kapitel == 5)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Abuyin_Zukunft5_Info()
{	
	AI_Output (other, self,"DIA_Abuyin_Zukunft5_15_00");//Háblame del futuro.
	
	if B_GiveInvItems (other,self, ItMI_Gold, 1000)
	{ 
		AI_Output (self, other,"DIA_Abuyin_Zukunft5_13_01");//De acuerdo, Hijo del Conocimiento. Ahora entraré en un estado de trance. ¿Estás preparado?
		
		Info_ClearChoices (DIA_Abuyin_Zukunft5);
		Info_AddChoice (DIA_Abuyin_Zukunft5,"¡Estoy listo!",DIA_Abuyin_Zukunft5_Trance);
	}
	else 
	{
		AI_Output (self, other,"DIA_Abuyin_Zukunft5_13_02");//Oh, Padre de las Monedas, te pido 1000 monedas de oro a cambio de un atisbo del futuro.
	};

};
FUNC VOID DIA_Abuyin_Zukunft5_Trance ()
{
	AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",  self, self, 0, 0, 0, FALSE );
	
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_00");//(En trance)… la Oscuridad se extiende por la tierra... el mal triunfará...
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_01");//(En trance)… el Rey perderá su guerra contra los orcos...
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_02");//(En trance)… regresarás, pero no encontrarás paz...
	
	AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
	AI_Output (self, other,"DIA_Abuyin_Zukunft5_Trance_13_03");//Eso es todo. No hay nada más que pueda ver.
		
	DIA_Abuyin_Zukunft5_permanent = TRUE; 
	Abuyin_Zukunft = 5;
	
	Info_ClearChoices (DIA_Abuyin_Zukunft5);
	
	B_GivePlayerXP ((XP_Ambient*4));
};

