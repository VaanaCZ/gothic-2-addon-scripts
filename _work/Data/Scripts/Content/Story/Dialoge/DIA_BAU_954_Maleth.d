///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Maleth_EXIT   (C_INFO)
{
	npc         = BAU_954_Maleth;
	nr          = 999;
	condition   = DIA_Maleth_EXIT_Condition;
	information = DIA_Maleth_EXIT_Info;
	permanent   = TRUE;
	description = "Musz� i��!";
};
FUNC INT DIA_Maleth_EXIT_Condition()
{
	if (Kapitel	< 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (Maleth_ersterWolf == FALSE)
	{
		Wld_InsertNpc		(YWolf,	"NW_FARM1_PATH_CITY_SHEEP_06");
		Maleth_ersterWolf = TRUE;
	};
};


///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Hallo (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_Hallo_Condition;
	information	= DIA_Maleth_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};

func int DIA_Maleth_Hallo_Condition ()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Maleth_Hallo_08_00"); //Hej, w�drowcze!

	if (hero.guild == GIL_NONE)
		{
		
			if (Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_01"); //Widzia�em, jak wyszed�e� spomi�dzy g�r.
			};
			AI_Output (self, other, "DIA_Maleth_Hallo_08_02"); //Ciesz si�, �e nie przyszed�e� tutaj trzy tygodnie temu.
			AI_Output (self, other, "DIA_Maleth_Hallo_08_03"); //Wzi�liby�my ci� za zbieg�ego wi�nia. A wtedy szybko by�my si� z tob� rozprawili!
			
			if (Npc_HasEquippedArmor(other) == FALSE) 
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_04"); //Wygl�dasz na wyko�czonego.
			}
			else
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_05"); //Kiedy tu przyby�e�, wygl�da�e� na wyko�czonego.
				AI_Output (self, other, "DIA_Maleth_Hallo_08_06"); //Teraz wygl�dasz ju� prawie jak cz�owiek!
			};
		};

	AI_Output (self, other, "DIA_Maleth_Hallo_08_07"); //Czego tu szukasz?
};

///////////////////////////////////////////////////////////////////////
//	Banditen �berfall
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BANDITS		(C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BANDITS_Condition;
	information	= DIA_Maleth_BANDITS_Info;
	permanent   = FALSE;
	description	= "W g�rach zosta�em zaatakowany przez bandyt�w.";
};

func int DIA_Maleth_BANDITS_Condition ()
{
	if (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BANDITS_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BANDITS_15_00"); //W g�rach zosta�em zaatakowany przez bandyt�w.
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_01"); //Te przekl�te �miecie! To pewnie ci sami, kt�rzy ostatniej nocy ukradli nam owc�!
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_02"); //Mia�e� niesamowite szcz�cie. RZADKO kto uchodzi z �yciem.
};

///////////////////////////////////////////////////////////////////////
//	Banditen tot
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsDEAD	(C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsDEAD_Condition;
	information	= DIA_Maleth_BanditsDEAD_Info;
	permanent   = FALSE;
	description	= "Bandyci nie b�d� ju� was wi�cej niepokoi�...";
};

func int DIA_Maleth_BanditsDEAD_Condition ()
{
	if ( Npc_IsDead (Ambusher_1013) || (Bdt_1013_Away == TRUE) )
	&& (Npc_IsDead (Ambusher_1014)) 
	&& (Npc_IsDead (Ambusher_1015))
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsDEAD_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_00"); //Bandyci nie b�d� ju� was wi�cej niepokoi�...
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_01"); //Czemu? Nie �yj�?
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_02"); //Zadarli z niew�a�ciw� osob�...
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_03"); //Chwa�a Innosowi! Prosz� - przyjmij ten skromny dar!
	B_GiveInvItems (self, other, ItFo_Wine, 3);
	
	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_MalethKillBandits);
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_04"); //Opowiem o tym pozosta�ym!
};

///////////////////////////////////////////////////////////////////////
//	Banditen leben noch
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BanditsALIVE (C_INFO) //E2
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BanditsALIVE_Condition;
	information	= DIA_Maleth_BanditsALIVE_Info;
	permanent   = FALSE;
	description	= "Wiem, gdzie znajduje si� kryj�wka bandyt�w...";
};

func int DIA_Maleth_BanditsALIVE_Condition ()
{
	var C_NPC b13; b13 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	var C_NPC b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_NPC b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);
	
	if ( (!Npc_IsDead (b13)) || (!Npc_IsDead (b14)) || (!Npc_IsDead (b15)) )
	&& (Npc_KnowsInfo (other, DIA_Maleth_BANDITS))
	&& (MIS_Maleth_Bandits != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsALIVE_Info ()
{
	AI_Output (other, self, "DIA_Maleth_BanditsALIVE_15_00"); //Wiem, gdzie znajduje si� kryj�wka bandyt�w...
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_01"); //Chcesz ich zaatakowa�? Ja si� na to nie pisz�! To zbyt niebezpieczne!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_02"); //Poza tym, musz� pilnowa� moich owiec!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_03"); //Jednak je�li s�dzisz, �e by�by� w stanie uwolni� nas od tej ho�oty, ca�a farma by�aby ci bardzo wdzi�czna.
	MIS_Maleth_Bandits = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Maleth,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Maleth,LOG_RUNNING);
	B_LogEntry (TOPIC_Maleth,"Je�li pokonam bandyt�w grasuj�cych przy drodze z wie�y Xardasa na farm� Lobarta, wszyscy na farmie b�d� mi bardzo wdzi�czni.");
	
};


///////////////////////////////////////////////////////////////////////
//	Auf dem Weg in die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_ToTheCity (C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 2;
	condition	= DIA_Maleth_ToTheCity_Condition;
	information	= DIA_Maleth_ToTheCity_Info;
	permanent   = FALSE;
	description	= "Podr�uj� do miasta.";
};

func int DIA_Maleth_ToTheCity_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_ToTheCity_Info ()
{
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_00"); //Podr�uj� do miasta.
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_01"); //Przy twoim wygl�dzie b�dziesz musia� przekupi� stra�nik�w, je�li chcesz, �eby ci� wpu�cili.
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_02"); //Musisz wiedzie�, co chc� us�ysze�.
	}
	else
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_03"); //Je�li powiesz im to, co chcieliby us�ysze�, mog� ci� wpu�ci�...
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_04"); //A co to takiego?
	AI_Output (self, other, "DIA_Maleth_ToTheCity_08_05"); //Mo�esz im na przyk�ad powiedzie�, �e przychodzisz z farmy Lobarta i chcesz si� dosta� do kowala.
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Dostan� si� do miasta, je�li powiem stra�nikowi strzeg�cemu bramy, �e przyszed�em z farmy Lobarta i potrzebuj� pomocy kowala.");
	
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_06"); //Chocia� to raczej nie zadzia�a, nie wygl�dasz na ch�opa.
		B_LogEntry (TOPIC_City,"Oczywi�cie, powinienem wygl�da� jak farmer.");
		
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_07"); //Rozumiem.
};
	
	
	

///////////////////////////////////////////////////////////////////////
//	Bessere Ausr�stung
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Equipment		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_Equipment_Condition;
	information	= DIA_Maleth_Equipment_Info;
	permanent   = FALSE;
	description	= "Potrzebuj� lepszego wyposa�enia!";
};

func int DIA_Maleth_Equipment_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Hallo))
	&& (Kapitel < 3)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_Equipment_Info ()
{
	AI_Output (other, self, "DIA_Maleth_Equipment_15_00"); //Potrzebuj� lepszego wyposa�enia!
	AI_Output (self, other, "DIA_Maleth_Equipment_08_01"); //Mog� ci powiedzie� od razu, �e nie mamy nic do oddania.
	if (!Npc_IsDead(Lobart))
	{
		AI_Output (self, other, "DIA_Maleth_Equipment_08_02"); //Je�li ci� na to sta�, mo�esz co� kupi� od Lobarta.
		AI_Output (self, other, "DIA_Maleth_Equipment_08_03"); //Mo�esz te� zapyta� go, czy znajdzie dla ciebie jak�� prac�.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Lobart
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_LOBART		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_LOBART_Condition;
	information	= DIA_Maleth_LOBART_Info;
	permanent   = FALSE;
	description	= "Gdzie znajd� Lobarta?";
};

func int DIA_Maleth_LOBART_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_Equipment))
	&& (!Npc_IsDead(Lobart))
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Maleth_LOBART_Info ()
{
	AI_Output (other, self, "DIA_Maleth_LOBART_15_00"); //Gdzie znajd� Lobarta?
	AI_Output (self, other, "DIA_Maleth_LOBART_08_01"); //Jest gdzie� na farmie, to chyba oczywiste! W ko�cu to jego w�asno��!
	AI_Output (self, other, "DIA_Maleth_LOBART_08_02"); //Tylko nie pr�buj z nim zadziera�! Niejednego ju� pobi� i wyrzuci� ze swojego podw�rka.
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

INSTANCE DIA_Maleth_KAP3_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP3_EXIT_Condition;
	information	= DIA_Maleth_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info probleme
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PROBLEME		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	30;
	condition	 = 	DIA_Maleth_PROBLEME_Condition;
	information	 = 	DIA_Maleth_PROBLEME_Info;

	description	 = 	"Czy w ci�gu kilku ostatnich dni wydarzy�o si� co� nowego?";
};

func int DIA_Maleth_PROBLEME_Condition ()
{
	if (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Maleth_PROBLEME_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_15_00"); //Czy w ci�gu kilku ostatnich dni wydarzy�o si� co� nowego?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_01"); //Po prostu id� �cie�k� do miasta.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_02"); //Je�li natkniesz si� na faceta w czarnej szacie, dowiesz si�, co si� wydarzy�o.
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Jak twoje owce?", DIA_Maleth_PROBLEME_schafe );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Czy m�czy�ni w czarnych szatach ju� tu byli?", DIA_Maleth_PROBLEME_beidir );
	
};
func void DIA_Maleth_PROBLEME_beidir ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_beidir_15_00"); //Czy m�czy�ni w czarnych szatach ju� tu byli?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_beidir_08_01"); //Tak. Kr��� dooko�a nas od paru dni. Moim zdaniem, przyszli tutaj prosto z piek�a.

};

func void DIA_Maleth_PROBLEME_schafe ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_15_00"); //Jak twoje owce?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_08_01"); //Tak jakby faktycznie ci� to interesowa�o! Masz chyba inne zmartwienia.
	Info_AddChoice	(DIA_Maleth_PROBLEME, "A co ty mo�esz wiedzie� o moich zmartwieniach?", DIA_Maleth_PROBLEME_schafe_probleme );

};
func void DIA_Maleth_PROBLEME_schafe_probleme ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_15_00"); //A co ty mo�esz wiedzie� o moich zmartwieniach?
	
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_01"); //Jeste� cz�onkiem stra�y miejskiej czy nie? Je�li tak, to z pewno�ci� wiesz co� na temat tych odzianych na czarno facet�w.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_02"); //Wy najemnicy my�licie tylko o jednym: 'Jak mog� wy�udzi� od innych ich ci�ko zarobione pieni�dze?'
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_03"); //Wy, dostojni magowie z klasztoru, chyba powinni�cie wiedzie� co� na temat pewnych zakapturzonych postaci.
		};

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Uwa�aj, co m�wisz, kolego.", DIA_Maleth_PROBLEME_schafe_probleme_drohen );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Info_AddChoice	(DIA_Maleth_PROBLEME, "W czym problem?", DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag );
		};
};

func void DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00"); //O co ci chodzi?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01"); //Wszystko przez to wstr�tne wi�sko, kt�rym Vino tak strasznie mnie spi� kilka tygodni temu.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02"); //Nie wiem, jak to si� sta�o, ale zgubi�em wtedy moj� lask�.
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03"); //I o to tyle zamieszania?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04"); //�atwo ci m�wi�, nie nale�a�a do ciebie.
	
	Log_CreateTopic (TOPIC_MalethsGehstock, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock, LOG_RUNNING);
	B_LogEntry (TOPIC_MalethsGehstock,"Maleth zgubi� swoj� lask�. By� wtedy zupe�nie pijany, wi�c nie podejrzewam, �eby si� zbytnio oddali� od farmy Lobarta. Zguba na pewno le�y gdzie� w pobli�u."); 

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEME_schafe_probleme_drohen ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00"); //Uwa�aj, co m�wisz, kolego.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01"); //Potrafisz tylko gada�. Najlepiej b�dzie, je�li w og�le sobie st�d p�jdziesz.
};

func void DIA_Maleth_PROBLEME_Back ()
{
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

///////////////////////////////////////////////////////////////////////
//	Info Gehstock
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_GEHSTOCK		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_GEHSTOCK_Condition;
	information	 = 	DIA_Maleth_GEHSTOCK_Info;

	description	 = 	"Wydaje mi si�, �e ta laska nale�y do ciebie.";
};

func int DIA_Maleth_GEHSTOCK_Condition ()
{
	if (Npc_HasItems (other,ItMw_MalethsGehstock_MIS))
	&& (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
		{
				return TRUE;
		};
};

func void DIA_Maleth_GEHSTOCK_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_00"); //Wydaje mi si�, �e ta laska nale�y do ciebie.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_01"); //Niesamowite. Ja...
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_02"); //Chwileczk�. Najpierw zap�ata.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_03"); //Ale... Ja nie mam pieni�dzy.
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_04"); //Pomy�l o jakiej� innej formie wynagrodzenia.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_05"); //Dobrze. Co powiesz na to? Wczoraj widzia�em tutaj kilku bandyt�w, uciekaj�cych ze skradzionym z�otem.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_06"); //Je�li powiem ci, gdzie ukryli sw�j �up, czy dostan� z powrotem swoj� lask�?
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP (XP_FoundMalethsGehstock);

	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "Przykro mi, nie interesuje mnie to. Chc� twojego z�ota.", DIA_Maleth_GEHSTOCK_gold );
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "W porz�dku.", DIA_Maleth_GEHSTOCK_ok );
};
func void DIA_Maleth_GEHSTOCK_ok ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_ok_15_00"); //Zgoda.
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_01"); //W porz�dku, s�uchaj uwa�nie. Najpierw udaj si� na zach�d, a� dojdziesz do tamtych drzew. Zobaczysz g��boki jar.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_02"); //Jest tam jaskinia, a w niej powinno by� ukryte co� ciekawego.

	B_LogEntry (TOPIC_MalethsGehstock,"Maleth powiedzia� mi, �e w lesie na zach�d od farmy Lobarta znajduje si� du�y ob�z bandyt�w."); 
	CreateInvItems 		(BDT_1024_MalethsBandit, ItMi_MalethsBanditGold,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos (self);
};

func void DIA_Maleth_GEHSTOCK_gold ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_gold_15_00"); //Przykro mi, nie interesuje mnie to. Chc� twojego z�ota.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_gold_08_01"); //To wszystko, co mam. B�dzie musia�o ci wystarczy�.
	CreateInvItems 		(self, Itmi_Gold, 35);
	B_GiveInvItems 		(self, other, Itmi_Gold,35);
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_PERM3		(C_INFO)
{
	npc		 = 	BAU_954_Maleth;
	nr		 = 	33;
	condition	 = 	DIA_Maleth_PERM3_Condition;
	information	 = 	DIA_Maleth_PERM3_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nie przepracowuj si�.";
};

func int DIA_Maleth_PERM3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Maleth_PROBLEME))
	&& (Kapitel >= 3)
			{
					return TRUE;
			};
};

func void DIA_Maleth_PERM3_Info ()
{
	AI_Output			(other, self, "DIA_Maleth_PERM3_15_00"); //Nie przepracowuj si�.
	AI_Output			(self, other, "DIA_Maleth_PERM3_08_01"); //Zje�d�aj st�d.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Maleth_KAP4_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP4_EXIT_Condition;
	information	= DIA_Maleth_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Maleth_KAP5_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP5_EXIT_Condition;
	information	= DIA_Maleth_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Maleth_KAP6_EXIT(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 999;
	condition	= DIA_Maleth_KAP6_EXIT_Condition;
	information	= DIA_Maleth_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Maleth_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Maleth_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maleth_PICKPOCKET (C_INFO)
{
	npc			= BAU_954_Maleth;
	nr			= 900;
	condition	= DIA_Maleth_PICKPOCKET_Condition;
	information	= DIA_Maleth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Maleth_PICKPOCKET_Condition()
{
	C_Beklauen (10, 10);
};
 
FUNC VOID DIA_Maleth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maleth_PICKPOCKET);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_BACK 		,DIA_Maleth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maleth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maleth_PICKPOCKET_DoIt);
};

func void DIA_Maleth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};
	
func void DIA_Maleth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maleth_PICKPOCKET);
};






































































