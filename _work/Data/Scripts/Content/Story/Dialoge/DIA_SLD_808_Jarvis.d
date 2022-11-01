// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Jarvis_EXIT(C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************
instance DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_Hello_Info()
{	
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //Hej! Neznám tě odněkud?
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //To je možný. Taky jsem byl v kolonii.
	AI_Output (self, other, "DIA_Jarvis_Hello_04_02"); //Správně... co chceš?
};
	
// ************************************************************
// 			  					DieLage 
// ************************************************************
instance DIA_Jarvis_DieLage (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_DieLage_Condition;
	information	= DIA_Jarvis_DieLage_Info;
	permanent	= FALSE;
	description = "Jak se vede?";
};                       

FUNC INT DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jarvis_DieLage_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //Jak to vypadá?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //Právě teď máme skutečný problém. Mezi žoldáky se vytváří dvě frakce.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //Sylvio a jeho lidé pochybují, že Lee se drží správného záměru.
};
	
// ************************************************************
// 			  					TwoFronts 
// ************************************************************
instance DIA_Jarvis_TwoFronts (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_TwoFronts_Condition;
	information	= DIA_Jarvis_TwoFronts_Info;
	permanent	= FALSE;
	description = "Jak to, že jsou tu dvě frakce?";
};                       

FUNC INT DIA_Jarvis_TwoFronts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_TwoFronts_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //Jak to, že jsou tu dvě frakce?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //Většina z nás se vrátila z kolonie s Leem.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //Ale někteří ze žoldáků se k nám připojili později.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //Nepřišli z kolonie, ale bojovali daleko na jihu se skřety.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //Nějak se dozvěděli, že Lee potřeboval lidi. Jejich vůdcem byl Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //On souhlasil s tím, že Lee zůstane velitelem, ale teď se snaží poštvat ostatní žoldáky proti němu a jeho záměrům.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //Hodně Leeových lidí si nemyslí, že je to velkej problém. Ale já ty týpky, jako je Sylvio, znám.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //Aby dosáhl svého, bude to klidně hnát na ostří nože.
};
	
// ************************************************************
// 			  					LeesPlan 
// ************************************************************
instance DIA_Jarvis_LeesPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_LeesPlan_Condition;
	information	= DIA_Jarvis_LeesPlan_Info;
	permanent	= FALSE;
	description = "Víš, jaké jsou Leeovy záměry?";
};                       

FUNC INT DIA_Jarvis_LeesPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_LeesPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_LeesPlan_15_00"); //Víš, co chce Lee dělat?
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //Lee chce, abychom počkali a nechali paladiny ve městě vyhladovět.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //Chce nás všechny dostat z ostrova. A Innos ví, že nemám nic proti tomu odsud vypadnout.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //Skutečně nevím, co přesně má za lubem, ale já mu věřím. Vedl nás doteďka dobře.
};

// ************************************************************
// 			  				SylviosPlan 
// ************************************************************
instance DIA_Jarvis_SylviosPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_SylviosPlan_Condition;
	information	= DIA_Jarvis_SylviosPlan_Info;
	permanent	= FALSE;
	description = "Víš, co má Sylvio v plánu?";
};                       

FUNC INT DIA_Jarvis_SylviosPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosPlan_15_00"); //Víš, co má Sylvio v plánu?
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //Sylvio zjistil, že někteří z paladinů se přesunuli do staré kolonie.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //Říká, že zbytek paladinů by se nás tady neodvážil napadnout, a chce z toho vytěžit co nejvíc.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //Drancování malých farem, přepadávání vojenských hlídek mimo města, olupování poutníků, prostě takovéhle věci.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //Ale Lee si myslí, že by to byla ta nejhorší věc, jakou bychom v naší situaci mohli udělat.
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Jarvis_WannaJoin (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 6;
	condition	= DIA_Jarvis_WannaJoin_Condition;
	information	= DIA_Jarvis_WannaJoin_Info;
	permanent	= FALSE;
	description = "Chtěl bych se stát žoldákem!";
};                       

FUNC INT DIA_Jarvis_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //Chtěl bych se stát žoldákem!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //Nejsem si jistej, že je to dobrej nápad.
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //Kde je problém?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //No, buď budu hlasovat pro, nebo proti.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //A v situaci, ve které jsme, bych pro tebe určitě hlasoval, kdybych si byl jistej, že jsi na Leeho straně!
};

// ************************************************************
// 			  				Mission KO
// ************************************************************
instance DIA_Jarvis_MissionKO (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 7;
	condition	= DIA_Jarvis_MissionKO_Condition;
	information	= DIA_Jarvis_MissionKO_Info;
	permanent	= FALSE;
	description = "Takže co bych měl dělat?";
};                       

FUNC INT DIA_Jarvis_MissionKO_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Jarvis_WannaJoin))
	&& (Npc_KnowsInfo (other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_MissionKO_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //Takže co bych měl dělat?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //To je jednoduché. Zmlať pár Sylviových hochů! Tímhle způsobem budou obě strany přesně vědět, kde stojíš.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //A pokud se budeš při souboji držet pravidel, dokonce získáš respekt ostatních.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"Jarvis mi dá svůj hlas, pokud se mi podaří porazit Sylviovy hochy.");
};

// ************************************************************
// 			  				DuellRegeln
// ************************************************************
instance DIA_Jarvis_DuellRegeln (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_DuellRegeln_Condition;
	information	= DIA_Jarvis_DuellRegeln_Info;
	permanent	= FALSE;
	description = "Jaká jsou pravidla pro souboj?";
};                       

FUNC INT DIA_Jarvis_DuellRegeln_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_DuellRegeln_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //Jaká jsou pravidla pro souboj?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //Běž za Torlofem a nech si to vysvětlit, pokud tě to zajímá.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //Takže už si rozumíme: Nezajímá mě, jestli dodržuješ pravidla nebo ne. Prostě ať ti chlapi leží držkou v bahně!
	
	B_LogEntry (TOPIC_JarvisSLDKo,"A já se žádnými soubojovými pravidly řídit nemusím...");
};

// ************************************************************
// 			  				SylviosMen
// ************************************************************
instance DIA_Jarvis_SylviosMen (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_SylviosMen_Condition;
	information	= DIA_Jarvis_SylviosMen_Info;
	permanent	= FALSE;
	description = "Kteří z žoldáků jsou Sylviovi muži?";
};                       

FUNC INT DIA_Jarvis_SylviosMen_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosMen_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //Kteří ze žoldáků jsou Sylviovi muži?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //Je to šest chlapů. První je Sylvio sám a jeho pravá ruka Bullco.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //A pak jsou tu Rod, Sentenza, Fester a Raoul.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //Zbytek chlapů je buď neutrálních, nebo na Leeově straně.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"K Sylviovým chlapům patří jeho velitel Bullco, Rod, Sentenza, Fester a Raoul.");
};

// ************************************************************
// 			  				HowMany
// ************************************************************
instance DIA_Jarvis_HowMany (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowMany_Condition;
	information	= DIA_Jarvis_HowMany_Info;
	permanent	= FALSE;
	description = "Kolik Sylviových lidí bych měl přemoci?";
};                       

FUNC INT DIA_Jarvis_HowMany_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowMany_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //Kolik Sylviových chlapů mám porazit?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //Pokud srazíš tři z nich k zemi, pak nám dokážeš, na které jsi straně.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //Koho z nich si vybereš, to je tvoje věc.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //Alespoň jedna malá rada: Tohle není o tom dokázat si kuráž. Nechoď přímo proti Sylviovi samotnému - nadělal by z tebe sekanou.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Postačí, když porazím tři Sylviovy kumpány - se Sylviem samotným bych se do křížku radši pouštět neměl.");
};

// ************************************************************
// 			  				HowManyLeft
// ************************************************************
instance DIA_Jarvis_HowManyLeft (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowManyLeft_Condition;
	information	= DIA_Jarvis_HowManyLeft_Info;
	permanent	= TRUE;
	description = "Kolik Sylviových mužů je ještě stále na mém seznamu?";
};                       

FUNC INT DIA_Jarvis_HowManyLeft_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowManyLeft_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //Kolik Sylviových mužů mám ještě na seznamu?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //Porazil jsem Bullca.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //Slyšel jsem. To nebylo zlý.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //Rod vypadá trochu unaveně.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //Sentenza se pokusil ze mě dostat nějakou zlatku - to nebylo chytrý.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_05"); //Sundal jsem Sentenzu.
		};

		victories = victories + 1;
	};

	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //Fester se mě pokusil oblafnout - to byla velká chyba.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //Fester dostal, co si zasloužil.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //A to samé Raoul...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //Byl jsem se na Raoula podívat...
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //A?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //Potřeboval pořádnou nakládačku.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //Doteď jsi nesložil jedinýho Sylviova chlapa.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //Dobře - jen pokračuj.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //Očekávám od tebe, že zřídíš alespoň tři z nich.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //To stačí, to stačí.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //Ty jsi skutečně napráskal každýmu z nich, jo?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //Udělal jsi na mě dojem - až se mě Lee zeptá, budu bez váhání hlasovat pro tebe.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"Když se budu chtít připojit k žoldákům, Jarvis bude pro.");
	};
};


// ###############################
// ##							##
// 			Höhere Gilden
// ##							##
// ###############################


// ************************************************************
// 			  				HowMany
// ************************************************************
var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= FALSE;
	description = "Co je nového?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //Co je nového?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //Teď jsi jeden z nás. To je dobře.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //Vybral sis špatně, mohl ses stát jedním z nás.
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //Poslední dobou Sylviovi lidé dost zkrotli. (divoký smích)
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //Sylvio je konečně pryč. Po tom, co se doslechl o dracích, se on a pár jeho chlapů vydali do těžařské kolonie.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //Pravděpodobně si myslí, že by tam mohlo být něco víc.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //Nic, teď už je všechno v klidu. Nemůžu se dočkat toho, až uvidím, jak tohle všechno dopadne.
		};
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jarvis_PICKPOCKET (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 900;
	condition	= DIA_Jarvis_PICKPOCKET_Condition;
	information	= DIA_Jarvis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jarvis_PICKPOCKET_Condition()
{
	C_Beklauen (41, 55);
};
 
FUNC VOID DIA_Jarvis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_BACK 		,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};
	
func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};





		





