///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_EXIT   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 999;
	condition   = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kardif_EXIT_Condition()
{
	if (Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Kardif_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Kardif_PICKPOCKET (C_INFO)
{
	npc			= VLK_431_Kardif;
	nr			= 900;
	condition	= DIA_Kardif_PICKPOCKET_Condition;
	information	= DIA_Kardif_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Kardif_PICKPOCKET_Condition()
{
	C_Beklauen (55, 85);
};
 
FUNC VOID DIA_Kardif_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kardif_PICKPOCKET);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_BACK 		,DIA_Kardif_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kardif_PICKPOCKET_DoIt);
};

func void DIA_Kardif_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
	
func void DIA_Kardif_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hi		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hi_Condition;
	information	 = 	DIA_Kardif_Hi_Info;
	permanent    =  FALSE;
	description	 = 	"¿Qué pasa?";
};
func int DIA_Kardif_Hi_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hi_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hi_15_00"); //¿Cómo van las cosas?
	AI_Output (self, other, "DIA_Kardif_Hi_14_01"); //Si quieres beber algo, tendrás que pedirlo.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif vende bebidas en la taberna de los muelles.");
};	
	
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hallo		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hallo_Condition;
	information	 = 	DIA_Kardif_Hallo_Info;
	permanent    =  FALSE;
	description	 = 	"Apuesto a que te enteras de un montón de cosas...";
};
func int DIA_Kardif_Hallo_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Kardif_Hi)
	&& (Kardif_Deal == 0)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_15_00"); //Apuesto a que te enteras de un montón de cosas...
	AI_Output (self, other, "DIA_Kardif_Hallo_14_01"); //¿Y a ti qué te importa?
	AI_Output (other, self, "DIA_Kardif_Hallo_15_02"); //Siempre estoy atento a las noticias.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_03"); //¿Tienes también tu bolsillo abierto?
	AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Cada información que te dé te costará 10 monedas de oro.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, el propietario de la taberna del puerto, trafica con información.");
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"No te daré más de 5 por tu información.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Olvídalo. Conseguiré la información en otra parte.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"De acuerdo, acepto.",DIA_Kardif_Hallo_Zehn);	
};
FUNC VOID DIA_Kardif_Hallo_Zehn()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Zehn_15_00"); //De acuerdo, acepto.
	AI_Output (self, other, "DIA_Kardif_Hallo_Zehn_14_01"); //Has hecho un buen trato (sonríe). Estoy siempre a tu servicio.
	
	Kardif_Deal = 10;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Angebot()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Angebot_15_00"); //No te daré más de 5 por tu información.
	AI_Output (self, other, "DIA_Kardif_Hallo_Angebot_14_01"); //¿Qué? ¿5 monedas de oro? ¿Intentas arruinarme? (Se lo piensa brevemente) Que sean 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"No, no va así. ¡Digamos 6!",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Bien, 7 monedas de oro me parece justo.",DIA_Kardif_Hallo_Sieben);
};
FUNC VOID DIA_Kardif_Hallo_Hart()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Hart_15_00"); //Olvídalo. Conseguiré la información en otra parte.
	AI_Output (self, other, "DIA_Kardif_Hallo_Hart_14_01"); //De acuerdo, de acuerdo... bajaré a 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Bien, 7 monedas de oro me parece justo.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"No, no necesito tu información tan desesperadamente.",DIA_Kardif_Hallo_Ablehnen);
};
FUNC VOID DIA_Kardif_Hallo_Sieben()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Sieben_15_00"); //Bien, 7 monedas de oro me parece justo.
	AI_Output (self, other, "DIA_Kardif_Hallo_Sieben_14_01"); //(Sonríe) Una sabia decisión. Pues entonces, si hay algo que quieras saber, pregúntame.
	
	Kardif_Deal = 7;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Ablehnen_15_00"); //No, no necesito tu información tan desesperadamente.
	AI_Output (self, other, "DIA_Kardif_Hallo_Ablehnen_14_01"); //Oye, espera... (suspira) De acuerdo, 5 monedas de oro. ¡Pero ésa es mi última oferta!
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"¿Por qué no lo dijiste directamente?",DIA_Kardif_Hallo_Fuenf);

};
FUNC VOID DIA_Kardif_Hallo_Fuenf()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Fuenf_15_00"); //¿Por qué no lo dijiste directamente?
	AI_Output (self, other, "DIA_Kardif_Hallo_Fuenf_14_01"); //Oh, estoy un poco bajo de forma. Pero da igual, trato hecho.
	Kardif_Deal = 5;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_KeinDeal_15_00"); //No, no va así. ¡Digamos 6!
	AI_Output (self, other, "DIA_Kardif_Hallo_KeinDeal_14_01"); //Eres una rata, ¿lo sabes? Bueno, si insistes, que sean 6 monedas de oro por cada noticia.
	Kardif_Deal = 6;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TRADE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TRADE_Condition;
	information	 = 	DIA_Kardif_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Dame algo para beber.";
};

func int DIA_Kardif_TRADE_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Kardif_TRADE_15_00"); //Dame algo para beber.
};
///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TradeInfo		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TradeInfo_Condition;
	information	 = 	DIA_Kardif_TradeInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"Necesito información.";
};

func int DIA_Kardif_TradeInfo_Condition ()
{
	if (Kardif_OneQuestion == FALSE)
	&& (Kardif_Deal > 0)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_TradeInfo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_TradeInfo_15_00"); //Necesito información.

	Kardif_OneQuestion = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
FUNC VOID B_SayKardifZuwenigGold()
{
	AI_Output (self,other, "B_SayKardifZuwenigGold_14_00");//Regresa cuando tengas oro suficiente.
};
instance DIA_Kardif_Buerger		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Buerger_Condition;
	information	 = 	DIA_Kardif_Buerger_Info;
	permanent    =  TRUE;
	description	 = 	"¿Quiénes están entre los ciudadanos influyentes de esta ciudad?";
};
//-------------------------------------------
var int DIA_Kardif_Buerger_permanent;
//-------------------------------------------
func int DIA_Kardif_Buerger_Condition ()
{	
	if (DIA_Kardif_Buerger_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Buerger_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Buerger_15_00"); //¿Quiénes están entre los ciudadanos influyentes de esta ciudad?
		AI_Output (self, other, "DIA_Kardif_Buerger_14_01"); //No vas a encontrar a ninguno aquí abajo, en el puerto. El único hombre poderoso aquí es Lehmar.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_02"); //El prestamista no es muy popular, pero tiene oro y otros ciudadanos influyentes le deben dinero.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_03"); //Los comerciantes y los artesanos también tienen mucha influencia. Demasiada, si me preguntas.
		
		
		DIA_Kardif_Buerger_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

// *****************************************************
//						Lehmar
// *****************************************************

instance DIA_Kardif_Lehmar	(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lehmar_Condition;
	information	 = 	DIA_Kardif_Lehmar_Info;
	permanent    =  TRUE;
	description	 = 	"¿Quién está en deuda con Lehmar?";
};
//-------------------------------------------
var int DIA_Kardif_Lehmar_permanent;
//-------------------------------------------
func int DIA_Kardif_Lehmar_Condition ()
{	
	if (DIA_Kardif_Lehmar_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Buerger_permanent == TRUE) //(Knows perm Info)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lehmar_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Add_15_00"); //¿Quién está en deuda con Lehmar?
		AI_Output (self, other, "DIA_Kardif_Add_14_01"); //(Se ríe) Si quieres saberlo, deberías echar un vistazo a su libro de cuentas.
		AI_Output (self, other, "DIA_Kardif_Add_14_02"); //Solo que sería bastante complicado hacerlo sin que se diera cuenta.
		AI_Output (self, other, "DIA_Kardif_Add_14_03"); //Por lo que yo sé, siempre lo lleva encima...
		
		DIA_Kardif_Lehmar_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};



///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Arbeit		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Arbeit_Condition;
	information	 = 	DIA_Kardif_Arbeit_Info;
	permanent    =  TRUE;
	description	 = 	"¿Dónde puedo encontrar trabajo?";
};
//-------------------------------------------
var int DIA_Kardif_Arbeit_permanent;
//-------------------------------------------
func int DIA_Kardif_Arbeit_Condition ()
{	
	if (DIA_Kardif_Arbeit_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Arbeit_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Arbeit_15_00"); //¿Dónde puedo encontrar trabajo?
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_01"); //No es probable que encuentres trabajo aquí en el puerto. Para eso tienes que acudir a los artesanos de la parte baja de la ciudad.
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_02"); //Pero si empuñas una hoja decente, podrías ir a retar a Alrik. Lucha por dinero, detrás del almacén.
			
	DIA_Kardif_Arbeit_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Kardif_MissingPeople		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Addon_Kardif_MissingPeople_Condition;
	information	 = 	DIA_Addon_Kardif_MissingPeople_Info;
	permanent    =  TRUE;
	description	 = 	"¿Qué sabes sobre los ciudadanos desaparecidos?";
};
//-------------------------------------------
var int DIA_Addon_Kardif_MissingPeople_permanent;
//-------------------------------------------
func int DIA_Addon_Kardif_MissingPeople_Condition ()
{	
	if (DIA_Addon_Kardif_MissingPeople_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Kardif_MissingPeople_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Addon_Kardif_MissingPeople_15_00"); //¿Qué sabes sobre los ciudadanos desaparecidos?
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_01"); //Lo único que sé es que ha desaparecido gente en los últimos días.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_02"); //Dicen que es especialmente grave aquí, en el puerto. Quizá deberías preguntar por la zona.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_03"); //También ha habido casos en la parte baja de la ciudad.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_04"); //Si quieres saber más, deberías hablar con Coragon.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_05"); //Tiene su bar en la parte baja de la ciudad, así que seguro que ha oído algo.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_06"); //Tal vez Halvor, el pescadero que hay junto al muelle, sepa algo. Trata con mucha gente.
		
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kardif dice que debería preguntar a Coragon, el dueño de la taberna de la parte baja de la ciudad, y a Halvor, el pescadero del puerto, sobre la gente desaparecida."); 

		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Lernen		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lernen_Condition;
	information	 = 	DIA_Kardif_Lernen_Info;
	permanent    =  TRUE;
	description	 = 	"¿Quién puede enseñarme algo aquí?";
};
//-------------------------------------------
var int DIA_Kardif_Lernen_permanent;
//-------------------------------------------
func int DIA_Kardif_Lernen_Condition ()
{	
	if (DIA_Kardif_Lernen_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lernen_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Lernen_15_00"); //¿Quién puede enseñarme algo aquí?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_01"); //Hay unas cuantas personas competentes, aquí en el barrio portuario.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_02"); //Carl el herrero es un tipo duro. Apuesto a que puede enseñarte a ponerte cachas.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_03"); //Alrik sabe mucho sobre lucha. Y Lares es un pícaro inteligente. Suele andar por el puerto.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_04"); //Y si estás suficientemente chalado como para ir a ver al viejo Ignaz, él lo sabe todo sobre la alemi... almiq... pociones.
		AI_Output (other, self, "DIA_Kardif_Lernen_15_05"); //¿Dónde puedo encontrar a toda esa gente?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_06"); //(Quejoso) Chico, el Rey habrá ganado su guerra contra los orcos antes de que haya terminado de explicártelo.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_07"); //Echa un vistazo por el distrito portuario y seguro que los encontrarás. Y si no te orientas, ve a donde Brahim y cómprate un mapa.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_08"); //ÉL es fácil de encontrar. Su choza está justo al lado de mi taberna. (Murmura) Debería haberte cobrado doble por ésa.
		
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		
		
		B_LogEntry (Topic_CityTeacher,"Carl, el herrero del distrito portuario, me puede ayudar a hacerme más fuerte.");
		B_LogEntry (Topic_CityTeacher,"Lares me puede ayudar a mejorar mi destreza.");
		B_LogEntry (Topic_CityTeacher,"Alrik me puede entrenar en el combate con armas de una mano. Suele perder el tiempo detrás del almacén del distrito del puerto.");
		B_LogEntry (Topic_CityTeacher,"Ignaz me puede mostrar fórmulas para destilar pociones. Vive en el distrito de los muelles.");
	
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Brahim dibuja y vende mapas cerca del puerto.");
		
		
	DIA_Kardif_Lernen_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk_Condition;
	information	 = 	DIA_Kardif_Diebeswerk_Info;
	permanent    =  TRUE;
	description	 = 	"¿Hay algún trabajo ''especial'' que pueda hacer...?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk_Condition ()
{	
	if (DIA_Kardif_Diebeswerk_permanent == FALSE)
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	//&& (other.guild == GIL_NONE) 
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk_15_00"); //¿Hay algún trabajo ''especial'' que pueda hacer por aquí y que me dé dinero rápido?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_01"); //¿Algo especial, dices? Mmm...
		AI_PlayAni(self, "T_SEARCH");
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_02"); //… entonces ve a hablar con Nagur. Quizá él pueda ayudarte.
	
		DIA_Kardif_Diebeswerk_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk2		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk2_Condition;
	information	 = 	DIA_Kardif_Diebeswerk2_Info;
	permanent    =  TRUE;
	description	 = 	"¿Tienes algo ''especial'' para que yo haga?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk2_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk2_Condition ()
{	
	if (DIA_Kardif_Diebeswerk2_permanent == FALSE)
	&& (DIA_Kardif_Diebeswerk_permanent == TRUE) //andere Info
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	&& (other.guild != GIL_KDF) 
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk2_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_00"); //¿Tienes algo ''especial'' para que yo haga?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_01"); //Tengo algo para ti, pero solo te interesaría si fueras un hombre de talentos versátiles.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_02"); //¿Qué tienes?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_03"); //Bueno, Zuris, el vendedor de pociones del mercado, tiene un invitado actualmente: Daron, el mago de fuego.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_04"); //¿Y?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_05"); //Encargó un cofre nuevo especial a Thorben, el carpintero.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_06"); //Dicen que este Daron ha traído un montón de cosas valiosas consigo. Pero tú no me has oído decir esto, ¿entiendes?
		
		DIA_Kardif_Diebeswerk2_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's ich will doch keine Info kaufen 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Zurueck		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Zurueck_Condition;
	information	 = 	DIA_Kardif_Zurueck_Info;
	permanent    =  TRUE;
	description	 = 	DIALOG_BACK;
};
func int DIA_Kardif_Zurueck_Condition ()
{	
	if (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Zurueck_Info ()
{
	Kardif_OneQuestion = FALSE;
	Info_ClearChoices (DIA_Kardif_Zurueck);
};
///////////////////////////////////////////////////////////////////////
//	Info DOPE
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DOPE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_DOPE_Condition;
	information	 = 	DIA_Kardif_DOPE_Info;
	permanent    =  TRUE;
	description	 = 	"¿Dónde puedo comprar hierba aquí?";
};
var int DIA_Kardif_DOPE_perm;
func int DIA_Kardif_DOPE_Condition ()
{
	if 	(MIS_Andre_REDLIGHT == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&&  (DIA_Kardif_DOPE_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_DOPE_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Kardif_DOPE_15_01"); //¿Dónde puedo comprar hierba aquí?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_00"); //Pues aquí no, eso seguro. No tengo nada que ver con esas cosas.
	}
	else
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_02"); //Aquí no, seguro.
		AI_Output (other, self, "DIA_Kardif_DOPE_15_03"); //De acuerdo, entonces ¿dónde?
		AI_Output (self, other, "DIA_Kardif_DOPE_14_04"); //Si fuera tú, hablaría con Meldor. Después de todo, él fuma todo el rato.
		
		DIA_Kardif_DOPE_perm = TRUE;
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Paket		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  3;
	condition	 = 	DIA_Kardif_Paket_Condition;
	information	 = 	DIA_Kardif_Paket_Info;
	permanent	 =  TRUE;
	description	 = 	"¿Qué sabes de un paquete de hierba de ciénaga?";
};
var int DIA_Kardif_Paket_perm;
func int DIA_Kardif_Paket_Condition ()
{
	if 	(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Paket_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Paket_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Paket_15_00"); //¿Qué sabes de un paquete de hierba de ciénaga?
		AI_Output (self, other, "DIA_Kardif_Paket_14_01"); //Quien posea dicho paquete es un hombre rico. ¡Y probablemente, también un hombre muy relajado!
		AI_Output (other, self, "DIA_Kardif_Paket_15_02"); //No intentes engañarme. Sabes algo. Así que, ¡escúpelo!
		AI_Output (self, other, "DIA_Kardif_Paket_14_03"); //De acuerdo, de acuerdo. El tipo vino a mi taberna el otro día. Uno de los mercenarios.
		AI_Output (self, other, "DIA_Kardif_Paket_14_04"); //Dijo que había vendido un paquete de hierba de ciénaga en el puerto, pero claro, estaba totalmente pedo. Eso es todo lo que sé.
		
		DIA_Kardif_Paket_perm = TRUE;
		
		B_LogEntry (TOPIC_WAREHOUSE,"Kardif ha estado hablando con un mercenario. El tipo en cuestión tenía un fardo de hierba del pantano que quería vender.");
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info SendAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_SENDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_SENDATTILA_Condition;
	information	 = 	DIA_Kardif_SENDATTILA_Info;
	important	 = 	TRUE;
};

func int DIA_Kardif_SENDATTILA_Condition ()
{
	if (MIS_ThiefGuild_sucked == TRUE)
	|| (Diebesgilde_Okay >= 3)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Kardif_SENDATTILA_Info ()
{
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_00"); //Oye tú, ven para acá. Tengo algo para ti.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_01"); //Había un tipo aquí que insistía en hablar contigo.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_02"); //Como no estabas aquí, me dijo que te diera un mensaje.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_03"); //Quiere reunirse contigo. Detrás de la pescadería de Halvor.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_04"); //Esta información es gratis. ¡Pero esto es una excepción, chaval! Si quieres saber algo más, tendrás que pagar.
	AI_Output (other, self, "DIA_Kardif_SENDATTILA_15_05"); //¿Qué aspecto tenía el tipo?
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_06"); //Podría decírtelo, pero tienes que pagar por ello, amigo mío. (Sonríe).
	
	if (Kardif_Deal == 0)
	{
		AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Cada información que te dé te costará 10 monedas de oro.
		Kardif_Deal = 10;
	};
	Wld_InsertNpc (VLK_494_Attila, "NW_CITY_ENTRANCE_01");
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Kerl		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_Kerl_Condition;
	information	 = 	DIA_Kardif_Kerl_Info;
	permanent    =  TRUE;
	description	 = 	"¿Qué aspecto tenía el tipo?";
};
//----------------------------------
var int DIA_Kardif_Kerl_permanent;
//----------------------------------
func int DIA_Kardif_Kerl_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kardif_SENDATTILA)
	&& (Attila.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Kerl_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Kerl_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Kerl_15_00"); //¿Qué aspecto tenía el tipo?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_01"); //Bueno, bastante alto, moreno y fuerte, pero sin uniforme. Un tanto... amenazador.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_02"); //¿Y su cara?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_03"); //¿Su cara? Cuando me miró, me alegré de que no hubiera venido a buscarme a mí.
		AI_Output (self, other, "DIA_Kardif_Kerl_14_04"); //Había algo espeluznante en sus ojos. De todas formas, creo que deberías ir a verlo. Esto promete ponerse interesante.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_05"); //Sí... la cuestión es... para quién...
		
		DIA_Kardif_Kerl_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DEFEATEDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_DEFEATEDATTILA_Condition;
	information	 = 	DIA_Kardif_DEFEATEDATTILA_Info;
	permanent    =  FALSE;
	description	 = 	"¡Ese bastardo intentó matarme!";
};

func int DIA_Kardif_DEFEATEDATTILA_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Attila_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info ()
{
	AI_Output (other, self, "DIA_Kardif_DEFEATEDATTILA_15_00"); //¡Ese bastardo intentó matarme!
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_01"); //Oye, ¿y cómo iba yo a saberlo? Lo único que hice fue pasar cierta información.
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_02"); //Si alguien está decidido a pisotearte, supongo que tendrá sus razones.

	B_GivePlayerXP (XP_Kardif_Blame4Attila);
	
	B_KillNpc	(Attila);
	Npc_RemoveInvItem	(Attila, ItMi_OldCoin);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Zeichen   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 2;
	condition   = DIA_Kardif_Zeichen_Condition;
	information = DIA_Kardif_Zeichen_Info;
	permanent   = FALSE;
	description = "(Hacer la señal de los ladrones)";
};

FUNC INT DIA_Kardif_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_00");//Ah, estás involucrado con la banda. De acuerdo. En ese caso, tengo algo para ti.
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_01");//(Quedamente) Si alguna vez necesitas ganzúas, ven a verme. Aún me quedan algunas. Basta con que me pidas algo de beber.
	
	CreateInvItems (self, ItKe_Lockpick, 20);
};

//###########################
//##
//##	Kapitel 5
//##
//###########################

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Crew   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 51;
	condition   = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent   = FALSE;
	description = "Aún necesito unos cuantos marineros.";
};

FUNC INT DIA_Kardif_Crew_Condition()
{
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Crew_Info()
{
	AI_Output (other,self , "DIA_Kardif_Crew_15_00");//Aún necesito unos cuantos marineros.
	AI_Output (self, other, "DIA_Kardif_Crew_14_01");//Mala época, amigo mío. No encontrarás marineros en todo Khorinis. La mayoría se han ido de la ciudad.
	AI_Output (self, other, "DIA_Kardif_Crew_14_02");//Pero con un buen capitán no sería demasiado difícil encontrar a un puñado de chicos listos y convertirlos en una tripulación decente en poco tiempo.
	AI_Output (other,self , "DIA_Kardif_Crew_15_03");//¿Dónde puedo encontrar un capitán?
	AI_Output (self, other, "DIA_Kardif_Crew_14_04");//Estás preguntando a la persona equivocada. Yo solo llevo esta taberna.
	if (Npc_IsDead (Jack) == FALSE)
	{
		if (SCGoTCaptain == FALSE)
		{
			Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                           
			Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                         
			B_LogEntry (TOPIC_Captain,"Kardif me ha enviado con el viejo Jack. Por lo visto, debería poder ayudarme.");
	    };
		AI_Output (self, other, "DIA_Kardif_Crew_14_05");//Ve a hablar con el viejo Jack. Lleva rondando por el puerto más de lo que recuerdo. Para todo lo relacionado con el mar, él es tu hombre.
	};
};




























