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
	AI_Output (self, other, "DIA_Bennet_HALLO_06_00"); //Nie sprzedaj� broni. Khaled ni� handluje. Jest w domu, razem z Onarem.
	
	Log_CreateTopic (Topic_SoldierTrader,LOG_NOTE);
	B_LogEntry (Topic_SoldierTrader,"Khaled sprzedaje bro�.");
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
		B_LogEntry (Topic_SoldierTrader,"Bennet sprzedaje sprz�t kowalski.");
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
	description	= "Jak� bro� wyrabiasz?";
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
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_00"); //Jak� bro� wyrabiasz?
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_01"); //W tej chwili zwyk�e miecze, nic wi�cej.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_02"); //Ale gdybym mia� troch� magicznej rudy, m�g�bym robi� bro� lepsz� ni� zwyczajn� - ze stali.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_03"); //Nie wiesz przypadkiem, gdzie mo�na znale�� troch� rudy? Opr�cz G�rniczej Doliny, oczywi�cie.
	AI_Output (other, self, "DIA_Bennet_WhichWeapons_15_04"); //Nie.
	AI_Output (self, other, "DIA_Bennet_WhichWeapons_06_05"); //Oczywi�cie, �e nie.
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
	description	= "Jeste� farmerem czy najemnikiem?";
};

func int DIA_Bennet_BauOrSld_Condition ()
{
	return TRUE;
};

func void DIA_Bennet_BauOrSld_Info ()
{
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_00"); //Jeste� farmerem czy najemnikiem?
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_01"); //Nabierasz mnie, co?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_02"); //By�em po prostu ciekawy.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_03"); //Widzia�e� kiedy� rolnika, kt�ry kuje bro�?
	AI_Output (other, self, "DIA_Bennet_BauOrSld_15_04"); //Nie.
	AI_Output (self, other, "DIA_Bennet_BauOrSld_06_05"); //No to czemu zadajesz takie g�upie pytania?
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
	description	= "Chc� si� przy��czy� do najemnik�w. Masz co� przeciwko temu?";
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
	AI_Output (other, self, "DIA_Bennet_WannaJoin_15_00"); //Chc� przy��czy� si� do najemnik�w!
	AI_Output (self, other, "DIA_Bennet_WannaJoin_06_01"); //Wi�c przesta� papla� i id� do Torlofa. On ci� wypr�buje.
	if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Bennet_WannaJoin_15_02"); //Przeszed�em pr�b�.
		AI_Output (self, other, "DIA_Bennet_WannaJoin_06_03"); //Dobrze, a wi�c popr� ci�.
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
	description	= "Mo�esz mnie nauczy�, jak wyku� miecz?";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmith_15_00"); //Mo�esz mnie nauczy�, jak wyku� miecz?
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_01"); //Jasne.
	AI_Output (self, other, "DIA_Bennet_WannaSmith_06_02"); //Ale to ci� b�dzie troch� kosztowa�. Powiedzmy... 30 z�otych monet.
	
	Info_ClearChoices (DIA_Bennet_WannaSmith);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Mo�e p�niej.", DIA_Bennet_WannaSmith_Later);
	Info_AddChoice (DIA_Bennet_WannaSmith, "Zgoda. Prosz�, oto 30 sztuk z�ota dla ciebie.", DIA_Bennet_WannaSmith_Pay);
};

func void DIA_Bennet_WannaSmith_Pay()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Pay_15_00"); //Zgoda. Prosz�, oto 30 sztuk z�ota.
	
	if (B_GiveInvItems (other, self, itmi_gold, 30))
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_01"); //To by�a bardzo dobra cena! Mo�emy zacz��, kiedy b�dziesz gotowy.
		
		Bennet_TeachCommon = TRUE;
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Bennet mo�e mnie przeszkoli� w zakresie kowalstwa.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmith_Pay_06_02"); //Nie r�b ze mnie frajera. Trzy dychy i ani grosza mniej.
	};
	Info_ClearChoices (DIA_Bennet_WannaSmith);
};

func void DIA_Bennet_WannaSmith_Later()
{
	AI_Output (other, self, "DIA_Bennet_WannaSmith_Later_15_00"); //Mo�e p�niej.
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
	AI_Output (other, self, "DIA_Bennet_TeachCOMMON_15_00"); //Naucz mnie, jak wyku� miecz.
	
	if (B_TeachPlayerTalentSmith (self, other, WEAPON_Common))
	{
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_01"); //To do�� proste. Znajd� sobie kawa�ek surowej stali i rozgrzej go w ogniu, a� zacznie si� �arzy�.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_02"); //Potem wykuj na kowadle ostrze.
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_03"); //Najwa�niejsze, �eby� pilnowa�, czy ostrze nie wystyg�o. Masz tylko kilka minut, �eby zrobi� bro�...
		AI_Output (self, other, "DIA_Bennet_TeachCOMMON_06_04"); //Reszty dowiesz si� sam. To kwestia praktyki.
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
	description	= "Naucz mnie, jak wyku� bro� z magicznej rudy!";
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
	AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_00"); //Naucz mnie, jak wyku� bro� z magicznej rudy!
		
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_01"); //Ale ty nawet nie znasz podstaw.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_02"); //Najpierw musisz si� nauczy�, jak wyku� porz�dny miecz. Potem zobaczymy.
	}
	else if (other.guild != GIL_SLD)
	&& 		(other.guild != GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_03"); //Dop�ki nie b�dziesz jednym z nas, nie zdradz� ci sekretu broni z magicznej rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_04"); //Ten sekret zna tylko paru kowali. S�dz�, �e nawet rzemie�lnicy w mie�cie go nie odkryli.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_05"); //No i dobrze. Bo inaczej te szumowiny ze stra�y miejskiej nosi�yby magiczne miecze.
		if (other.guild == GIL_MIL)
		{	
			AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_06"); //Nie mam nic przeciwko tobie. Wydajesz si� w porz�dku.
		};
	}
	else if (MIS_Bennet_BringOre != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_07"); //Gdybym mia� rud�, to mo�e nawet bym to zrobi�.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_08");//Ech, daj spok�j. Jestem po stronie najemnik�w i potrafi� ku�. Czego jeszcze chcesz?
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_09"); //Mo�esz mi powiedzie�, jak wyku� bro� z magicznej rudy BEZ magicznej rudy?
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_10");//No c�...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_11"); //Tak my�la�em. Potrzebuj� przynajmniej 5 bry�ek rudy. Albo mo�esz o tym zapomnie�.
		if (MIS_Bennet_BringOre == FALSE)
		{
			MIS_Bennet_BringOre = LOG_RUNNING;
		};
	}
	else //alles OK
	{
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_12"); //Wspaniale, przynios�e� mi rud� i wiesz, jak wyku� przyzwoity miecz.
		AI_Output (other, self, "DIA_Bennet_WannaSmithORE_15_13");//A wi�c jedziemy...
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_14"); //Najwa�niejsze jest jedno: niewa�ne, czy ca�� bro� wyku�e� z magicznego kruszcu, czy tylko pokry�e� stalowe ostrze warstw� zakl�tej rudy. Liczy si� tylko powierzchnia.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_15"); //A poniewa� to cholerstwo jest takie drogie, z�ap za stalowy pr�t i kilka bry�ek rudy.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_16"); //Oczywi�cie, nie wystarczy pokry� gotowy miecz warstw� magicznej rudy. Ca�� bro� musisz wyku� od podstaw.
		AI_Output (self, other, "DIA_Bennet_WannaSmithORE_06_17"); //Poza tym, wszystko zale�y od rodzaju broni, jak� chcesz wykona�.
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
	description	= "Gdzie mog� znale�� magiczn� rud�?";
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
	AI_Output (other, self, "DIA_Bennet_WhereOre_15_00"); //Gdzie mog� znale�� magiczn� rud�?
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_01"); //C�, wiem tylko jedno. W kolonii g�rniczej na pewno jest jej troch�.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_02"); //Ale mo�e ci si� poszcz�ci i znajdziesz par� porzuconych kawa�k�w w okolicy.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_03"); //Wydaje mi si�, �e w g�rach na po�udniu s� jakie� stare tunele g�rnicze. Mo�e tam b�dziesz mia� szcz�cie.
	AI_Output (self, other, "DIA_Bennet_WhereOre_06_04"); //Tylko uwa�aj, s�ysza�em, �e roi si� tam od bandyt�w.
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
	description	= "Prosz� � 5 bry�ek.";
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
	AI_Output (other, self, "DIA_Bennet_BringOre_15_00"); //Prosz� - 5 bry�ek.
	AI_Output (self, other, "DIA_Bennet_BringOre_06_01"); //Poka� mi!
	B_GiveInvItems (other, self, itmi_nugget, 5);
	AI_Output (self, other, "DIA_Bennet_BringOre_06_02"); //Naprawd�! No teraz mnie rozbroi�e�!
	AI_Output (self, other, "DIA_Bennet_BringOre_06_03"); //Zatrzymaj sobie dwie z nich. Przydadz� ci si�, je�li b�dziesz chcia� wyku� sobie bro�.
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
	AI_Output	(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nie, jeszcze nie. Wr�� p�niej.
};
instance DIA_Bennet_TeachSmith		(C_INFO)
{
	npc		 	= SLD_809_Bennet;
	nr		 	= 30;
	condition	= DIA_Bennet_TeachSmith_Condition;
	information	= DIA_Bennet_TeachSmith_Info;
	permanent	= TRUE;
	description	= "Chcia�bym wiedzie� wi�cej o wykuwaniu magicznej broni.";
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
	AI_Output (other, self, "DIA_Bennet_TeachSmith_15_00"); //Chcia�bym wiedzie� wi�cej o wykuwaniu magicznej broni.
	
	if (Kapitel == 1)//HACK Mattes  
	{
		B_SayBennetLATER();
	}
	else if (Kapitel == 2)
	&& (Bennet_Kap2Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_01"); //Mog� ci� nauczy�, jak wyku� miecze z magicznego kruszcu, nawet dwur�czne.
		Bennet_Kap2Smith = TRUE;
	}
	else if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (Bennet_Kap3Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_02"); //Poprawi�em moj� technik�. Teraz mog� ci� nauczy�, jak wyku� z rudy miecze p�torar�czne albo ci�kie dwur�czne.
		Bennet_Kap3Smith = TRUE;
	}
	else if (MIS_ReadyForChapter4 == TRUE)
	&& (Kapitel < 5)
	&& (Bennet_Kap4Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_03"); //Chyba tym razem przeszed�em samego siebie. Opracowa�em dwa bitewne ostrza. To najlepsza rzecz, jak� do tej pory zrobi�em.
		Bennet_Kap4Smith = TRUE;
	}
	else if (Kapitel >= 5)
	&& (Bennet_Kap5Smith == FALSE)
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_04"); //S�uchaj, chyba mam genialny pomys�. Bro� z magicznego kruszcu, pokryta smocz� krwi�. I wiem dok�adnie, jak to zrobi�!
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_05"); //Chcesz pozna� ten sekret?
		Bennet_Kap5Smith = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Bennet_TeachSmith_06_06"); //Jak� bro� chcia�by� zrobi�?
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
	description	 = 	"Jak trafi�e� do paki?";
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
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_00"); //Jak trafi�e� do paki?
	AI_Output	(self , other,"DIA_Bennet_WhyPrison_06_01"); //Te �winie wrzuci�y mnie do lochu. Twierdz�, �e zamordowa�em paladyna.
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_02"); //Ale ja tego nie zrobi�em, pr�buj� mnie wrobi�.
	AI_Output	(other, self ,"DIA_Bennet_WhyPrison_15_03"); //Czemu mieliby to robi�?
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_04"); //A sk�d mam wiedzie�? Musisz mnie st�d wyci�gn��!
	AI_Output 	(self ,other ,"DIA_Bennet_WhyPrison_06_05"); //Porozmawiaj z Lordem Hagenem, zburz mury, nie wiem - po prostu zr�b co�!
	
	MIS_RescueBennet = LOG_RUNNING; 
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet zrobi�by wszystko, �eby wydosta� si� z wi�zienia."); 
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
	description	 = 	"Co si� sta�o?";
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
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_00"); //Co si� sta�o?
	AI_Output	(self , other,"DIA_Bennet_WhatHappened_06_01"); //Poszed�em do miasta z Hodgesem, �eby kupi� troch� zapas�w dla ch�opak�w.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_02"); //Nagle us�yszeli�my g�o�ny krzyk i tupot n�g.
	AI_Output	(other, self ,"DIA_Bennet_WhatHappened_15_03"); //Przejd� do rzeczy.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_04"); //Od razu wiedzieli�my, �e co� si� sta�o i spr�buj� nas z�apa�, je�li nas zauwa��.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_05"); //Uciekali�my, jakby nas diabe� goni�. Wtedy, tu� przed bram� miasta, potkn��em si� i rozwali�em kolano.
	AI_Output 	(self ,other ,"DIA_Bennet_WhatHappened_06_06"); //Reszta jest oczywista. Stra� od razu mnie z�apa�a i wrzuci�a prosto do tego lochu.
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
	AI_Output	(self , other,"DIA_Bennet_Victim_06_01"); //Nie mam poj�cia. Jednego z paladyn�w, nie znam ich.
	AI_Output	(other, self ,"DIA_Bennet_Victim_15_02"); //Wiesz, jak si� nazywa�?
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_03"); //Jaki� Lothar, chyba. No nie wiem, nie jestem pewny.
	AI_Output 	(self ,other ,"DIA_Bennet_Victim_06_04"); //Lepiej zapytaj Lorda Hagena, on zna wszystkie szczeg�y.

	B_LogEntry (TOPIC_RESCUEBENNET,"Jeden z paladyn�w, Lothar, zosta� zamordowany. �ledztwo w tej sprawie prowadzi Lord Hagen i z pewno�ci� udzieli mi dok�adniejszych informacji.");
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
	description	 = 	"Maj� przeciwko tobie jakie� dowody?";
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
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_00"); //Maj� przeciwko tobie jakie� dowody?
	AI_Output	(self , other,"DIA_Bennet_Evidence_06_01"); //M�wi�, �e maj� �wiadka, kt�ry wszystko widzia�.
	AI_Output	(other, self ,"DIA_Bennet_Evidence_15_02"); //Wiesz, kim jest ten �wiadek?
	AI_Output 	(self ,other ,"DIA_Bennet_Evidence_06_03"); //Nie. Wiem tylko, �e k�amie.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Podobno kto� widzia� Benneta, gdy ten pope�nia� zbrodni�. Je�li chc� pozna� prawd�, b�d� musia� znale�� tego �wiadka.");
	
	RescueBennet_KnowsWitness = TRUE; 
};


//*********************************************************************
//	Wer f�hrt die Untersuchungen durch?
//*********************************************************************
instance DIA_Bennet_Investigation		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_Investigation_Condition;
	information	 = 	DIA_Bennet_Investigation_Info;
	permanent	 = 	FALSE;
	description	 = 	"Kto kieruje �ledztwem?";
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
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_00"); //Kto kieruje �ledztwem?
	AI_Output	(self , other,"DIA_Bennet_Investigation_06_01"); //Sam Lord Hagen. Poniewa� ofiara by�a paladynem, to sprawa podlega pod s�d wojskowy.
	AI_Output	(other, self ,"DIA_Bennet_Investigation_15_02"); //Co to znaczy?
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_03"); //Nietrudno zgadn��. Je�li si� st�d nie wydostan�, to zadyndam na sznurze.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_04"); //Musisz mi pom�c albo wybuchnie wojna. Lee tak tego nie zostawi.
	AI_Output 	(self ,other ,"DIA_Bennet_Investigation_06_05"); //Sam si� domy�l, co to b�dzie oznacza�.
};


//*********************************************************************
//	Mann, ich hatte echt schon geglaubt, dass die mich h�ngen! 
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

	AI_Output	(self ,other,"DIA_Bennet_ThankYou_06_00"); //Stary, ju� my�la�em, �e naprawd� mnie powiesz�!
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_01"); //No c�, wszystko si� w ko�cu wyja�ni�o.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_02"); //Wspaniale. Szkoda, �e nie widzia�e� twarzy tego �o�nierza, kt�ry mnie wyprowadza�!
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_03"); //By� taki przera�ony, �e prawie narobi� w gacie.
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_04"); //A to mi przypomina, �e mam co� dla ciebie.
	AI_Output	(other,self ,"DIA_Bennet_ThankYou_15_05"); //Co? O co ci chodzi?
	AI_Output 	(self ,other,"DIA_Bennet_ThankYou_06_06"); //Prezent.
	
};

//*********************************************************************
//	Was f�r ein Geschenk?
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
	
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_01"); //S�yszeli�my pog�oski o smokach w Dolinie.
	AI_Output	(other,self ,"DIA_Bennet_Present_15_02"); //Naprawd� tam s�!
	AI_Output 	(self ,other,"DIA_Bennet_Present_06_03"); //W porz�dku, wierz� ci.
	
	if (hero.guild == GIL_DJG)
	{
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_04"); //W ka�dym razie, paru ch�opak�w postanowi�o wybra� si� do Doliny.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_05"); //Zamierzaj� tam troch� zarobi�.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_06"); //A co to ma wsp�lnego ze mn�?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_07"); //Opracowa�em nowy rodzaj zbroi. Zbroj� �owcy smok�w!
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_08"); //Jest bardziej wytrzyma�a i l�ejsza ni� zwyk�e zbroje.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_09"); //A poniewa� to ty mnie uratowa�e�, chc� ci da� jej pierwszy egzemplarz. To prezent!
			
		CreateInvItems (self,ITAR_DJG_L,1);
		B_GiveInvItems (self,other,ITAR_DJG_L,1);
			
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_10"); //S�dzi�em, �e pewnie zechcesz przy��czy� si� do zabawy. Je�li wybierasz si� do Doliny, b�dzie ci potrzebny odpowiedni ekwipunek.
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_11"); //A poza tym interesuj� mnie smocze �uski. Prawdziwe smocze �uski. Dam ci za nie dobr� cen�.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_12"); //Ile dostan� za ka�d� �usk�?
		B_Say_Gold (self,other,Value_DragonScale); 
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_13"); //Tak czy inaczej, pomy�la�em, �e b�dziesz chcia� wzi�� udzia� w polowaniu na smoki.
		AI_Output	(other,self ,"DIA_Bennet_Present_15_14"); //I co?
		AI_Output 	(self ,other,"DIA_Bennet_Present_06_15"); //Prosz�, we� ten amulet. S�dz�, �e tobie bardziej si� on przyda.
	
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
	description	 =	"Mam dla ciebie smocze �uski.";
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
	AI_Output	(other,self ,"DIA_Bennet_DragonScale_15_00"); //Mam dla ciebie smocze �uski.
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_01"); //Prawdziwe smocze �uski!
	AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_02"); //Oto twoje z�oto.
	
	Bennet_DragonScale_Counter = (Bennet_DragonScale_Counter +(Npc_HasItems (other,ItAT_Dragonscale)));
	
	B_GiveInvItems (self ,other,ItMi_Gold,(Npc_HasItems(other,ItAT_Dragonscale) * Value_DragonScale) ); 
	B_GiveInvItems (other,self ,ItAt_Dragonscale,(Npc_HasItems (other,ItAT_Dragonscale)));
	
	
	if (Bennet_DragonScale_Counter >= 20)
	&& (Show_DJG_Armor_M == FALSE)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DragonScale_06_03"); //W porz�dku, tyle powinno wystarczy�. Mog� ci sprzeda� now�, ulepszon� zbroj�. Je�li chcesz.
		
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
	description	 =	"�redni pancerz �owcy smok�w. Ochrona (bro� i strza�y) 120, 12000 sztuk z�ota."; //Wenn �ndern, dann bitte auch in der Info-Instanz. s.u.
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
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_00"); //Chc� kupi� zbroj�.
	
	if (Npc_HasItems (other,itmi_Gold) >= 12000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_01"); //Bardzo dobrze. B�dziesz ni� zachwycony.
		AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_M_15_02"); //Chyba mog� tego oczekiwa� po takiej cenie.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_03"); //Przekonasz si�, �e jest warta ka�dej sztuki z�ota.
		
		B_GiveInvItems (other,self,ItMi_Gold,12000);
		CreateInvItems (self,ITAR_DJG_M,1);
		B_GiveInvItems (self,other,ITAR_DJG_M,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_M_06_04"); //Masz za ma�o z�ota.
	};	
	
};

//*********************************************************************
//		Ich weiss, wie man die R�stung noch mehr verbessern kann.
//*********************************************************************

instance DIA_Bennet_BetterArmor		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_BetterArmor_Condition;
	information	 = 	DIA_Bennet_BetterArmor_Info;
	permanent	 = 	FALSE;
	description	 =	"Wiem, jak jeszcze bardziej ulepszy� zbroj�.";
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
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_00"); //Wiem, jak jeszcze bardziej ulepszy� zbroj�.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_01"); //Tak? No to mi powiedz.
	AI_Output	(other,self ,"DIA_Bennet_BetterArmor_15_02"); //Mo�esz pokry� smocze �uski magiczn� rud�.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_03"); //Te� o tym pomy�la�em. Masz racj�.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_04"); //Moja najnowsza zbroja bije na g�ow� wszystko, co do tej pory widzia�e�. Jest lekka, ale mocna.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_05"); //Jest po prostu IDEALNA.
	AI_Output 	(self ,other,"DIA_Bennet_BetterArmor_06_06"); //Je�li chcesz, to ci j� sprzedam. Nie zaproponowa�bym tego byle komu, a cena pokrywa tylko moje koszty.
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
	description	 =	"Ci�ki pancerz �owcy smok�w. Ochrona (bro� i strza�y) 150, 20000 sztuk z�ota."; //Wenn �ndern, dann bitte auch in der Info-Instanz. s.u.
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
	AI_Output	(other,self ,"DIA_Bennet_DJG_ARMOR_H_15_00"); //Daj mi t� zbroj�.
	
	if (Npc_HasItems (other,itmi_Gold) >= 20000)
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_01"); //To najlepsza zbroja, jak� kiedykolwiek zrobi�em.
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_02"); //Prawdziwe arcydzie�o.
		
		B_GiveInvItems (other,self,ItMi_Gold,20000);
		CreateInvItems (self,ITAR_DJG_H,1);
		B_GiveInvItems (self,other,ITAR_DJG_H,1);
		
		Bennet_DIA_Bennet_DJG_ARMOR_H_permanent = TRUE;
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Bennet_DJG_ARMOR_H_06_03"); //Masz za ma�o z�ota.
	};	
	
};
//*********************************************************************
//	Kannst du auch Schmuckst�cke reparieren?
//*********************************************************************
instance DIA_Bennet_RepairNecklace		(C_INFO)
{
	npc		 	 = 	SLD_809_Bennet;
	nr           = 	8;
	condition	 = 	DIA_Bennet_RepairNecklace_Condition;
	information	 = 	DIA_Bennet_RepairNecklace_Info;
	permanent	 = 	FALSE;
	description	 = 	"Potrafisz naprawi� bi�uteri�?";
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
	AI_Output			(other, self, "DIA_Bennet_RepairNecklace_15_00"); //Umiesz naprawia� bi�uteri�?
	AI_Output			(self, other, "DIA_Bennet_RepairNecklace_06_01"); //To zale�y. Musia�by� mi j� najpierw pokaza�.
	
	if (MIS_RescueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_02"); //No i oczywi�cie musz� si� st�d wydosta�.
		AI_Output (self ,other,"DIA_Bennet_RepairNecklace_06_03"); //Bo teraz nic nie mog� zrobi�.
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
	description	 = 	"Mo�esz obejrze� ten amulet?";
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
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_00"); //Mo�esz obejrze� ten amulet?
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_01"); //Jasne, poka�.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_02"); //Hmmm. Pi�kna robota. Ale oprawa jest uszkodzona. Chyba da�bym rad� to naprawi�.
	AI_Output			(other, self, "DIA_Bennet_ShowInnosEye_15_03"); //Ile ci to zajmie?
	if (MIS_REscueBennet != LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_04"); //C�, na razie tu ugrz�z�em. Widzisz tu jak�� ku�ni�?
		AI_Output (self ,other,"DIA_Bennet_ShowInnosEye_06_05"); //U siebie zrobi�bym to w jeden dzie�. Ale najpierw musia�bym si� st�d wydosta�.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_06"); //Je�li to tu zostawisz, b�dzie gotowe na jutro.
	AI_Output			(self, other, "DIA_Bennet_ShowInnosEye_06_07"); //I nic ci za to nie policz�. W ko�cu wyci�gn��e� mnie z paki.
	};
	
	B_LogEntry (TOPIC_INNOSEYE, "Bennet m�g�by naprawi� amulet.");

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
	description	 = 	"Oto amulet, prosz�, napraw go dla mnie.";
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
	AI_Output			(other, self, "DIA_Bennet_GiveInnosEye_15_00"); //Oto amulet, prosz�, napraw go dla mnie.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_01"); //W porz�dku. Do jutra zrobi� now� opraw�.
	AI_Output			(self, other, "DIA_Bennet_GiveInnosEye_06_02"); //Mo�esz do mnie wtedy przyj�� i go odebra�.
	
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
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_01"); //Tak, prosz�.
	
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Repaired;
		CreateInvItems (other,ItMi_InnosEye_Broken_Mis,1);
		AI_PrintScreen (Print_InnoseyeGet, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_02"); //Musia�em zrobi� now� opraw� dla kamienia.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_03"); //Pracowa�em przez ca�� noc. Wygl�da jak nowy.
		
		B_LogEntry (TOPIC_INNOSEYE, "Bennet naprawi� opraw� amuletu.");
		
		MIS_Bennet_InnosEyeRepairedSetting   = LOG_SUCCESS;
		
		B_GivePlayerXP (XP_InnosEyeIsRepaired);
	}
	else
	{	//Hack Mattes
		B_SayBennetLATER();
		//AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_04"); //Nein, noch nicht. Komm sp�ter wieder.
		AI_Output			(self, other, "DIA_Bennet_GetInnosEye_06_05"); //Je�li b�dziesz mi przeszkadza�, potrwa to d�u�ej.
		
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

	description	 = 	"Czy mo�esz co� zrobi� ze smoczych jaj?";
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
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_00"); //Czy mo�esz co� zrobi� ze smoczych jaj?
	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_01"); //Smocze jaja? Do licha, sk�d je wytrzasn��e�?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_02"); //Zabra�em je jaszczuroludziom.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_03"); //Poka�.
	};

	Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
	AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	

	if (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_04"); //Hmmm. Bardzo twardy materia�. Idealny do wyko�czenia zbroi. To znaczy, gdyby komu� uda�o si� je rozbi�.
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_15_05"); //No to co? Chcesz?
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_06"); //Jasne! Dawaj.
	}
	else
	{
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_07"); //Ile razy jeszcze masz zamiar pokazywa� mi te cholerstwa? Chcesz, �ebym je kupi� czy nie?
	};

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_06_08"); //Zap�ac� powiedzmy, hmmm... 300 sztuk z�ota za ka�de jajo, kt�re mi przyniesiesz.

	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Zachowaj wi�c swoje z�oto. My�l�, �e je zatrzymam.", DIA_Bennet_DRACHENEIER_nein );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "To s� smocze jaja, a nie jajka od kury.", DIA_Bennet_DRACHENEIER_mehr );
	Info_AddChoice	(DIA_Bennet_DRACHENEIER, "Umowa stoi.", DIA_Bennet_DRACHENEIER_ok );

	IF (DRACHENEIER_angebotenXP_OneTime == FALSE)
	{
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet hojnie mi zap�aci za wszystkie smocze jaja, kt�re zdo�am znale��."); 
	B_GivePlayerXP (XP_DJG_BringDragonEgg);
	DRACHENEIER_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Bennet_DRACHENEIER_ok ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_00"); //Umowa stoi.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_01"); //Dobra.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_02"); //A wi�c je�li jakie� znajdziesz, przynie� mi je.

	if (BennetsDragonEggOffer != 350)
	{
		BennetsDragonEggOffer = 300;	
	};

	CreateInvItems (self, ItMi_Gold, BennetsDragonEggOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	BennetsDragonEggOffer);

	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_03"); //Hmmm. M�wi�e�, �e znalaz�e� je u jaszczuroludzi?
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_ok_15_04"); //Dok�adnie.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_05"); //Z tego, co wiem, wi�kszo�� jaszczuroludzi mieszka w jaskiniach.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_06"); //Nie zdziwi�bym si�, gdyby w okolicznych pieczarach by�o tego wi�cej.
	B_LogEntry (TOPIC_DRACHENEIER,"Bennet uwa�a, �e powinienem poszuka� smoczych jaj w jaskiniach Khorinis, w kt�rych podobno �yj� jaszczuroludzie."); 
	
	AI_Output (self, other, "DIA_Bennet_DRACHENEIER_ok_06_07"); //Prosz�. We� t� map�. Pomo�e ci znale�� jaskinie.
	CreateInvItems (self, ItWr_Map_Caves_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_Caves_MIS,1);
	B_LogEntry (TOPIC_DRACHENEIER,"Aby u�atwi� mi to zadanie, da� mi map� jaski�."); 
	
	if (1 == 2) //MH: Besser Karte direkt (war sowieso so - wegen Bug)
	{
		AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_ok_06_08"); //Ale najpierw musisz zdoby� map� jaski� od kartografa w mie�cie. Szkoda by�oby, gdyby� przeoczy� jakie� jajo.
		B_LogEntry (TOPIC_DRACHENEIER,"Powinienem kupi� u kartografa w mie�cie map� jaski�. Dzi�ki temu b�d� mia� pewno��, �e nie przeoczy�em �adnego jaja."); 
	};
	
	Info_ClearChoices	(DIA_Bennet_DRACHENEIER);
};

func void DIA_Bennet_DRACHENEIER_mehr ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_mehr_15_00"); //To s� smocze jaja, a nie jajka od kury.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_mehr_06_01"); //W porz�dku. Niech b�dzie 350. Nie mog� ci wi�cej da�, bo mi si� to nie zwr�ci.
	BennetsDragonEggOffer =	350;
};

func void DIA_Bennet_DRACHENEIER_nein ()
{
	AI_Output			(other, self, "DIA_Bennet_DRACHENEIER_nein_15_00"); //Zachowaj wi�c swoje z�oto. My�l�, �e je zatrzymam.
	AI_Output			(self, other, "DIA_Bennet_DRACHENEIER_nein_06_01"); //Powiedz, je�li zmienisz zdanie.

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
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_02"); //Prosz�, mam kolejne.
			B_GivePlayerXP (XP_DJG_BringDragonEgg);
			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	1);
			AI_PrintScreen (PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);	// "1 Gegenstand gegeben"	
			DragonEggCounter = DragonEggCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Bennet_EierBringen_15_03"); //Mam tu kilka.

			Npc_RemoveInvItems	(other,	ItAt_DragonEgg_MIS,	DragonEggCount);
			concatText = ConcatStrings(IntToString(DragonEggCount), PRINT_ItemsGegeben);		// "x Gegenst�nde gegeben"
			AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			XP_DJG_BringDragonEggs = (DragonEggCount * XP_DJG_BringDragonEgg);
			DragonEggCounter = (DragonEggCounter + DragonEggCount); 

			B_GivePlayerXP (XP_DJG_BringDragonEggs);
		};

	if (DragonEggCounter <= 7)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_04"); //Wspaniale. Dawaj. Wsz�dzie ju� zajrza�e�? Na pewno jest ich wi�cej.
	}
	else if	(DragonEggCounter <= 11)
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_05"); //Sk�d to wygrzeba�e�? Pewnie niewiele ju� ich zosta�o.
	}
	else
	{
		AI_Output			(self, other, "DIA_Bennet_EierBringen_06_06"); //S�dz�, �e ju� wi�cej ich nie znajdziesz. A ja mam ich tyle, �e nie wiem, co z nimi zrobi�.
		TOPIC_END_DRACHENEIER = TRUE;
	};

	AI_Output			(self, other, "DIA_Bennet_EierBringen_06_07"); //Och, w porz�dku. Oto twoje pieni�dze.

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
	description	 = 	"Wybieram si� na wysp� i przyda�by mi si� kowal.";
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
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_00"); //Wybieram si� na wysp� i przyda�by mi si� kowal.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_01"); //I pomy�la�e� o mnie?
	AI_Output			(other, self, "DIA_Bennet_KnowWhereEnemy_15_02"); //Tak. Co ty na to? Tak czy inaczej, dzi�ki temu by� si� st�d wydosta�.
	AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_03"); //Stary, nawet w piekle nie mo�e by� tak paskudnie jak na farmie Onara. Wchodz� w to.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	B_LogEntry (TOPIC_Crew,"Bennet mo�e wyruszy� w ka�dej chwili. Jest niezr�wnanym kowalem - z pewno�ci� m�g�bym si� od niego wiele nauczy�.");
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Bennet_KnowWhereEnemy_15_04"); //Moja za�oga jest ju� kompletna.
		AI_Output			(self, other, "DIA_Bennet_KnowWhereEnemy_06_05"); //Wi�c ode�lij kogo�.
	}
	else 
	{
		Info_ClearChoices (DIA_Bennet_KnowWhereEnemy);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"Powiem ci, kiedy mi b�dziesz potrzebny.",DIA_Bennet_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Bennet_KnowWhereEnemy,"A wi�c b�dziesz moim kowalem. Zobaczymy si� w porcie.",DIA_Bennet_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Bennet_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_Yes_15_00"); //A wi�c b�dziesz moim kowalem. Zobaczymy si� w porcie.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01"); //W porz�dku. Do zobaczenia.
	
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
	AI_Output (other,self ,"DIA_Bennet_KnowWhereEnemy_No_15_00"); //Powiem ci, kiedy mi b�dziesz potrzebny.
	AI_Output (self ,other,"DIA_Bennet_KnowWhereEnemy_No_06_01"); //�wietnie.

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
	description	 = 	"Zamierzam znale�� sobie innego kowala.";
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
	AI_Output			(other, self, "DIA_Bennet_LeaveMyShip_15_00"); //Zamierzam znale�� sobie innego kowala.
	AI_Output			(self, other, "DIA_Bennet_LeaveMyShip_06_01"); //Raz tak, raz siak. Zdecyduj si�, dobra? Daj mi zna�, jak b�dziesz wiedzia�, czego NAPRAWD� chcesz.
	
	Bennet_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Start"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir �berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_809_Bennet;
	nr			 = 	55;
	condition	 = 	DIA_Bennet_StillNeedYou_Condition;
	information	 = 	DIA_Bennet_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Wr��. Nie mog� znale�� innego kowala.";
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
	AI_Output	(other, self, "DIA_Bennet_StillNeedYou_15_00"); //Wr��. Nie mog� znale�� innego kowala.
	AI_Output	(self, other, "DIA_Bennet_StillNeedYou_06_01"); //Dobra! W ko�cu kto by si� mn� przejmowa�, drobiazg. Zobaczymy si� w porcie.
		
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


























