// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_EXIT_Condition;
	information	= DIA_Gritta_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Gritta_PICKPOCKET (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 900;
	condition	= DIA_Gritta_PICKPOCKET_Condition;
	information	= DIA_Gritta_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Gritta_PICKPOCKET_Condition()
{
	C_Beklauen (20, 20);
};
 
FUNC VOID DIA_Gritta_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gritta_PICKPOCKET);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_BACK 		,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
	
func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Gritta_Hello(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 10;
	condition	= DIA_Gritta_Hello_Condition;
	information	= DIA_Gritta_Hello_Info;
	permanent	= FALSE;
	Important   = TRUE;
};                       
FUNC INT DIA_Gritta_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Gritta_Hello_16_00"); //¿Qué quieres, extraño? Si has venido a mendigar, lo siento, pero soy una pobre viuda.
	AI_Output (self ,other,"DIA_Gritta_Hello_16_01"); //Me llamo Gritta. Desde que mi marido murió, llevo la casa de mi tío, Thorben.
};
//*************************************************************
//			Matteo will sein Geld
//*************************************************************
INSTANCE DIA_Gritta_WantsMoney(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 2;
	condition	= DIA_Gritta_WantsMoney_Condition;
	information	= DIA_Gritta_WantsMoney_Info;
	permanent	= FALSE;
	description = "Matteo me envió. Aún le debes cierto dinero.";
};                       
FUNC INT DIA_Gritta_WantsMoney_Condition()
{
	if (MIS_Matteo_Gold == LOG_RUNNING)
	{
		return TRUE;
	};	
};
//------------------------------------
var int Gritta_WantPay;
var int Gritta_Threatened;
//------------------------------------
FUNC VOID DIA_Gritta_WantsMoney_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_15_00"); //Matteo me envió. Aún le debes cierto dinero.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_01"); //¿Quiere su dinero? ¿A cambio de qué? Lo que me vendió estaba mal: malas telas y malas costuras.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_02"); //¿Y viste los colores? Esos no eran los colores que yo encargué. ¡Eso es fraude, claro que sí!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_03"); //Déjame decirte... Cuando mi marido vivía, él nunca se atrevió a hacer eso. Oh, mi pobre marido...

	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Corta el rollo. ¿Dónde está la pasta?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continuar",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue01 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue01_16_00"); //… era un hombre tan bueno. Guapo, trabajador... un caballero de la vieja escuela. Lo teníamos todo: dinero, felicidad...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_01"); //… a veces incluso nos invitaban a eventos de la alta sociedad. Las fiestas, toda esa ropa preciosa y los peinados...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_02"); //… las buenas cenas y las conversaciones civilizadas. Todo era mejor entonces. Nadie se habría atrevido a humillar el corazón de una pobre viuda con tales...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Corta el rollo. ¿Dónde está la pasta?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continuar",DIA_Gritta_WantsMoney_Continue02);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue02 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue02_16_00"); //… reclamaciones ridículas. ¿Qué voy a hacer? Mi pensión prácticamente no me permite vivir y las cosas cada vez están peor. Una lo ve por todas partes...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_01"); //… la gente debe economizar y ahorrar. Hace semanas que el último barco llegó a la ciudad. Mi marido era capitán de un barco mercante. En realidad, incluso era el dueño del barco...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_02"); //… siempre me traía regalos de sus largos viajes: telas exquisitas del continente, preciadas especias de los países del sur...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Corta el rollo. ¿Dónde está la pasta?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continuar",DIA_Gritta_WantsMoney_Continue03);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue03 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue03_16_00"); //… la mayoría de la gente ni siquiera ha oído hablar de esas cosas. Pero luego, un día, recibí la noticia de que el Gritta se había hundido (ése era el nombre del barco, mi marido lo llamó así...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue03_16_01"); //… por el amor que me tenía). Lloré y recé para que mi marido hubiera sobrevivido al desastre. Cada días esperaba obtener noticias suyas, pero todas mis esperanzas fueron en vano...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_02"); //… que Innos se apiade de su alma. Que descanse en paz. Desde entonces llevo viviendo de esta modesta forma y ahora ese desalmado insensible de Matteo...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_03"); //… anda detrás de los últimos restos de mis ahorros de toda la vida. Por favor, apiádate de una pobre mujer. Cuando mi marido vivía, él no se habría atrevido a hacer esto. Oh, mi pobre marido...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Corta el rollo. ¿Dónde está el oro?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continuar",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_WhereMoney ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_WhereMoney_15_00"); //Corta el rollo. ¿Dónde está el oro?
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01"); //(Provocando) Pero yo no tengo dinero, ¡solo soy una pobre viuda!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"¡Suelta la pasta o te arreo una!",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Supongo que solo tenemos que vender tu mercancía...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Voy a pagar el dinero por ti.",DIA_Gritta_WantsMoney_IWillPay);
};
FUNC VOID DIA_Gritta_WantsMoney_EnoughStuff ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //Entonces bastará con vender unos cuantos de tus vestidos. Estoy seguro de que tendrás un montón más en tu armario...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //¡Cómo te atreves, vulgar patán! De acuerdo, toma, aquí tienes el oro.
	B_GiveInvItems (self,other,ItMi_Gold, 100); 
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //(Sonríe) ¿Ves? Tampoco era tan difícil.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //(Agriamente) Y ahora, por favor, abandona mi casa.
	
	Gritta_GoldGiven = TRUE;
	
	AI_StopProcessInfos (self); 
};
func VOID DIA_Gritta_WantsMoney_IWillPay ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_00"); //Voy a pagar el dinero por ti.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_01"); //¿Harías eso por mí? Oh, ¡sabía que no eras un bastardo usurero como ese Matteo!
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_02"); //Ya, ya, da igual.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_03"); //Regresa cuando te hayas ocupado del tema. Deseo mostrarte mi gratitud.
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	
	Gritta_WantPay = TRUE;
};
FUNC VOID DIA_Gritta_WantsMoney_BeatUp ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_BeatUp_15_00"); //(Amenazador) ¡Suelta la pasta o te arreo una!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_BeatUp_16_01"); //(Desafiante) No eres más que un simple ladrón. Vamos, atrévete, ¡saca tu arma y llamo a los policías!
	
	Gritta_Threatened = TRUE;
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WINE
///////////////////////////////////////////////////////////////////////
instance DIA_Gritta_WINE		(C_INFO)
{
	npc			 = 	VLK_418_Gritta;
	nr			 = 	2;
	condition	 = 	DIA_Gritta_WINE_Condition;
	information	 = 	DIA_Gritta_WINE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Gritta_WINE_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Gritta_WantPay == TRUE)
	&& (MIS_Matteo_Gold == LOG_SUCCESS)
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		return TRUE;
	};
};
func void DIA_Gritta_WINE_Info ()
{
	AI_Output (self, other, "DIA_Gritta_WINE_16_00"); //Fue muy noble por tu parte pagar mis cosas. Quiero mostrarte mi gratitud.
	AI_Output (self, other, "DIA_Gritta_WINE_16_01"); //Aquí tienes una botella de vino que mi marido, que su alma descanse junto a Innos, trajo de las islas del sur.
	AI_Output (self, other, "DIA_Gritta_WINE_16_02"); //Además, voy a extender la noticia. Al menos hay alguien en la ciudad cuya virtud....
	AI_Output (other, self, "DIA_Gritta_WINE_15_03"); //Ya, ya, da igual.

	B_GivePlayerXP 		(XP_PayForGritta);
	B_GiveInvItems 		(self, other, Itfo_Wine, 1);
	
	AI_StopProcessInfos (self); 
};
// *************************************************************
//							PERM (1u2)
// *************************************************************
instance DIA_Gritta_PERM (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr		 	= 3;
	condition	= DIA_Gritta_PERM_Condition;
	information	= DIA_Gritta_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Gritta_PERM_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Npc_KnowsInfo (other, DIA_Gritta_WantsMoney))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Gritta_PERM_Info ()
{
	if (Npc_KnowsInfo (other, DIA_Gritta_WINE))
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_00"); //Mientras haya hombres como tú en esta ciudad, aún tengo esperanza de que todo saldrá bien.
	}
	else if (Gritta_WantPay == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_01"); //Regresa cuando esté arreglado el asunto con Matteo.
	}
	else if (Gritta_Threatened == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_02"); //¿Por qué me miras como un idiota? ¡No te atreverás a atacarme!
	}
	else //Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_03"); //¿Qué más quieres? ¡Tienes mi oro! ¡Lárgate!
	};
	
	AI_StopProcessInfos (self); 
};


//###########################################
//##
//##	Kapitel 3
//##
//###########################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_Kap3_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_Kap3_EXIT_Condition;
	information	= DIA_Gritta_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//		Perm3U4U5
// ************************************************************

//------------------------------------
var int GrittaXP_Once;
//-----------------------------

INSTANCE DIA_Gritta_Perm3U4U5(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 31;
	condition	= DIA_Gritta_Perm3U4U5_Condition;
	information	= DIA_Gritta_Perm3U4U5_Info;
	permanent	= TRUE;
	description = "¿Qué tal va todo?";
};                       
FUNC INT DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gritta_Perm3U4U5_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_00"); //¿Cómo va todo?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_01"); //Todo se está yendo al garete por aquí. Mires donde mires no hay más que crimen y violencia. Imagínate, incluso han asesinado a uno de los paladines.
			
			Info_ClearChoices (DIA_Gritta_Perm3U4U5);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,DIALOG_BACK,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Así es la guerra. Esas cosas pasan.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Todo irá bien.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"¿De qué te has enterado?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_02"); //Oh, estoy tan nerviosa, Lord Hagen ha liberado al mercenario.
			AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_03"); //¿Y en qué te afecta eso?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_04"); //Piensa en ello. ¿Crees que los mercenarios se iban a quedar parados viendo cómo colgaban a uno de sus camaradas?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_05"); //Habrían intentado liberarlo y se habría derramado muchísima sangre. Doy gracias a Innos.
		};	
	}
	else if (Kapitel == 5)	
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_06"); //Los paladines se están preparando y parece que van a irse pronto.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_07"); //Como siempre, pero no me quiero quejar.
	};
};

FUNC VOID DIA_Gritta_Perm3U4U5_BACK ()
{
	Info_ClearChoices (DIA_Gritta_Perm3U4U5);
};

FUNC VOID DIA_Gritta_Perm3U4U5_War ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_War_15_00"); //Así es la guerra. Esas cosas pasan.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_01"); //Sí, además está esta horrible guerra, encima de todo. Todo el mundo sufre y se pregunta cómo va a arreglárselas.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_02"); //A veces me pregunto a mí mismo qué hemos hecho para merecer semejante castigo de Innos.
};

FUNC VOID DIA_Gritta_Perm3U4U5_TurnsGood ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //Todo irá bien.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //Intentas consolarme. Qué amable.
	
	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};	
};

FUNC VOID DIA_Gritta_Perm3U4U5_Rumors ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_Rumors_15_00"); //¿De qué te has enterado?
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01"); //Solo lo que se habla en las calles.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02"); //He oído que ya han cogido al asesino pero no puedo decirte si es verdad.
};












