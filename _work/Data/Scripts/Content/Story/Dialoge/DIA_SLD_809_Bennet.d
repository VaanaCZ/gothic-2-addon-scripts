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
	AI_Output (self, other, "DIA_Bennet_HALLO_06_00"); //Nie sprzedaję broni. Khaled nią handluje. Jest w domu, razem z Onarem.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Khaled sprzedaje broń.");
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
		B_LogEntry (Topic_SoldierTrader,"Bennet sprzedaje sprzęt kowalski.");
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
	description	= "Jaką broń wyrabiasz?";
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
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_00"); //Jaką broń wyrabiasz?
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_01"); //W tej chwili zwykłe miecze, nic więcej.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_02"); //Ale gdybym miał trochę magicznej rudy, mógłbym robić broń lepszą niż zwyczajną - ze stali.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_03"); //Nie wiesz przypadkiem, gdzie można znaleźć trochę rudy? Oprócz Górniczej Doliny, oczywiście.
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_04"); //Nie.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_05"); //Oczywiście, że nie.
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
	description	= "Jesteś farmerem czy najemnikiem?";
};

func int DIA_Bennet_BauOrSld_Condition ()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_00"); //Jesteś farmerem czy najemnikiem?
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_01"); //Nabierasz mnie, co?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_02"); //Byłem po prostu ciekawy.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_03"); //Widziałeś kiedyś rolnika, który kuje broń?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_04"); //Nie.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_05"); //No to czemu zadajesz takie głupie pytania?
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
	description	= "Chcę się przyłączyć do najemników. Masz coś przeciwko temu?";
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
	AI_Output (other, self, "DIA_Bennet_WannaJoin_15_00"); //Chcę przyłączyć się do najemników!
	AI_Output (self, other, "DIA_Bennet_WannaJoin_06_01"); //Więc przestań paplać i idź do Torlofa. On cię wypróbuje.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Bennet_WannaJoin_15_02"); //Przeszedłem próbę.
		AI_Output (self, other, "DIA_Bennet_WannaJoin_06_03"); //Dobrze, a więc poprę cię.
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
	description	= "Możesz mnie nauczyć, jak wykuć miecz?";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmith_15_00"); //Możesz mnie nauczyć, jak wykuć miecz?
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_01"); //Jasne.
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_02"); //Ale to cię będzie trochę kosztować. Powiedzmy... 30 złotych monet.
	
	Info_ClearChoices (DIA_Bennet_WannaSmith);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Może później.", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Zgoda. Proszę, oto 30 sztuk złota dla ciebie.", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //Zgoda. Proszę, oto 30 sztuk złota.
	
	if (B_GiveInvItems (other, self, itmi_gold, 30))
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //To była bardzo dobra cena! Możemy zacząć, kiedy będziesz gotowy.
		
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Bennet może mnie przeszkolić w zakresie kowalstwa.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //Nie rób ze mnie frajera. Trzy dychy i ani grosza mniej.
	};
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //Może później.
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
	AI_Output (other, self, "DIA_Bennet_TeachCOMMON_15_00"); //Naucz mnie, jak wykuć miecz.
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_01"); //To dość proste. Znajdź sobie kawałek surowej stali i rozgrzej go w ogniu, aż zacznie się żarzyć.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_02"); //Potem wykuj na kowadle ostrze.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_03"); //Najważniejsze, żebyś pilnował, czy ostrze nie wystygło. Masz tylko kilka minut, żeby zrobić broń...
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_04"); //Reszty dowiesz się sam. To kwestia praktyki.
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
	description	= "Naucz mnie, jak wykuć broń z magicznej rudy!";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_00"); //Naucz mnie, jak wykuć broń z magicznej rudy!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_01"); //Ale ty nawet nie znasz podstaw.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_02"); //Najpierw musisz się nauczyć, jak wykuć porządny miecz. Potem zobaczymy.
	}
	else if (other.guild != GIL_SLD)
	&& 		(other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_03"); //Dopóki nie będziesz jednym z nas, nie zdradzę ci sekretu broni z magicznej rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_04"); //Ten sekret zna tylko paru kowali. Sądzę, że nawet rzemieślnicy w mieście go nie odkryli.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_05"); //No i dobrze. Bo inaczej te szumowiny ze straży miejskiej nosiłyby magiczne miecze.
		if (other.guild == GIL_MIL)
		{	
			AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_06"); //Nie mam nic przeciwko tobie. Wydajesz się w porządku.
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_07"); //Gdybym miał rudę, to może nawet bym to zrobił.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_08");//Ech, daj spokój. Jestem po stronie najemników i potrafię kuć. Czego jeszcze chcesz?
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_09"); //Możesz mi powiedzieć, jak wykuć broń z magicznej rudy BEZ magicznej rudy?
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_10");//No cóż...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_11"); //Tak myślałem. Potrzebuję przynajmniej 5 bryłek rudy. Albo możesz o tym zapomnieć.
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else //alles OK
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_12"); //Wspaniale, przyniosłeś mi rudę i wiesz, jak wykuć przyzwoity miecz.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_13");//A więc jedziemy...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_14"); //Najważniejsze jest jedno: nieważne, czy całą broń wykułeś z magicznego kruszcu, czy tylko pokryłeś stalowe ostrze warstwą zaklętej rudy. Liczy się tylko powierzchnia.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_15"); //A ponieważ to cholerstwo jest takie drogie, złap za stalowy pręt i kilka bryłek rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_16"); //Oczywiście, nie wystarczy pokryć gotowy miecz warstwą magicznej rudy. Całą broń musisz wykuć od podstaw.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_17"); //Poza tym, wszystko zależy od rodzaju broni, jaką chcesz wykonać.
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
	description	= "Gdzie mogę znaleźć magiczną rudę?";
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
	AI_Output (other, self, "DIA_Bennet_WhereOre_15_00"); //Gdzie mogę znaleźć magiczną rudę?
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_01"); //Cóż, wiem tylko jedno. W kolonii górniczej na pewno jest jej trochę.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_02"); //Ale może ci się poszczęści i znajdziesz parę porzuconych kawałków w okolicy.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_03"); //Wydaje mi się, że w górach na południu są jakieś stare tunele górnicze. Może tam będziesz miał szczęście.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_04"); //Tylko uważaj, słyszałem, że roi się tam od bandytów.
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
	description	= "Proszę – 5 bryłek.";
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
	AI_Output (other, self, "DIA_Bennet_BringOre_15_00"); //Proszę - 5 bryłek.
	AI_Output (self, other, "DIA_Bennet_BringOre_06_01"); //Pokaż mi!
	B_GiveInvItems (other, self, itmi_nugget, 5);
	AI_Output (self, other, "DIA_Bennet_BringOre_06_02"); //Naprawdę! No teraz mnie rozbroiłeś!
	AI_Output (self, other, "DIA_Bennet_BringOre_06_03"); //Zatrzymaj sobie dwie z nich. Przydadzą ci się, jeśli będziesz chciał wykuć sobie broń.
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
	AI_Output	(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nie, jeszcze nie. Wróć później.
};
instance DIA_Bennet_TeachSmith		(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 30;
	condition	= DIA_Bennet_TeachSmith_Condition;
	information	= DIA_Bennet_TeachSmith_Info;
	permanent	= TRUE;
	description	= "Chciałbym wiedzieć więcej o wykuwaniu magicznej broni.";
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
	AI_Output (other, self, "DIA_Bennet_TeachSmith_15_00"); //Chciałbym wiedzieć więcej o wykuwaniu magicznej broni.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		B_SayBennetLATER();
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_01"); //Mogę cię nauczyć, jak wykuć miecze z magicznego kruszcu, nawet dwuręczne.
		Bennet_Kap2Smith = TRUE;
	}
	else if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_02"); //Poprawiłem moją technikę. Teraz mogę cię nauczyć, jak wykuć z rudy miecze półtoraręczne albo ciężkie dwuręczne.
		Bennet_Kap3Smith = TRUE;
	}
	else if (MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_03"); //Chyba tym razem przeszedłem samego siebie. Opracowałem dwa bitewne ostrza. To najlepsza rzecz, jaką do tej pory zrobiłem.
		Bennet_Kap4Smith = TRUE;
	}
	else if (Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_04"); //Słuchaj, chyba mam genialny pomysł. Broń z magicznego kruszcu, pokryta smoczą krwią. I wiem dokładnie, jak to zrobić!
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_05"); //Chcesz poznać ten sekret?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_06"); //Jaką broń chciałbyś zrobić?
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
	description	 = 	"Jak trafiłeś do paki?";
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
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_00"); //Jak trafiłeś do paki?
	AI_Output	(self , other,"DIA_Bennet_WhyPrison_06_01"); //Te świnie wrzuciły mnie do lochu. Twierdzą, że zamordowałem paladyna.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_02"); //Ale ja tego nie zrobiłem, próbują mnie wrobić.
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_03"); //Czemu mieliby to robić?
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_04"); //A skąd mam wiedzieć? Musisz mnie stąd wyciągnąć!
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_05"); //Porozmawiaj z Lordem Hagenem, zburz mury, nie wiem - po prostu zrób coś!
	
	MIS_RescueBennet = LOG_RUNNING; 
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet zrobiłby wszystko, żeby wydostać się z więzienia."); 
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
	description	 = 	"Co się stało?";
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
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_00"); //Co się stało?
	AI_Output	(self , other,"DIA_Bennet_WhatHappened_06_01"); //Poszedłem do miasta z Hodgesem, żeby kupić trochę zapasów dla chłopaków.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_02"); //Nagle usłyszeliśmy głośny krzyk i tupot nóg.
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_03"); //Przejdź do rzeczy.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_04"); //Od razu wiedzieliśmy, że coś się stało i spróbują nas złapać, jeśli nas zauważą.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_05"); //Uciekaliśmy, jakby nas diabeł gonił. Wtedy, tuż przed bramą miasta, potknąłem się i rozwaliłem kolano.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_06"); //Reszta jest oczywista. Straż od razu mnie złapała i wrzuciła prosto do tego lochu.
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
	AI_Output	(self , other,"DIA_Bennet_Victim_06_01"); //Nie mam pojęcia. Jednego z paladynów, nie znam ich.
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_02"); //Wiesz, jak się nazywał?
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_03"); //Jakiś Lothar, chyba. No nie wiem, nie jestem pewny.
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_04"); //Lepiej zapytaj Lorda Hagena, on zna wszystkie szczegóły.

	B_LogEntry (TOPIC_RESCUEBENNET,"Jeden z paladynów, Lothar, został zamordowany. śledztwo w tej sprawie prowadzi Lord Hagen i z pewnością udzieli mi dokładniejszych informacji.");
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
	description	 = 	"Mają przeciwko tobie jakieś dowody?";
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
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_00"); //Mają przeciwko tobie jakieś dowody?
	AI_Output	(self , other,"DIA_Bennet_Evidence_06_01"); //Mówią, że mają świadka, który wszystko widział.
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_02"); //Wiesz, kim jest ten świadek?
	AI_Output 	(self ,other ,"DIA_Bennet_Evidence_06_03"); //Nie. Wiem tylko, że kłamie.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Podobno ktoś widział Benneta, gdy ten popełniał zbrodnię. Jeśli chcę poznać prawdę, będę musiał znaleźć tego świadka.");
	
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
	description	 = 	"Kto kieruje śledztwem?";
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
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_00"); //Kto kieruje śledztwem?
	AI_Output	(self , other,"DIA_Bennet_Investigation_06_01"); //Sam Lord Hagen. Ponieważ ofiara była paladynem, to sprawa podlega pod sąd wojskowy.
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_02"); //Co to znaczy?
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_03"); //Nietrudno zgadnąć. Jeśli się stąd nie wydostanę, to zadyndam na sznurze.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_04"); //Musisz mi pomóc albo wybuchnie wojna. Lee tak tego nie zostawi.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_05"); //Sam się domyśl, co to będzie oznaczać.
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

	AI_Output	(self ,other,"DIA_Bennet_ThankYou_06_00"); //Stary, już myślałem, że naprawdę mnie powieszą!
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_01"); //No cóż, wszystko się w końcu wyjaśniło.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_02"); //Wspaniale. Szkoda, że nie widziałeś twarzy tego żołnierza, który mnie wyprowadzał!
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_03"); //Był taki przerażony, że prawie narobił w gacie.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_04"); //A to mi przypomina, że mam coś dla ciebie.
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
	
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_01"); //Słyszeliśmy pogłoski o smokach w Dolinie.
	AI_Output	(other,self ,"DIA_Bennet_Present_15_02"); //Naprawdę tam są!
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_03"); //W porządku, wierzę ci.
	
	if (hero.guild == GIL_DJG)
	{
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_04"); //W każdym razie, paru chłopaków postanowiło wybrać się do Doliny.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_05"); //Zamierzają tam trochę zarobić.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_06"); //A co to ma wspólnego ze mną?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_07"); //Opracowałem nowy rodzaj zbroi. Zbroję łowcy smoków!
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_08"); //Jest bardziej wytrzymała i lżejsza niż zwykłe zbroje.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_09"); //A ponieważ to ty mnie uratowałeś, chcę ci dać jej pierwszy egzemplarz. To prezent!
			
		CreateInvItems (self,ITAR_DJG_L,1);
		B_GiveInvItems (self,other,ITAR_DJG_L,1);
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_10"); //Sądziłem, że pewnie zechcesz przyłączyć się do zabawy. Jeśli wybierasz się do Doliny, będzie ci potrzebny odpowiedni ekwipunek.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_11"); //A poza tym interesują mnie smocze łuski. Prawdziwe smocze łuski. Dam ci za nie dobrą cenę.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_12"); //Ile dostanę za każdą łuskę?
		B_Say_Gold (self,other,Value_DragonScale); 
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_13"); //Tak czy inaczej, pomyślałem, że będziesz chciał wziąć udział w polowaniu na smoki.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_14"); //I co?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_15"); //Proszę, weź ten amulet. Sądzę, że tobie bardziej się on przyda.
	
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
	description	 =	"Mam dla ciebie smocze łuski.";
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
	AI_Output	(other,self ,"DIA_Bennet_DragonScale_15_00"); //Mam dla ciebie smocze łuski.
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_01"); //Prawdziwe smocze łuski!
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_02"); //Oto twoje złoto.
	
	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter +(Npc_HasItems (other,ItAT_Dragonscale)));
	
	B_GiveInvItems (self ,other,ItMi_Gold,(Npc_HasItems(other,ItAT_Dragonscale) * Value_DragonScale) ); 
	B_GiveInvItems (other,self ,ItAt_Dragonscale,(Npc_HasItems (other,ItAT_Dragonscale)));
	
	
	if (Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_03"); //W porządku, tyle powinno wystarczyć. Mogę ci sprzedać nową, ulepszoną zbroję. Jeśli chcesz.
		
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
	description	 =	"Średni pancerz łowcy smoków. Ochrona (broń i strzały) 120, 12000 sztuk złota."; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
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
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_00"); //Chcę kupić zbroję.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_01"); //Bardzo dobrze. Będziesz nią zachwycony.
		AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_02"); //Chyba mogę tego oczekiwać po takiej cenie.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_03"); //Przekonasz się, że jest warta każdej sztuki złota.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_04"); //Masz za mało złota.
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
	description	 =	"Wiem, jak jeszcze bardziej ulepszyć zbroję.";
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
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_00"); //Wiem, jak jeszcze bardziej ulepszyć zbroję.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_01"); //Tak? No to mi powiedz.
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_02"); //Możesz pokryć smocze łuski magiczną rudą.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_03"); //Też o tym pomyślałem. Masz rację.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_04"); //Moja najnowsza zbroja bije na głowę wszystko, co do tej pory widziałeś. Jest lekka, ale mocna.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_05"); //Jest po prostu IDEALNA.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_06"); //Jeśli chcesz, to ci ją sprzedam. Nie zaproponowałbym tego byle komu, a cena pokrywa tylko moje koszty.
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
	description	 =	"Ciężki pancerz łowcy smoków. Ochrona (broń i strzały) 150, 20000 sztuk złota."; //Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
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
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_H_15_00"); //Daj mi tę zbroję.
	
	if (Npc_HasItems (other,itmi_Gold) >= 20000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_01"); //To najlepsza zbroja, jaką kiedykolwiek zrobiłem.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_02"); //Prawdziwe arcydzieło.
		
		B_GiveInvItems (other,self,ItMi_Gold,20000);
		CreateInvItems (self,ITAR_DJG_H,1);
		B_GiveInvItems (self,other,ITAR_DJG_H,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_03"); //Masz za mało złota.
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
	description	 = 	"Potrafisz naprawić biżuterię?";
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
	AI_Output			(other, self, "DIA_Bennet_RepairNecklace_15_00"); //Umiesz naprawiać biżuterię?
	AI_Output			(self, other, "DIA_Bennet_RepairNecklace_06_01"); //To zależy. Musiałbyś mi ją najpierw pokazać.
	
	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_02"); //No i oczywiście muszę się stąd wydostać.
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_03"); //Bo teraz nic nie mogę zrobić.
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
	description	 = 	"Możesz obejrzeć ten amulet?";
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
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //Możesz obejrzeć ten amulet?
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //Jasne, pokaż.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //Hmmm. Piękna robota. Ale oprawa jest uszkodzona. Chyba dałbym radę to naprawić.
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //Ile ci to zajmie?
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_04"); //Cóż, na razie tu ugrzęzłem. Widzisz tu jakąś kuźnię?
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_05"); //U siebie zrobiłbym to w jeden dzień. Ale najpierw musiałbym się stąd wydostać.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //Jeśli to tu zostawisz, będzie gotowe na jutro.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //I nic ci za to nie policzę. W końcu wyciągnąłeś mnie z paki.
	};
	
	B_LogEntry (TOPIC_INNOSEYE, "Bennet mógłby naprawić amulet.");

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
	description	 = 	"Oto amulet, proszę, napraw go dla mnie.";
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
	AI_Output			(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //Oto amulet, proszę, napraw go dla mnie.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //W porządku. Do jutra zrobię nową oprawę.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //Możesz do mnie wtedy przyjść i go odebrać.
	
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
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_01"); //Tak, proszę.
	
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems (other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen (Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_02"); //Musiałem zrobić nową oprawę dla kamienia.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_03"); //Pracowałem przez całą noc. Wygląda jak nowy.
		
		B_LogEntry (TOPIC_INNOSEYE, "Bennet naprawił oprawę amuletu.");
		
		MIS_Bennet_InnosEyeRepairedSetting   = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_InnosEyeIsRepaired);
	}
	else
	{	//Hack Mattes
		B_SayBennetLATER();
		//AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm später wieder.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_05"); //Jeśli będziesz mi przeszkadzał, potrwa to dłużej.
		
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

	description	 = 	"Czy możesz coś zrobić ze smoczych jaj?";
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
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //Czy możesz coś zrobić ze smoczych jaj?
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //Smocze jaja? Do licha, skąd je wytrzasnąłeś?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //Zabrałem je jaszczuroludziom.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //Pokaż.
	};

	Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //Hmmm. Bardzo twardy materiał. Idealny do wykończenia zbroi. To znaczy, gdyby komuś udało się je rozbić.
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //No to co? Chcesz?
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //Jasne! Dawaj.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //Ile razy jeszcze masz zamiar pokazywać mi te cholerstwa? Chcesz, żebym je kupił czy nie?
	};

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //Zapłacę powiedzmy, hmmm... 300 sztuk złota za każde jajo, które mi przyniesiesz.

	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Zachowaj więc swoje złoto. Myślę, że je zatrzymam.", DIA_Bennet_DRACHENEIER_nein );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "To są smocze jaja, a nie jajka od kury.", DIA_Bennet_DRACHENEIER_mehr );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Umowa stoi.", DIA_Bennet_DRACHENEIER_ok );

	IF (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet hojnie mi zapłaci za wszystkie smocze jaja, które zdołam znaleźć."); 
	B_GivePlayerXP (XP_DJG_BringDragonEgg);
	DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Bennet_DRACHENEIER_ok ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //Umowa stoi.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //Dobra.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //A więc jeśli jakieś znajdziesz, przynieś mi je.

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;	
	};

	CreateInvItems (self, ItMi_Gold, BennetsDragonEggOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	BennetsDragonEggOffer);

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //Hmmm. Mówiłeś, że znalazłeś je u jaszczuroludzi?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //Dokładnie.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //Z tego, co wiem, większość jaszczuroludzi mieszka w jaskiniach.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //Nie zdziwiłbym się, gdyby w okolicznych pieczarach było tego więcej.
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet uważa, że powinienem poszukać smoczych jaj w jaskiniach Khorinis, w których podobno żyją jaszczuroludzie."); 
	
	AI_Output (self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //Proszę. Weź tę mapę. Pomoże ci znaleźć jaskinie.
	CreateInvItems (self, ItWr_Map_Caves_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_Caves_MIS,1);
	B_LogEntry (TOPIC_DRACHENEIER,"Aby ułatwić mi to zadanie, dał mi mapę jaskiń."); 
	
	if (1 == 2) //MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //Ale najpierw musisz zdobyć mapę jaskiń od kartografa w mieście. Szkoda byłoby, gdybyś przeoczył jakieś jajo.
		B_LogEntry (TOPIC_DRACHENEIER,"Powinienem kupić u kartografa w mieście mapę jaskiń. Dzięki temu będę miał pewność, że nie przeoczyłem żadnego jaja."); 
	};
	
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //To są smocze jaja, a nie jajka od kury.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //W porządku. Niech będzie 350. Nie mogę ci więcej dać, bo mi się to nie zwróci.
	BennetsDragonEggOffer =	350;
};

func void DIA_Bennet_DRACHENEIER_nein ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //Zachowaj więc swoje złoto. Myślę, że je zatrzymam.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_nein_06_01"); //Powiedz, jeśli zmienisz zdanie.

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
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_02"); //Proszę, mam kolejne.
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
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_04"); //Wspaniale. Dawaj. Wszędzie już zajrzałeś? Na pewno jest ich więcej.
	}
	else if	(DragonEggCounter <= 11)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_05"); //Skąd to wygrzebałeś? Pewnie niewiele już ich zostało.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_06"); //Sądzę, że już więcej ich nie znajdziesz. A ja mam ich tyle, że nie wiem, co z nimi zrobić.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_07"); //Och, w porządku. Oto twoje pieniądze.

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
	description	 = 	"Wybieram się na wyspę i przydałby mi się kowal.";
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
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //Wybieram się na wyspę i przydałby mi się kowal.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //I pomyślałeś o mnie?
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //Tak. Co ty na to? Tak czy inaczej, dzięki temu byś się stąd wydostał.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //Stary, nawet w piekle nie może być tak paskudnie jak na farmie Onara. Wchodzę w to.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Bennet może wyruszyć w każdej chwili. Jest niezrównanym kowalem - z pewnością mógłbym się od niego wiele nauczyć.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Bennet_KnowWhereEnemy_15_04"); //Moja załoga jest już kompletna.
		AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //Więc odeślij kogoś.
	}
	else 
	{
		Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Powiem ci, kiedy mi będziesz potrzebny.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"A więc będziesz moim kowalem. Zobaczymy się w porcie.",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_Yes_15_00"); //A więc będziesz moim kowalem. Zobaczymy się w porcie.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01"); //W porządku. Do zobaczenia.
	
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
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_No_15_00"); //Powiem ci, kiedy mi będziesz potrzebny.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_No_06_01"); //Świetnie.

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
	description	 = 	"Zamierzam znaleźć sobie innego kowala.";
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
	AI_Output			(other, self, "DIA_Bennet_LeaveMyShip_15_00"); //Zamierzam znaleźć sobie innego kowala.
	AI_Output			(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //Raz tak, raz siak. Zdecyduj się, dobra? Daj mi znać, jak będziesz wiedział, czego NAPRAWDĘ chcesz.
	
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
	description	 = 	"Wróć. Nie mogę znaleźć innego kowala.";
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
	AI_Output	(other, self, "DIA_Bennet_StillNeedYou_15_00"); //Wróć. Nie mogę znaleźć innego kowala.
	AI_Output	(self, other, "DIA_Bennet_StillNeedYou_06_01"); //Dobra! W końcu kto by się mną przejmował, drobiazg. Zobaczymy się w porcie.
		
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


























