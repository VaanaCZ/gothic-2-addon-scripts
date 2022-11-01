// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bennet_EXIT   (C_INFO)
{
	npc         = SLD_809_Bennet;
	nr          = 999;
	condition   = DIA_Bennet_EXIT_Condition;
	information = DIA_Bennet_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Bennet_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bennet_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo 
// ************************************************************
instance DIA_Bennet_HALLO	(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 1;
	condition	= DIA_Bennet_HALLO_Condition;
	information	= DIA_Bennet_HALLO_Info;
	permanent 	= FALSE;
	important 	= TRUE;
};

func int DIA_Bennet_HALLO_Condition ()
{
	if (Kapitel < 3)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bennet_HALLO_06_00"); //Neprodávám žádné zbranę. Khaled je prodává. Je v domę s Onarem.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Khaled prodává zbranę.");
};

// ************************************************************
// 			  				TRADE 
// ************************************************************
instance DIA_Bennet_TRADE		(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 700;
	condition	= DIA_Bennet_TRADE_Condition;
	information	= DIA_Bennet_TRADE_Info;
	permanent	= TRUE;
	description	= "Můžeš mi prodat nęjaké vęci na kování?";
	trade		= TRUE;
};

func int DIA_Bennet_TRADE_Condition ()
{
	if ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TRADE_15_00"); //Můžeš mi prodat nęjaké vęci na kování?
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

	AI_Output (self, other, "DIA_Bennet_TRADE_06_01"); //Co potâebuješ?
	
	if (BennetLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Bennet prodává kováâské náčiní.");
		BennetLOG = TRUE;
	};
};

// ************************************************************
// 			  				WhichWeapons 
// ************************************************************
instance DIA_Bennet_WhichWeapons (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 2;
	condition	= DIA_Bennet_WhichWeapons_Condition;
	information	= DIA_Bennet_WhichWeapons_Info;
	permanent	= FALSE;
	description	= "Jaké zbranę vyrábíš?";
};

func int DIA_Bennet_WhichWeapons_Condition ()
{
	if ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	&& (MIS_Bennet_BringOre == FALSE)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhichWeapons_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_00"); //Jaké zbranę vyrábíš?
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_01"); //V tuhle chvíli obyčejné meče, nic jiného.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_02"); //Ale kdybych męl trochu magické rudy, mohl bych ukovat zbranę, které jsou mnohem lepší než všechny srovnatelné zbranę vyrobené z normální staré oceli.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_03"); //Nevíš náhodou, kde bych tady v okolí nęjakou našel? (smęje se) Mám na mysli kromę Hornického údolí samozâejmę.
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_04"); //Ne.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_05"); //Samozâejmę ne.
};

// ************************************************************
// 			  				BauOrSld 
// ************************************************************
instance DIA_Bennet_BauOrSld (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 3;
	condition	= DIA_Bennet_BauOrSld_Condition;
	information	= DIA_Bennet_BauOrSld_Info;
	permanent	= FALSE;
	description	= "Patâíš k rolníkům, nebo k žoldákům?";
};

func int DIA_Bennet_BauOrSld_Condition ()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_00"); //Patâíš k rolníkům, nebo k žoldákům?
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_01"); //Ty si ze mę utahuješ, že jo?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_02"); //Byl jsem jenom zvędavý.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_03"); //Už jsi nękdy vidęl farmáâe kovat zbranę?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_04"); //Ne.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_05"); //Tak proč mi dáváš tak hloupé otázky?
};

// ************************************************************
// 			  				WannaJoin 
// ************************************************************
instance DIA_Bennet_WannaJoin (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 4;
	condition	= DIA_Bennet_WannaJoin_Condition;
	information	= DIA_Bennet_WannaJoin_Info;
	permanent	= TRUE;
	description	= "Chci se pâidat k žoldnéâům!";
};

func int DIA_Bennet_WannaJoin_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bennet_BauOrSld))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaJoin_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaJoin_15_00"); //Chci se pâidat k žoldnéâům!
	AI_Output (self, other, "DIA_Bennet_WannaJoin_06_01"); //Pâestaŕ žvanit, bęž za Torlofem a nech ho, aă ti dá test.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Bennet_WannaJoin_15_02"); //Prošel jsem zkouškou.
		AI_Output (self, other, "DIA_Bennet_WannaJoin_06_03"); //Dobâe, tak to pro tebe budu hlasovat.
	};
};

// ************************************************************
// 			  				WannaSmith 
// ************************************************************

instance DIA_Bennet_WannaSmith (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 5;
	condition	= DIA_Bennet_WannaSmith_Condition;
	information	= DIA_Bennet_WannaSmith_Info;
	permanent	= TRUE;
	description	= "Můžeš mę naučit, jak ukovat meč?";
};

func int DIA_Bennet_WannaSmith_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmith_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_15_00"); //Můžeš mę naučit, jak ukovat meč?
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_01"); //Jasnę.
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_02"); //To tę bude nęco stát. Âeknęme 30 zlatých.
	
	Info_ClearChoices (DIA_Bennet_WannaSmith);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Možná pozdęji.", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Dobâe. Tady máš 30 zlatek.", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //Dobâe. Tady máš 30 zlatek.
	
	if (B_GiveInvItems (other, self, itmi_gold, 30))
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //A to byla taky zatracenę dobrá cena! Můžeme začít, jakmile budeš pâipraven.
		
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Bennet mę naučí kováâskému umęní.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //Pâestaŕ se chovat jako naivka. Âíkám 30 a ani o minci míŕ.
	};
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //Možná pozdęji.
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};


// ************************************************************
// 			  				Teach COMMON 
// ************************************************************
instance DIA_Bennet_TeachCOMMON (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 6;
	condition	= DIA_Bennet_TeachCOMMON_Condition;
	information	= DIA_Bennet_TeachCOMMON_Info;
	permanent	= TRUE;
	description	= B_BuildLearnString("Naučit se kováâství", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
};

func int DIA_Bennet_TeachCOMMON_Condition ()
{
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	&& (Bennet_TeachCommon == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachCOMMON_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TeachCOMMON_15_00"); //Nauč mne ukovat meč!
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_01"); //Je to celkem jednoduché: Vezmi kus surového železa a drž ho v ohni, dokud se nerozžhaví.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_02"); //Pak ho polož na kovadlinu a roztepej čepel do potâebného tvaru.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_03"); //Hlavnę musíš dávat pozor, aby čepel pâíliš nevychladla. Na opracování zbranę máš vždycky jenom pár minut času.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_04"); //Na zbytek pâijdeš sám - je to jenom otázka praxe.
	};
};

// ************************************************************
// 			  				WannaSmithORE
// ************************************************************
instance DIA_Bennet_WannaSmithORE (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 7;
	condition	= DIA_Bennet_WannaSmithORE_Condition;
	information	= DIA_Bennet_WannaSmithORE_Info;
	permanent	= TRUE;
	description	= "Nauč mne, jak ukovat zbranę z magické rudy!";
};

func int DIA_Bennet_WannaSmithORE_Condition ()
{
	if (Bennet_TeachSmith == FALSE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))	
	{
		return TRUE;
	};
};

func void DIA_Bennet_WannaSmithORE_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_00"); //Nauč mne kovat zbranę z magické rudy!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_01"); //Ale ty neznáš vůbec ani základy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_02"); //Nejdâív se musíš naučit ukovat obyčejný meč. Pak uvidíme.
	}
	else if (other.guild != GIL_SLD)
	&& 		(other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_03"); //Protože nejsi jedním z nás, tak bych byl v háji, kdybych ti vyzradil tajemství zbraní z magické rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_04"); //Pouze velmi málo kováren tohle všechno umí, a já vęâím, že to nedokáží dokonce ani kováâi ve męstę.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_05"); //A to je taky dobâe. Jinak by všichni ty męstský ochlastové ve stráži nosili magické meče.
		if (other.guild == GIL_MIL)
		{	
			AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_06"); //Nic proti tobę. (kâení se) Vypadáš, že jsi v pohodę.
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_07"); //Kdybych męl magickou rudu, dokonce i já bych to tak udęlal.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_08");//Ale, no táák - jsem s žoldákama a umím kovat - co jiného chceš?
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_09"); //Můžeš mi tedy potom âíct, jak mám ukovat zbraŕ z magické rudy bez použití magické rudy?
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_10");//Noooo...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_11"); //To jsem si myslel. Potâebuju nejménę 5 hrudek té rudy - nebo na to rovnou zapomeŕ.
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else //alles OK
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_12"); //Skvęle, pâinesl jsi mi rudu a také víš, jak ukovat normální meč.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_13");//No, tak tedy povídej.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_14"); //Nejdůležitęjší vęc je: Nezáleží na tom, zdali je tvá celá zbraŕ vyrobená z magické rudy, nebo jestli máš pokrytou jen obyčejnou ocelovou čepel vrstvou rudy. Povrch je to, na čem záleží.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_15"); //A protože je ten mizernej materiál tak drahej, popadni ocelovej prut a použij pár hrud rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_16"); //Pâirozenę z toho nevznikne nic jinýho, než že to jenom pokryje hotový meč magickou rudou. Budeš muset ukovat ten meč od začátku.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_17"); //Všechno ostatní závisí na zbrani, kterou chceš vyrobit.
		Bennet_TeachSmith = TRUE;
	};
};

// ************************************************************
// 			  				WhereOre
// ************************************************************
instance DIA_Bennet_WhereOre (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 8;
	condition	= DIA_Bennet_WhereOre_Condition;
	information	= DIA_Bennet_WhereOre_Info;
	permanent	= FALSE;
	description	= "Kde mohu najít magickou rudu?";
};

func int DIA_Bennet_WhereOre_Condition ()
{
	if (MIS_Bennet_BringOre == LOG_RUNNING)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_WhereOre_Info ()
{
	AI_Output (other, self, "DIA_Bennet_WhereOre_15_00"); //Kde můžu najít magickou rudu?
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_01"); //No, kdybych tohle jenom vędęl. Nęjaká určitę bude v tęžaâské kolonii.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_02"); //Ale možná budeš mít štęstí a najdeš tady v okolí pár zbytků.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_03"); //Myslím, že v horách jižnę odsud jsou nęjaké doly. Možná že bys tam męl vętší štęstí.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_04"); //Ale dávej bacha, slyšel jsem, že se to tam hemží banditama.
};

// ************************************************************
// 			  				BringOre
// ************************************************************
instance DIA_Bennet_BringOre (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr          = 9;
	condition	= DIA_Bennet_BringOre_Condition;
	information	= DIA_Bennet_BringOre_Info;
	permanent	= FALSE;
	description	= "Tumáš - 5 kousků rudy.";
};

func int DIA_Bennet_BringOre_Condition ()
{
	if (MIS_Bennet_BringOre == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Nugget) >= 5)
	{
		return TRUE;
	};
};

func void DIA_Bennet_BringOre_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BringOre_15_00"); //Tady máš - 5 zlatých.
	AI_Output (self, other, "DIA_Bennet_BringOre_06_01"); //(smęje se) Ukaž!
	B_GiveInvItems (other, self, itmi_nugget, 5);
	AI_Output (self, other, "DIA_Bennet_BringOre_06_02"); //Skutečnę! Tohle mę fakt srazilo k zemi!
	AI_Output (self, other, "DIA_Bennet_BringOre_06_03"); //Dvę si nech. Budeš je potâebovat, abys mohl ukovat svojí vlastní zbraŕ.
	B_GiveInvItems (self,other, itmi_nugget, 2);
	MIS_Bennet_BringOre = LOG_SUCCESS;
};

// ************************************************************
// 			  				  Teach 
// ************************************************************
var int Bennet_Kap2Smith;
var int Bennet_Kap3Smith;
var int Bennet_Kap4Smith;
var int Bennet_Kap5Smith;
// ---------------------------------

FUNC VOID B_SayBennetLATER()
{
	AI_Output	(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Ne, ještę ne. Vraă se pozdęji.
};
instance DIA_Bennet_TeachSmith		(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 30;
	condition	= DIA_Bennet_TeachSmith_Condition;
	information	= DIA_Bennet_TeachSmith_Info;
	permanent	= TRUE;
	description	= "Chtęl bych umęt kovat zbranę z magické rudy.";
};

func int DIA_Bennet_TeachSmith_Condition ()
{
	if (Bennet_TeachSmith == TRUE)
	&& ((Kapitel != 3) || (MIS_RescueBennet == LOG_SUCCESS))		//damit Bennet dir im Knast kein Schmieden beibringt
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSmith_Info ()
{
	AI_Output (other, self, "DIA_Bennet_TeachSmith_15_00"); //Chci vędęt víc o kutí zbraní z magické rudy.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		B_SayBennetLATER();
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_01"); //Mohu tę naučit, jak kovat meče z magické rudy nebo dokonce obouruční zbranę.
		Bennet_Kap2Smith = TRUE;
	}
	else if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_02"); //Zdokonalil jsem svojí techniku. Nyní tę mohu naučit, jak vytvoâit s pomocí rudy tęžké meče nebo tęžké obouruční meče.
		Bennet_Kap3Smith = TRUE;
	}
	else if (MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_03"); //Myslím, že jsem se tentokrát pâekonal. Vytvoâil jsem dvę bojové čepele. To je ta nejlepší vęc, jakou jsem doteë vidęl.
		Bennet_Kap4Smith = TRUE;
	}
	else if (Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_04"); //Poslyš. Myslím, že jsem právę dostal dokonalý nápad. Zbranę z magické rudy, zakalené dračí krví. A já pâesnę vím, jak na to půjdu!
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_05"); //(zubí se) Chceš to vędęt?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_06"); //Jakou zbraŕ bys chtęl vyrobit?
	};
	
	Info_ClearChoices (DIA_Bennet_TeachSmith);
	Info_AddChoice (DIA_Bennet_TeachSmith, DIALOG_BACK, DIA_Bennet_TeachSmith_BACK);
	// ------ Kapitel 2 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_01 , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01))		,DIA_Bennet_TeachSmith_1hSpecial1);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
	&& (Kapitel >= 2) 
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01))		,DIA_Bennet_TeachSmith_2hSpecial1);
	};
	// ------ Kapitel 3 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02))		,DIA_Bennet_TeachSmith_1hSpecial2);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
	&& (Kapitel >= 3)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02))		,DIA_Bennet_TeachSmith_2hSpecial2);
	};
	// ------ Kapitel 4 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_03))		,DIA_Bennet_TeachSmith_1hSpecial3);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
	&& (Kapitel >= 4)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_03))		,DIA_Bennet_TeachSmith_2hSpecial3);
	};
	// ------ Kapitel 5 ------
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
	&& (Kapitel >= 5)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_1H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_04))		,DIA_Bennet_TeachSmith_1hSpecial4);
	};  
	if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
	&& (Kapitel >= 5)
	{
		Info_AddChoice		(DIA_Bennet_TeachSmith, B_BuildLearnString(NAME_ItMw_2H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_04))		,DIA_Bennet_TeachSmith_2hSpecial4);
	};
};

FUNC VOID DIA_Bennet_TeachSmith_Back ()
{
	Info_ClearChoices (DIA_Bennet_TeachSmith);
};
func VOID DIA_Bennet_TeachSmith_1hSpecial1 ()
{
	
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_01);	
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial1 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_01);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_02);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial2 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_02);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_03);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial3 ()
{

	B_TeachPlayerTalentSmith (self, other, WEAPON_2H_Special_03);
};
FUNC VOID DIA_Bennet_TeachSmith_1hSpecial4 ()
{
	
	B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Special_04);
};
FUNC VOID DIA_Bennet_TeachSmith_2hSpecial4 ()
{

	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_04);
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

INSTANCE DIA_Bennet_KAP3_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP3_EXIT_Condition;
	information	= DIA_Bennet_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//*********************************************************************
//	Was machst du hier im Knast?
//*********************************************************************
instance DIA_Bennet_WhyPrison		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_WhyPrison_Condition;
	information	 = 	DIA_Bennet_WhyPrison_Info;
	permanent	 = 	FALSE;
	description	 = 	"A proč ses vlastnę dostal do lochu?";
};

func int DIA_Bennet_WhyPrison_Condition ()
{
	IF (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhyPrison_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_00"); //Za co ses dostal do lochu?
	AI_Output	(self , other,"DIA_Bennet_WhyPrison_06_01"); //Ty svinę mę hodily do týhle díry. Prý jsem zavraždil paladina.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_02"); //Ale já jsem to neudęlal, oni se to jenom pokouší na mę hodit.
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_03"); //Proč by to dęlali?
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_04"); //Jak to mám vędęt? Męl bys mę odtud dostat.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_05"); //Promluv s lordem Hagenem, probourej zeë, je to jedno - prostę nęco udęlej!
	
	MIS_RescueBennet = LOG_RUNNING; 
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet je v pękné bryndę a teë by udęlal cokoliv, jen aby se dostal z basy."); 
};

//*********************************************************************
//	Was ist passiert?
//*********************************************************************
instance DIA_Bennet_WhatHappened		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_WhatHappened_Condition;
	information	 = 	DIA_Bennet_WhatHappened_Info;
	permanent	 = 	FALSE;
	description	 = 	"Co se stalo?";
};

func int DIA_Bennet_WhatHappened_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_WhatHappened_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_00"); //Co se stalo?
	AI_Output	(self , other,"DIA_Bennet_WhatHappened_06_01"); //Šel jsem do centra s Hodgesem nakoupit nęjaký zásoby pro naše chlapce.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_02"); //Najednou jsme uslyšeli hlasitý výkâik a zvuk, jako by nękdo bęžel.
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_03"); //Jdi pâímo k vęci.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_04"); //Vędęli jsme najednou, že se nęco stalo a že nás chytí, když nás tam nękdo uvidí.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_05"); //Bęželi jsme jak o život. Potom, tęsnę pâedtím, než jsme dobęhli k męstské bránę, jsem zakopnul a vyvrknul jsem si kotník.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_06"); //Zbytek je už jednoduchej. Najednou u mę byla domobrana, a ta mę odvlekla rovnou do týhle díry.
};

//*********************************************************************
//	Wer ist ermordet worden?
//*********************************************************************
instance DIA_Bennet_Victim		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Victim_Condition;
	information	 = 	DIA_Bennet_Victim_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kdo byl zavraždęn?";
};

func int DIA_Bennet_Victim_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Victim_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_00"); //Kdo byl zavraždęn?
	AI_Output	(self , other,"DIA_Bennet_Victim_06_01"); //Nemám ponętí - jeden z paladinů, vůbec je neznám.
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_02"); //Jak se jmenoval?
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_03"); //Nęjaký Lothar, myslím. No, nevím, opravdu si nejsem jistej.
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_04"); //Radši by ses męl zeptat lorda Hagena, on zná všechny detaily.

	B_LogEntry (TOPIC_RESCUEBENNET,"Lothar, jeden z paladinů, byl zavraždęn. Bližší informaci by mi mohl podat Lord Hagen, který vede celé vyšetâování.");
};

//*********************************************************************
//	Haben sie Beweise gegen dich?
//*********************************************************************
instance DIA_Bennet_Evidence		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Evidence_Condition;
	information	 = 	DIA_Bennet_Evidence_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mají proti tobę nęjaký důkaz?";
};

func int DIA_Bennet_Evidence_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_WhyPrison))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Evidence_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_00"); //Mají proti tobę nęjaký důkaz?
	AI_Output	(self , other,"DIA_Bennet_Evidence_06_01"); //Âíkají, že mají nęjakého svędka, který mę poznal.
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_02"); //Nevíš náhodou, kdo je ten svędek?
	AI_Output 	(self ,other ,"DIA_Bennet_Evidence_06_03"); //Ne. Všechno, co vím, je, že je to lháâ.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Jeden svędek tvrdí, že Benneta vidęl. Musím ho najít a zjistit, jak to bylo doopravdy.");
	
	RescueBennet_KnowsWitness = TRUE; 
};


//*********************************************************************
//	Wer führt die Untersuchungen durch?
//*********************************************************************
instance DIA_Bennet_Investigation		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Investigation_Condition;
	information	 = 	DIA_Bennet_Investigation_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kdo vede vyšetâování?";
};

func int DIA_Bennet_Investigation_Condition ()
{
	IF (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Bennet_Evidence))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Investigation_Info ()
{
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_00"); //Kdo vede vyšetâování?
	AI_Output	(self , other,"DIA_Bennet_Investigation_06_01"); //Sám lord Hagen. A protože obętí byl jeden z paladinů, spadá tenhle pâípad pod válečný soud.
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_02"); //Co to znamená?
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_03"); //To je jednoduchý uhodnout. Pokud se odtud nedostanu, bez okolků mę povęsí.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_04"); //Musíš mi pomoct, nebo tady bude válka. Lee to nenechá jen tak.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_05"); //Můžeš si dát dohromady sám, co to znamená.
};


//*********************************************************************
//	Mann, ich hatte echt schon geglaubt, dass die mich hängen! 
//*********************************************************************
instance DIA_Bennet_ThankYou		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_ThankYou_Condition;
	information	 = 	DIA_Bennet_ThankYou_Info;
	permanent	 = 	FALSE;
	Important	 =	TRUE;
};

func int DIA_Bennet_ThankYou_Condition ()
{
	IF (MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_ThankYou_Info ()
{
	if (hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild (other, GIL_DJG);
	};

	AI_Output	(self ,other,"DIA_Bennet_ThankYou_06_00"); //Chlape, už jsem si myslel, že mę vážnę povęsí!
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_01"); //No, nakonec to dobâe dopadlo.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_02"); //To mi povídej. Męl jsi vidęt ksicht toho vojáka, když mę musel pustit ven!
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_03"); //(smęje se) Byl tak vystrašenej, že si skoro nadęlal do kalhot.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_04"); //Což mi pâipomíná, že pro tebe nęco mám.
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_05"); //Co myslíš?
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_06"); //(kâení se) Dáreček.
	
};

//*********************************************************************
//	Was für ein Geschenk?
//*********************************************************************

instance DIA_Bennet_Present		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Present_Condition;
	information	 = 	DIA_Bennet_Present_Info;
	permanent	 = 	FALSE;
	description	 =	"Jaký dáreček?";
};

func int DIA_Bennet_Present_Condition ()
{
	IF (Npc_KnowsInfo (other,DIA_Bennet_ThankYou))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_Present_Info ()
{
	AI_Output	(other,self ,"DIA_Bennet_Present_15_00"); //Jaký dáreček?
	
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_01"); //Slyšeli jsme o dracích, co by męli údajnę bejt v údolí.
	AI_Output	(other,self ,"DIA_Bennet_Present_15_02"); //Oni tam skutečnę jsou!
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_03"); //Dobâe, já ti vęâím.
	
	if (hero.guild == GIL_DJG)
	{
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_04"); //V každém pâípadę se pár chlapců rozhodlo jít do údolí.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_05"); //(zubí se) Mají v plánu to tam trochu uklidit.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_06"); //A co to má co dęlat se mnou?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_07"); //(pyšnę) Vytvoâil jsem nový typ brnęní. Brnęní drakobijců!
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_08"); //Je robustnęjší a lehčí než normální brnęní.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_09"); //A protože jsi mę zachránil, chci, abys dostal první kus. Je to dar!
			
		CreateInvItems (self,ITAR_DJG_L,1);
		B_GiveInvItems (self,other,ITAR_DJG_L,1);
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_10"); //Myslel jsem, že by se ti to mohlo hodit. Budeš potâebovat to správné vybavení, než půjdeš tam dolů do údolí.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_11"); //Také mę zajímají dračí šupiny. Opravdové dračí šupiny. Slušnę ti za nę zaplatím.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_12"); //Kolik dostanu za jednu šupinu?
		B_Say_Gold (self,other,Value_DragonScale); 
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_13"); //Kromę toho jsem si myslel, že by sis asi nechtęl nechat ten dračí hon ujít.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_14"); //A?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_15"); //Tady, vezmi si tenhle amulet. Myslím, že ho budeš potâebovat víc než já.
	
		CreateInvItems (self,ItAm_Hp_01,1); 
		B_GiveInvItems (self,other,ItAm_Hp_01,1);
	};
};


//*********************************************************************
//		DragonScale
//*********************************************************************

//-------------------------------------------------
	var int Bennet_DragonScale_Counter;
	var int Show_DJG_Armor_M;
//-------------------------------------------------

instance DIA_Bennet_DragonScale		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DragonScale_Condition;
	information	 = 	DIA_Bennet_DragonScale_Info;
	permanent	 = 	TRUE;
	description	 =	"Mám pro tebe pár dračích šupin.";
};

func int DIA_Bennet_DragonScale_Condition ()
{
	IF (Npc_HasItems (other,ItAt_Dragonscale) > 0)
	&& (hero.guild == GIL_DJG)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DragonScale_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DragonScale_15_00"); //Mám pro tebe pár dračích šupin.
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_01"); //Opravdové dračí šupiny!
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_02"); //Tady je tvé zlato!
	
	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter +(Npc_HasItems (other,ItAT_Dragonscale)));
	
	B_GiveInvItems (self ,other,ItMi_Gold,(Npc_HasItems(other,ItAT_Dragonscale) * Value_DragonScale) ); 
	B_GiveInvItems (other,self ,ItAt_Dragonscale,(Npc_HasItems (other,ItAT_Dragonscale)));
	
	
	if (Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_03"); //Dobâe, to by stačilo. Mohl bych ti prodat nové, vylepšené brnęní, pokud bys męl zájem.
		
		Show_DJG_Armor_M = TRUE;
	};
};

//*********************************************************************
//		DJG_ARMOR_M
//*********************************************************************

//-----------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_M_permanent;
//-----------------------------

instance DIA_Bennet_DJG_ARMOR_M		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DJG_ARMOR_M_Condition;
	information	 = 	DIA_Bennet_DJG_ARMOR_M_Info;
	permanent	 = 	TRUE;
	description	 =	"Stâednę tęžká drakobijecká zbroj: Ochrana: zbranę 80, šípy 80 (12000 zlatých)"; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_M_Condition ()
{
	IF (Bennet_DIA_Bennet_DJG_ARMOR_M_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Show_DJG_Armor_M == TRUE)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DJG_ARMOR_M_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_00"); //Chci si koupit nové brnęní.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_01"); //Velmi dobâe. Bude se ti líbit.
		AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_02"); //Za tu cenu by opravdu męlo.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_03"); //Zjistíš, že to brnęní stojí za každej ten zlaăák.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_04"); //Nemáš dost zlata.
	};	
	
};

//*********************************************************************
//		Ich weiss, wie man die Rüstung noch mehr verbessern kann.
//*********************************************************************

instance DIA_Bennet_BetterArmor		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_BetterArmor_Condition;
	information	 = 	DIA_Bennet_BetterArmor_Info;
	permanent	 = 	FALSE;
	description	 =	"Vím, jak se může brnęní ještę více vylepšit.";
};

func int DIA_Bennet_BetterArmor_Condition ()
{
	IF (PlayerGetsFinalDJGArmor == TRUE)
	&& (hero.guild == GIL_DJG)
	{
		return TRUE;
	};	
};

func void DIA_Bennet_BetterArmor_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_00"); //Vím, jak brnęní ještę víc vylepšit.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_01"); //(usmívá se) Tak mi to âekni.
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_02"); //Mohl bys pokrýt dračí šupiny magickou rudou.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_03"); //(smęje se) Tohle mę už taky napadlo. A máš pravdu.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_04"); //Moje nejnovęjší brnęní pâedčí všechno, co jsi doposud vidęl. Je teë lehké a masivní.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_05"); //Je PERFEKTNÍ.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_06"); //Můžeš si ho koupit, jestli chceš. Nedávám tuhle nabídku jen tak nękomu a navíc cena zahrnuje pouze výrobní náklady.
};


//*********************************************************************
//		DJG_ARMOR_H
//*********************************************************************

//---------------------------------------------------
var int Bennet_DIA_Bennet_DJG_ARMOR_H_permanent;
//---------------------------------------------------

instance DIA_Bennet_DJG_ARMOR_H		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_DJG_ARMOR_H_Condition;
	information	 = 	DIA_Bennet_DJG_ARMOR_H_Info;
	permanent	 = 	TRUE;
	description	 =	"Tęžká drakobijecká zbroj: Ochrana: zbranę 90, šípy 90. (20000 zlatých)"; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Bennet_DJG_ARMOR_H_Condition ()
{
	IF (Bennet_DIA_Bennet_DJG_ARMOR_H_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (Npc_KnowsInfo (other,DIA_Bennet_BetterArmor))
	{
		return TRUE;
	};	
};

func void DIA_Bennet_DJG_ARMOR_H_Info ()
{	
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_H_15_00"); //Dej mi to brnęní.
	
	if (Npc_HasItems (other,itmi_Gold) >= 20000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_01"); //Tohle je nejlepší brnęní, jaké jsem kdy vyrobil.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_02"); //Opravdový skvost.
		
		B_GiveInvItems (other,self,ItMi_Gold,20000);
		CreateInvItems (self,ITAR_DJG_H,1);
		B_GiveInvItems (self,other,ITAR_DJG_H,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_03"); //Nemáš dost zlata.
	};	
	
};
//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Bennet_RepairNecklace		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_RepairNecklace_Condition;
	information	 = 	DIA_Bennet_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Umíš opravit i klenoty?";
};

func int DIA_Bennet_RepairNecklace_Condition ()
{
	if 	(MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	&&	((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) 
	||   (MIS_SCKnowsInnosEyeIsBroken  == TRUE)) 
  	{
  		return TRUE;
  	};
};

func void DIA_Bennet_RepairNecklace_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_RepairNecklace_15_00"); //Umíš opravit i klenoty?
	AI_Output			(self, other, "DIA_Bennet_RepairNecklace_06_01"); //Záleží na tom jaké. Nejdâív mi ukaž, co máš na mysli.
	
	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_02"); //Taky se odsud musím nejdâív dostat.
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_03"); //DO té doby ti tu vęc zâejmę neopravím.
	};	
	
	MIS_SCKnowsInnosEyeIsBroken  = TRUE; 	
};

//*********************************************************************
//		Hier wird das Amulett repariert
//*********************************************************************

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_ShowInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_ShowInnosEye_Condition;
	information	 = 	DIA_Bennet_ShowInnosEye_Info;
	permanent	 = 	FALSE;
	description	 = 	"Můžeš se podívat na tenhle amulet?";
};

func int DIA_Bennet_ShowInnosEye_Condition ()
{
	if (Npc_HasItems (other,ItMi_InnosEye_Broken_MIS))
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
 	{
    	return TRUE;
  	};

};

func void DIA_Bennet_ShowInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //Můžeš se podívat na tenhle amulet?
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //Jasnę, ukaž mi ho.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //Hmm, to je skutečnę nádherná práce. Oprava bude záhul. Ale myslím si, že jsem schopnej to opravit.
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //Jak dlouho ti to potrvá?
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_04"); //No, teë jsem se zaseknul tady. Nebo tu snad vidíš nękde dílnu?
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_05"); //Kdybych byl ve své kovárnę, byl bych schopnej to všechno udęlat za jeden den. Ale samozâejmę se musím nejdâív dostat ven.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //Pokud mi ho tu necháš, bude hotovej do doby, než se sem zítra vrátíš.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //A dokonce ti to ani nebudu účtovat. Vždyă jsi mę dostal ven z lochu.
	};
	
	B_LogEntry (TOPIC_INNOSEYE, "Bennet je ten pravý kováâ, který mi opraví ten amulet.");

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
};

//*********************************************************************
//	Kannst du mir dieses Amulett reparieren?
//*********************************************************************
instance DIA_Bennet_GiveInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_GiveInnosEye_Condition;
	information	 = 	DIA_Bennet_GiveInnosEye_Info;
	permanent	 = 	FALSE;
	description	 = 	"Tady je ten amulet, prosím oprav mi ho.";
};

func int DIA_Bennet_GiveInnosEye_Condition ()
{
	IF (Npc_HasItems (other,ItMi_InnosEye_Broken_Mis)	>=1)
	&& (MIS_SCKnowsInnosEyeIsBroken  == TRUE)
	&& (MIS_REscueBennet == LOG_SUCCESS)
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)
	{
		return TRUE;
	};	                                                                             
};

func void DIA_Bennet_GiveInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //Tady je ten amulet, oprav mi ho, prosím.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //Dobâe. Budu to mít opravené do zítâka.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //Tak si pak pro nęj pâijë.
	
	Npc_RemoveInvItems	(other,	ItMi_InnosEye_Broken_Mis,1);
	AI_PrintScreen (Print_InnoseyeGiven, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
	Bennet_RepairDay = Wld_GetDay ();	
};



///////////////////////////////////////////////////////////////////////
//	Kannst du mir dieses Amulett reparieren?
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_GetInnosEye		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_GetInnosEye_Condition;
	information	 = 	DIA_Bennet_GetInnosEye_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je amulet hotový?";
};

func int DIA_Bennet_GetInnosEye_Condition ()
{
	IF (Npc_KnowsInfo (other,DIA_Bennet_GiveInnosEye)
	&& (MIS_Bennet_InnosEyeRepairedSetting   != LOG_SUCCESS)) 
	{
		return TRUE;
	};	
};

func void DIA_Bennet_GetInnosEye_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_GetInnosEye_15_00"); //Je amulet hotový?
	
	if (Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_01"); //Ano, tady je.
	
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems (other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen (Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_02"); //Musel jsem tam zasadit nový kámen.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_03"); //Pracoval jsem na nęm celou noc. Koukni na to,  vypadá jako nový.
		
		B_LogEntry (TOPIC_INNOSEYE, "Amulet je opęt celý, Bennet odvedl skvęlou práci.");
		
		MIS_Bennet_InnosEyeRepairedSetting   = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_InnosEyeIsRepaired);
	}
	else
	{	//Hack Mattes
		B_SayBennetLATER();
		//AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm später wieder.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_05"); //Když mę budeš zdržovat, bude to trvat déle.
		
		AI_StopProcessInfos (self);
	};	 
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

INSTANCE DIA_Bennet_KAP4_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP4_EXIT_Condition;
	information	= DIA_Bennet_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dracheneier
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DRACHENEIER		(C_INFO)
{
	npc		 = 	SLD_809_Bennet;
	nr		 = 	5;
	condition	 = 	DIA_Bennet_DRACHENEIER_Condition;
	information	 = 	DIA_Bennet_DRACHENEIER_Info;
	permanent	 = 	TRUE;

	description	 = 	"Můžeš nęco udęlat s dračími vejci?";
};

func int DIA_Bennet_DRACHENEIER_Condition ()
{
	if (Kapitel >= 4)
	&& (BennetsDragonEggOffer == 0)
	&& (Npc_HasItems (other,ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG)
		{
				return TRUE;
		};
};
var int BennetsDragonEggOffer;
var int DRACHENEIER_angebotenXP_OneTime;
func void DIA_Bennet_DRACHENEIER_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //Dá se nęco udęlat s dračími vejci?
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //Dračími vejci? Jak jsi k nim krucinál pâišel?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //Vzal jsem je ještęrům.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //Ukaž mi to.
	};

	Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //Mmh. Velmi šikovný materiál. Ideální k dokončení brnęní. Teda pokud se mi je podaâí rozlousknout.
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //Takže co bude? Chceš je?
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //Jasnę! Dej je sem.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //Jak dlouho tu budeš s tou vęcí mávat? Chceš, abych to koupil, nebo ne?
	};

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //Zaplatím ti, hmm, âeknęme, 300 zlatých za každé dračí vejce, které mi pâineseš.

	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Tak si svoje zlato nech. Myslím, že si to nechám.", DIA_Bennet_DRACHENEIER_nein );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Tohle jsou dračí vejce, ne slepičí...", DIA_Bennet_DRACHENEIER_mehr );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Dohodnuto.", DIA_Bennet_DRACHENEIER_ok );

	IF (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet je ochoten mi dobâe zaplatit za všechna dračí vejce, která mu pâinesu."); 
	B_GivePlayerXP (XP_DJG_BringDragonEgg);
	DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Bennet_DRACHENEIER_ok ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //Dohodnuto.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //Dobâe.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //Když ještę na nęco takového narazíš, určitę mi to pâines.

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;	
	};

	CreateInvItems (self, ItMi_Gold, BennetsDragonEggOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	BennetsDragonEggOffer);

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //Ehm. Âíkáš, žes je vzal ještęrům?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //Správnę.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //Z toho, co jsem slyšel, tak vętšina ještęrů bydlí v jeskyních.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //Nepâekvapilo by mę, kdybys našel víc tęchhle vęcí v jeskyních tady v okolí.
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet si myslí, že bych se po vejcích męl podívat v khorinidských jeskyních, kde by męli ještęâi pâebývat."); 
	
	AI_Output (self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //Tady. Vem si tuhle mapu. Ta ti pomůže najít ty jeskynę.
	CreateInvItems (self, ItWr_Map_Caves_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_Caves_MIS,1);
	B_LogEntry (TOPIC_DRACHENEIER,"Dal mi mapu jeskyní, která by mi męla pomoci."); 
	
	if (1 == 2) //MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //Nejdâív ale musíš získat mapu jeskyní od kartografa ve męstę. Byla by to škoda, kdybys je nemohl najít všechny.
		B_LogEntry (TOPIC_DRACHENEIER,"Męl bych si u místního kartografa obstarat mapu jeskyní, aby mi žádné vejce neuniklo."); 
	};
	
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //Tohle jsou dračí vejce, ne bezcenná slepičí vajíčka.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //(podráždęnę) Dobâe. Tak 350. Ale víc ti za nę už dát nemůžu - pak by se mi to nevyplatilo.
	BennetsDragonEggOffer =	350;
};

func void DIA_Bennet_DRACHENEIER_nein ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //Tak si nech svoje zlato. Myslím, že si to nechám.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_nein_06_01"); //Dej mi vędęt, až si to rozmyslíš.

	CreateInvItems (other, ItAt_DragonEgg_MIS, 1);									
	AI_PrintScreen	(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2);	// "1 Gegenstand erhalten"

	BennetsDragonEggOffer = 0;
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

///////////////////////////////////////////////////////////////////////
//	Info EierBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_EierBringen		(C_INFO)
{
	npc		 = 	SLD_809_Bennet;
	nr		 = 	5;
	condition	 = 	DIA_Bennet_EierBringen_Condition;
	information	 = 	DIA_Bennet_EierBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Zajímají tę ještę další dračí vejce?";
};

func int DIA_Bennet_EierBringen_Condition ()
{
	if (BennetsDragonEggOffer > 0)
	&& (Kapitel >= 4)
	&& (Npc_HasItems (other,ItAt_DragonEgg_MIS) >= 1)
	&& (hero.guild == GIL_DJG)
		{
				return TRUE;
		};
};

var int DragonEggCounter;

func void DIA_Bennet_EierBringen_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_EierBringen_15_00"); //Zajímají tę ještę další dračí vejce?
	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_01"); //Jistę!

	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	
	DragonEggCount = Npc_HasItems(other, ItAt_DragonEgg_MIS);


	if (DragonEggCount == 1)
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_02"); //Tady. Mám další.
			B_GivePlayerXP (XP_DJG_BringDragonEgg);
			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
			AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
			DragonEggCounter = DragonEggCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_03"); //Mám tady ještę nęjaký.

			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	DragonEggCount);
			concatText = ConcatStrings(IntToString(DragonEggCount), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
			AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			XP_DJG_BringDragonEggs = (DragonEggCount * XP_DJG_BringDragonEgg);
			DragonEggCounter = (DragonEggCounter + DragonEggCount); 

			B_GivePlayerXP (XP_DJG_BringDragonEggs);
		};

	if (DragonEggCounter <= 7)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_04"); //Skvęle. Dej to sem. Díval ses po nich všude? Jistę musí nękde být ještę nęjaké.
	}
	else if	(DragonEggCounter <= 11)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_05"); //Kde tyhle vęcičky vůbec poâád nacházíš? Vsadím se, že už jich tady moc nebude.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_06"); //Nemyslím si, že ještę nęco najdeš. A já už toho mám tolik, že ani nevím, co s tím budu dęlat.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_07"); //Jo, správnę. Tady máš peníze.

	DragonEggGeld	= (DragonEggCount * BennetsDragonEggOffer);

	CreateInvItems (self, ItMi_Gold, DragonEggGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, DragonEggGeld);
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

INSTANCE DIA_Bennet_KAP5_EXIT(C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 999;
	condition	= DIA_Bennet_KAP5_EXIT_Condition;
	information	= DIA_Bennet_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Bennet_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bennet_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_KnowWhereEnemy_Condition;
	information	 = 	DIA_Bennet_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Potâebuju se dostat na ostrov. Mohl bych vzít kováâe.";
};
func int DIA_Bennet_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Bennet_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Bennet_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //Potâebuju se dostat na ostrov. Kováâ by se mi mohl hodit.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //A tím jako myslíš mę.
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //Jo. Co na to âíkáš? Âíkals pâece, že bys odsud rád vypadnul.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //Je to lepší než Onarova farma. Chlapče, myslím, že ani v pekle to nebude horší. Počítej se mnou.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Bennet by mohl odejít klidnę hned teë. Jeho kováâskému umęní se hned tak nękdo nevyrovná a já se od nęj mohu leccos pâiučit.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Bennet_KnowWhereEnemy_15_04"); //Moje posádka je v tuhle chvíli kompletní.
		AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //Pak tedy jednoho z nich pošli zase pryč.
	}
	else 
	{
		Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Dám ti včas vędęt, až tę budu potâebovat. ",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Tak buë tedy mým kováâem. Sejdeme se v pâístavu!",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_Yes_15_00"); //Tak tedy buë mým kováâem. Uvidíme se v pâístavu.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01"); //Dobâe. Uvidíme se pozdęji.
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_No_15_00"); //Dám ti včas vędęt, až tę budu potâebovat.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_No_06_01"); //Fajn. Budu tady.

	Bennet_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_LeaveMyShip		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_LeaveMyShip_Condition;
	information	 = 	DIA_Bennet_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Budu si muset najít jiného kováâe.";
};
func int DIA_Bennet_LeaveMyShip_Condition ()
{	
	if (Bennet_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bennet_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Bennet_LeaveMyShip_15_00"); //Budu si muset najít jiného kováâe.
	AI_Output			(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //Jednou je to takhle, a za chvíli zase jinak. Dej si to v hlavę dohromady, jo? A až budeš vędęt, co vlastnę chceš, dej mi vędęt.
	
	Bennet_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Začít"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_StillNeedYou_Condition;
	information	 = 	DIA_Bennet_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Pojë zpátky. Nemůžu najít jinýho kováâe.";
};

func int DIA_Bennet_StillNeedYou_Condition ()
{	
	if ((Bennet_IsOnBOard == LOG_OBSOLETE)	
	|| (Bennet_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_Bennet_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_Bennet_StillNeedYou_15_00"); //Pojë zpátky. Nemůžu najít jinýho kováâe.
	AI_Output	(self, other, "DIA_Bennet_StillNeedYou_06_01"); //(naštvanę) Správnę! Jsem tu jenom já, tak nikoho nehledej. Uvidíme se pozdęji v docích.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Bennet_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	AI_StopProcessInfos (self);

		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bennet_PICKPOCKET (C_INFO)
{
	npc			= SLD_809_Bennet;
	nr			= 900;
	condition	= DIA_Bennet_PICKPOCKET_Condition;
	information	= DIA_Bennet_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bennet_PICKPOCKET_Condition()
{
	C_Beklauen (35, 45);
};
 
FUNC VOID DIA_Bennet_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bennet_PICKPOCKET);
	Info_AddChoice		(DIA_Bennet_PICKPOCKET, DIALOG_BACK 		,DIA_Bennet_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bennet_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bennet_PICKPOCKET_DoIt);
};

func void DIA_Bennet_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bennet_PICKPOCKET);
};
	
func void DIA_Bennet_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bennet_PICKPOCKET);
};


























