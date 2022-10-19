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
	description = "(Krádež tohoto klíèe by byla riskantní)";
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
	description	 =  "Zdar, jak se vede?";
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
	AI_Output (other, self, "DIA_Peck_HEY_15_00"); //Zdar, jak se vede?
	AI_Output (self, other, "DIA_Peck_HEY_12_01"); //Hele, mám dost práce. Nech mê být.
	
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
	description	 =  "Hej, je nejvyšší èas vyrazit.";
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
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_00"); //Hej, je nejvyšší èas vyrazit.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_01"); //Co chceš? Nevidíš, že mám práci?
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_02"); //Potâebuji zbraà, takže se vraã do kasáren.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_03"); //Sakra, tvoje zbraà mùže poèkat.
	AI_Output (other, self, "DIA_Peck_FOUND_PECK_15_04"); //Pojë, Andre se už po tobê taky ptal.
	AI_Output (self, other, "DIA_Peck_FOUND_PECK_12_05"); //Hmpf... sakra. Dobrá, vždyã už jdu - ale až budeš Andremu podávat hlášení, neâíkej mu, že jsem byl tady.
	
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
	description	 = 	"Pâišel jsem si pro zbraà.";
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
	AI_Output (other, self, "DIA_Peck_WEAPON_15_00"); //Pâišel jsem si pro zbraà.
	
	if (MIS_Andre_Peck == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Peck_WEAPON_12_01"); //Nejdâív jdi za lordem Andrem a podej mu hlášení.
	}
	else	
	{
		if (MIS_Andre_Peck == LOG_OBSOLETE)
		{
			AI_Output (self, other, "DIA_Peck_WEAPON_12_02"); //No, podívejme, kdo tady je. Náš nový kolegáèek. A chce zbraà.
			AI_Output (self, other, "DIA_Peck_WEAPON_12_03"); //Neâekl jsi Andremu, že jsem byl v Èervené lucernê. Jsi docela fajn. Na, tady máš meè.
			AI_Output (self ,other,"DIA_Peck_Add_12_00"); //Je to nejlepší, jaký tady mám.
			B_GiveInvItems 		(self, hero	, ItMw_Schwert1, 1); // edles Schwert 35
	
		}
		else if (MIS_Andre_Peck == LOG_SUCCESS) // ist schon korrekt, das SUCCESS gilt für Andre M.F.
		{
			AI_Output (self, other, "DIA_Peck_WEAPON_12_04"); //Nezapomnêl jsem na tebe. Kdo napráskal Andremu, že jsem byl v Èervené lucernê?
			AI_Output (self, other, "DIA_Peck_WEAPON_12_05"); //A teë ode mne ještê chceš meè... dobrá, tady jeden máš. Vezmi si ho. A teë zmiz.
			
			B_GiveInvItems (self, hero, ItMw_1h_MISC_Sword,1);// rostiges Schwert
			
		};
		DIA_Peck_WEAPON_perm = TRUE;
	AI_Output (self, other, "DIA_Peck_WEAPON_12_06"); //Jestli chceš lepší zbraà, zajdi si na trh ke kupcùm.
	};
	AI_StopProcessInfos (self);
};


// ***************
// B_Peck_LeckMich
// ***************

func void B_Peck_LeckMich()
{
	AI_Output (self ,other,"DIA_Peck_Add_12_07"); //Polib mi! A s rozbêhem!
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
	description	 = 	"Nemêl bys pro mê lepší zbraà?";
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
	AI_Output (self ,other,"DIA_Peck_Add_15_01"); //Nemêl bys pro mê lepší zbraà?
	if (MIS_Andre_Peck == LOG_SUCCESS) //Peck verpetzt
	{	
		AI_Output (self ,other,"DIA_Peck_Add_12_06"); //Nezapomnêl jsem, žes mê prásknul lordu Andremu.
		B_Peck_LeckMich();
	}
	else if (Kapitel < 3)
	{
		AI_Output (self ,other,"DIA_Peck_Add_12_02"); //Teë zrovna ne...
	}
	else
	{
		AI_Output (self ,other,"DIA_Peck_Add_12_03"); //Dobâe že se ptáš. Od Onarových žoldákù máme pár opravdu slušných kouskù.
		AI_Output (self ,other,"DIA_Peck_Add_12_04"); //Jim samotným už nebudou k nièemu. (ošklivê se zasmêje)
		AI_Output (self ,other,"DIA_Peck_Add_12_05"); //Na, vem si tenhle.
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
	description	 = 	"Jsi v poâádku?";
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
	AI_Output			(other, self, "DIA_Peck_PERM_15_00"); //Všechno v poâádku?
	
	if (MIS_Andre_Peck == LOG_SUCCESS) //Peck verpetzt
	{	
		B_Peck_LeckMich();
	}
	else if (Kapitel != 3)
	{
		AI_Output			(self, other, "DIA_Peck_PERM_12_01"); //Jo, a co u tebe?
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			if (hero.guild == GIL_MIL)
			|| (hero.guild == GIL_PAL)
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_02"); //Ne tak docela. Dêlají mi starosti ti žoldáci. Konkrétnê to, že se teë urèitê pokusí vysvobodit svého kamaráda z vêzení.
				AI_Output			(self, other, "DIA_Peck_PERM_12_03"); //Moc by mê nepotêšilo, kdybych se musel postavit bandê zkušených rváèù.
			}
			else if (hero.guild == GIL_KDF)
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_04"); //No samozâejmê! Všichni máme oèi otevâené. Èarodêjové mohou být ujištêni, že vêzeà nemá žádnou šanci uniknout.
			}
			else //Sld oder DJG
			{
				AI_Output			(self, other, "DIA_Peck_PERM_12_05"); //Vím, co máš v plánu, ale dostat vêznê na svobodu se ti nepodaâí.
			};
		}	
		else
		{
			AI_Output			(self, other, "DIA_Peck_PERM_12_06"); //Jsem rád, že se celá ta záležitost kolem vraždy vyjasnila.
			AI_Output			(other, self, "DIA_Peck_PERM_15_07"); //Proè?
			AI_Output			(self, other, "DIA_Peck_PERM_12_08"); //Ti žoldáci by asi jen tak bez boje nepâihlíželi, jak jednoho z nich povêsíme na šibenici.
			AI_Output			(self, other, "DIA_Peck_PERM_12_09"); //V nejhorším pâípadê by na nás zaútoèili. Radêji si ani nechci pâedstavit, co by se stalo potom.
		};	
	};
};






