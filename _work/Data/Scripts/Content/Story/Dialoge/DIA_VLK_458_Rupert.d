// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Rupert_EXIT(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 999;
	condition	= DIA_Rupert_EXIT_Condition;
	information	= DIA_Rupert_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Rupert_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rupert_PICKPOCKET (C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_PICKPOCKET_Condition;
	information	= DIA_Rupert_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Rupert_PICKPOCKET_Condition()
{
	C_Beklauen (18, 10);
};
 
FUNC VOID DIA_Rupert_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rupert_PICKPOCKET);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_BACK 		,DIA_Rupert_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rupert_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rupert_PICKPOCKET_DoIt);
};

func void DIA_Rupert_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
	
func void DIA_Rupert_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rupert_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Rupert_Hello(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_Hello_Condition;
	information	= DIA_Rupert_Hello_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Rupert_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Rupert_Hello_03_00"); //¡Hola extraño!
	AI_Output (self ,other,"DIA_Rupert_Hello_03_01"); //Debes estar hambriento y sediento. ¿Quizá pueda interesarte mi mercancía?
};	

// ************************************************************
// 			  				 Zu Pal 
// ************************************************************
INSTANCE DIA_Rupert_ZuPal(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_ZuPal_Condition;
	information	= DIA_Rupert_ZuPal_Info;
	permanent	= FALSE;
	description = "En realidad iba de camino a ver a los paladines...";
};                       
FUNC INT DIA_Rupert_ZuPal_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_ZuPal_Info()
{	
	AI_Output (other, self,"DIA_Rupert_ZuPal_15_00"); //En realidad iba de camino a ver a los paladines...
	AI_Output (self ,other,"DIA_Rupert_ZuPal_03_01"); //No creo que sea posible. Desde que los paladines se alojan en el barrio alto de la ciudad, ya casi nadie puede entrar allí.
};	

// ************************************************************
// 			  			HelpMeIntoOV
// ************************************************************
INSTANCE DIA_Rupert_HelpMeIntoOV(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_HelpMeIntoOV_Condition;
	information	= DIA_Rupert_HelpMeIntoOV_Info;
	permanent	= FALSE;
	description = "¿Puedes ayudarme a entrar en el barrio alto?";
};                       
FUNC INT DIA_Rupert_HelpMeIntoOV_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rupert_ZuPal))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_HelpMeIntoOV_Info()
{	
	AI_Output (other, self,"DIA_Rupert_HelpMeIntoOV_15_00"); //¿Puedes ayudarme a entrar en el barrio alto?
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_01"); //¿Yo? No, ¡yo no pinto nada aquí!
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_02"); //Solo hay un par de personas en la parte baja de la ciudad que tengan suficiente influencia como para hacerte pasar el control de los guardias.
	AI_Output (self ,other,"DIA_Rupert_HelpMeIntoOV_03_03"); //Matteo, mi jefe, es uno de ellos. Quizá deberías hablar con él.
	
	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Si quiero llegar al barrio alto, necesitaré algo de ayuda por parte de algunos ciudadanos influyentes de la parte baja.");
	B_LogEntry (TOPIC_OV,"Matteo, el mercader, es uno de los ciudadanos influyentes de la parte baja de la ciudad.");
};	

// ***************************************************************
//							WoMatteo
// ***************************************************************
INSTANCE DIA_Rupert_WoMatteo(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 1;
	condition	= DIA_Rupert_WoMatteo_Condition;
	information	= DIA_Rupert_WoMatteo_Info;
	permanent	= FALSE;
	description = "¿Dónde puedo encontrar a Matteo?";
};                      
FUNC INT DIA_Rupert_WoMatteo_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WoMatteo_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WoMatteo_15_00"); //¿Dónde puedo encontrar a Matteo?
	AI_Output (self ,other,"DIA_Rupert_WoMatteo_03_01"); //Estás justo delante de su tienda. Entra. Suele estar casi siempre ahí.
	
	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader,"La tienda de Matteo está en la puerta sur de la ciudad. Vende equipo, armas y pertrechos.");
		Knows_Matteo = TRUE;
	};
};

// ***************************************************************
//							Wer hat Einfluß
// ***************************************************************
INSTANCE DIA_Rupert_WerEinfluss(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 2;
	condition	= DIA_Rupert_WerEinfluss_Condition;
	information	= DIA_Rupert_WerEinfluss_Info;
	permanent	= FALSE;
	description = "¿Qué hay de los otros ciudadanos influyentes?";
};                      
FUNC INT DIA_Rupert_WerEinfluss_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_WerEinfluss_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_WerEinfluss_15_00"); //¿Qué hay de los otros ciudadanos influyentes?
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_01"); //Los comerciantes y los maestros artesanos de la calle principal son las figuras más importantes de la ciudad.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_02"); //Deberías intentar ser admitido por uno de ellos como aprendiz, igual que yo.
	AI_Output (self ,other,"DIA_Rupert_WerEinfluss_03_03"); //Desde que empecé a trabajar para Matteo, ¡la gente de la ciudad me trata con respeto!
	
	B_LogEntry (TOPIC_OV,"Debería intentar empezar a trabajar como aprendiz para uno de los maestros artesanos.");
};

// ***************************************************************
//							Work
// ***************************************************************
INSTANCE DIA_Rupert_Work(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 3;
	condition	= DIA_Rupert_Work_Condition;
	information	= DIA_Rupert_Work_Info;
	permanent	= FALSE;
	description = "Necesito un poco de dinero y busco trabajo.";
};                      
FUNC INT DIA_Rupert_Work_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Work_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Work_15_00"); //Necesito un poco de dinero y busco trabajo.
	AI_Output (self ,other,"DIA_Rupert_Work_03_01"); //He oído que Bosper tiene problemas con sus abastecedores. Su tienda está justo ahí.
	AI_Output (self ,other,"DIA_Rupert_Work_03_02"); //Dicen que paga bastante bien.
};

// ***************************************************************
//							YourOffer
// ***************************************************************
INSTANCE DIA_Rupert_YourOffer(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_YourOffer_Condition;
	information	= DIA_Rupert_YourOffer_Info;
	permanent	= FALSE;
	description = "¿Qué puedes ofrecerme?";
};                      
FUNC INT DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Rupert_YourOffer_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_YourOffer_15_00"); //¿Qué puedes ofrecerme?
	AI_Output (self ,other,"DIA_Rupert_YourOffer_03_01"); //En este momento no tengo mucha variedad.
	if (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{ 
		AI_Output (self ,other,"DIA_Rupert_YourOffer_03_02"); //El maldito hacendado ya no envía nada y lo que obtenemos de las granjas pequeñas no es suficiente para satisfacer las demandas de la ciudad.
	};
};

// ************************************************************
//								Trade
// ************************************************************
INSTANCE DIA_Rupert_Trade(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 900;
	condition	= DIA_Rupert_Trade_Condition;
	information	= DIA_Rupert_Trade_Info;
	permanent	= TRUE;
	description = "Enséñame tu mercancía.";
	trade		= TRUE;
};                       
FUNC INT DIA_Rupert_Trade_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Rupert_Trade_Info()
{	
	if (Npc_HasItems (self, itfo_cheese) < 5)
	{
		CreateInvItems (self, ItFo_cheese, 5);
	};
	
	AI_Output (other,self ,"DIA_Rupert_Trade_15_00"); //Enséñame tu mercancía.
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_Rupert_Trade_03_01"); //Debo pedir disculpas por mi escasa selección. Un hombre de tu posición seguramente está acostumbrado a algo mejor.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Rupert_Bauernaufstand(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Bauernaufstand_Condition;
	information	= DIA_Rupert_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "Cuéntame más sobre la revuelta de los campesinos.";
};                       
FUNC INT DIA_Rupert_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_YourOffer))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Bauernaufstand_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Bauernaufstand_15_00"); //Cuéntame más sobre la revuelta de los campesinos.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_01"); //Es bastante simple: Onar, el hacendado gordo, ya no paga más impuestos a la ciudad.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_02"); //¡Imagínate! ¡Estamos en guerra contra los orcos y el gordo baboso lo quiere todo para él!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_03"); //En tales casos, la guardia de la ciudad tomaría medidas firmes.
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_04"); //Pero ahora llega lo mejor: ¡dicen que Onar ha contratado a mercenarios para evitar que las tropas de la ciudad se le echen encima!
	AI_Output (self ,other,"DIA_Rupert_Bauernaufstand_03_05"); //¡MERCENARIOS! ¡Todo esto terminará en una maldita guerra! ¡Cómo si no tuviéramos bastante ya con UNA!
};

// ***************************************************************
//							Söldner
// ***************************************************************
INSTANCE DIA_Rupert_Mercs(C_INFO)
{
	npc			= VLK_458_Rupert;
	nr			= 4;
	condition	= DIA_Rupert_Mercs_Condition;
	information	= DIA_Rupert_Mercs_Info;
	permanent	= FALSE;
	description = "¿Qué sabes de los mercenarios de Onar?";
};                       
FUNC INT DIA_Rupert_Mercs_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Rupert_Bauernaufstand))
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rupert_Mercs_Info()
{	
	AI_Output (other,self ,"DIA_Rupert_Mercs_15_00"); //¿Qué sabes de los mercenarios de Onar?
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_01"); //He oído que la mayoría son antiguos convictos de la colonia minera.
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_02"); //Y su líder se supone que ha sido un pez gordo del Rey, un general o algo así, ¡al que degradaron por traidor!
	AI_Output (self	,other,"DIA_Rupert_Mercs_03_03"); //Vivimos unos momentos terribles.
};



