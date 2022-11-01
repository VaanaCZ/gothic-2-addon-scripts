
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Nefarius_ADW_EXIT   (C_INFO)
{
	npc         = KDW_14020_Addon_Nefarius_ADW;
	nr          = 999;
	condition   = DIA_Addon_Nefarius_ADW_EXIT_Condition;
	information = DIA_Addon_Nefarius_ADW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Nefarius_ADW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Nefarius_ADW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
INSTANCE DIA_Addon_Nefarius_ADW_PICKPOCKET (C_INFO)
{
	npc			= KDW_14020_Addon_Nefarius_ADW;
	nr			= 900;
	condition	= DIA_Addon_Nefarius_ADW_PICKPOCKET_Condition;
	information	= DIA_Addon_Nefarius_ADW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre einfach seine Spruchrolle zu stehlen)";
};                       

FUNC INT DIA_Addon_Nefarius_ADW_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Nefarius_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Addon_Nefarius_ADW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Nefarius_ADW_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Nefarius_ADW_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Nefarius_ADW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Nefarius_ADW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Nefarius_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Nefarius_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		
		B_GiveInvItems (self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Addon_Nefarius_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Addon_Nefarius_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_PICKPOCKET);
};
*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_ADWHello		(C_INFO)
{
	npc		 = 	KDW_14020_Addon_Nefarius_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_ADWHello_Condition;
	information	 = 	DIA_Addon_Nefarius_ADWHello_Info;
	important	 = 	TRUE;
};
func int DIA_Addon_Nefarius_ADWHello_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};
};
func void DIA_Addon_Nefarius_ADWHello_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_00"); //Cieszy mnie, że dotarłeś tu bezpiecznie.
	AI_Output	(other, self, "DIA_Addon_Nefarius_ADWHello_15_01"); //Jak to się stało, że przybyłeś tu przede mną?
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_02"); //Podróżowaliśmy przez dziwny wymiar. Kto wie, w jaką odnogę zboczyłeś.
	AI_Output	(other, self, "DIA_Addon_Nefarius_ADWHello_15_03"); //No i? Czy będę mógł jeszcze skorzystać z portalu?
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_04"); //Dotarliśmy dokładnie na miejsce. Najwyraźniej działa bardzo dobrze.
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_05"); //Poinformuję cię, jeśli będę podejrzewać, że może być inaczej.
};

///////////////////////////////////////////////////////////////////////
//	Info Neues
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_Neues		(C_INFO)
{
	npc		 = 	KDW_14020_Addon_Nefarius_ADW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Nefarius_Neues_Condition;
	information	 = 	DIA_Addon_Nefarius_Neues_Info;

	description	 = 	"Co robiłeś do tej pory?";
};

func int DIA_Addon_Nefarius_Neues_Condition ()
{
	if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Nefarius_Neues_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_Neues_15_00"); //Co robiłeś do tej pory?
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_01"); //Badam historię budowniczych i próbuję zrozumieć, dlaczego zamknęli portal.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_02"); //Wygląda na to, że usiłowali ukryć miasto przed resztą świata.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_03"); //Wiele lat temu działy się tu straszne rzeczy. Zostali opętani przez jakąś potworną moc.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_04"); //Jeśli wierzyć ich zapiskom, przed zagładą miasta miała tu miejsce straszna wojna domowa.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_05"); //Drogi stanęły w płomieniach, a w końcu niszcząca powódź przypieczętowała los budowniczych.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_06"); //Ci, którym udało się przeżyć to piekło, odcięli tę część wyspy w nadziei, że uda im się powstrzymać chaos.
	
	Info_ClearChoices	(DIA_Addon_Nefarius_Neues);
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "Jak myślisz, co tu znajdziemy?", DIA_Addon_Nefarius_Neues_find );
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "A my, głupcy, ponownie otworzyliśmy portal.", DIA_Addon_Nefarius_Neues_auf );
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "Czemu budowniczowie oszaleli?", DIA_Addon_Nefarius_Neues_was );
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "Powiedziałeś, że nadeszła powódź?", DIA_Addon_Nefarius_Neues_flut );
};
func void DIA_Addon_Nefarius_Neues_find ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_find_15_00"); //Jak myślisz, co tu znajdziemy?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_find_05_01"); //Mogę się tylko domyślać. Lepiej porozmawiaj z Saturasem.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_find_05_02"); //On ma jakiś pomysł.
	
	Log_CreateTopic (TOPIC_Addon_Flut, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Flut, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Flut,"Nefarius uważa, że powinienem porozmawiać z Saturasem o zaginionym mieście."); 

	
	NefariusADW_Talk2Saturas = TRUE;
};
func void DIA_Addon_Nefarius_Neues_flut ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_flut_15_00"); //Powiedziałeś, że nadeszła powódź?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_flut_05_01"); //Pojawił się przed nimi sam Adanos, chcąc położyć kres ich szaleństwu.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_flut_05_02"); //Zrównał miasto z ziemią.
};
func void DIA_Addon_Nefarius_Neues_was ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_was_15_00"); //Czemu budowniczowie oszaleli?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_01"); //Jeden spośród nich oddał się złu. Był to wielki dowódca o imieniu Quarhodron.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_02"); //Powróciwszy do domu po zwycięskiej bitwie za murami miasta, przywiódł ze sobą samo zło.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_03"); //Wszyscy jego towarzysze w krótkim czasie popadli w szaleństwo i zaczęli walczyć ze zwykłymi ludźmi.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_04"); //Rozpoczęła się wojna domowa i wszystko zostało zniszczone.
};
func void DIA_Addon_Nefarius_Neues_auf ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_auf_15_00"); //A my, głupcy, ponownie otworzyliśmy portal.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_auf_05_01"); //Mnie się to też nie podoba.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_auf_05_02"); //Ale jaki mieliśmy wybór?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_auf_05_03"); //Jeśli nie powstrzymamy tego, co tu się dzieje, Khorinis może spotkać ten sam los, który dotknął mieszkańców tego pradawnego miasta.
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_PermADW		(C_INFO)
{
	npc		 = 	KDW_14020_Addon_Nefarius_ADW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Nefarius_PermADW_Condition;
	information	 = 	DIA_Addon_Nefarius_PermADW_Info;
	permanent	 = 	TRUE;

	description	 = 	"Podróż przez portal jest bezpieczna?";
};
func int DIA_Addon_Nefarius_PermADW_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Nefarius_PermADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_PermADW_15_00"); //Podróż przez portal jest bezpieczna?
	AI_Output	(self, other, "DIA_Addon_Nefarius_PermADW_05_01"); //Jak na razie nie mam co do tego wątpliwości.
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_PreTeach		(C_INFO)
{
	npc		 = 	KDW_14020_Addon_Nefarius_ADW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Nefarius_PreTeach_Condition;
	information	 = 	DIA_Addon_Nefarius_PreTeach_Info;

	description	 = 	"Mógłbyś mi przekazać swą wiedzę na temat magii?";
};

func int DIA_Addon_Nefarius_PreTeach_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_PreTeach_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_PreTeach_15_00"); //Mógłbyś mi przekazać swą wiedzę na temat magii?
	AI_Output	(self, other, "DIA_Addon_Nefarius_PreTeach_05_01"); //Mogę nauczyć cię tworzenia run, a Cronos sprzeda ci instrukcje.
	AI_Output	(self, other, "DIA_Addon_Nefarius_PreTeach_05_02"); //Zawsze nosi przy sobie księgi o runach.
	
	Nefarius_Addon_TeachRunes = TRUE;
	Log_CreateTopic	(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry (TOPIC_Addon_KDWTeacher, LogText_Addon_NefariusTeach); 
};

//*********************************************
// Runen
//*********************************************

INSTANCE DIA_Addon_Nefarius_ADW_Runen (C_INFO)
{
	npc			= KDW_14020_Addon_Nefarius_ADW;
	nr			= 99;
	condition	= DIA_Addon_Nefarius_ADW_Runen_Condition;
	information	= DIA_Addon_Nefarius_ADW_Runen_Info;
	permanent	= TRUE;
	description = "Naucz mnie (tworzenia run)";
};                       

FUNC INT DIA_Addon_Nefarius_ADW_Runen_Condition()
{
	if (Nefarius_Addon_TeachRunes == TRUE)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Info()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	  (DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"6. kręgu magii",DIA_Addon_Nefarius_ADW_Runen_6);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"5. kręgu magii",DIA_Addon_Nefarius_ADW_Runen_5);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"4. kręgu magii",DIA_Addon_Nefarius_ADW_Runen_4);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"3. kręgu magii",DIA_Addon_Nefarius_ADW_Runen_3);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"2. kręgu magii",DIA_Addon_Nefarius_ADW_Runen_2);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
	{ 
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"1. kręgu magii",DIA_Addon_Nefarius_ADW_Runen_1);
	};
};
//**********************************************************
// BACK
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_BACK()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
};
//**********************************************************
// Erster Kreis 
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_1 ()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	if	(PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_SummonGoblinSkeleton);
	};
	if (PLAYER_TALENT_RUNES [SPL_LightHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_LightHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightHeal)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LightHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_Zap] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Zap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Zap)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap);
	};
	if (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Firebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firebolt)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Firebolt);
	};
	if (PLAYER_TALENT_RUNES [SPL_LIGHT] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_LIGHT, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LIGHT)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LIGHT);
	};
};

//**********************************************************
// Zweiter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_2()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_InstantFireball);
	};
	if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Icebolt);
	};
	if (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_SummonWolf, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonWolf)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_SummonWolf);
	};
	if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_WINDFIST);
	};
	if (PLAYER_TALENT_RUNES [SPL_Sleep] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Sleep, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Sleep)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Sleep);
	};
	
//------------- Addon ----------------------

	if (PLAYER_TALENT_RUNES [SPL_Whirlwind] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Whirlwind, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Whirlwind)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Whirlwind);
	};
	if (PLAYER_TALENT_RUNES [SPL_ICELANCE] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_ICELANCE, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ICELANCE)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE);
	};	
	
};

//**********************************************************
// Dritter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_3()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_MediumHeal] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_MediumHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MediumHeal)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_MediumHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_ChargeZap] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_ChargeZap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeZap)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall);
	};
	if (PLAYER_TALENT_RUNES [SPL_Firestorm] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Firestorm, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firestorm)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Firestorm);
	};
	if (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_SummonSkeleton);
	};
	if (PLAYER_TALENT_RUNES [SPL_Fear] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Fear, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Fear)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Fear);
	};
	if (PLAYER_TALENT_RUNES [SPL_IceCube] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_IceCube, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceCube)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube);
	};
	
//------------------ Addon -------------------

	if (PLAYER_TALENT_RUNES [SPL_Thunderstorm] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Thunderstorm, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Thunderstorm)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Thunderstorm);
	};
	if (PLAYER_TALENT_RUNES [SPL_Geyser] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Geyser, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Geyser)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Geyser);
	};	
};

//**********************************************************
// Vierter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_4()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	
	if (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_SummonGolem, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGolem)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_SummonGolem);
	};
	if (PLAYER_TALENT_RUNES [SPL_DestroyUndead] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_DestroyUndead, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_DestroyUndead)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_DestroyUndead);
	};
	
	if (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_LightningFlash, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_LightningFlash)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash);
	};
	if (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_ChargeFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeFireball)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_ChargeFireball);
	};
	
	if (PLAYER_TALENT_RUNES [SPL_Waterfist] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Waterfist, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Waterfist)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_Waterfist);
	};
};

//**********************************************************
// Fünfter Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_5()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	
	if (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_IceWave, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_IceWave)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave);
	};
	if (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_SummonDemon, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonDemon)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_SummonDemon);
	};
	if (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_FullHeal, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_FullHeal)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_FullHeal);
	};
	if (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE) 
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Pyrokinesis, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Pyrokinesis)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_Pyrokinesis);
	};
};

//**********************************************************
// Sechster Kreis 
//--------------------------
//**********************************************************
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_6()
{
	Info_ClearChoices (DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);
	
	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Firerain);
	};
	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_BreathOfDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_BreathOfDeath)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_BreathOfDeath);
	};
	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_MassDeath, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_MassDeath)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_MassDeath);
	};
	if (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_ArmyOfDarkness);
	};
	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString (NAME_SPL_Shrink, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Shrink)) ,DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Shrink);
	};
};

//##########################################################
//			LERNEN
//##########################################################


//********	Kreis 1 **********
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LIGHT()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LIGHT);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Firebolt()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firebolt);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Zap);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LightHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightHeal);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_SummonGoblinSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);	
};

//******* Kreis 2 **********

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Whirlwind ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Whirlwind);
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE ()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ICELANCE);
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_InstantFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Icebolt()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_SummonWolf()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonWolf);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Sleep()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Sleep);		
};

//*********** Kreis 3 **********

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Thunderstorm()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Thunderstorm);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Geyser()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Geyser);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_MediumHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MediumHeal);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_SummonSkeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Fear()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Fear);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceCube);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeZap);		
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Firestorm()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firestorm);	
};

//************** Kreis 4 *********

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes (self, other, SPL_LightningFlash);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeFireball);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_Waterfist()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Waterfist);		
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGolem);		
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes (self, other, SPL_DestroyUndead);		
};

//*********** Kreis 5 ************

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Pyrokinesis);		
};

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes (self, other, SPL_IceWave);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonDemon);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes (self, other, SPL_FullHeal);	
};

//************* Kreis 6 ************

FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_BreathOfDeath);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes (self, other, SPL_MassDeath);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ArmyOfDarkness);	
};
FUNC VOID DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Shrink()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Shrink);	
};











