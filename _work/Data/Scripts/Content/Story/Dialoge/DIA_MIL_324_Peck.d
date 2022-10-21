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
	description = "(Es wäre gewagt seinen Schlüssel zu stehlen)";
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
	description	 =  "Hey, was liegt an?";
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
	AI_Output (other, self, "DIA_Peck_HEY_15_00"); //Hey, was liegt an?
	AI_Output (self, other, "DIA_Peck_HEY_12_01"); //Mann, ich bin beschäftigt. Lass mich in Ruhe.
	
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
	description	 =  "Hey, es wird Zeit abzuhauen.";
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
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_00"); //Hey, es wird Zeit abzuhauen.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_01"); //Was willst du? Siehst du nicht, dass ich beschäftigt bin?
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_02"); //Ich brauche eine Waffe, also komm zur Kaserne zurück.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_03"); //Verdammt, deine Waffe kann warten.
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_04"); //Los, Andre vermisst dich auch schon.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_05"); //Hmpf ... verdammt. Okay, ich komme ja schon - aber wenn du deine Rückmeldung bei Andre machst, sagst du ihm nicht, dass ich hier war.
	
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
	description	 = 	"Ich wollte mir eine Waffe abholen";
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
	AI_Output (other, self, "DIA_Peck_WEAPON_15_00"); //Ich wollte mir eine Waffe abholen.
	
	if (MIS_Andre_Peck == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Peck_WEAPON_12_01"); //Geh erst zu Andre und erstatte ihm Rückmeldung.
	}
	else	
	{
		if (MIS_Andre_Peck == LOG_OBSOLETE)
		{
			AI_Output (self, other, "DIA_Peck_WEAPON_12_02"); //Nun sieh mal, wer da ist. Unser neuer Kamerad. Und er will ein Schwert haben.
			AI_Output (self, other, "DIA_Peck_WEAPON_12_03"); //Du hast Andre nicht erzählt, dass ich in der Roten Laterne war. Du scheinst ganz in Ordnung zu sein. Hier, nimm dein Schwert.
			AI_Output (self ,other,"DIA_Peck_Add_12_00"); //Es ist das Beste, was ich da habe.
			B_GiveInvItems 		(self, hero	, ItMw_Schwert1, 1); // edles Schwert 35
	
		}
		else if (MIS_Andre_Peck == LOG_SUCCESS) // ist schon korrekt, das SUCCESS gilt für Andre M.F.
		{
			AI_Output (self, other, "DIA_Peck_WEAPON_12_04"); //Ich hab dich nicht vergessen. Wer hat Andre wohl gesteckt, dass ich in der Roten Laterne war?
			AI_Output (self, other, "DIA_Peck_WEAPON_12_05"); //Und jetzt willst du eine Klinge von mir haben ... na schön, du kriegst eine Klinge. Hier. Und jetzt machst du 'n Abgang.
			
			B_GiveInvItems (self, hero, ItMw_1h_MISC_Sword,1);// rostiges Schwert
			
		};
		DIA_Peck_WEAPON_perm = TRUE;
	AI_Output (self, other, "DIA_Peck_WEAPON_12_06"); //Wenn du bessere Waffen haben willst, dann geh zu den Händlern am Markt.
	};
	AI_StopProcessInfos (self);
};


// ***************
// B_Peck_LeckMich
// ***************

func void B_Peck_LeckMich()
{
	AI_Output (self ,other,"DIA_Peck_Add_12_07"); //Leck mich!
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
	description	 = 	"Hast du eine bessere Waffe für mich?";
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
	AI_Output (self ,other,"DIA_Peck_Add_15_01"); //Hast du eine bessere Waffe für mich?
	if (MIS_Andre_Peck == LOG_SUCCESS) //Peck verpetzt
	{	
		AI_Output (self ,other,"DIA_Peck_Add_12_06"); //Ich hab nicht vergessen, daß du mich bei Lord Andre verpfiffen hast.
		B_Peck_LeckMich();
	}
	else if (Kapitel < 3)
	{
		AI_Output (self ,other,"DIA_Peck_Add_12_02"); //Zur Zeit nicht...
	}
	else
	{
		AI_Output (self ,other,"DIA_Peck_Add_12_03"); //Gut, das du fragst. Wir haben ein paar ziemlich gute Klingen von Onars Söldnern bekommen.
		AI_Output (self ,other,"DIA_Peck_Add_12_04"); //Sie brauchten sie nicht mehr (lacht dreckig).
		AI_Output (self ,other,"DIA_Peck_Add_12_05"); //Hier, nimm.
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
	description	 = 	"Alles klar bei dir?";
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
	AI_Output			(other, self, "DIA_Peck_PERM_15_00"); //Alles klar bei dir?
	
	if (MIS_Andre_Peck == LOG_SUCCESS) //Peck verpetzt
	{	
		B_Peck_LeckMich();
	}
	else if (Kapitel != 3)
	{
		AI_Output			(self, other, "DIA_Peck_PERM_12_01"); //Ja, und bei dir?
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_02"); //Eigentlich nicht. Ich mache mir Sorgen wegen der Söldner, ich meine, die werden jetzt doch versuchen, ihren Kameraden aus dem Knast zu holen.
				AI_Output			(self, other, "DIA_Peck_PERM_12_03"); //Ich hab keine Lust, mich mit einem Haufen erfahrener Kämpfer anzulegen.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_04"); //Ja natürlich! Wir halten alle die Augen offen. Die Magier können ganz beruhigt sein, der Gefangene hat keine Chance zu entkommen.
			}
			else //Sld oder DJG
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_05"); //Ich weiß, was du vorhast, aber es wird dir nicht gelingen, mit dem Gefangenen zu fliehen.
			};
		}	
		else
		{
			AI_Output			(self, other, "DIA_Peck_PERM_12_06"); //Ich bin heilfroh, dass sich die Sache mit dem Mord aufgeklärt hat.
			AI_Output			(other, self, "DIA_Peck_PERM_15_07"); //Wieso?
			AI_Output			(self, other, "DIA_Peck_PERM_12_08"); //Kampflos hätten die Söldner doch nie zugeschaut, wie wir einen von ihnen an den Galgen bringen.
			AI_Output			(self, other, "DIA_Peck_PERM_12_09"); //Schlimmstenfalls hätten sie uns einfach angegriffen. Ich will mir gar nicht ausmalen, was dann passiert wäre.
		};	
	};
};






