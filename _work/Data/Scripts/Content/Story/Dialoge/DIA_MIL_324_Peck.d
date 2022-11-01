///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Peck_EXIT   (C_INFO)
{
	npc         = Mil_324_Peck;
	nr          = 999;
	condition   = DIA_Peck_EXIT_Condition;
	information = DIA_Peck_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Peck_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Peck_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Peck_PICKPOCKET (C_INFO)
{
	npc			= Mil_324_Peck;
	nr			= 900;
	condition	= DIA_Peck_PICKPOCKET_Condition;
	information	= DIA_Peck_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Sarebbe rischioso sottrargli la chiave)";
};                       

FUNC INT DIA_Peck_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_05) >= 1)
	&&  (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Peck_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Peck_PICKPOCKET);
	Info_AddChoice		(DIA_Peck_PICKPOCKET, DIALOG_BACK 		,DIA_Peck_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Peck_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Peck_PICKPOCKET_DoIt);
};

func void DIA_Peck_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_05, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Peck_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Peck_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Peck_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info HEY
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_HEY		(C_INFO)
{
	npc			 = 	Mil_324_Peck;
	nr			 = 	2;
	condition	 = 	DIA_Peck_HEY_Condition;
	information	 = 	DIA_Peck_HEY_Info;
	permanent	 = 	TRUE;
	description	 =  "Ehi, cosa succede?";
};
func int DIA_Peck_HEY_Condition ()
{	
	if (MIS_Andre_Peck != LOG_RUNNING)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_PECK") <= 500) 
	{
		return TRUE;
	};
};
func void DIA_Peck_HEY_Info ()
{
	AI_Output (other, self, "DIA_Peck_HEY_15_00"); //Ehi, cosa succede?
	AI_Output (self, other, "DIA_Peck_HEY_12_01"); //Amico, ho da fare. Lasciami in pace.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info FOUND_PECK
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_FOUND_PECK		(C_INFO)
{
	npc			 = 	Mil_324_Peck;
	nr			 = 	2;
	condition	 = 	DIA_Peck_FOUND_PECK_Condition;
	information	 = 	DIA_Peck_FOUND_PECK_Info;
	permanent 	 =  FALSE;
	description	 =  "È ora di andare.";
};

func int DIA_Peck_FOUND_PECK_Condition ()
{
	if (MIS_Andre_Peck == LOG_RUNNING)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_PUFF_PECK") <= 500) 
	{
		return TRUE;
	};
};
func void DIA_Peck_FOUND_PECK_Info ()
{
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_00"); //È ora di andare.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_01"); //Cosa vuoi? Non vedi che sono occupato?
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_02"); //Devi tornare in caserma. Ho bisogno di un'arma.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_03"); //Dannazione, la tua arma può aspettare.
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_04"); //Coraggio, anche Andre sente già la tua mancanza.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_05"); //Hmpf... maledizione. D’accordo verrò via, ma quando farai rapporto ad Andre, non dirgli che ero qui.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "STORAGE");
	Npc_ExchangeRoutine (Vanja, "ALONE");
};
///////////////////////////////////////////////////////////////////////
//	Info WEAPON
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_WEAPON		(C_INFO)
{
	npc			 = 	Mil_324_Peck;
	nr			 = 	2;
	condition	 = 	DIA_Peck_WEAPON_Condition;
	information	 = 	DIA_Peck_WEAPON_Info;
	permanent 	 =  TRUE;
	description	 = 	"Sono venuto per procurarmi un’arma.";
};
//------------------------------------
var int DIA_Peck_WEAPON_perm;
//------------------------------------
func int DIA_Peck_WEAPON_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Andre_FOUND_PECK)
	&& (Npc_GetDistToWP (self, "NW_CITY_ARMORY_PECK") <= 1000)
	&& (Kapitel < 3)
	&& (DIA_Peck_WEAPON_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Peck_WEAPON_Info ()
{
	AI_Output (other, self, "DIA_Peck_WEAPON_15_00"); //Sono venuto per procurarmi un’arma.
	
	if (MIS_Andre_Peck == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Peck_WEAPON_12_01"); //Prima vai a fare rapporto ad Andre.
	}
	else	
	{
		if (MIS_Andre_Peck == LOG_OBSOLETE)
		{
			AI_Output (self, other, "DIA_Peck_WEAPON_12_02"); //Bene, guarda chi c'è qui, il nostro nuovo compagno. E vuole una spada.
			AI_Output (self, other, "DIA_Peck_WEAPON_12_03"); //Grazie per non avere detto ad Andre che ero alla Lanterna Rossa. Mi sembri uno a posto. Tieni, prendi la tua spada.
			AI_Output (self ,other,"DIA_Peck_Add_12_00"); //È la migliore che ho.
			B_GiveInvItems 		(self, hero	, ItMw_Schwert1, 1); // edles Schwert 35
	
		}
		else if (MIS_Andre_Peck == LOG_SUCCESS) // ist schon korrekt, das SUCCESS gilt für Andre M.F.
		{
			AI_Output (self, other, "DIA_Peck_WEAPON_12_04"); //Non mi sono dimenticato di te. Chi è che ha detto ad Andre che mi trovavo alla Lanterna Rossa?
			AI_Output (self, other, "DIA_Peck_WEAPON_12_05"); //E ora vorresti una spada da me...? D’accordo, prendi questa e sparisci.
			
			B_GiveInvItems (self, hero, ItMw_1h_MISC_Sword,1);// rostiges Schwert
			
		};
		DIA_Peck_WEAPON_perm = TRUE;
	AI_Output (self, other, "DIA_Peck_WEAPON_12_06"); //Se vuoi un'arma migliore, allora rivolgiti ai negozianti al mercato.
	};
	AI_StopProcessInfos (self);
};


// ***************
// B_Peck_LeckMich
// ***************

func void B_Peck_LeckMich()
{
	AI_Output (self ,other,"DIA_Peck_Add_12_07"); //Vai al diavolo!
};


// *********************************************************
// 						zweite Waffe
// *********************************************************
instance DIA_Peck_WEAPON2		(C_INFO)
{
	npc			 = 	Mil_324_Peck;
	nr			 = 	2;
	condition	 = 	DIA_Peck_WEAPON2_Condition;
	information	 = 	DIA_Peck_WEAPON2_Info;
	permanent 	 =  TRUE;
	description	 = 	"Hai un’arma migliore per me?";
};
//------------------------------------
var int DIA_Peck_WEAPON2_perm;
//------------------------------------
func int DIA_Peck_WEAPON2_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Npc_GetDistToWP (self, "NW_CITY_ARMORY_PECK") <= 1000)
	&& (EnterOW_Kapitel2 == TRUE)
	&& (DIA_Peck_WEAPON_perm == TRUE)
	&& (DIA_Peck_WEAPON2_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Peck_WEAPON2_Info ()
{
	AI_Output (self ,other,"DIA_Peck_Add_15_01"); //Hai un’arma migliore per me?
	if (MIS_Andre_Peck == LOG_SUCCESS) //Peck verpetzt
	{	
		AI_Output (self ,other,"DIA_Peck_Add_12_06"); //Non mi sono dimenticato che hai fatto la spia a Lord Andre.
		B_Peck_LeckMich();
	}
	else if (Kapitel < 3)
	{
		AI_Output (self ,other,"DIA_Peck_Add_12_02"); //Al momento no...
	}
	else
	{
		AI_Output (self ,other,"DIA_Peck_Add_12_03"); //Hai fatto bene a chiedermelo. Abbiamo alcune buone spade che appartenevano ai mercenari di Onar.
		AI_Output (self ,other,"DIA_Peck_Add_12_04"); //Tanto a loro non servono più (risata grassa).
		AI_Output (self ,other,"DIA_Peck_Add_12_05"); //Ecco, prendila.
		B_GiveInvItems (self, other, ItMw_Rubinklinge, 1); //50
		
		DIA_Peck_WEAPON2_perm = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Peck_PERM		(C_INFO)
{
	npc			 = 	Mil_324_Peck;
	nr			 = 	998;
	condition	 = 	DIA_Peck_PERM_Condition;
	information	 = 	DIA_Peck_PERM_Info;
	permanent	 =	TRUE;
	description	 = 	"Va tutto bene?";
};

func int DIA_Peck_PERM_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Peck_WEAPON)
	|| (other.guild != GIL_MIL)
	&& (Npc_GetDistToWP (self, "NW_CITY_ARMORY_PECK") <= 1000)
	{
		return TRUE;
	};
};
func void DIA_Peck_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Peck_PERM_15_00"); //Va tutto bene?
	
	if (MIS_Andre_Peck == LOG_SUCCESS) //Peck verpetzt
	{	
		B_Peck_LeckMich();
	}
	else if (Kapitel != 3)
	{
		AI_Output			(self, other, "DIA_Peck_PERM_12_01"); //Sì, e tu?
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_02"); //Non proprio. Sono preoccupato per i mercenari. Cercheranno di liberare il loro amico di prigione.
				AI_Output			(self, other, "DIA_Peck_PERM_12_03"); //Non voglio battermi contro un gruppo di guerrieri esperti.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_04"); //Certamente! Stiamo tenendo tutti gli occhi aperti. I maghi possono stare sicuri che il prigioniero non avrà alcuna possibilità di fuggire.
			}
			else //Sld oder DJG
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_05"); //So cos'hai in mente, ma non riuscirai a liberare il prigioniero.
			};
		}	
		else
		{
			AI_Output			(self, other, "DIA_Peck_PERM_12_06"); //Sono molto contento che la faccenda dell'omicidio sia stata chiarita.
			AI_Output			(other, self, "DIA_Peck_PERM_15_07"); //Perché?
			AI_Output			(self, other, "DIA_Peck_PERM_12_08"); //I mercenari non sarebbero rimasti a guardare mentre noi mandavamo alla forca un loro compagno.
			AI_Output			(self, other, "DIA_Peck_PERM_12_09"); //Nel peggiore dei casi, ci avrebbero attaccato. Non voglio nemmeno immaginare cosa sarebbe successo a quel punto.
		};	
	};
};






