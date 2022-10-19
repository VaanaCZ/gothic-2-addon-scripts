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
	description	 = 	"�Qu� pasa?";
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
	AI_Output (other, self, "DIA_Kardif_Hi_15_00"); //�C�mo van las cosas?
	AI_Output (self, other, "DIA_Kardif_Hi_14_01"); //Si quieres beber algo, tendr�s que pedirlo.
	
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
	description	 = 	"Apuesto a que te enteras de un mont�n de cosas...";
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
	AI_Output (other, self, "DIA_Kardif_Hallo_15_00"); //Apuesto a que te enteras de un mont�n de cosas...
	AI_Output (self, other, "DIA_Kardif_Hallo_14_01"); //�Y a ti qu� te importa?
	AI_Output (other, self, "DIA_Kardif_Hallo_15_02"); //Siempre estoy atento a las noticias.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_03"); //�Tienes tambi�n tu bolsillo abierto?
	AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Cada informaci�n que te d� te costar� 10 monedas de oro.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, el propietario de la taberna del puerto, trafica con informaci�n.");
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"No te dar� m�s de 5 por tu informaci�n.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Olv�dalo. Conseguir� la informaci�n en otra parte.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"De acuerdo, acepto.",DIA_Kardif_Hallo_Zehn);	
};
FUNC VOID DIA_Kardif_Hallo_Zehn()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Zehn_15_00"); //De acuerdo, acepto.
	AI_Output (self, other, "DIA_Kardif_Hallo_Zehn_14_01"); //Has hecho un buen trato (sonr�e). Estoy siempre a tu servicio.
	
	Kardif_Deal = 10;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Angebot()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Angebot_15_00"); //No te dar� m�s de 5 por tu informaci�n.
	AI_Output (self, other, "DIA_Kardif_Hallo_Angebot_14_01"); //�Qu�? �5 monedas de oro? �Intentas arruinarme? (Se lo piensa brevemente) Que sean 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"No, no va as�. �Digamos 6!",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Bien, 7 monedas de oro me parece justo.",DIA_Kardif_Hallo_Sieben);
};
FUNC VOID DIA_Kardif_Hallo_Hart()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Hart_15_00"); //Olv�dalo. Conseguir� la informaci�n en otra parte.
	AI_Output (self, other, "DIA_Kardif_Hallo_Hart_14_01"); //De acuerdo, de acuerdo... bajar� a 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Bien, 7 monedas de oro me parece justo.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"No, no necesito tu informaci�n tan desesperadamente.",DIA_Kardif_Hallo_Ablehnen);
};
FUNC VOID DIA_Kardif_Hallo_Sieben()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Sieben_15_00"); //Bien, 7 monedas de oro me parece justo.
	AI_Output (self, other, "DIA_Kardif_Hallo_Sieben_14_01"); //(Sonr�e) Una sabia decisi�n. Pues entonces, si hay algo que quieras saber, preg�ntame.
	
	Kardif_Deal = 7;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Ablehnen_15_00"); //No, no necesito tu informaci�n tan desesperadamente.
	AI_Output (self, other, "DIA_Kardif_Hallo_Ablehnen_14_01"); //Oye, espera... (suspira) De acuerdo, 5 monedas de oro. �Pero �sa es mi �ltima oferta!
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"�Por qu� no lo dijiste directamente?",DIA_Kardif_Hallo_Fuenf);

};
FUNC VOID DIA_Kardif_Hallo_Fuenf()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Fuenf_15_00"); //�Por qu� no lo dijiste directamente?
	AI_Output (self, other, "DIA_Kardif_Hallo_Fuenf_14_01"); //Oh, estoy un poco bajo de forma. Pero da igual, trato hecho.
	Kardif_Deal = 5;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_KeinDeal_15_00"); //No, no va as�. �Digamos 6!
	AI_Output (self, other, "DIA_Kardif_Hallo_KeinDeal_14_01"); //Eres una rata, �lo sabes? Bueno, si insistes, que sean 6 monedas de oro por cada noticia.
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
	description	 = 	"Necesito informaci�n.";
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
	AI_Output (other, self, "DIA_Kardif_TradeInfo_15_00"); //Necesito informaci�n.

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
	description	 = 	"�Qui�nes est�n entre los ciudadanos influyentes de esta ciudad?";
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
		AI_Output (other, self, "DIA_Kardif_Buerger_15_00"); //�Qui�nes est�n entre los ciudadanos influyentes de esta ciudad?
		AI_Output (self, other, "DIA_Kardif_Buerger_14_01"); //No vas a encontrar a ninguno aqu� abajo, en el puerto. El �nico hombre poderoso aqu� es Lehmar.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_02"); //El prestamista no es muy popular, pero tiene oro y otros ciudadanos influyentes le deben dinero.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_03"); //Los comerciantes y los artesanos tambi�n tienen mucha influencia. Demasiada, si me preguntas.
		
		
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
	description	 = 	"�Qui�n est� en deuda con Lehmar?";
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
		AI_Output (other, self, "DIA_Kardif_Add_15_00"); //�Qui�n est� en deuda con Lehmar?
		AI_Output (self, other, "DIA_Kardif_Add_14_01"); //(Se r�e) Si quieres saberlo, deber�as echar un vistazo a su libro de cuentas.
		AI_Output (self, other, "DIA_Kardif_Add_14_02"); //Solo que ser�a bastante complicado hacerlo sin que se diera cuenta.
		AI_Output (self, other, "DIA_Kardif_Add_14_03"); //Por lo que yo s�, siempre lo lleva encima...
		
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
	description	 = 	"�D�nde puedo encontrar trabajo?";
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
		AI_Output (other, self, "DIA_Kardif_Arbeit_15_00"); //�D�nde puedo encontrar trabajo?
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_01"); //No es probable que encuentres trabajo aqu� en el puerto. Para eso tienes que acudir a los artesanos de la parte baja de la ciudad.
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_02"); //Pero si empu�as una hoja decente, podr�as ir a retar a Alrik. Lucha por dinero, detr�s del almac�n.
			
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
	description	 = 	"�Qu� sabes sobre los ciudadanos desaparecidos?";
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
		AI_Output (other, self, "DIA_Addon_Kardif_MissingPeople_15_00"); //�Qu� sabes sobre los ciudadanos desaparecidos?
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_01"); //Lo �nico que s� es que ha desaparecido gente en los �ltimos d�as.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_02"); //Dicen que es especialmente grave aqu�, en el puerto. Quiz� deber�as preguntar por la zona.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_03"); //Tambi�n ha habido casos en la parte baja de la ciudad.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_04"); //Si quieres saber m�s, deber�as hablar con Coragon.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_05"); //Tiene su bar en la parte baja de la ciudad, as� que seguro que ha o�do algo.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_06"); //Tal vez Halvor, el pescadero que hay junto al muelle, sepa algo. Trata con mucha gente.
		
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kardif dice que deber�a preguntar a Coragon, el due�o de la taberna de la parte baja de la ciudad, y a Halvor, el pescadero del puerto, sobre la gente desaparecida."); 

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
	description	 = 	"�Qui�n puede ense�arme algo aqu�?";
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
		AI_Output (other, self, "DIA_Kardif_Lernen_15_00"); //�Qui�n puede ense�arme algo aqu�?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_01"); //Hay unas cuantas personas competentes, aqu� en el barrio portuario.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_02"); //Carl el herrero es un tipo duro. Apuesto a que puede ense�arte a ponerte cachas.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_03"); //Alrik sabe mucho sobre lucha. Y Lares es un p�caro inteligente. Suele andar por el puerto.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_04"); //Y si est�s suficientemente chalado como para ir a ver al viejo Ignaz, �l lo sabe todo sobre la alemi... almiq... pociones.
		AI_Output (other, self, "DIA_Kardif_Lernen_15_05"); //�D�nde puedo encontrar a toda esa gente?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_06"); //(Quejoso) Chico, el Rey habr� ganado su guerra contra los orcos antes de que haya terminado de explic�rtelo.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_07"); //Echa un vistazo por el distrito portuario y seguro que los encontrar�s. Y si no te orientas, ve a donde Brahim y c�mprate un mapa.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_08"); //�L es f�cil de encontrar. Su choza est� justo al lado de mi taberna. (Murmura) Deber�a haberte cobrado doble por �sa.
		
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		
		
		B_LogEntry (Topic_CityTeacher,"Carl, el herrero del distrito portuario, me puede ayudar a hacerme m�s fuerte.");
		B_LogEntry (Topic_CityTeacher,"Lares me puede ayudar a mejorar mi destreza.");
		B_LogEntry (Topic_CityTeacher,"Alrik me puede entrenar en el combate con armas de una mano. Suele perder el tiempo detr�s del almac�n del distrito del puerto.");
		B_LogEntry (Topic_CityTeacher,"Ignaz me puede mostrar f�rmulas para destilar pociones. Vive en el distrito de los muelles.");
	
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
	description	 = 	"�Hay alg�n trabajo ''especial'' que pueda hacer...?";
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
		AI_Output (other, self, "DIA_Kardif_Diebeswerk_15_00"); //�Hay alg�n trabajo ''especial'' que pueda hacer por aqu� y que me d� dinero r�pido?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_01"); //�Algo especial, dices? Mmm...
		AI_PlayAni(self, "T_SEARCH");
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_02"); //� entonces ve a hablar con Nagur. Quiz� �l pueda ayudarte.
	
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
	description	 = 	"�Tienes algo ''especial'' para que yo haga?";
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
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_00"); //�Tienes algo ''especial'' para que yo haga?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_01"); //Tengo algo para ti, pero solo te interesar�a si fueras un hombre de talentos vers�tiles.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_02"); //�Qu� tienes?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_03"); //Bueno, Zuris, el vendedor de pociones del mercado, tiene un invitado actualmente: Daron, el mago de fuego.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_04"); //�Y?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_05"); //Encarg� un cofre nuevo especial a Thorben, el carpintero.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_06"); //Dicen que este Daron ha tra�do un mont�n de cosas valiosas consigo. Pero t� no me has o�do decir esto, �entiendes?
		
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
	description	 = 	"�D�nde puedo comprar hierba aqu�?";
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
	
	AI_Output (other, self, "DIA_Kardif_DOPE_15_01"); //�D�nde puedo comprar hierba aqu�?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_00"); //Pues aqu� no, eso seguro. No tengo nada que ver con esas cosas.
	}
	else
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_02"); //Aqu� no, seguro.
		AI_Output (other, self, "DIA_Kardif_DOPE_15_03"); //De acuerdo, entonces �d�nde?
		AI_Output (self, other, "DIA_Kardif_DOPE_14_04"); //Si fuera t�, hablar�a con Meldor. Despu�s de todo, �l fuma todo el rato.
		
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
	description	 = 	"�Qu� sabes de un paquete de hierba de ci�naga?";
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
		AI_Output (other, self, "DIA_Kardif_Paket_15_00"); //�Qu� sabes de un paquete de hierba de ci�naga?
		AI_Output (self, other, "DIA_Kardif_Paket_14_01"); //Quien posea dicho paquete es un hombre rico. �Y probablemente, tambi�n un hombre muy relajado!
		AI_Output (other, self, "DIA_Kardif_Paket_15_02"); //No intentes enga�arme. Sabes algo. As� que, �esc�pelo!
		AI_Output (self, other, "DIA_Kardif_Paket_14_03"); //De acuerdo, de acuerdo. El tipo vino a mi taberna el otro d�a. Uno de los mercenarios.
		AI_Output (self, other, "DIA_Kardif_Paket_14_04"); //Dijo que hab�a vendido un paquete de hierba de ci�naga en el puerto, pero claro, estaba totalmente pedo. Eso es todo lo que s�.
		
		DIA_Kardif_Paket_perm = TRUE;
		
		B_LogEntry (TOPIC_WAREHOUSE,"Kardif ha estado hablando con un mercenario. El tipo en cuesti�n ten�a un fardo de hierba del pantano que quer�a vender.");
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
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_00"); //Oye t�, ven para ac�. Tengo algo para ti.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_01"); //Hab�a un tipo aqu� que insist�a en hablar contigo.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_02"); //Como no estabas aqu�, me dijo que te diera un mensaje.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_03"); //Quiere reunirse contigo. Detr�s de la pescader�a de Halvor.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_04"); //Esta informaci�n es gratis. �Pero esto es una excepci�n, chaval! Si quieres saber algo m�s, tendr�s que pagar.
	AI_Output (other, self, "DIA_Kardif_SENDATTILA_15_05"); //�Qu� aspecto ten�a el tipo?
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_06"); //Podr�a dec�rtelo, pero tienes que pagar por ello, amigo m�o. (Sonr�e).
	
	if (Kardif_Deal == 0)
	{
		AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Cada informaci�n que te d� te costar� 10 monedas de oro.
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
	description	 = 	"�Qu� aspecto ten�a el tipo?";
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
		AI_Output (other, self, "DIA_Kardif_Kerl_15_00"); //�Qu� aspecto ten�a el tipo?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_01"); //Bueno, bastante alto, moreno y fuerte, pero sin uniforme. Un tanto... amenazador.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_02"); //�Y su cara?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_03"); //�Su cara? Cuando me mir�, me alegr� de que no hubiera venido a buscarme a m�.
		AI_Output (self, other, "DIA_Kardif_Kerl_14_04"); //Hab�a algo espeluznante en sus ojos. De todas formas, creo que deber�as ir a verlo. Esto promete ponerse interesante.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_05"); //S�... la cuesti�n es... para qui�n...
		
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
	description	 = 	"�Ese bastardo intent� matarme!";
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
	AI_Output (other, self, "DIA_Kardif_DEFEATEDATTILA_15_00"); //�Ese bastardo intent� matarme!
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_01"); //Oye, �y c�mo iba yo a saberlo? Lo �nico que hice fue pasar cierta informaci�n.
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_02"); //Si alguien est� decidido a pisotearte, supongo que tendr� sus razones.

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
	description = "(Hacer la se�al de los ladrones)";
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
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_00");//Ah, est�s involucrado con la banda. De acuerdo. En ese caso, tengo algo para ti.
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_01");//(Quedamente) Si alguna vez necesitas ganz�as, ven a verme. A�n me quedan algunas. Basta con que me pidas algo de beber.
	
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
	description = "A�n necesito unos cuantos marineros.";
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
	AI_Output (other,self , "DIA_Kardif_Crew_15_00");//A�n necesito unos cuantos marineros.
	AI_Output (self, other, "DIA_Kardif_Crew_14_01");//Mala �poca, amigo m�o. No encontrar�s marineros en todo Khorinis. La mayor�a se han ido de la ciudad.
	AI_Output (self, other, "DIA_Kardif_Crew_14_02");//Pero con un buen capit�n no ser�a demasiado dif�cil encontrar a un pu�ado de chicos listos y convertirlos en una tripulaci�n decente en poco tiempo.
	AI_Output (other,self , "DIA_Kardif_Crew_15_03");//�D�nde puedo encontrar un capit�n?
	AI_Output (self, other, "DIA_Kardif_Crew_14_04");//Est�s preguntando a la persona equivocada. Yo solo llevo esta taberna.
	if (Npc_IsDead (Jack) == FALSE)
	{
		if (SCGoTCaptain == FALSE)
		{
			Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                           
			Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                         
			B_LogEntry (TOPIC_Captain,"Kardif me ha enviado con el viejo Jack. Por lo visto, deber�a poder ayudarme.");
	    };
		AI_Output (self, other, "DIA_Kardif_Crew_14_05");//Ve a hablar con el viejo Jack. Lleva rondando por el puerto m�s de lo que recuerdo. Para todo lo relacionado con el mar, �l es tu hombre.
	};
};




























