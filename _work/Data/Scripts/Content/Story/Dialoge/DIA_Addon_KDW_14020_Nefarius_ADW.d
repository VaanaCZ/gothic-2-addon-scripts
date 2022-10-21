
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
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_00"); //Strašnì se mi ulevilo, že jsi sem v poøádku dorazil.
	AI_Output	(other, self, "DIA_Addon_Nefarius_ADWHello_15_01"); //Jak to, že jsi sem dorazil døív než já?
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_02"); //Cestovali jsme pøes zvláštní dimenzi. Kdo ví, jakými oklikami jsi to bral ty.
	AI_Output	(other, self, "DIA_Addon_Nefarius_ADWHello_15_03"); //A teï? Mùžu ten portál použít znovu?
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_04"); //Pøišli jsme sem pøímo. Evidentnì to funguje docela dobøe.
	AI_Output	(self, other, "DIA_Addon_Nefarius_ADWHello_05_05"); //Samozøejmì ti dám vìdìt, kdybych mìl nìjaké podezøení, že by to mohlo být jinak.
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

	description	 = 	"Co jsi tu dosud dìlal?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_Neues_15_00"); //Co jsi tu dosud dìlal?
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_01"); //Studuji historii stavitelù a snažím se pochopit, proè uzavøeli ten portál.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_02"); //Vypadá to, jako by se to potopené mìsto snažili ukrýt pøed celým svìtem.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_03"); //Pøed mnoha lety se tu staly dìsivé vìci. Zachvátilo je nìco strašlivého.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_04"); //Pokud se dá vìøit jejich záznamùm, tak nedlouho pøed pádem mìsta tu propukla obèanská válka.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_05"); //Ulice byly v plamenech a nakonec osud stavitelù zpeèetila povodeò, která se vzápìtí pøihnala.
	AI_Output	(self, other, "DIA_Addon_Nefarius_Neues_05_06"); //Ti nemnozí, kteøí celé to peklo pøežili, uzavøeli tuto èást ostrova v nadìji, že tak celý chaos zastaví.
	
	Info_ClearChoices	(DIA_Addon_Nefarius_Neues);
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "Co si myslíš, že tu najdeme?", DIA_Addon_Nefarius_Neues_find );
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "A my hlupáci ten portál znovu otevøeli.", DIA_Addon_Nefarius_Neues_auf );
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "Z èeho byli stavitelé tak vydìšeni?", DIA_Addon_Nefarius_Neues_was );
	Info_AddChoice	(DIA_Addon_Nefarius_Neues, "Zmiòoval ses o povodni?", DIA_Addon_Nefarius_Neues_flut );
};
func void DIA_Addon_Nefarius_Neues_find ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_find_15_00"); //Co si myslíš, že tu najdeme?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_find_05_01"); //O tom se mùžu jedinì dohadovat. Mìl by sis promluvit se Saturasem.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_find_05_02"); //Má jistý nápad.
	
	Log_CreateTopic (TOPIC_Addon_Flut, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Flut, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Flut,"Nefarius tvrdí, že o potopeném mìstì bych si mìl promluvit se Saturasem."); 

	
	NefariusADW_Talk2Saturas = TRUE;
};
func void DIA_Addon_Nefarius_Neues_flut ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_flut_15_00"); //Øíkal jsi, že propukla povodeò?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_flut_05_01"); //Samotný Adanos se jim zjevil, aby celé šílenství ukonèil.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_flut_05_02"); //Znièil celé mìsto do poslední mrtì.
};
func void DIA_Addon_Nefarius_Neues_was ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_was_15_00"); //Co ty stavitele tak znepokojilo?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_01"); //Jeden z nich propadl zlu. Byl to slavný velitel jménem Quarhodron.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_02"); //Jednou vyjel z ochranných hradeb mìsta, kde vybojoval úspìšnou bitvu. Avšak spolu s ním vstoupilo do mìsta velké zlo.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_03"); //Všichni jeho následovníci zakrátko zešíleli a zaèali bojovat proti prostému lidu.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_was_05_04"); //Následovala obèanská válka, která vše obrátila v sutiny.
};
func void DIA_Addon_Nefarius_Neues_auf ()
{
	AI_Output			(other, self, "DIA_Addon_Nefarius_Neues_auf_15_00"); //A my blázni jsme ten portál znovu otevøeli.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_auf_05_01"); //Ani jedno mì netìší, vìø mi.
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_auf_05_02"); //Ale mìli jsme snad na vybranou?
	AI_Output			(self, other, "DIA_Addon_Nefarius_Neues_auf_05_03"); //Jestli neuèiníme pøítrž tomu, co se tady dìje, pak Khorinis postihne pøesnì stejný osud, který kdysi potkal i stavitele tohoto pradávného mìsta.
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

	description	 = 	"Je cesta portálem bezpeèná?";
};
func int DIA_Addon_Nefarius_PermADW_Condition ()
{
	return TRUE;
};
func void DIA_Addon_Nefarius_PermADW_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Nefarius_PermADW_15_00"); //Je cesta skrz portál bezpeèná?
	AI_Output	(self, other, "DIA_Addon_Nefarius_PermADW_05_01"); //Ještì jsem tím neletìl.
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

	description	 = 	"Mohl by ses se mnou podìlit o své magické vìdìní?";
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
	AI_Output	(other, self, "DIA_Addon_Nefarius_PreTeach_15_00"); //Mùžeš mi pøedat nìjaké magické vìdomosti?
	AI_Output	(self, other, "DIA_Addon_Nefarius_PreTeach_05_01"); //Mohu tì nauèit vytváøet runy a Cronos ti k nim mùže prodat magické formule.
	AI_Output	(self, other, "DIA_Addon_Nefarius_PreTeach_05_02"); //Poøád s sebou nosí runové knihy.
	
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
	description = "Instruuj mì (vytvoøení run)";
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
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"6. kruh magie",DIA_Addon_Nefarius_ADW_Runen_6);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"5. kruh magie",DIA_Addon_Nefarius_ADW_Runen_5);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"4. kruh magie",DIA_Addon_Nefarius_ADW_Runen_4);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"3. kruh magie",DIA_Addon_Nefarius_ADW_Runen_3);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"2. kruh magie",DIA_Addon_Nefarius_ADW_Runen_2);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
	{ 
		Info_AddChoice		(DIA_Addon_Nefarius_ADW_Runen,"1. kruh magie",DIA_Addon_Nefarius_ADW_Runen_1);
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











