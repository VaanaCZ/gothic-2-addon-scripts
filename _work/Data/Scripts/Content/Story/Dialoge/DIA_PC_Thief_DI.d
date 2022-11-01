// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_PC_Thief_DI_EXIT(C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 999;
	condition	= DIA_PC_Thief_DI_EXIT_Condition;
	information	= DIA_PC_Thief_DI_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_PC_Thief_DI_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_PC_Thief_DI_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  	  Hallo
// ************************************************************

INSTANCE DIA_PC_Thief_DI_Hallo (C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 5;
	condition	= DIA_PC_Thief_DI_Hallo_Condition;
	information	= DIA_PC_Thief_DI_Hallo_Info;

	description = "Tak jsme tady.";
};                       
FUNC INT DIA_PC_Thief_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_PC_Thief_DI_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_PC_Thief_DI_Hallo_15_00"); //Tak jsme tady.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_01"); //Ten ostrov není od Khorinidu tak daleko, jak jsem si myslel.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_02"); //To jsem nevěděl. Teď se mi ale samozřejmě pár věcí vyjasnilo.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_03"); //Pořád mi vrtalo hlavou, jak je možné, že mají skřeti tak dobrý přísun zásob.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_04"); //S pomocí téhle základny to je hračka.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_05"); //Během cesty do srdce tohoto ostrova nejspíš narazíš na jednu dvě pasti.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_06"); //Pokud by ses někde zasekl, přijď ke mně. Možná by se ti mohly hodit moje zkušenosti.
};

// ************************************************************
// 	  	  RAT
// ************************************************************

INSTANCE DIA_PC_Thief_DI_RAT (C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 5;
	condition	= DIA_PC_Thief_DI_RAT_Condition;
	information	= DIA_PC_Thief_DI_RAT_Info;
	permanent	 = 	TRUE;

	description = "Potřebuji tvou pomoc.";
};     
                  
FUNC INT DIA_PC_Thief_DI_RAT_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_PC_Thief_DI_Hallo))
		{
				return TRUE;
		};
};

var int DIA_PC_Thief_DI_RAT_OneTime;
var int DIA_PC_Thief_DI_RAT_OneTime2;
FUNC VOID DIA_PC_Thief_DI_RAT_Info()
{	
	AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_00"); //Potřebuji tvou pomoc.
	
	if (Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI))
	&& (EVT_ORKOBERST_SWITCH_FOUND == FALSE)
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_01"); //Tam nahoře má svůj hlavní stan skřetí plukovník. Nemůžu se dostat dovnitř ostrova.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_02"); //Skřeti jsou chytrá stvoření. Často jsou neprávem podceňováni. Řekl bych, že mají nějaký tajný průchod. Prohledej zdi, snad najdeš nějaký skrytý spínač.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_03"); //Ale nezapomeň, že aby takovéhle tajné spínače fungovaly, musíš je často používat v přesně určeném pořadí.
		 
	}
	else if	(Npc_IsDead(FireDragonIsland))
	&& (EVT_DIBRIDGE_OPENED == FALSE)
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_04"); //Bojoval jsem s drakem a teď mám před sebou propast s padacím mostem. Ten most je ale zvednutý a já se nemůžu dostat na druhou stranu.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_05"); //Hmm. Zkoušel jsi už nějakou střelnou zbraň? Možná by šlo jeho mechanismus spustit dobře mířenou ranou.
	}
	else if	(Npc_IsDead(Skeleton_Lord_Archol))
	&& ((Npc_KnowsInfo(other, DIA_Schwarzmagier_HELLO)) == FALSE)
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_06"); //Stojím proti hordě nemrtvých a jejich složitým pastem.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_07"); //Je mi líto, ale s nemrtvými nemám žádné zkušenosti. S tím si budeš muset poradit sám.
	}
	else
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_08"); //Vrať se ke mně, až budeš mít problém, na jehož řešení budou moje zkušenosti stačit.
		
		 if (ORkSturmDI == TRUE)
		 && (DIA_PC_Thief_DI_RAT_OneTime2 == FALSE)
			{
				AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_09"); //Ještě jedna věc. Byl bych rád, kdybys k lodi nepřivedl všechny příšery, co se tu po okolí potulují. Doufám, že tenhle skřetí nájezd byl poslední, který jsem musel odrážet!
				B_GivePlayerXP (XP_Ambient);
				DIA_PC_Thief_DI_RAT_OneTime2 = TRUE;
			};	
	};
};

 
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Diego_DI_TRADE		(C_INFO)
{
	npc		 = 	PC_Thief_DI;
	nr          = 12;
	condition	 = 	DIA_Diego_DI_TRADE_Condition;
	information	 = 	DIA_Diego_DI_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;

	description	 = 	"Potřebuju doplnit výzbroj.";
};

func int DIA_Diego_DI_TRADE_Condition ()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Diego_DI_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Diego_DI_TRADE_15_00"); //Potřebuju doplnit výzbroj.
	B_GiveTradeInv (self);

	//Joly: Mc ArrowBolt
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
	Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 50);
	CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
	//////////////////////////////////////////////////////////////////////////////////////


	AI_Output			(self, other, "DIA_Diego_DI_TRADE_11_01"); //Možná bych ti mohl pomoct.
};

// ************************************************************
// 	  	  Training
// ************************************************************

INSTANCE DIA_PC_Thief_DI_Training_Talente (C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 10;
	condition	= DIA_PC_Thief_DI_Training_Talente_Condition;
	information	= DIA_PC_Thief_DI_Training_Talente_Info;
	permanent	 = 	TRUE;

	description = "Trénuj mě.";
};                       
FUNC INT DIA_PC_Thief_DI_Training_Talente_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_PC_Thief_DI_Hallo))
	{
		return TRUE;
	};
};

FUNC VOID DIA_PC_Thief_DI_Training_Talente_Info()
{	
	AI_Output (other,self ,"DIA_PC_Thief_DI_Training_15_00"); //Trénuj mě.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Training_11_01"); //Co potřebuješ?
	
	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Páčení zámků"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};

	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

//***************************************************************************
// DEX 1
//***************************************************************************

func void DIA_PC_Thief_DI_Training_DEX_1 ()
{
	if (B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX))
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00"); //Život pro tebe bude mnohem jednodušší, když se budeš držet mimo střelecký úhel.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Páčení zámků"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};

	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

//***************************************************************************
// DEX 5
//***************************************************************************

func void DIA_PC_Thief_DI_Training_DEX_5 ()
{
	if (B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX))
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00"); //Když se pohybuješ, snaž se být mrštný jako kočka. Zbytek půjde sám.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Páčení zámků"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};

	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

//***************************************************************************
// BOGEN
//***************************************************************************
// ------ 1% Waffentalent ------
func void DIA_PC_Thief_DI_Training_Combat_BOW_1()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 100))
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00"); //Jestli chceš být opravdu dobrý, hodně trénuj nanečisto.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Páčení zámků"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};

	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

// ------ 5% Waffentalent ------
func void DIA_PC_Thief_DI_Training_Combat_BOW_5()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 100))
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00"); //Při míření pomalu vydechni, aby se ti netřásla ruka.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Páčení zámků"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};
	
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

// ------ PICKLOCK ------
func void DIA_PC_Thief_DI_Training_Talente_PICKLOCK ()
{
	if (B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK))
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_PICKLOCK_11_00"); //Už bylo načase. Nechápu, žes to doteď neuměl.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "Páčení zámků"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
	};

	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1			, B_GetLearnCostAttribute(other, ATR_DEXTERITY))			,DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5			, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)		,DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1))				,DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5	, 			B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5))			,DIA_PC_Thief_DI_Training_Combat_BOW_5);
	
};

// ------ Back ------
func void DIA_PC_Thief_DI_Training_Talente_BACK ()
{
	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
};

// ************************************************************
// 	  	  UndeadDragonDead
// ************************************************************

INSTANCE DIA_PC_Thief_DI_UndeadDragonDead (C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 5;
	condition	= DIA_PC_Thief_DI_UndeadDragonDead_Condition;
	information	= DIA_PC_Thief_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;

	description = "Je po všem. Teď odsud můžeme vypadnout.";
};                       
FUNC INT DIA_PC_Thief_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};
var int DIA_PC_Thief_DI_UndeadDragonDead_OneTime;
FUNC VOID DIA_PC_Thief_DI_UndeadDragonDead_Info()
{	
	AI_Output (other,self ,"DIA_PC_Thief_DI_UndeadDragonDead_15_00"); //Je po všem. Teď odsud můžeme vypadnout.

	if ((Npc_GetDistToWP(self,"WP_UNDEAD_MIDDLE_01")<4000) )
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_01"); //Jen se na to podívej. Za celej svůj život jsem nic podobnýho neviděl.
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_02"); //Jak ses proboha skrz tu věc dostal?
		AI_Output (other,self ,"DIA_PC_Thief_DI_UndeadDragonDead_15_03"); //Řekl bych, že jsem měl štěstí.
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_04"); //(směje se) Když to říkáš.
	}
	else
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_05"); //Dobrá.
	};

	if (DIA_PC_Thief_DI_UndeadDragonDead_OneTime == FALSE )
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_UndeadDragonDead_15_06"); //Co budeš dělat dál?
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_07"); //To je dobrá otázka. Ze všeho nejdřív se asi vrátím do Khorinidu.
		//AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_08"); //Wäre doch gelacht, wenn ich aus dem Dreckloch nicht wieder eine gescheite Stadt ohne Korruption machen kann.
		if (Diebesgilde_Verraten == TRUE)
		|| (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_DiegoDI_Add_11_00"); //Zlodějskej cech tam už není. Tím pádem se nabízí několik zajímavých příležitostí.
		};
		//AI_Output (self ,other,"DIA_DiegoDI_Add_11_01"); //Für Bromors Haus kann ich bestimmt noch was rausschlagen - vorausgesetzt ich finde einen Käufer...
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_09"); //Hmm. Nebo možná prostě převezmu Bromorovu živnost. V tom jsou vždycky peníze. Poctivý peníze.
		DIA_PC_Thief_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_10"); //Běž za kapitánem, ať už jsme pryč.
	AI_StopProcessInfos (self);

	if ( Lares_IsOnBoard != LOG_SUCCESS) 
			{
				Npc_ExchangeRoutine	(self, "SittingShipDI");
			}
			else
			{
				Npc_ExchangeRoutine	(self,"Začít");		
			};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thief_DI_PICKPOCKET (C_INFO)
{
	npc			= PC_Thief_DI;
	nr			= 900;
	condition	= DIA_Thief_DI_PICKPOCKET_Condition;
	information	= DIA_Thief_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Thief_DI_PICKPOCKET_Condition()
{
	C_Beklauen (120, 600);
};
 
FUNC VOID DIA_Thief_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thief_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Thief_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Thief_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thief_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thief_DI_PICKPOCKET_DoIt);
};

func void DIA_Thief_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thief_DI_PICKPOCKET);
};
	
func void DIA_Thief_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thief_DI_PICKPOCKET);
};


