///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Martin_EXIT   (C_INFO)
{
	npc         = Mil_350_Addon_Martin;
	nr          = 999;
	condition   = DIA_Addon_Martin_EXIT_Condition;
	information = DIA_Addon_Martin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Martin_PICKPOCKET (C_INFO)
{
	npc			= Mil_350_Addon_Martin;
	nr			= 900;
	condition	= DIA_Addon_Martin_PICKPOCKET_Condition;
	information	= DIA_Addon_Martin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Martin_PICKPOCKET_Condition()
{
	C_Beklauen (65, 77);
};
 
FUNC VOID DIA_Addon_Martin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};
	
func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_MeetingIsRunning		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Martin_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Martin_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Martin_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Martin_MeetingIsRunning_OneTime;
func void DIA_Addon_Martin_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_00"); //As� que t� eres el nuevo, �mh? Bienvenido, hermano del Anillo.
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_01"); //Visita primero a Vatras, quiz�s luego tenga tiempo para ti.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Hallo		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Hallo_Condition;
	information	 = 	DIA_Addon_Martin_Hallo_Info;
	
	important	 = 	TRUE;
};

func int DIA_Addon_Martin_Hallo_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	&& (SC_IsRanger == FALSE)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Martin_Hallo_07_00"); //Eh, t�. Aqu� no hay nada para ti. S�lo pueden entrar los paladines y los que pertenecemos a la milicia.
};


///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_WasMachstDu		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_WasMachstDu_Condition;
	information	 = 	DIA_Addon_Martin_WasMachstDu_Info;

	description	 = 	"�Qu� es lo que hay aqu�?";
};

func int DIA_Addon_Martin_WasMachstDu_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_WasMachstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_WasMachstDu_15_00"); //�Qu� es lo que hay aqu�?
	AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_01"); //Hay un almac�n de provisiones de la guardia real de los paladines.
	
	if (other.guild == GIL_NONE)
	&& (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_02"); //Yo soy el maestro de provisiones de aqu� y me ocupo de que no se pierda material de los paladines, as� que no eres bienvenido.
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_03"); //Las manitas quiteas o te las corto.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_PreTrade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_PreTrade_Condition;
	information	 = 	DIA_Addon_Martin_PreTrade_Info;

	description	 = 	"�Puedes venderme material de los paladines?";
};

func int DIA_Addon_Martin_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_PreTrade_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_00"); //�Puedes venderme material de los paladines?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_01"); //�Quieres comprar? Mh. Digamos que si me puedes compensar por hacer desaparecer cosas de los paladines, quiz� hagamos un trato.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_02"); //�Pasa mucho, lo de que se pierda material?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_03"); //Mientras el maestro de provisiones diga que todo est� en orden, no.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_04"); //Comprendo.
};

///////////////////////////////////////////////////////////////////////
//	Info Farim
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Farim		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Farim_Condition;
	information	 = 	DIA_Addon_Martin_Farim_Info;

	description	 = 	"El pescador Farin tiene problemas con la milicia.";
};

func int DIA_Addon_Martin_Farim_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Farim_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_00"); //El pescador Farim tiene problemas con la milicia. Esos chicos no hacen m�s que robarle.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_01"); //�Y yo qu� tengo que ver con eso?
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_02"); //T� tienes cierta influencia aqu� con los paladines.
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_03"); //Farim necesita tu protecci�n. Te dar� a cambio una parte de sus capturas.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_04"); //Ya te voy entendiendo.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_05"); //(con desprecio) �Pescado! Como si no tuviera bastante de lo que ocuparme.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_06"); //Dile a tu amigo que deber�a venir en persona y contarme exactamente su problema.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_07"); //Me ocupar� de ello.
	
	B_LogEntry (TOPIC_Addon_FarimsFish,	"Martin, maestro de provisiones, se ocupar� del asunto."); 

	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP (XP_Addon_FarimSchutz);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Trade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	80;
	condition	 = 	DIA_Addon_Martin_Trade_Condition;
	information	 = 	DIA_Addon_Martin_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 = 	TRUE;

	description	 = 	"�Qu� puedes ofrecerme?";
};

func int DIA_Addon_Martin_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};
var int DIA_Addon_Martin_Trade_OneTime;
func void DIA_Addon_Martin_Trade_Info ()
{
	if (DIA_Addon_Martin_Trade_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader, LogText_Addon_MartinTrade); 
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};
	
	
	AI_Output	(other, self, "DIA_Addon_Martin_Trade_15_00"); //�Qu� tienes que ofrecer?
	B_GiveTradeInv (self);
	AI_Output	(self, other, "DIA_Addon_Martin_Trade_07_01"); //Pues presta atenci�n.
};


///////////////////////////////////////////////////////////////////////
//	Info Rangerhelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Rangerhelp		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Rangerhelp_Condition;
	information	 = 	DIA_Addon_Martin_Rangerhelp_Info;

	description	 = 	"Me env�a Lares";
};

func int DIA_Addon_Martin_Rangerhelp_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};		
};

func void DIA_Addon_Martin_Rangerhelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_00"); //Me env�a Lares. Dijo que podr�as ayudarme.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_01"); //�Y? �Eso dijo? Pues dispara. �Qu� quieres de m�?
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_02"); //Quiero unirme a la milicia.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_03"); //(r�e) Eso quieres, �eh? No cogemos a in�tiles como t� sin un buen motivo.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_04"); //Probablemente tengas que
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_05"); //D�jate de tonter�as. Dime qu� tengo que hacer para unirme.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_06"); //(sorprendido) Est� bien. Presta atenci�n.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_07"); //D�jame que te diga que el trabajo de un maestro de provisiones es un infierno. Ocuparse de todas las cajas y sacas de aqu� ya es suficientemente malo.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_08"); //Pero cada vez que paso una tarde en la taberna de Kardif, alguien anda revolviendo con las cajas y, cuando vuelvo a la ma�ana siguiente, siempre falta algo.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_09"); //(enfadado) Lo raro es que los paladines nunca ven nada.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_10"); //(molesto) Me estoy volviendo loco. No puedo pasarme toda la noche aqu� como un idiota.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_11"); //Pero t�, por otra parte
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_12"); //Lo capto. Tengo que quedarme vigilando mientras t� vas a la taberna.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_13"); //�Lo tomas o lo dejas?

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Se supone que debo echar un vistazo a las cajas de Martin, maestro de provisiones. Si cazo al tipo que est� causando revuelo con las cajas, Martin me ayudar� a unirme a la milicia."); 

}; 

///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Auftrag		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Auftrag_Condition;
	information	 = 	DIA_Addon_Martin_Auftrag_Info;

	description	 = 	"Te cuidar� esta noche tu caja de provisiones.";
};

func int DIA_Addon_Martin_Auftrag_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_Rangerhelp))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};
};

var int MIS_Addon_Martin_GetRangar_Day;

func void DIA_Addon_Martin_Auftrag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Auftrag_15_00"); //Te cuidar� esta noche tu caja de provisiones.
	AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_01"); //(satisfecho) Estupendo.
	
	if (Wld_IsTime (23,00,04,00))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_02"); //Entonces me ir� a la taberna de Kardif. Y pobre de ti como falte algo a la vuelta.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_03"); //Bien, pues vuelve esta noche y vigila todo. Mientras tanto, yo estar� en la taberna de Kardif.
	};

	B_StartOtherRoutine	(MIL_321_Rangar,"PrePalCampKlau"); 

	Info_ClearChoices	(DIA_Addon_Martin_Auftrag);
	Info_AddChoice	(DIA_Addon_Martin_Auftrag, "(m�s)", DIA_Addon_Martin_Auftrag_weiter );

};

func void DIA_Addon_Martin_Auftrag_weiter ()
{
	MIS_Addon_Martin_GetRangar = LOG_RUNNING;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay(); 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_StartOtherRoutine	(MIL_321_Rangar,"PalCampKlau");
};



// ********************************************************************
// 							Banditen + Waffen
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	From Vatras
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_FromVatras (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_FromVatras_Condition;
	information	= DIA_Addon_Martin_FromVatras_Info;

	description	= "�Buscas al hombre que vende armas a los bandidos?";
};
func int DIA_Addon_Martin_FromVatras_Condition ()
{
	if (Vatras_ToMartin == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_FromVatras_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_00"); //�Buscas al hombre que vende armas a los bandidos?
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_01"); //�Qui�n es?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_02"); //Es Vatras.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_03"); //Oh. �Y qu� sabes sobre el asunto?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_04"); //No mucho, pero podr�a averiguar m�s.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_05"); //(d�ndose cuenta) Ah, con que s
};	
///////////////////////////////////////////////////////////////////////
//	Tell Me
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_TellAll (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_TellAll_Condition;
	information	= DIA_Addon_Martin_TellAll_Info;

	description	= "Dime, �qu� sabes sobre el comerciante de armas?";
};
func int DIA_Addon_Martin_TellAll_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_TellAll_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_TellAll_15_00"); //Dime, �qu� sabes sobre el comerciante de armas?
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_01"); //Escucha. Sabemos que un ciudadano influyente del barrio alto anda detr�s de todo.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_02"); //Y dicen que algunas de las armas provienen de suministros de la milicia.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_03"); //Pero a�n no sabemos qui�n es el responsable.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_04"); //Si tienes narices para hacerte con un grupo de al menos cinco bandidos, tal vez averig�es
	B_LogEntry (TOPIC_Addon_BanditTrader,"Seg�n Martin, el comerciante de armas tiene mucha influencia en el barrio alto."); 
};	
///////////////////////////////////////////////////////////////////////
//	About Bandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_AboutBandits (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_AboutBandits_Condition;
	information	= DIA_Addon_Martin_AboutBandits_Info;

	description	= "�Qu� ocurre CON LOS bandidos?";
};
func int DIA_Addon_Martin_AboutBandits_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_AboutBandits_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_AboutBandits_15_00"); //�Qu� ocurre CON LOS bandidos?
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_01"); //Sabemos que los bandidos est�n bloqueando los caminos que comunican a los granjeros con la ciudad.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_02"); //Adem�s, ha habido un env�o de armas en los �ltimos d�as.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_03"); //Quiz� los bandidos te proporcionen alguna pista para descubr�r al comerciante de armas.
	//AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_04"); //Ich werd sehen, was ich tun kann
	
	MIS_Martin_FindTheBanditTrader = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_BanditTrader,"Los bandidos est�n bloqueando los caminos entre el puerto y las granjas. Quiz� all� encuentre algo con lo que acusar al comerciante de armas."); 
};	

///////////////////////////////////////////////////////////////////////
//	Info Fernando
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Fernando		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Fernando_Condition;
	information	 = 	DIA_Addon_Martin_Fernando_Info;
	permanent	 = 	TRUE;

	description	 = 	"Sobre el comerciante de armas�";
};

func int DIA_Addon_Martin_Fernando_Condition ()
{
	if (MIs_Martin_FindTheBanditTrader == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_00"); //Eh, sobre el comerciante de armas

	if 	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
	||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
	||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	||(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_01"); //Ens��ame lo que traes.
	
		var int FernandoHints;
		FernandoHints = 0;
		
		if 	(
			(Npc_HasItems (other,ItMw_Addon_BanditTrader))
			||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
			||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
			)
			{
				
				if (Npc_HasItems (other,ItMw_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_02"); //Les he quitado este estoque a los bandidos. �Tiene la letra F grabada en la empu�adura!
					FernandoHints = (FernandoHints + 1);
				};
				if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_03"); //Los bandidos ten�an este anillo. Inculpa a un comerciante de ultramar.
					FernandoHints = (FernandoHints + 1);
				};
				if ((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_04"); //Esta lista de env�os de armas y dem�s material para los bandidos viene firmada por un tal Fernando.
					FernandoHints = (FernandoHints + 3);
				};
			
				if (Fernando_HatsZugegeben == TRUE)
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_05"); //Adem�s, Fernando, el viejo comerciante del barrio alto, ha admitido que ha hecho negocios con los bandidos.
					FernandoHints = (FernandoHints + 1);
				};
			}
			else
			{
				AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_06"); //Fernando ha confesado que suministraba armas a los bandidos.
			};
			
		if (FernandoHints >= 3)
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_07"); //Eso es suficiente. Fernando, entonces. Ya ver� lo que se le viene encima.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_08"); //Y parec�a que no hab�a roto un plato en su vida.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_09"); //Me ocupar� de desterrarlo hasta que se pudra.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_10"); //Buen trabajo, amigo.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_11"); //Vatras estar� complacido.
			B_StartOtherRoutine	(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry (TOPIC_Addon_BanditTrader,"Martin se ocupar� de que Fernando cumpla su castigo. Se lo comentar� a Vatras."); 

			B_GivePlayerXP (XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_12"); //�Y? �Nada m�s?
			AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_13"); //Eso es todo.
		
			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_14"); //Esta bien que lo admita, pero sin pruebas reales, no puedo hacer nada m�s.
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_15"); //No quiero hacer el rid�culo ante Lord Hagen. Tienes que conseguir m�s.
			}
			else
			{
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_16"); //No es suficiente. Podr�a ser cualquiera del barrio alto.
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_17"); //Parece que vas a tener que continuar siguiendo el rastro de los bandidos y el env�o de armas hasta averiguar qui�n anda detr�s de todo.
				if (Martin_IrrlichtHint == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_18"); //Quiz� deber�as volver a hablar con Vatras
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_19"); //Expl�camelo otra vez.
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_20"); //Mira. Tienes que averiguar qui�n es el responsable de los env�os de armas a los bandidos y traerme alguna prueba.
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_21"); //Pero tiene que ser una prueba realmente incriminatoria. Si no, no podr� arrestar al tipo.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Perm		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Martin_Perm_Condition;
	information	 = 	DIA_Addon_Martin_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"�Las cajas siguen en su sitio?";
};

func int DIA_Addon_Martin_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Perm_15_00"); //�Las cajas siguen en su sitio?
	
	if (MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay()-2))
	&&	(MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_01"); //(enfadado) Idiota, ten�as que vigilarme las cajas y ahora resulta que faltan cosas.

		if (Wld_IsTime (24,00,03,00))
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_02"); //(en alto) Ve enseguida al almac�n de provisiones en el puerto y coge al granuja que me ha robado, �de acuerdo?
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_03"); //Y esta noche, cuando me vaya, presta m�s atenci�n, �entendido?
		};	
	}	
	else if ((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (Sc_IsRanger == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_04"); //Ve delante y r�ete de m�. QU�DATE en el muelle todo el d�a e intenta vigilar todo ese caos.
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_05"); //Los paladines han tra�do tanta escoria que no tiene ni gracia.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_06"); //No toques nada o llamar� al vigilante, �vale?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GotRangar
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GotRangar		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GotRangar_Condition;
	information	 = 	DIA_Addon_Martin_GotRangar_Info;

	description	 = 	"He atrapado al ladr�n.";
};

func int DIA_Addon_Martin_GotRangar_Condition ()
{
	if (MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	&& (SC_GotRangar == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GotRangar_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_00"); //He atrapado al ladr�n.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_01"); //Rangar es qui�n te est� robando.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_02"); //Vaya, por fin. Al menos ya s� a qui�n debo vigilar. Ese bastardo. Como le pille, se va a armar una buena.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_03"); //Siempre me ha extra�ado que ning�n palad�n viera nada.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_04"); //�Y? �Por qu�?
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_05"); //Es obvio. Esos idiotas no nos distinguen a los de la milicia. Para ellos, todos somos iguales.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_06"); //Un buen trabajo, amigo.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_07"); //Si puedo hacer algo por ti, no lo dudes.

	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Martin_GotRangar_Report);
};

///////////////////////////////////////////////////////////////////////
//	Info GetMiliz
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GetMiliz		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GetMiliz_Condition;
	information	 = 	DIA_Addon_Martin_GetMiliz_Info;

	description	 = 	"Ya sabes lo que quiero de ti.";
};

func int DIA_Addon_Martin_GetMiliz_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_GotRangar))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GetMiliz_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GetMiliz_15_00"); //Ya sabes lo que quiero de ti.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_01"); //Ah, s�. Quieres unirte a la milicia, �verdad?
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_02"); //Ya me has demostrado tus aptitudes.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_03"); //Bien, dig�moslo as�. Prefiero que est�s de nuestra parte a que te al�es con otro.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_04"); //Por eso voy a ayudarte. Toma esta carta de recomendaci�n y ll�vasela a Andr�, nuestro palad�n comandante.
	CreateInvItems (self, ItWr_Martin_MilizEmpfehlung_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Martin_MilizEmpfehlung_Addon, 1);		
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_05"); //Lo encontrar�s en el cuartel. Seguro que te busca un puesto.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Martin me dio una carta de recomendaci�n para Andre, el palad�n comandante. Con ella, Andre me dejar� entrar en la milicia. Lo buscar� en el cuartel."); 
};


