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
	description = "Muszê iœæ!";
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
	AI_Output (self, other, "DIA_Maleth_Hallo_08_00"); //Hej, wêdrowcze!

	if (hero.guild == GIL_NONE)
		{
		
			if (Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_01"); //Widzia³em, jak wyszed³eœ spomiêdzy gór.
			};
			AI_Output (self, other, "DIA_Maleth_Hallo_08_02"); //Ciesz siê, ¿e nie przyszed³eœ tutaj trzy tygodnie temu.
			AI_Output (self, other, "DIA_Maleth_Hallo_08_03"); //Wziêlibyœmy ciê za zbieg³ego wiêŸnia. A wtedy szybko byœmy siê z tob¹ rozprawili!
			
			if (Npc_HasEquippedArmor(other) == FALSE) 
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_04"); //Wygl¹dasz na wykoñczonego.
			}
			else
			{
				AI_Output (self, other, "DIA_Maleth_Hallo_08_05"); //Kiedy tu przyby³eœ, wygl¹da³eœ na wykoñczonego.
				AI_Output (self, other, "DIA_Maleth_Hallo_08_06"); //Teraz wygl¹dasz ju¿ prawie jak cz³owiek!
			};
		};

	AI_Output (self, other, "DIA_Maleth_Hallo_08_07"); //Czego tu szukasz?
};

///////////////////////////////////////////////////////////////////////
//	Banditen Überfall
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_BANDITS		(C_INFO) //E1
{
	npc			= BAU_954_Maleth;
	nr          = 1;
	condition	= DIA_Maleth_BANDITS_Condition;
	information	= DIA_Maleth_BANDITS_Info;
	permanent   = FALSE;
	description	= "W górach zosta³em zaatakowany przez bandytów.";
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
	AI_Output (other, self, "DIA_Maleth_BANDITS_15_00"); //W górach zosta³em zaatakowany przez bandytów.
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_01"); //Te przeklête œmiecie! To pewnie ci sami, którzy ostatniej nocy ukradli nam owcê!
	AI_Output (self, other, "DIA_Maleth_BANDITS_08_02"); //Mia³eœ niesamowite szczêœcie. RZADKO kto uchodzi z ¿yciem.
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
	description	= "Bandyci nie bêd¹ ju¿ was wiêcej niepokoiæ...";
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
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_00"); //Bandyci nie bêd¹ ju¿ was wiêcej niepokoiæ...
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_01"); //Czemu? Nie ¿yj¹?
	AI_Output (other, self, "DIA_Maleth_BanditsDEAD_15_02"); //Zadarli z niew³aœciw¹ osob¹...
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_03"); //Chwa³a Innosowi! Proszê - przyjmij ten skromny dar!
	B_GiveInvItems (self, other, ItFo_Wine, 3);
	
	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_MalethKillBandits);
	AI_Output (self, other, "DIA_Maleth_BanditsDEAD_08_04"); //Opowiem o tym pozosta³ym!
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
	description	= "Wiem, gdzie znajduje siê kryjówka bandytów...";
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
	AI_Output (other, self, "DIA_Maleth_BanditsALIVE_15_00"); //Wiem, gdzie znajduje siê kryjówka bandytów...
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_01"); //Chcesz ich zaatakowaæ? Ja siê na to nie piszê! To zbyt niebezpieczne!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_02"); //Poza tym, muszê pilnowaæ moich owiec!
	AI_Output (self, other, "DIA_Maleth_BanditsALIVE_08_03"); //Jednak jeœli s¹dzisz, ¿e by³byœ w stanie uwolniæ nas od tej ho³oty, ca³a farma by³aby ci bardzo wdziêczna.
	MIS_Maleth_Bandits = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Maleth,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Maleth,LOG_RUNNING);
	B_LogEntry (TOPIC_Maleth,"Jeœli pokonam bandytów grasuj¹cych przy drodze z wie¿y Xardasa na farmê Lobarta, wszyscy na farmie bêd¹ mi bardzo wdziêczni.");
	
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
	description	= "Podró¿ujê do miasta.";
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
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_00"); //Podró¿ujê do miasta.
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_01"); //Przy twoim wygl¹dzie bêdziesz musia³ przekupiæ stra¿ników, jeœli chcesz, ¿eby ciê wpuœcili.
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_02"); //Musisz wiedzieæ, co chc¹ us³yszeæ.
	}
	else
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_03"); //Jeœli powiesz im to, co chcieliby us³yszeæ, mog¹ ciê wpuœciæ...
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_04"); //A co to takiego?
	AI_Output (self, other, "DIA_Maleth_ToTheCity_08_05"); //Mo¿esz im na przyk³ad powiedzieæ, ¿e przychodzisz z farmy Lobarta i chcesz siê dostaæ do kowala.
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Dostanê siê do miasta, jeœli powiem stra¿nikowi strzeg¹cemu bramy, ¿e przyszed³em z farmy Lobarta i potrzebujê pomocy kowala.");
	
	
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output (self, other, "DIA_Maleth_ToTheCity_08_06"); //Chocia¿ to raczej nie zadzia³a, nie wygl¹dasz na ch³opa.
		B_LogEntry (TOPIC_City,"Oczywiœcie, powinienem wygl¹daæ jak farmer.");
		
	};
	
	AI_Output (other, self, "DIA_Maleth_ToTheCity_15_07"); //Rozumiem.
};
	
	
	

///////////////////////////////////////////////////////////////////////
//	Bessere Ausrüstung
///////////////////////////////////////////////////////////////////////
instance DIA_Maleth_Equipment		(C_INFO)
{
	npc			= BAU_954_Maleth;
	nr          = 3;
	condition	= DIA_Maleth_Equipment_Condition;
	information	= DIA_Maleth_Equipment_Info;
	permanent   = FALSE;
	description	= "Potrzebujê lepszego wyposa¿enia!";
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
	AI_Output (other, self, "DIA_Maleth_Equipment_15_00"); //Potrzebujê lepszego wyposa¿enia!
	AI_Output (self, other, "DIA_Maleth_Equipment_08_01"); //Mogê ci powiedzieæ od razu, ¿e nie mamy nic do oddania.
	if (!Npc_IsDead(Lobart))
	{
		AI_Output (self, other, "DIA_Maleth_Equipment_08_02"); //Jeœli ciê na to staæ, mo¿esz coœ kupiæ od Lobarta.
		AI_Output (self, other, "DIA_Maleth_Equipment_08_03"); //Mo¿esz te¿ zapytaæ go, czy znajdzie dla ciebie jak¹œ pracê.
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
	description	= "Gdzie znajdê Lobarta?";
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
	AI_Output (other, self, "DIA_Maleth_LOBART_15_00"); //Gdzie znajdê Lobarta?
	AI_Output (self, other, "DIA_Maleth_LOBART_08_01"); //Jest gdzieœ na farmie, to chyba oczywiste! W koñcu to jego w³asnoœæ!
	AI_Output (self, other, "DIA_Maleth_LOBART_08_02"); //Tylko nie próbuj z nim zadzieraæ! Niejednego ju¿ pobi³ i wyrzuci³ ze swojego podwórka.
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

	description	 = 	"Czy w ci¹gu kilku ostatnich dni wydarzy³o siê coœ nowego?";
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
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_15_00"); //Czy w ci¹gu kilku ostatnich dni wydarzy³o siê coœ nowego?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_01"); //Po prostu idŸ œcie¿k¹ do miasta.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_08_02"); //Jeœli natkniesz siê na faceta w czarnej szacie, dowiesz siê, co siê wydarzy³o.
	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Jak twoje owce?", DIA_Maleth_PROBLEME_schafe );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Czy mê¿czyŸni w czarnych szatach ju¿ tu byli?", DIA_Maleth_PROBLEME_beidir );
	
};
func void DIA_Maleth_PROBLEME_beidir ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_beidir_15_00"); //Czy mê¿czyŸni w czarnych szatach ju¿ tu byli?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_beidir_08_01"); //Tak. Kr¹¿¹ dooko³a nas od paru dni. Moim zdaniem, przyszli tutaj prosto z piek³a.

};

func void DIA_Maleth_PROBLEME_schafe ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_15_00"); //Jak twoje owce?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_08_01"); //Tak jakby faktycznie ciê to interesowa³o! Masz chyba inne zmartwienia.
	Info_AddChoice	(DIA_Maleth_PROBLEME, "A co ty mo¿esz wiedzieæ o moich zmartwieniach?", DIA_Maleth_PROBLEME_schafe_probleme );

};
func void DIA_Maleth_PROBLEME_schafe_probleme ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_15_00"); //A co ty mo¿esz wiedzieæ o moich zmartwieniach?
	
	
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_01"); //Jesteœ cz³onkiem stra¿y miejskiej czy nie? Jeœli tak, to z pewnoœci¹ wiesz coœ na temat tych odzianych na czarno facetów.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_02"); //Wy najemnicy myœlicie tylko o jednym: 'Jak mogê wy³udziæ od innych ich ciê¿ko zarobione pieni¹dze?'
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_08_03"); //Wy, dostojni magowie z klasztoru, chyba powinniœcie wiedzieæ coœ na temat pewnych zakapturzonych postaci.
		};

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
	Info_AddChoice	(DIA_Maleth_PROBLEME, DIALOG_BACK, DIA_Maleth_PROBLEME_Back );
	Info_AddChoice	(DIA_Maleth_PROBLEME, "Uwa¿aj, co mówisz, kolego.", DIA_Maleth_PROBLEME_schafe_probleme_drohen );

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			Info_AddChoice	(DIA_Maleth_PROBLEME, "W czym problem?", DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag );
		};
};

func void DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00"); //O co ci chodzi?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01"); //Wszystko przez to wstrêtne wiñsko, którym Vino tak strasznie mnie spi³ kilka tygodni temu.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02"); //Nie wiem, jak to siê sta³o, ale zgubi³em wtedy moj¹ laskê.
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03"); //I o to tyle zamieszania?
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04"); //£atwo ci mówiæ, nie nale¿a³a do ciebie.
	
	Log_CreateTopic (TOPIC_MalethsGehstock, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock, LOG_RUNNING);
	B_LogEntry (TOPIC_MalethsGehstock,"Maleth zgubi³ swoj¹ laskê. By³ wtedy zupe³nie pijany, wiêc nie podejrzewam, ¿eby siê zbytnio oddali³ od farmy Lobarta. Zguba na pewno le¿y gdzieœ w pobli¿u."); 

	Info_ClearChoices	(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEME_schafe_probleme_drohen ()
{
	AI_Output			(other, self, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00"); //Uwa¿aj, co mówisz, kolego.
	AI_Output			(self, other, "DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01"); //Potrafisz tylko gadaæ. Najlepiej bêdzie, jeœli w ogóle sobie st¹d pójdziesz.
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

	description	 = 	"Wydaje mi siê, ¿e ta laska nale¿y do ciebie.";
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
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_00"); //Wydaje mi siê, ¿e ta laska nale¿y do ciebie.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_01"); //Niesamowite. Ja...
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_02"); //Chwileczkê. Najpierw zap³ata.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_03"); //Ale... Ja nie mam pieniêdzy.
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_15_04"); //Pomyœl o jakiejœ innej formie wynagrodzenia.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_05"); //Dobrze. Co powiesz na to? Wczoraj widzia³em tutaj kilku bandytów, uciekaj¹cych ze skradzionym z³otem.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_08_06"); //Jeœli powiem ci, gdzie ukryli swój ³up, czy dostanê z powrotem swoj¹ laskê?
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP (XP_FoundMalethsGehstock);

	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "Przykro mi, nie interesuje mnie to. Chcê twojego z³ota.", DIA_Maleth_GEHSTOCK_gold );
	Info_AddChoice	(DIA_Maleth_GEHSTOCK, "W porz¹dku.", DIA_Maleth_GEHSTOCK_ok );
};
func void DIA_Maleth_GEHSTOCK_ok ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_ok_15_00"); //Zgoda.
	B_GiveInvItems 		(other, self, ItMw_MalethsGehstock_MIS,1);
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_01"); //W porz¹dku, s³uchaj uwa¿nie. Najpierw udaj siê na zachód, a¿ dojdziesz do tamtych drzew. Zobaczysz g³êboki jar.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_ok_08_02"); //Jest tam jaskinia, a w niej powinno byæ ukryte coœ ciekawego.

	B_LogEntry (TOPIC_MalethsGehstock,"Maleth powiedzia³ mi, ¿e w lesie na zachód od farmy Lobarta znajduje siê du¿y obóz bandytów."); 
	CreateInvItems 		(BDT_1024_MalethsBandit, ItMi_MalethsBanditGold,1);
	Info_ClearChoices	(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos (self);
};

func void DIA_Maleth_GEHSTOCK_gold ()
{
	AI_Output			(other, self, "DIA_Maleth_GEHSTOCK_gold_15_00"); //Przykro mi, nie interesuje mnie to. Chcê twojego z³ota.
	AI_Output			(self, other, "DIA_Maleth_GEHSTOCK_gold_08_01"); //To wszystko, co mam. Bêdzie musia³o ci wystarczyæ.
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

	description	 = 	"Nie przepracowuj siê.";
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
	AI_Output			(other, self, "DIA_Maleth_PERM3_15_00"); //Nie przepracowuj siê.
	AI_Output			(self, other, "DIA_Maleth_PERM3_08_01"); //Zje¿d¿aj st¹d.
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






































































