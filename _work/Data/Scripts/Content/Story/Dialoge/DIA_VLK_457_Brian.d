// *****************************************************
// 							EXIT 
// *****************************************************
INSTANCE DIA_Brian_EXIT   (C_INFO)
{
	npc         = VLK_457_Brian;
	nr          = 999;
	condition   = DIA_Brian_EXIT_Condition;
	information = DIA_Brian_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brian_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Brian_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 // ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Brian_PICKPOCKET (C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 900;
	condition	= DIA_Brian_PICKPOCKET_Condition;
	information	= DIA_Brian_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Brian_PICKPOCKET_Condition()
{
	C_Beklauen (55, 100);
};
 
FUNC VOID DIA_Brian_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Brian_PICKPOCKET);
	Info_AddChoice		(DIA_Brian_PICKPOCKET, DIALOG_BACK 		,DIA_Brian_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Brian_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Brian_PICKPOCKET_DoIt);
};

func void DIA_Brian_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Brian_PICKPOCKET);
};
	
func void DIA_Brian_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Brian_PICKPOCKET);
};
// *****************************************************
// 							Hallo 
// *****************************************************
instance DIA_Brian_HALLO		(C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_HALLO_Condition;
	information	= DIA_Brian_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Brian_HALLO_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Brian_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Brian_HALLO_04_00"); //�Nuevo en la ciudad, eh? �Soy Brian! Soy el aprendiz del maestro Harad.
};

// *****************************************************
// 					Wie ist Lehrling? 
// *****************************************************
instance DIA_Brian_AboutLehrling (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_AboutLehrling_Condition;
	information	= DIA_Brian_AboutLehrling_Info;
	permanent 	= FALSE;
	description = "�C�mo es ser el aprendiz del herrero?";
};

func int DIA_Brian_AboutLehrling_Condition ()
{
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};

func void DIA_Brian_AboutLehrling_Info ()
{
	AI_Output (other, self, "DIA_Brian_AboutLehrling_15_00"); //�C�mo es ser el aprendiz del herrero?
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_01"); //�Por qu� lo preguntas? �Quieres ser mi sucesor?
	AI_Output (other, self, "DIA_Brian_AboutLehrling_15_02"); //Tal vez.
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_03"); //Por qu� no... Ya casi he terminado con mi aprendizaje, y luego me voy a ir de la ciudad.
	AI_Output (self, other, "DIA_Brian_AboutLehrling_04_04"); //Pero no por Harad. �l es un buen maestro. He aprendido mucho de �l.
	
};

// *****************************************************
// 					Warum Stadt verlassen? 
// *****************************************************
instance DIA_Brian_WhyLeave (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_WhyLeave_Condition;
	information	= DIA_Brian_WhyLeave_Info;
	permanent 	= FALSE;
	description = "�Por qu� quieres irte de la ciudad?";
};

func int DIA_Brian_WhyLeave_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_WhyLeave_Info ()
{
	AI_Output (other,self , "DIA_Brian_WhyLeave_15_00"); //�Por qu� quieres irte de la ciudad?
	AI_Output (self,other , "DIA_Brian_WhyLeave_04_00"); //�Porque aqu� la gente me saca de mis casillas! Sobre todo los dem�s maestros.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_01"); //A�n recuerdo el l�o que fue conseguir ser admitido como aprendiz de Harad.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_02"); //En serio, todos y cada uno de esos bufones tuvo que opinar sobre el tema.
	AI_Output (self, other, "DIA_Brian_WhyLeave_04_03"); //Quiero decidir por m� mismo a qui�n puedo o no puedo admitir como aprendiz.
};

// *****************************************************
// 						Other Masters
// *****************************************************
instance DIA_Brian_OtherMasters (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 1;
	condition	= DIA_Brian_OtherMasters_Condition;
	information	= DIA_Brian_OtherMasters_Info;
	permanent 	= FALSE;
	description = "�Qui�nes son los otros maestros?";
};
func int DIA_Brian_OtherMasters_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_WhyLeave))
	&&  (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

func void DIA_Brian_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Brian_Add_15_00"); //�Qui�nes son los otros maestros?
	AI_Output (self ,other, "DIA_Brian_Add_04_01"); //Bueno, est� Thorben el carpintero, Bosper el arquero, Constantino el alquimista y Matteo.
	AI_Output (self ,other, "DIA_Brian_Add_04_02"); //�l vende armaduras pero sobre todo es comerciante.
	AI_Output (self ,other, "DIA_Brian_Add_04_03"); //Todos los maestros tienen sus casas aqu� en la calle.
	AI_Output (self ,other, "DIA_Brian_Add_04_04"); //Y la tienda de Constantino est� en el paso subterr�neo hacia el templo.
};



// *****************************************************
// 					�ber Meister Harad
// *****************************************************
instance DIA_Brian_AboutHarad (C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 2;
	condition	= DIA_Brian_AboutHarad_Condition;
	information	= DIA_Brian_AboutHarad_Info;
	permanent 	= FALSE;
	description = "Cu�ntame m�s cosas del maestro Harad.";
};

func int DIA_Brian_AboutHarad_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutHarad_Info ()
{
	AI_Output (other, self, "DIA_Brian_AboutHarad_15_00"); //Cu�ntame m�s cosas del maestro Harad.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_01"); //No est� de muy buen humor ahora mismo.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_02"); //Hace unos pocos d�as, vinieron los paladines y le ordenaron que forjara nuevas espadas para ellos.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_03"); //Incluso le han prohibido vender espadas a otros.
	AI_Output (self, other, "DIA_Brian_AboutHarad_04_04"); //Ahora est� esclavizado d�a y noche para terminar el trabajo lo m�s pronto posible.
};

// *****************************************************
// 					Waffen kaufen?
// *****************************************************
instance DIA_Brian_NEEDWEAPONS		(C_INFO)
{
	npc		 	= VLK_457_Brian;
	nr 			= 4;
	condition	= DIA_Brian_NEEDWEAPONS_Condition;
	information	= DIA_Brian_NEEDWEAPONS_Info;
	permanent 	= FALSE;
	description	= "�Puedo comprarte armas a ti?";
};

func int DIA_Brian_NEEDWEAPONS_Condition ()
{
	return TRUE;
};

func void DIA_Brian_NEEDWEAPONS_Info ()
{
	AI_Output (other, self, "DIA_Brian_NEEDWEAPONS_15_00"); //�Puedo comprarte armas a ti?
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_01"); //En realidad, no. Soy solo un asistente.
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_02"); //Las armas que se fabrican en esta forja son recogidas por la milicia y llevadas a las torres, donde se almacenan.
	AI_Output (self, other, "DIA_Brian_NEEDWEAPONS_04_03"); //Pero si tiene algo que ver con la forja, quiz� pueda ayudarte.
};


// *****************************************************
// 					Schmiede-Stuff kaufen
// *****************************************************

//------------------------------------------------------
var int Brian_Trade_einmal;

instance DIA_Brian_WASKAUFEN		(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 4;
	condition	= DIA_Brian_WASKAUFEN_Condition;
	information	= DIA_Brian_WASKAUFEN_Info;
	permanent	= TRUE;
	description	= "�Qu� puedo obtener de ti?";
	trade		= TRUE;
};

func int DIA_Brian_WASKAUFEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Brian_NEEDWEAPONS))
	{
		return TRUE;
	};
};

func void DIA_Brian_WASKAUFEN_Info ()
{
	AI_Output			(other, self, "DIA_Brian_WASKAUFEN_15_00"); //�Qu� puedo obtener de ti?
	B_GiveTradeInv (self);

	if (Npc_IsDead(Harad))
	{
		AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_01"); //Si todav�a me quedan un par de lingotes de acero, puedes qued�rtelos. Me temo que eso es todo.
		
		if (MIS_Jack_NewLighthouseOfficer == 0)
		{
			AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_02"); //Como Harad ya no est� m�s aqu�, la milicia no me quita el ojo de encima.
			AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_03"); //No tengo permiso para seguir llevando la herrer�a. Tienen miedo de que lo venda todo y salga pitando.
		};
	}
	else
	{
		AI_Output			(self, other, "DIA_Brian_WASKAUFEN_04_05"); //Puedo venderte unos lingotes de acero.
	};
	
	if (Brian_Trade_Einmal == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Brian, el ayudante de Harad, vende barras de acero."); 
		Brian_Trade_Einmal = TRUE;
	};
	Npc_RemoveInvItems (self,ItMiSwordblade,Npc_HasItems (self,ItMiSwordblade));
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Brian_KAP3_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP3_EXIT_Condition;
	information	= DIA_Brian_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//*********************************************************************
//	Kannst du auch Schmuckst�cke reparieren?
//*********************************************************************
instance DIA_Brian_RepairNecklace		(C_INFO)
{
	npc		 	 = 	VLK_457_Brian;
	nr           = 	8;
	condition	 = 	DIA_Brian_RepairNecklace_Condition;
	information	 = 	DIA_Brian_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"�Puedes reparar joyas?";
};

func int DIA_Brian_RepairNecklace_Condition ()
{
	if 	(
		(MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
		&&	 	(
				(Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
				|| 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE)
				)
		) 
		{
			return TRUE;
		};
};

func void DIA_Brian_RepairNecklace_Info ()
{
	AI_Output (other,self ,"DIA_Brian_RepairNecklace_15_00"); //�Puedes reparar joyas?
	AI_Output (self	,other,"DIA_Brian_RepairNecklace_04_01"); //Soy solo un ayudante. Me doy con un canto en los dientes si tan solo me dejan fabricar una daga.
	
	if ((Npc_IsDead (Harad))== FALSE)
	{
		AI_Output (self ,other,"DIA_Brian_RepairNecklace_04_02"); //�Joyas? Tendr�s que preguntarle al maestro.
	};
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Brian_KAP4_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP4_EXIT_Condition;
	information	= DIA_Brian_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Brian_KAP5_EXIT(C_INFO)
{
	npc			= VLK_457_Brian;
	nr			= 999;
	condition	= DIA_Brian_KAP5_EXIT_Condition;
	information	= DIA_Brian_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Brian_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Brian_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NewLighthouseOfficer
///////////////////////////////////////////////////////////////////////
instance DIA_Brian_NEWLIGHTHOUSEOFFICER		(C_INFO)
{
	npc		 = 	VLK_457_Brian;
	nr		 = 	51;
	condition	 = 	DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition;
	information	 = 	DIA_Brian_NEWLIGHTHOUSEOFFICER_Info;

	description	 = 	"Me han dicho que est�s interesado en el viejo faro de Jack.";
};

func int DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition ()
{
	if (Kapitel == 5)	
	&& (MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	
	&& (Npc_KnowsInfo(other, DIA_Brian_NEEDWEAPONS))
		{
			return TRUE;
		};
};

func void DIA_Brian_NEWLIGHTHOUSEOFFICER_Info ()
{
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00"); //Me han dicho que est�s interesado en el viejo faro de Jack.
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01"); //Jack est� considerando volver al mar. Pero entonces su faro quedar�a descuidado.
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02"); //Pero deber�a quedar claro para Jack que transformar� su faro en una herrer�a cuando se vaya.
	AI_Output			(other, self, "DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03"); //�Es eso un problema?
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04"); //(Se r�e) No para m�. No heredar� la herrer�a de Harad de ninguna forma. Ya me he sacado esa idea de la cabeza.
	AI_Output			(self, other, "DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05"); //Acepto. Nos encontraremos donde Jack.
	MIS_Jack_NewLighthouseOfficer = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Lighthouse");
};


///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Brian_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_457_Brian;
	nr		 = 	8;
	condition	 = 	DIA_Brian_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Brian_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"�Qu� dices?";
};

func int DIA_Brian_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01")<1000)
		&& (Kapitel == 5) 
		{
				return TRUE;
		};
};

func void DIA_Brian_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Brian_LIGHTHOUSEFREE_15_00"); //�Y qu� opinas?
	AI_Output			(self, other, "DIA_Brian_LIGHTHOUSEFREE_04_01"); //Dios, qu� desastre. Jack no reconocer� este lugar cuando haya terminado con �l.
};






























