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
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_01"); //Ten ostrov nen� od Khorinidu tak daleko, jak jsem si myslel.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_02"); //To jsem nev�d�l. Te� se mi ale samoz�ejm� p�r v�c� vyjasnilo.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_03"); //Po��d mi vrtalo hlavou, jak je mo�n�, �e maj� sk�eti tak dobr� p��sun z�sob.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_04"); //S pomoc� t�hle z�kladny to je hra�ka.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_05"); //B�hem cesty do srdce tohoto ostrova nejsp� naraz� na jednu dv� pasti.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Hallo_11_06"); //Pokud by ses n�kde zasekl, p�ij� ke mn�. Mo�n� by se ti mohly hodit moje zku�enosti.
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

	description = "Pot�ebuji tvou pomoc.";
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
	AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_00"); //Pot�ebuji tvou pomoc.
	
	if (Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI))
	&& (EVT_ORKOBERST_SWITCH_FOUND == FALSE)
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_01"); //Tam naho�e m� sv�j hlavn� stan sk�et� plukovn�k. Nem��u se dostat dovnit� ostrova.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_02"); //Sk�eti jsou chytr� stvo�en�. �asto jsou nepr�vem podce�ov�ni. �ekl bych, �e maj� n�jak� tajn� pr�chod. Prohledej zdi, snad najde� n�jak� skryt� sp�na�.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_03"); //Ale nezapome�, �e aby takov�hle tajn� sp�na�e fungovaly, mus� je �asto pou��vat v p�esn� ur�en�m po�ad�.
		 
	}
	else if	(Npc_IsDead(FireDragonIsland))
	&& (EVT_DIBRIDGE_OPENED == FALSE)
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_04"); //Bojoval jsem s drakem a te� m�m p�ed sebou propast s padac�m mostem. Ten most je ale zvednut� a j� se nem��u dostat na druhou stranu.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_05"); //Hmm. Zkou�el jsi u� n�jakou st�elnou zbra�? Mo�n� by �lo jeho mechanismus spustit dob�e m��enou ranou.
	}
	else if	(Npc_IsDead(Skeleton_Lord_Archol))
	&& ((Npc_KnowsInfo(other, DIA_Schwarzmagier_HELLO)) == FALSE)
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_RAT_15_06"); //Stoj�m proti hord� nemrtv�ch a jejich slo�it�m pastem.
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_07"); //Je mi l�to, ale s nemrtv�mi nem�m ��dn� zku�enosti. S t�m si bude� muset poradit s�m.
	}
	else
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_08"); //Vra� se ke mn�, a� bude� m�t probl�m, na jeho� �e�en� budou moje zku�enosti sta�it.
		
		 if (ORkSturmDI == TRUE)
		 && (DIA_PC_Thief_DI_RAT_OneTime2 == FALSE)
			{
				AI_Output (self ,other,"DIA_PC_Thief_DI_RAT_11_09"); //Je�t� jedna v�c. Byl bych r�d, kdybys k lodi nep�ivedl v�echny p��ery, co se tu po okol� potuluj�. Douf�m, �e tenhle sk�et� n�jezd byl posledn�, kter� jsem musel odr�et!
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

	description	 = 	"Pot�ebuju doplnit v�zbroj.";
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
	AI_Output			(other, self, "DIA_Diego_DI_TRADE_15_00"); //Pot�ebuju doplnit v�zbroj.
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


	AI_Output			(self, other, "DIA_Diego_DI_TRADE_11_01"); //Mo�n� bych ti mohl pomoct.
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

	description = "Tr�nuj m�.";
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
	AI_Output (other,self ,"DIA_PC_Thief_DI_Training_15_00"); //Tr�nuj m�.
	AI_Output (self ,other,"DIA_PC_Thief_DI_Training_11_01"); //Co pot�ebuje�?
	
	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "P��en� z�mk�"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
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
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00"); //�ivot pro tebe bude mnohem jednodu���, kdy� se bude� dr�et mimo st�eleck� �hel.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "P��en� z�mk�"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
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
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00"); //Kdy� se pohybuje�, sna� se b�t mr�tn� jako ko�ka. Zbytek p�jde s�m.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "P��en� z�mk�"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
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
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00"); //Jestli chce� b�t opravdu dobr�, hodn� tr�nuj nane�isto.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "P��en� z�mk�"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
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
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00"); //P�i m��en� pomalu vydechni, aby se ti net��sla ruka.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "P��en� z�mk�"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
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
		AI_Output (self ,other,"DIA_PC_Thief_DI_Training_PICKLOCK_11_00"); //U� bylo na�ase. Nech�pu, �es to dote� neum�l.
	};

	Info_ClearChoices (DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice	  (DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
	Info_AddChoice		(DIA_PC_Thief_DI_Training_Talente, "P��en� z�mk�"	,DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
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

	description = "Je po v�em. Te� odsud m��eme vypadnout.";
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
	AI_Output (other,self ,"DIA_PC_Thief_DI_UndeadDragonDead_15_00"); //Je po v�em. Te� odsud m��eme vypadnout.

	if ((Npc_GetDistToWP(self,"WP_UNDEAD_MIDDLE_01")<4000) )
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_01"); //Jen se na to pod�vej. Za celej sv�j �ivot jsem nic podobn�ho nevid�l.
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_02"); //Jak ses proboha skrz tu v�c dostal?
		AI_Output (other,self ,"DIA_PC_Thief_DI_UndeadDragonDead_15_03"); //�ekl bych, �e jsem m�l �t�st�.
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_04"); //(sm�je se) Kdy� to ��k�.
	}
	else
	{
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_05"); //Dobr�.
	};

	if (DIA_PC_Thief_DI_UndeadDragonDead_OneTime == FALSE )
	{
		AI_Output (other,self ,"DIA_PC_Thief_DI_UndeadDragonDead_15_06"); //Co bude� d�lat d�l?
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_07"); //To je dobr� ot�zka. Ze v�eho nejd��v se asi vr�t�m do Khorinidu.
		//AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_08"); //W�re doch gelacht, wenn ich aus dem Dreckloch nicht wieder eine gescheite Stadt ohne Korruption machen kann.
		if (Diebesgilde_Verraten == TRUE)
		|| (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_DiegoDI_Add_11_00"); //Zlod�jskej cech tam u� nen�. T�m p�dem se nab�z� n�kolik zaj�mav�ch p��le�itost�.
		};
		//AI_Output (self ,other,"DIA_DiegoDI_Add_11_01"); //F�r Bromors Haus kann ich bestimmt noch was rausschlagen - vorausgesetzt ich finde einen K�ufer...
		AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_09"); //Hmm. Nebo mo�n� prost� p�evezmu Bromorovu �ivnost. V tom jsou v�dycky pen�ze. Poctiv� pen�ze.
		DIA_PC_Thief_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_Output (self ,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_10"); //B� za kapit�nem, a� u� jsme pry�.
	AI_StopProcessInfos (self);

	if ( Lares_IsOnBoard != LOG_SUCCESS) 
			{
				Npc_ExchangeRoutine	(self, "SittingShipDI");
			}
			else
			{
				Npc_ExchangeRoutine	(self,"Za��t");		
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


