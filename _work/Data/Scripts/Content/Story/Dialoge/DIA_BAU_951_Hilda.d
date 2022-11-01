///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hilda_EXIT   (C_INFO)
{
	npc         = BAU_951_Hilda;
	nr          = 999;
	condition   = DIA_Hilda_EXIT_Condition;
	information = DIA_Hilda_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Hilda_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Hilda_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_Hallo (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 2;
	condition	= DIA_Hilda_Hallo_Condition;
	information	= DIA_Hilda_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Hilda_Hallo_Condition ()
{
	if (MIS_Lobart_Rueben != LOG_SUCCESS)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_Hallo_Info ()
{
	if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_Hallo_17_00"); //Eh, ¿quién te ha invitado? Sal ahora mismo de la casa. Aquí no damos limosnas.
		}
	else
		{
			AI_Output (self, other, "DIA_Hilda_Hallo_17_01"); //Sí, ¿qué es?
		};
		
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Was zu essen? 		(PERM)
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_WasZuEssen (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 2;
	condition	= DIA_Hilda_WasZuEssen_Condition;
	information	= DIA_Hilda_WasZuEssen_Info;
	permanent	= TRUE;
	description = "¿Me das algo de comer?";
};

func int DIA_Hilda_WasZuEssen_Condition ()
{
	if ( (Npc_KnowsInfo (other, DIA_Hilda_Hallo)) || (MIS_Lobart_Rueben == LOG_SUCCESS) )
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_WasZuEssen_Info ()
{
	if (hero.guild == GIL_NONE)
		{
			var int Rueben_TagNull;
			
			AI_Output (other, self, "DIA_Hilda_WasZuEssen_15_00"); //¿Me das algo de comer?
				
			if (MIS_Lobart_Rueben == LOG_SUCCESS)
				{
					if (! Npc_KnowsInfo (other, DIA_Hilda_PfanneTooLate))
					{
						if (Hilda_Stew_Day != Wld_GetDay())
						{
							B_GiveInvItems (self, other, ItFo_Stew, 1);
						
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_01"); //Ten, toma. Eres un buen chico.
						
							Hilda_Stew_Day = Wld_GetDay();
						}
						
						else if (Wld_GetDay() == 0)
						&& 		(Rueben_TagNull == FALSE)
						{
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_02"); //Mañana vuelve a por más.
							B_GiveInvItems (self, other, ItFo_Stew, 1);
							Hilda_Stew_Day = Wld_GetDay();
							Rueben_TagNull = TRUE;
							
							Log_CreateTopic (Topic_Bonus,LOG_NOTE);
							B_LogEntry (Topic_Bonus,"Hilda me puede dar todos los días algo de estofado de nabos.");
						}
						else //heute schon bekommen
						{
							AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_03"); //¡Hoy ya te has tomado tu ración! Vuelve luego.
						};
					}
					else //Pfanne zu spät
					{
						AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_04"); //Aquí no alimentamos a los vagos. ¡Largo!
						AI_StopProcessInfos (self); 
					};
				}
				else
				{
					AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_05"); //¡Aquí solo comen los que trabajan!
				};
		}
	else
		{
			AI_Output (self, other, "DIA_Hilda_WasZuEssen_17_06"); //Seguro que tienes dinero para comprarte algo en la ciudad.
		};
};


///////////////////////////////////////////////////////////////////////
//	Rüben bringen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_BringBeet (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 1;
	condition	= DIA_Hilda_BringBeet_Condition;
	information	= DIA_Hilda_BringBeet_Info;
	permanent	= FALSE;
	description	= "Te traigo unos cuantos nabos...";
};

func int DIA_Hilda_BringBeet_Condition ()
{
	if (MIS_Lobart_RuebenToHilda == LOG_RUNNING)
	&& (Npc_HasItems (other,ItPl_Beet) >= 1)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_BringBeet_Info ()
{
	AI_Output (other, self, "DIA_Hilda_BringBeet_15_00"); //Te traigo unos cuantos nabos...
	
	if (Npc_HasItems (other,ItPl_Beet) >= 20)
	{
		B_GiveInvItems (other, self, ItPl_Beet, Npc_HasItems (other,ItPl_Beet));
		
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_01"); //¡Estupendo! (se ríe) ¡Deberían bastar para cebar a estos chicos!
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_02"); //Ya que estás aquí... hace unos minutos vi que pasaba un viajante.
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_03"); //Creo que se detuvo de camino a la ciudad. Ve a ver si tiene una sartén en condiciones.
				
		MIS_Lobart_RuebenToHilda = LOG_SUCCESS;
		B_GivePlayerXP (XP_Ambient);//damit der Logeintrag verschwindet
	}
	else
	{
		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_BringBeet_17_04"); //¡¿Qué?! ¿Se supone que eso es todo?
		}
		else
		{
			AI_Output (self, other, "DIA_Hilda_BringBeet_17_05"); //No es suficiente.
		};
		
		AI_Output (self, other, "DIA_Hilda_BringBeet_17_06"); //¡Ve al campo y tráeme más! ¡Los hombres están muertos de hambre!
		AI_StopProcessInfos (self);
	};
};


///////////////////////////////////////////////////////////////////////
//	Einkaufen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_Einkaufen (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 2;
	condition	= DIA_Hilda_Einkaufen_Condition;
	information	= DIA_Hilda_Einkaufen_Info;
	permanent	= FALSE;
	description	= "Dame el oro e iré a ver al mercader...";
};

func int DIA_Hilda_Einkaufen_Condition ()
{
	if (MIS_Lobart_RuebenToHilda == LOG_SUCCESS)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_Einkaufen_Info ()
{
	AI_Output (other, self, "DIA_Hilda_Einkaufen_15_00"); //Dame el oro e iré a ver al mercader...
		
		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_Einkaufen_17_01"); //¿Dices que me fíe de ti? No te gastes el dinero en bebida, ¿me oyes?
		};
		
	B_GiveInvItems (self, other, ItMi_Gold, 20); 
	
	MIS_Hilda_PfanneKaufen = LOG_RUNNING;
	MIS_Hilda_PfanneKaufen_Day = B_GetDayPlus();
	
	Log_CreateTopic (TOPIC_Hilda,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Hilda,LOG_RUNNING);
	B_LogEntry (TOPIC_Hilda,"Hilda, la esposa de Lobart, el granjero, quiere que vaya le compre una sartén al buhonero.");
};


///////////////////////////////////////////////////////////////////////
//	Pfanne geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_PfanneGeholt (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 2;
	condition	= DIA_Hilda_PfanneGeholt_Condition;
	information	= DIA_Hilda_PfanneGeholt_Info;
	permanent	= FALSE;
	description	= "Aquí tienes la sartén.";
};

func int DIA_Hilda_PfanneGeholt_Condition ()
{
	if (MIS_Hilda_PfanneKaufen == LOG_RUNNING)
	&& (Npc_HasItems(other, itmi_pan) > 0)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneGeholt_Info ()
{
	AI_Output (other, self, "DIA_Hilda_PfanneGeholt_15_00"); //Aquí tienes la sartén.
	B_GiveInvItems (other, self, itmi_pan, 1);
	AI_Output (self, other, "DIA_Hilda_PfanneGeholt_17_01"); //Muy bien. Veamos si es buena...
	
	MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
	B_GivePlayerXP (XP_HildaHolPfanne);
	
	
};


///////////////////////////////////////////////////////////////////////
//	Pfanne zu spät
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_PfanneTooLate (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 1;
	condition	= DIA_Hilda_PfanneTooLate_Condition;
	information	= DIA_Hilda_PfanneTooLate_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Hilda_PfanneTooLate_Condition ()
{
	if (MIS_Hilda_PfanneKaufen == LOG_RUNNING)
	&& (MIS_Hilda_PfanneKaufen_Day <= (Wld_GetDay()-1))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneTooLate_Info ()
{
		if (hero.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_00"); //¿Cómo te atreves a volver? ¿Qué has hecho con mi dinero, haragán?
		}
		else
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_01"); //Has tenido tiempo más que de sobra. ¿Dónde está el dinero que te di para la sartén?
		};
		
	if (Npc_HasItems(other, itmi_pan) > 0)
	{
		AI_Output (other, self, "DIA_Hilda_PfanneTooLate_15_02"); //Siento haber tardado tanto. Aquí tienes la sartén.
	
		B_GiveInvItems (other, self, itmi_pan, 1);
	
		AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_03"); //Arrh, dámela. Menuda cara... ¡es increíble!
	
		MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
		B_GivePlayerXP (XP_HildaHolPfanne/2);
		
		
		AI_StopProcessInfos(self);
	}
	else //keine Pfanne
	{
		if (Npc_HasItems(other, itmi_gold) >= 20)
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_04"); //¡Ah! ¡Todavía lo tienes! Devuélvemelo ahora mismo.
			B_GiveInvItems (other, self, ItMi_Gold, 20); 
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_05"); //Menuda cara... ¡es increíble!
		}
		else //kein Gold
		{
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_06"); //¡No lo tienes! ¡Te di 20 monedas de oro!
			AI_Output (self, other, "DIA_Hilda_PfanneTooLate_17_07"); //¡Fuera de aquí, ladrón asqueroso!
			
			B_MemorizePlayerCrime (self, other, CRIME_THEFT);
		};
		
		MIS_Hilda_PfanneKaufen = LOG_FAILED;
		B_CheckLog ();
		AI_StopProcessInfos(self);
	};
};


///////////////////////////////////////////////////////////////////////
//	Klamotten uas Truhe geklaut
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Hilda_TruheRumgemacht (C_INFO)
{
	npc		 	= BAU_951_Hilda;
	nr			= 2;
	condition	= DIA_Hilda_TruheRumgemacht_Condition;
	information	= DIA_Hilda_TruheRumgemacht_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Hilda_TruheRumgemacht_Condition ()
{
	if (Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == FALSE)
	&& (Lobart_Kleidung_Verkauft == FALSE)
	&& (! ( Npc_KnowsInfo(other,DIA_Lobart_STOLENCLOTHS) && (Lobart_Kleidung_gestohlen == FALSE) ) )
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_TruheRumgemacht_Info ()
{
	AI_Output (self, other, "DIA_Hilda_TruheRumgemacht_17_00"); //Denk´ bloss nicht, ich hätte nicht gesehen, wie du an der Kiste 'rumgemacht hast.
	AI_Output (self, other, "DIA_Hilda_TruheRumgemacht_17_01"); //Raus hier aber schnell. Sonst hol´ ich meinen Mann!
	
	AI_StopProcessInfos(self);
};
*/


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

INSTANCE DIA_Hilda_KAP3_EXIT(C_INFO)
{
	npc			= BAU_951_Hilda;
	nr			= 999;
	condition	= DIA_Hilda_KAP3_EXIT_Condition;
	information	= DIA_Hilda_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hilda_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hilda_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Krank
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_KRANK		(C_INFO)
{
	npc		 = 	BAU_951_Hilda;
	nr		 = 	30;
	condition	 = 	DIA_Hilda_KRANK_Condition;
	information	 = 	DIA_Hilda_KRANK_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Te sientes mal?";
};

func int DIA_Hilda_KRANK_Condition ()
{
	if (Kapitel >= 3)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)	||	(hero.guild == GIL_KDF))
	&& (MIS_HealHilda != LOG_SUCCESS)
		{
			return TRUE;
		};
};
var int DIA_Hilda_KRANK_OnTime;
func void DIA_Hilda_KRANK_Info ()
{
	AI_Output			(other, self, "DIA_Hilda_KRANK_15_00"); //¿Te sientes mal?
	AI_Output			(self, other, "DIA_Hilda_KRANK_17_01"); //La verdad es que sí. Otra vez me ha dado fiebre.
	AI_Output			(self, other, "DIA_Hilda_KRANK_17_02"); //Debería ir a ver al curandero de la ciudad, pero estoy muy débil.

	if (DIA_Hilda_KRANK_OnTime == FALSE)
	{
		Info_ClearChoices	(DIA_Hilda_KRANK);
		Info_AddChoice	(DIA_Hilda_KRANK, "Mejórate. Tengo que irme.", DIA_Hilda_KRANK_besserung );
		Info_AddChoice	(DIA_Hilda_KRANK, "¿Puedo ayudar?", DIA_Hilda_KRANK_helfen );
		
		DIA_Hilda_KRANK_OnTime = TRUE;
	};

	MIS_HealHilda = LOG_RUNNING;
};
func void DIA_Hilda_KRANK_besserung ()
{
	AI_Output			(other, self, "DIA_Hilda_KRANK_besserung_15_00"); //Mejórate. Tengo que irme.
	AI_Output			(self, other, "DIA_Hilda_KRANK_besserung_17_01"); //Espero que las cosas mejoren.
	AI_StopProcessInfos (self);
};

func void DIA_Hilda_KRANK_helfen ()
{
	AI_Output			(other, self, "DIA_Hilda_KRANK_helfen_15_00"); //¿Puedo ayudar?
	AI_Output			(self, other, "DIA_Hilda_KRANK_helfen_17_01"); //Sería estupendo que fueras a ver a Vatras y me trajeras mi medicina.
	AI_Output			(self, other, "DIA_Hilda_KRANK_helfen_17_02"); //¡Él sabrá lo que hay que hacer! Yo ya no puedo.

	Log_CreateTopic (TOPIC_HealHilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda, LOG_RUNNING);
	B_LogEntry (TOPIC_HealHilda,"La esposa de Lobart, Hilda, está enferma, pero Vatras tiene algo que puede curarla."); 
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilungbringen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_HEILUNGBRINGEN		(C_INFO)
{
	npc		 = 	BAU_951_Hilda;
	nr		 = 	31;
	condition	 = 	DIA_Hilda_HEILUNGBRINGEN_Condition;
	information	 = 	DIA_Hilda_HEILUNGBRINGEN_Info;

	description	 = 	"Tengo tu medicina.";
};

func int DIA_Hilda_HEILUNGBRINGEN_Condition ()
{
	if (Npc_HasItems (other,ItPo_HealHilda_MIS))
		{
				return TRUE;
		};
};

func void DIA_Hilda_HEILUNGBRINGEN_Info ()
{
	AI_Output			(other, self, "DIA_Hilda_HEILUNGBRINGEN_15_00"); //Tengo tu medicina.
	B_GiveInvItems 		(other, self, ItPo_HealHilda_MIS,1);
	AI_Output			(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_01"); //De verdad que nuestra sociedad necesita más gente como tú. Muchas gracias.
	B_UseItem 			(self,ItPo_HealHilda_MIS);
	AI_Output			(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_02"); //Espero que estas pocas monedas basten.
	CreateInvItems 		(self, ItMi_Gold, 50);									
	B_GiveInvItems 		(self, other, ItMi_Gold, 50);	
	MIS_HealHilda = LOG_SUCCESS;
	B_GivePlayerXP (XP_HealHilda);
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info disturb
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_DISTURB		(C_INFO)
{
	npc		 = 	BAU_951_Hilda;
	nr		 = 	32;
	condition	 = 	DIA_Hilda_DISTURB_Condition;
	information	 = 	DIA_Hilda_DISTURB_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Qué tal estás?";
};

func int DIA_Hilda_DISTURB_Condition ()
{
	if (MIS_HealHilda == LOG_SUCCESS)
	||	( 
		((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) )
		&& (Kapitel > 3)
		)
			{
					return TRUE;
			};
};

func void DIA_Hilda_DISTURB_Info ()
{
	if (MIS_HealHilda == LOG_SUCCESS)
	{
	AI_Output	(other, self, "DIA_Hilda_DISTURB_15_00"); //¿Qué tal estás?
	AI_Output	(self, other, "DIA_Hilda_DISTURB_17_01"); //Gracias a ti, ya me siento algo mejor.
	}
	else
	{
	AI_Output	(self, other, "DIA_Hilda_DISTURB_17_02"); //No muy bien.
	};
};

//#####################################################################
//##
//##
//##						KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Hilda_KAP4_EXIT(C_INFO)
{
	npc			= BAU_951_Hilda;
	nr			= 999;
	condition	= DIA_Hilda_KAP4_EXIT_Condition;
	information	= DIA_Hilda_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hilda_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hilda_KAP4_EXIT_Info()
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

INSTANCE DIA_Hilda_KAP5_EXIT(C_INFO)
{
	npc			= BAU_951_Hilda;
	nr			= 999;
	condition	= DIA_Hilda_KAP5_EXIT_Condition;
	information	= DIA_Hilda_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hilda_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hilda_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Hilda_KAP6_EXIT(C_INFO)
{
	npc			= BAU_951_Hilda;
	nr			= 999;
	condition	= DIA_Hilda_KAP6_EXIT_Condition;
	information	= DIA_Hilda_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hilda_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hilda_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hilda_PICKPOCKET (C_INFO)
{
	npc			= BAU_951_Hilda;
	nr			= 900;
	condition	= DIA_Hilda_PICKPOCKET_Condition;
	information	= DIA_Hilda_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Hilda_PICKPOCKET_Condition()
{
	C_Beklauen (26, 35);
};
 
FUNC VOID DIA_Hilda_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hilda_PICKPOCKET);
	Info_AddChoice		(DIA_Hilda_PICKPOCKET, DIALOG_BACK 		,DIA_Hilda_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hilda_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hilda_PICKPOCKET_DoIt);
};

func void DIA_Hilda_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hilda_PICKPOCKET);
};
	
func void DIA_Hilda_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hilda_PICKPOCKET);
};


























































