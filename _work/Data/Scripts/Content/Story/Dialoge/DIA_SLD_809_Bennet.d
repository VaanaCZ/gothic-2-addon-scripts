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
	AI_Output (self, other, "DIA_Bennet_HALLO_06_00"); //Nie sprzedajê broni. Khaled ni¹ handluje. Jest w domu, razem z Onarem.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Khaled sprzedaje broñ.");
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
	description	= "Co masz do sprzedania?";
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
	AI_Output (other, self, "DIA_Bennet_TRADE_15_00"); //Co masz do sprzedania?
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

	AI_Output (self, other, "DIA_Bennet_TRADE_06_01"); //Czego potrzebujesz?
	
	if (BennetLOG == FALSE)
	{
		Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry (Topic_SoldierTrader,"Bennet sprzedaje sprzêt kowalski.");
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
	description	= "Jak¹ broñ wyrabiasz?";
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
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_00"); //Jak¹ broñ wyrabiasz?
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_01"); //W tej chwili zwyk³e miecze, nic wiêcej.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_02"); //Ale gdybym mia³ trochê magicznej rudy, móg³bym robiæ broñ lepsz¹ ni¿ zwyczajn¹ - ze stali.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_03"); //Nie wiesz przypadkiem, gdzie mo¿na znaleŸæ trochê rudy? Oprócz Górniczej Doliny, oczywiœcie.
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_04"); //Nie.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_05"); //Oczywiœcie, ¿e nie.
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
	description	= "Jesteœ farmerem czy najemnikiem?";
};

func int DIA_Bennet_BauOrSld_Condition ()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_00"); //Jesteœ farmerem czy najemnikiem?
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_01"); //Nabierasz mnie, co?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_02"); //By³em po prostu ciekawy.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_03"); //Widzia³eœ kiedyœ rolnika, który kuje broñ?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_04"); //Nie.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_05"); //No to czemu zadajesz takie g³upie pytania?
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
	description	= "Chcê siê przy³¹czyæ do najemników. Masz coœ przeciwko temu?";
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
	AI_Output (other, self, "DIA_Bennet_WannaJoin_15_00"); //Chcê przy³¹czyæ siê do najemników!
	AI_Output (self, other, "DIA_Bennet_WannaJoin_06_01"); //Wiêc przestañ paplaæ i idŸ do Torlofa. On ciê wypróbuje.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Bennet_WannaJoin_15_02"); //Przeszed³em próbê.
		AI_Output (self, other, "DIA_Bennet_WannaJoin_06_03"); //Dobrze, a wiêc poprê ciê.
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
	description	= "Mo¿esz mnie nauczyæ, jak wykuæ miecz?";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmith_15_00"); //Mo¿esz mnie nauczyæ, jak wykuæ miecz?
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_01"); //Jasne.
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_02"); //Ale to ciê bêdzie trochê kosztowaæ. Powiedzmy... 30 z³otych monet.
	
	Info_ClearChoices (DIA_Bennet_WannaSmith);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Mo¿e póŸniej.", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Zgoda. Proszê, oto 30 sztuk z³ota dla ciebie.", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //Zgoda. Proszê, oto 30 sztuk z³ota.
	
	if (B_GiveInvItems (other, self, itmi_gold, 30))
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //To by³a bardzo dobra cena! Mo¿emy zacz¹æ, kiedy bêdziesz gotowy.
		
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Bennet mo¿e mnie przeszkoliæ w zakresie kowalstwa.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //Nie rób ze mnie frajera. Trzy dychy i ani grosza mniej.
	};
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //Mo¿e póŸniej.
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
	description	= B_BuildLearnString("Nauka kowalstwa", B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common));
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
	AI_Output (other, self, "DIA_Bennet_TeachCOMMON_15_00"); //Naucz mnie, jak wykuæ miecz.
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_01"); //To doœæ proste. ZnajdŸ sobie kawa³ek surowej stali i rozgrzej go w ogniu, a¿ zacznie siê ¿arzyæ.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_02"); //Potem wykuj na kowadle ostrze.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_03"); //Najwa¿niejsze, ¿ebyœ pilnowa³, czy ostrze nie wystyg³o. Masz tylko kilka minut, ¿eby zrobiæ broñ...
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_04"); //Reszty dowiesz siê sam. To kwestia praktyki.
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
	description	= "Naucz mnie, jak wykuæ broñ z magicznej rudy!";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_00"); //Naucz mnie, jak wykuæ broñ z magicznej rudy!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_01"); //Ale ty nawet nie znasz podstaw.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_02"); //Najpierw musisz siê nauczyæ, jak wykuæ porz¹dny miecz. Potem zobaczymy.
	}
	else if (other.guild != GIL_SLD)
	&& 		(other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_03"); //Dopóki nie bêdziesz jednym z nas, nie zdradzê ci sekretu broni z magicznej rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_04"); //Ten sekret zna tylko paru kowali. S¹dzê, ¿e nawet rzemieœlnicy w mieœcie go nie odkryli.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_05"); //No i dobrze. Bo inaczej te szumowiny ze stra¿y miejskiej nosi³yby magiczne miecze.
		if (other.guild == GIL_MIL)
		{	
			AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_06"); //Nie mam nic przeciwko tobie. Wydajesz siê w porz¹dku.
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_07"); //Gdybym mia³ rudê, to mo¿e nawet bym to zrobi³.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_08");//Ech, daj spokój. Jestem po stronie najemników i potrafiê kuæ. Czego jeszcze chcesz?
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_09"); //Mo¿esz mi powiedzieæ, jak wykuæ broñ z magicznej rudy BEZ magicznej rudy?
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_10");//No có¿...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_11"); //Tak myœla³em. Potrzebujê przynajmniej 5 bry³ek rudy. Albo mo¿esz o tym zapomnieæ.
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else //alles OK
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_12"); //Wspaniale, przynios³eœ mi rudê i wiesz, jak wykuæ przyzwoity miecz.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_13");//A wiêc jedziemy...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_14"); //Najwa¿niejsze jest jedno: niewa¿ne, czy ca³¹ broñ wyku³eœ z magicznego kruszcu, czy tylko pokry³eœ stalowe ostrze warstw¹ zaklêtej rudy. Liczy siê tylko powierzchnia.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_15"); //A poniewa¿ to cholerstwo jest takie drogie, z³ap za stalowy prêt i kilka bry³ek rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_16"); //Oczywiœcie, nie wystarczy pokryæ gotowy miecz warstw¹ magicznej rudy. Ca³¹ broñ musisz wykuæ od podstaw.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_17"); //Poza tym, wszystko zale¿y od rodzaju broni, jak¹ chcesz wykonaæ.
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
	description	= "Gdzie mogê znaleŸæ magiczn¹ rudê?";
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
	AI_Output (other, self, "DIA_Bennet_WhereOre_15_00"); //Gdzie mogê znaleŸæ magiczn¹ rudê?
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_01"); //Có¿, wiem tylko jedno. W kolonii górniczej na pewno jest jej trochê.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_02"); //Ale mo¿e ci siê poszczêœci i znajdziesz parê porzuconych kawa³ków w okolicy.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_03"); //Wydaje mi siê, ¿e w górach na po³udniu s¹ jakieœ stare tunele górnicze. Mo¿e tam bêdziesz mia³ szczêœcie.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_04"); //Tylko uwa¿aj, s³ysza³em, ¿e roi siê tam od bandytów.
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
	description	= "Proszê – 5 bry³ek.";
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
	AI_Output (other, self, "DIA_Bennet_BringOre_15_00"); //Proszê - 5 bry³ek.
	AI_Output (self, other, "DIA_Bennet_BringOre_06_01"); //Poka¿ mi!
	B_GiveInvItems (other, self, itmi_nugget, 5);
	AI_Output (self, other, "DIA_Bennet_BringOre_06_02"); //Naprawdê! No teraz mnie rozbroi³eœ!
	AI_Output (self, other, "DIA_Bennet_BringOre_06_03"); //Zatrzymaj sobie dwie z nich. Przydadz¹ ci siê, jeœli bêdziesz chcia³ wykuæ sobie broñ.
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
	AI_Output	(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nie, jeszcze nie. Wróæ póŸniej.
};
instance DIA_Bennet_TeachSmith		(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 30;
	condition	= DIA_Bennet_TeachSmith_Condition;
	information	= DIA_Bennet_TeachSmith_Info;
	permanent	= TRUE;
	description	= "Chcia³bym wiedzieæ wiêcej o wykuwaniu magicznej broni.";
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
	AI_Output (other, self, "DIA_Bennet_TeachSmith_15_00"); //Chcia³bym wiedzieæ wiêcej o wykuwaniu magicznej broni.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		B_SayBennetLATER();
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_01"); //Mogê ciê nauczyæ, jak wykuæ miecze z magicznego kruszcu, nawet dwurêczne.
		Bennet_Kap2Smith = TRUE;
	}
	else if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_02"); //Poprawi³em moj¹ technikê. Teraz mogê ciê nauczyæ, jak wykuæ z rudy miecze pó³torarêczne albo ciê¿kie dwurêczne.
		Bennet_Kap3Smith = TRUE;
	}
	else if (MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_03"); //Chyba tym razem przeszed³em samego siebie. Opracowa³em dwa bitewne ostrza. To najlepsza rzecz, jak¹ do tej pory zrobi³em.
		Bennet_Kap4Smith = TRUE;
	}
	else if (Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_04"); //S³uchaj, chyba mam genialny pomys³. Broñ z magicznego kruszcu, pokryta smocz¹ krwi¹. I wiem dok³adnie, jak to zrobiæ!
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_05"); //Chcesz poznaæ ten sekret?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_06"); //Jak¹ broñ chcia³byœ zrobiæ?
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
	description	 = 	"Jak trafi³eœ do paki?";
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
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_00"); //Jak trafi³eœ do paki?
	AI_Output	(self , other,"DIA_Bennet_WhyPrison_06_01"); //Te œwinie wrzuci³y mnie do lochu. Twierdz¹, ¿e zamordowa³em paladyna.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_02"); //Ale ja tego nie zrobi³em, próbuj¹ mnie wrobiæ.
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_03"); //Czemu mieliby to robiæ?
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_04"); //A sk¹d mam wiedzieæ? Musisz mnie st¹d wyci¹gn¹æ!
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_05"); //Porozmawiaj z Lordem Hagenem, zburz mury, nie wiem - po prostu zrób coœ!
	
	MIS_RescueBennet = LOG_RUNNING; 
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet zrobi³by wszystko, ¿eby wydostaæ siê z wiêzienia."); 
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
	description	 = 	"Co siê sta³o?";
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
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_00"); //Co siê sta³o?
	AI_Output	(self , other,"DIA_Bennet_WhatHappened_06_01"); //Poszed³em do miasta z Hodgesem, ¿eby kupiæ trochê zapasów dla ch³opaków.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_02"); //Nagle us³yszeliœmy g³oœny krzyk i tupot nóg.
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_03"); //PrzejdŸ do rzeczy.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_04"); //Od razu wiedzieliœmy, ¿e coœ siê sta³o i spróbuj¹ nas z³apaæ, jeœli nas zauwa¿¹.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_05"); //Uciekaliœmy, jakby nas diabe³ goni³. Wtedy, tu¿ przed bram¹ miasta, potkn¹³em siê i rozwali³em kolano.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_06"); //Reszta jest oczywista. Stra¿ od razu mnie z³apa³a i wrzuci³a prosto do tego lochu.
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
	description	 = 	"Kogo zamordowano?";
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
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_00"); //Kogo zamordowano?
	AI_Output	(self , other,"DIA_Bennet_Victim_06_01"); //Nie mam pojêcia. Jednego z paladynów, nie znam ich.
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_02"); //Wiesz, jak siê nazywa³?
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_03"); //Jakiœ Lothar, chyba. No nie wiem, nie jestem pewny.
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_04"); //Lepiej zapytaj Lorda Hagena, on zna wszystkie szczegó³y.

	B_LogEntry (TOPIC_RESCUEBENNET,"Jeden z paladynów, Lothar, zosta³ zamordowany. œledztwo w tej sprawie prowadzi Lord Hagen i z pewnoœci¹ udzieli mi dok³adniejszych informacji.");
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
	description	 = 	"Maj¹ przeciwko tobie jakieœ dowody?";
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
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_00"); //Maj¹ przeciwko tobie jakieœ dowody?
	AI_Output	(self , other,"DIA_Bennet_Evidence_06_01"); //Mówi¹, ¿e maj¹ œwiadka, który wszystko widzia³.
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_02"); //Wiesz, kim jest ten œwiadek?
	AI_Output 	(self ,other ,"DIA_Bennet_Evidence_06_03"); //Nie. Wiem tylko, ¿e k³amie.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Podobno ktoœ widzia³ Benneta, gdy ten pope³nia³ zbrodniê. Jeœli chcê poznaæ prawdê, bêdê musia³ znaleŸæ tego œwiadka.");
	
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
	description	 = 	"Kto kieruje œledztwem?";
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
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_00"); //Kto kieruje œledztwem?
	AI_Output	(self , other,"DIA_Bennet_Investigation_06_01"); //Sam Lord Hagen. Poniewa¿ ofiara by³a paladynem, to sprawa podlega pod s¹d wojskowy.
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_02"); //Co to znaczy?
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_03"); //Nietrudno zgadn¹æ. Jeœli siê st¹d nie wydostanê, to zadyndam na sznurze.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_04"); //Musisz mi pomóc albo wybuchnie wojna. Lee tak tego nie zostawi.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_05"); //Sam siê domyœl, co to bêdzie oznaczaæ.
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

	AI_Output	(self ,other,"DIA_Bennet_ThankYou_06_00"); //Stary, ju¿ myœla³em, ¿e naprawdê mnie powiesz¹!
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_01"); //No có¿, wszystko siê w koñcu wyjaœni³o.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_02"); //Wspaniale. Szkoda, ¿e nie widzia³eœ twarzy tego ¿o³nierza, który mnie wyprowadza³!
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_03"); //By³ taki przera¿ony, ¿e prawie narobi³ w gacie.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_04"); //A to mi przypomina, ¿e mam coœ dla ciebie.
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_05"); //Co? O co ci chodzi?
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_06"); //Prezent.
	
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
	description	 =	"Co za prezent?";
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
	AI_Output	(other,self ,"DIA_Bennet_Present_15_00"); //Co za prezent?
	
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_01"); //S³yszeliœmy pog³oski o smokach w Dolinie.
	AI_Output	(other,self ,"DIA_Bennet_Present_15_02"); //Naprawdê tam s¹!
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_03"); //W porz¹dku, wierzê ci.
	
	if (hero.guild == GIL_DJG)
	{
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_04"); //W ka¿dym razie, paru ch³opaków postanowi³o wybraæ siê do Doliny.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_05"); //Zamierzaj¹ tam trochê zarobiæ.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_06"); //A co to ma wspólnego ze mn¹?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_07"); //Opracowa³em nowy rodzaj zbroi. Zbrojê ³owcy smoków!
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_08"); //Jest bardziej wytrzyma³a i l¿ejsza ni¿ zwyk³e zbroje.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_09"); //A poniewa¿ to ty mnie uratowa³eœ, chcê ci daæ jej pierwszy egzemplarz. To prezent!
			
		CreateInvItems (self,ITAR_DJG_L,1);
		B_GiveInvItems (self,other,ITAR_DJG_L,1);
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_10"); //S¹dzi³em, ¿e pewnie zechcesz przy³¹czyæ siê do zabawy. Jeœli wybierasz siê do Doliny, bêdzie ci potrzebny odpowiedni ekwipunek.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_11"); //A poza tym interesuj¹ mnie smocze ³uski. Prawdziwe smocze ³uski. Dam ci za nie dobr¹ cenê.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_12"); //Ile dostanê za ka¿d¹ ³uskê?
		B_Say_Gold (self,other,Value_DragonScale); 
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_13"); //Tak czy inaczej, pomyœla³em, ¿e bêdziesz chcia³ wzi¹æ udzia³ w polowaniu na smoki.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_14"); //I co?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_15"); //Proszê, weŸ ten amulet. S¹dzê, ¿e tobie bardziej siê on przyda.
	
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
	description	 =	"Mam dla ciebie smocze ³uski.";
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
	AI_Output	(other,self ,"DIA_Bennet_DragonScale_15_00"); //Mam dla ciebie smocze ³uski.
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_01"); //Prawdziwe smocze ³uski!
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_02"); //Oto twoje z³oto.
	
	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter +(Npc_HasItems (other,ItAT_Dragonscale)));
	
	B_GiveInvItems (self ,other,ItMi_Gold,(Npc_HasItems(other,ItAT_Dragonscale) * Value_DragonScale) ); 
	B_GiveInvItems (other,self ,ItAt_Dragonscale,(Npc_HasItems (other,ItAT_Dragonscale)));
	
	
	if (Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_03"); //W porz¹dku, tyle powinno wystarczyæ. Mogê ci sprzedaæ now¹, ulepszon¹ zbrojê. Jeœli chcesz.
		
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
	description	 =	"Œredni pancerz ³owcy smoków. Ochrona (broñ i strza³y) 120, 12000 sztuk z³ota."; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
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
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_00"); //Chcê kupiæ zbrojê.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_01"); //Bardzo dobrze. Bêdziesz ni¹ zachwycony.
		AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_02"); //Chyba mogê tego oczekiwaæ po takiej cenie.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_03"); //Przekonasz siê, ¿e jest warta ka¿dej sztuki z³ota.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_04"); //Masz za ma³o z³ota.
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
	description	 =	"Wiem, jak jeszcze bardziej ulepszyæ zbrojê.";
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
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_00"); //Wiem, jak jeszcze bardziej ulepszyæ zbrojê.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_01"); //Tak? No to mi powiedz.
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_02"); //Mo¿esz pokryæ smocze ³uski magiczn¹ rud¹.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_03"); //Te¿ o tym pomyœla³em. Masz racjê.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_04"); //Moja najnowsza zbroja bije na g³owê wszystko, co do tej pory widzia³eœ. Jest lekka, ale mocna.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_05"); //Jest po prostu IDEALNA.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_06"); //Jeœli chcesz, to ci j¹ sprzedam. Nie zaproponowa³bym tego byle komu, a cena pokrywa tylko moje koszty.
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
	description	 =	"Ciê¿ki pancerz ³owcy smoków. Ochrona (broñ i strza³y) 150, 20000 sztuk z³ota."; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
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
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_H_15_00"); //Daj mi tê zbrojê.
	
	if (Npc_HasItems (other,itmi_Gold) >= 20000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_01"); //To najlepsza zbroja, jak¹ kiedykolwiek zrobi³em.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_02"); //Prawdziwe arcydzie³o.
		
		B_GiveInvItems (other,self,ItMi_Gold,20000);
		CreateInvItems (self,ITAR_DJG_H,1);
		B_GiveInvItems (self,other,ITAR_DJG_H,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_03"); //Masz za ma³o z³ota.
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
	description	 = 	"Potrafisz naprawiæ bi¿uteriê?";
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
	AI_Output			(other, self, "DIA_Bennet_RepairNecklace_15_00"); //Umiesz naprawiaæ bi¿uteriê?
	AI_Output			(self, other, "DIA_Bennet_RepairNecklace_06_01"); //To zale¿y. Musia³byœ mi j¹ najpierw pokazaæ.
	
	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_02"); //No i oczywiœcie muszê siê st¹d wydostaæ.
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_03"); //Bo teraz nic nie mogê zrobiæ.
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
	description	 = 	"Mo¿esz obejrzeæ ten amulet?";
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
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //Mo¿esz obejrzeæ ten amulet?
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //Jasne, poka¿.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //Hmmm. Piêkna robota. Ale oprawa jest uszkodzona. Chyba da³bym radê to naprawiæ.
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //Ile ci to zajmie?
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_04"); //Có¿, na razie tu ugrzêz³em. Widzisz tu jak¹œ kuŸniê?
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_05"); //U siebie zrobi³bym to w jeden dzieñ. Ale najpierw musia³bym siê st¹d wydostaæ.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //Jeœli to tu zostawisz, bêdzie gotowe na jutro.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //I nic ci za to nie policzê. W koñcu wyci¹gn¹³eœ mnie z paki.
	};
	
	B_LogEntry (TOPIC_INNOSEYE, "Bennet móg³by naprawiæ amulet.");

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
	description	 = 	"Oto amulet, proszê, napraw go dla mnie.";
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
	AI_Output			(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //Oto amulet, proszê, napraw go dla mnie.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //W porz¹dku. Do jutra zrobiê now¹ oprawê.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //Mo¿esz do mnie wtedy przyjœæ i go odebraæ.
	
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
	description	 = 	"Czy amulet jest gotowy?";
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
	AI_Output			(other, self, "DIA_Bennet_GetInnosEye_15_00"); //Czy amulet jest gotowy?
	
	if (Bennet_RepairDay < Wld_GetDay())
	{
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_01"); //Tak, proszê.
	
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems (other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen (Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_02"); //Musia³em zrobiæ now¹ oprawê dla kamienia.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_03"); //Pracowa³em przez ca³¹ noc. Wygl¹da jak nowy.
		
		B_LogEntry (TOPIC_INNOSEYE, "Bennet naprawi³ oprawê amuletu.");
		
		MIS_Bennet_InnosEyeRepairedSetting   = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_InnosEyeIsRepaired);
	}
	else
	{	//Hack Mattes
		B_SayBennetLATER();
		//AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm später wieder.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_05"); //Jeœli bêdziesz mi przeszkadza³, potrwa to d³u¿ej.
		
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

	description	 = 	"Czy mo¿esz coœ zrobiæ ze smoczych jaj?";
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
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //Czy mo¿esz coœ zrobiæ ze smoczych jaj?
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //Smocze jaja? Do licha, sk¹d je wytrzasn¹³eœ?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //Zabra³em je jaszczuroludziom.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //Poka¿.
	};

	Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //Hmmm. Bardzo twardy materia³. Idealny do wykoñczenia zbroi. To znaczy, gdyby komuœ uda³o siê je rozbiæ.
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //No to co? Chcesz?
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //Jasne! Dawaj.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //Ile razy jeszcze masz zamiar pokazywaæ mi te cholerstwa? Chcesz, ¿ebym je kupi³ czy nie?
	};

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //Zap³acê powiedzmy, hmmm... 300 sztuk z³ota za ka¿de jajo, które mi przyniesiesz.

	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Zachowaj wiêc swoje z³oto. Myœlê, ¿e je zatrzymam.", DIA_Bennet_DRACHENEIER_nein );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "To s¹ smocze jaja, a nie jajka od kury.", DIA_Bennet_DRACHENEIER_mehr );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Umowa stoi.", DIA_Bennet_DRACHENEIER_ok );

	IF (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet hojnie mi zap³aci za wszystkie smocze jaja, które zdo³am znaleŸæ."); 
	B_GivePlayerXP (XP_DJG_BringDragonEgg);
	DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Bennet_DRACHENEIER_ok ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //Umowa stoi.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //Dobra.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //A wiêc jeœli jakieœ znajdziesz, przynieœ mi je.

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;	
	};

	CreateInvItems (self, ItMi_Gold, BennetsDragonEggOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	BennetsDragonEggOffer);

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //Hmmm. Mówi³eœ, ¿e znalaz³eœ je u jaszczuroludzi?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //Dok³adnie.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //Z tego, co wiem, wiêkszoœæ jaszczuroludzi mieszka w jaskiniach.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //Nie zdziwi³bym siê, gdyby w okolicznych pieczarach by³o tego wiêcej.
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet uwa¿a, ¿e powinienem poszukaæ smoczych jaj w jaskiniach Khorinis, w których podobno ¿yj¹ jaszczuroludzie."); 
	
	AI_Output (self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //Proszê. WeŸ tê mapê. Pomo¿e ci znaleŸæ jaskinie.
	CreateInvItems (self, ItWr_Map_Caves_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_Caves_MIS,1);
	B_LogEntry (TOPIC_DRACHENEIER,"Aby u³atwiæ mi to zadanie, da³ mi mapê jaskiñ."); 
	
	if (1 == 2) //MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //Ale najpierw musisz zdobyæ mapê jaskiñ od kartografa w mieœcie. Szkoda by³oby, gdybyœ przeoczy³ jakieœ jajo.
		B_LogEntry (TOPIC_DRACHENEIER,"Powinienem kupiæ u kartografa w mieœcie mapê jaskiñ. Dziêki temu bêdê mia³ pewnoœæ, ¿e nie przeoczy³em ¿adnego jaja."); 
	};
	
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //To s¹ smocze jaja, a nie jajka od kury.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //W porz¹dku. Niech bêdzie 350. Nie mogê ci wiêcej daæ, bo mi siê to nie zwróci.
	BennetsDragonEggOffer =	350;
};

func void DIA_Bennet_DRACHENEIER_nein ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //Zachowaj wiêc swoje z³oto. Myœlê, ¿e je zatrzymam.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_nein_06_01"); //Powiedz, jeœli zmienisz zdanie.

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

	description	 = 	"Chcesz kolejne smocze jaja?";
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
	AI_Output			(other, self, "DIA_Bennet_EierBringen_15_00"); //Chcesz kolejne smocze jaja?
	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_01"); //Jasne!

	var int DragonEggCount;
	var int XP_DJG_BringDragonEggs;
	var int DragonEggGeld;
	var string concatText;
	
	DragonEggCount = Npc_HasItems(other, ItAt_DragonEgg_MIS);


	if (DragonEggCount == 1)
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_02"); //Proszê, mam kolejne.
			B_GivePlayerXP (XP_DJG_BringDragonEgg);
			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
			AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
			DragonEggCounter = DragonEggCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_03"); //Mam tu kilka.

			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	DragonEggCount);
			concatText = ConcatStrings(IntToString(DragonEggCount), PRINT_ItemsGegeben);		// "x Gegenstände gegeben"
			AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			XP_DJG_BringDragonEggs = (DragonEggCount * XP_DJG_BringDragonEgg);
			DragonEggCounter = (DragonEggCounter + DragonEggCount); 

			B_GivePlayerXP (XP_DJG_BringDragonEggs);
		};

	if (DragonEggCounter <= 7)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_04"); //Wspaniale. Dawaj. Wszêdzie ju¿ zajrza³eœ? Na pewno jest ich wiêcej.
	}
	else if	(DragonEggCounter <= 11)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_05"); //Sk¹d to wygrzeba³eœ? Pewnie niewiele ju¿ ich zosta³o.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_06"); //S¹dzê, ¿e ju¿ wiêcej ich nie znajdziesz. A ja mam ich tyle, ¿e nie wiem, co z nimi zrobiæ.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_07"); //Och, w porz¹dku. Oto twoje pieni¹dze.

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
	description	 = 	"Wybieram siê na wyspê i przyda³by mi siê kowal.";
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
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //Wybieram siê na wyspê i przyda³by mi siê kowal.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //I pomyœla³eœ o mnie?
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //Tak. Co ty na to? Tak czy inaczej, dziêki temu byœ siê st¹d wydosta³.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //Stary, nawet w piekle nie mo¿e byæ tak paskudnie jak na farmie Onara. Wchodzê w to.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Bennet mo¿e wyruszyæ w ka¿dej chwili. Jest niezrównanym kowalem - z pewnoœci¹ móg³bym siê od niego wiele nauczyæ.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Bennet_KnowWhereEnemy_15_04"); //Moja za³oga jest ju¿ kompletna.
		AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //Wiêc odeœlij kogoœ.
	}
	else 
	{
		Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Powiem ci, kiedy mi bêdziesz potrzebny.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"A wiêc bêdziesz moim kowalem. Zobaczymy siê w porcie.",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_Yes_15_00"); //A wiêc bêdziesz moim kowalem. Zobaczymy siê w porcie.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01"); //W porz¹dku. Do zobaczenia.
	
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
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_No_15_00"); //Powiem ci, kiedy mi bêdziesz potrzebny.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_No_06_01"); //Œwietnie.

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
	description	 = 	"Zamierzam znaleŸæ sobie innego kowala.";
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
	AI_Output			(other, self, "DIA_Bennet_LeaveMyShip_15_00"); //Zamierzam znaleŸæ sobie innego kowala.
	AI_Output			(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //Raz tak, raz siak. Zdecyduj siê, dobra? Daj mi znaæ, jak bêdziesz wiedzia³, czego NAPRAWDÊ chcesz.
	
	Bennet_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
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
	description	 = 	"Wróæ. Nie mogê znaleŸæ innego kowala.";
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
	AI_Output	(other, self, "DIA_Bennet_StillNeedYou_15_00"); //Wróæ. Nie mogê znaleŸæ innego kowala.
	AI_Output	(self, other, "DIA_Bennet_StillNeedYou_06_01"); //Dobra! W koñcu kto by siê mn¹ przejmowa³, drobiazg. Zobaczymy siê w porcie.
		
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


























