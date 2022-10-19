///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jora_EXIT   (C_INFO)
{
	npc         = VLK_408_Jora;
	nr          = 999;
	condition   = DIA_Jora_EXIT_Condition;
	information = DIA_Jora_EXIT_Info;
	permanent   = TRUE;
	description = "MusÌm jÌt!";
};

FUNC INT DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jora_EXIT_Info()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Jora_EXIT_08_00"); //Hej! A co moje prachy?
	};
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_Sperre		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_Sperre_Condition;
	information	 = 	DIA_Jora_Sperre_Info;
	permanent	 =  TRUE;
	important	 = 	TRUE;
};
func int DIA_Jora_Sperre_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&& (Npc_IsInState (self,ZS_Talk ))
	{
		return TRUE;
	};
};
func void DIA_Jora_Sperre_Info ()
{
	AI_Output (self, other, "DIA_Jora_Sperre_08_00"); //Jsi b˝val˝ trestanec z d˘lnÌ kolonie, nic ti neprod·m!
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_WAREZ		(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	700;
	condition	 = 	DIA_Jora_WAREZ_Condition;
	information	 = 	DIA_Jora_WAREZ_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Ukaû mi svÈ zboûÌ.";
};
func int DIA_Jora_WAREZ_Condition ()
{
	return TRUE;
};
func void DIA_Jora_WAREZ_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Jora_WAREZ_15_00"); //Ukaû mi svÈ zboûÌ.
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_GREET		(C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 1;
	condition	= DIA_Jora_GREET_Condition;
	information	= DIA_Jora_GREET_Info;
	permanent 	= FALSE;
	important	= TRUE;
};
func int DIA_Jora_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Canthar_Sperre == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GREET_Info ()
{
	AI_Output (self, other, "DIA_Jora_GREET_08_00"); //Innos tÏ prov·zej, cizinËe. Jestli si chceö po¯Ìdit dobrou cestovatelskou v˝bavu, pak jsi na tom spr·vnÈm mÌstÏ.
	AI_Output (self, other, "DIA_Jora_GREET_08_01"); //Ale varuji tÏ: jestli m·ö v pl·nu si invent·¯ vylepöit nÏjak pokoutnÏ bez placenÌ, zavol·m str·ûe!
	AI_Output (other, self, "DIA_Jora_GREET_15_02"); //PoËkej, copak vypad·m jako nÏjak˝ chmat·k?
	AI_Output (self, other, "DIA_Jora_GREET_08_03"); //(pohrdavÏ) Pche! Dneska bys nebyl prvnÌ, kdo by se mi snaûil nÏco Ëmajznout.

	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Jora prod·v· na trûiöti vöechny moûnÈ zbranÏ.");
};

// *******************************************************
// 					Du bestohlen?
// *******************************************************
instance DIA_Jora_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Bestohlen_Condition;
	information	 = 	DIA_Jora_Bestohlen_Info;
	permanent	 = 	FALSE;
	description	 = 	"NÏkdo tÏ okradl?";
};
func int DIA_Jora_Bestohlen_Condition ()
{
	return TRUE;
};
func void DIA_Jora_Bestohlen_Info ()
{
	AI_Output (other, self, "DIA_Jora_Bestohlen_15_00"); //NÏkdo tÏ okradl?
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_01"); //Nem˘ûu to dok·zat, ten manÌk byl zatracenÏ chytr˝. P¯edstavil se jako Rengaru - pokud to tedy je jeho skuteËnÈ jmÈno.
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_02"); //PoslednÌch p·r dnÌ jen tak zevloval na trûiöti.
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Bestohlen_08_03"); //A kaûd˝ veËer se p¯Ìmo na ulici nalÌv· pivem. VsadÌm boty, ûe ten ömejd chlast· za MOJE penÌze!
	};
	AI_Output (self, other, "DIA_Jora_Bestohlen_08_04"); //Jen jsem se na chvilku podÌval jinam a uû jsem byl bez portmonky!
};


// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output (self ,other,"DIA_Jora_Add_08_04"); //Poslyö - jestli se ti povede z toho Rengaru vyt¯Ìskat moje prachy, povÌm ti vöechno, co vÌm.
};


// *******************************************************
// 					Ich hol dir dein Gold
// *******************************************************
instance DIA_Jora_HolDeinGold	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_HolDeinGold_Condition;
	information	 = 	DIA_Jora_HolDeinGold_Info;
	permanent	 = 	FALSE;
	description	 = 	"Mohl bych se pokusit zÌskat zp·tky tvoje penÌze.";
};
func int DIA_Jora_HolDeinGold_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};
func void DIA_Jora_HolDeinGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_15_00"); //Mohl bych se pokusit zÌskat zp·tky tvoje penÌze.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_01"); //(ned˘vÏ¯ivÏ) Fakt? A jak to chceö udÏlat?

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice 		(DIA_Jora_HolDeinGold,"Ale za odmÏnu chci Ë·st zlata!",DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"R·d bych se dozvÏdÏl, jak se dostat do cechu zlodÏj˘.", DIA_Jora_HolDeinGold_GHDG);
	};
	if (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		Info_AddChoice (DIA_Jora_HolDeinGold,"P¯ijde na to - m˘ûu se s tvou pomocÌ dostat do hornÌ Ëtvrti?", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output (other, self,"DIA_Jora_Add_15_00"); //P¯ijde na to - m˘ûu se s tvou pomocÌ dostat do hornÌ Ëtvrti?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_08_03"); //(smÏje se) To jsi na öpatnÈ adrese, j· v˘bec nejsem z mÏsta - jako vÏtöina kupc˘ na trûiöti.
	AI_Output (self ,other,"DIA_Jora_Add_08_01"); //Jestli se chceö dostat do hornÌ Ëtvrti, promluv si v dolnÌ Ë·sti mÏsta s nÏkter˝mi mÌstnÌmi obchodnÌky.
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output (other, self,"DIA_Jora_Add_15_02"); //R·d bych se dozvÏdÏl, jak se dostat do cechu zlodÏj˘.
	AI_Output (self ,other,"DIA_Jora_Add_08_03"); //Moûn· ûe ti m˘ûu pomoct.
	B_Jora_GoldForClue();

	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"UvidÌm, co se d· dÏlat.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Kolik penÏz to bylo?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"ProË jsi nezavolal str·ûe?",DIA_Jora_HolDeinGold_Wache);	
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //Ale za odmÏnu chci Ë·st zlata!
	AI_Output (self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //Nejd¯Ìv se postarej o to, aby mi vr·tili portmonku, a teprve PAK si promluvÌme o odmÏnÏ!
	Info_ClearChoices (DIA_Jora_HolDeinGold);
	Info_AddChoice (DIA_Jora_HolDeinGold,"UvidÌm, co se d· dÏlat.",	DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice (DIA_Jora_HolDeinGold,"Kolik penÏz to bylo?",			DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice (DIA_Jora_HolDeinGold,"ProË jsi nezavolal str·ûe?",DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //ProË jsi nezavolal str·ûe?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //Str·ûe jsou nÏco platnÈ, pouze pokud zlodÏje p¯istihneö p¯i Ëinu.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //A kdyû jsem zjistil, ûe jsem bez portmonky, ten parchant uû byl d·vno v prachu!
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //Kolik penÏz to bylo?
	AI_Output (self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50 zlaù·k˘ - v tÈhle mizernÈ dobÏ je to vÌc neû dost.
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //UvidÌm, co se d· dÏlat.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //Dej si pozor. Jestli toho lotra jen tak zml·tÌö, vloûÌ se do toho str·ûe.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //PoslednÌ dobou je to tu pÏknÏ drsnÈ. Od chvÌle, co do mÏsta p¯ibyli paladinovÈ, str·ûe kaûdÈho rv·Ëe bez milosti sejmou.
	AI_Output (self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //Budeö si muset nÏco vymyslet.
	AI_Output (other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //JasnÏ.
		
	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;
	
	Log_CreateTopic (Topic_JoraDieb,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JoraDieb,LOG_RUNNING);
	Log_CreateTopic (TOPIC_Jora,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Jora,LOG_RUNNING);
	
	B_LogEntry (TOPIC_Jora, "ObchodnÌka Jora okradl chlapÌk jmÈnem Rengaru, kter˝ se p¯es den potuluje po trûiöti.");
	B_LogEntry (TOPIC_Jora, "MusÌm Jorovi vr·tit ukradenÈ zlato.");
	B_LogEntry (TOPIC_JoraDieb, "ObchodnÌka Jora okradl chlapÌk jmÈnem Rengaru - jestli ho chytÌm, moûn· z toho bude koukat i nÏjak· odmÏna.");

	Info_ClearChoices 	(DIA_Jora_HolDeinGold);
};

// *******************************************************
// 					Wegen Dieb...
// *******************************************************
instance DIA_Jora_WegenDieb	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_WegenDieb_Condition;
	information	 = 	DIA_Jora_WegenDieb_Info;
	permanent	 = 	TRUE;
	description	 = 	"K tomu zlodÏji...";
};
func int DIA_Jora_WegenDieb_Condition ()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_WegenDieb_Info ()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_15_00"); //K tomu zlodÏji...
	AI_Output (self, other, "DIA_Jora_WegenDieb_08_01"); //Tak jak to vypad·? Chytils ho, a co je d˘leûitÏjöÌ, m·ö to moje zlato?
	
	Info_ClearChoices (DIA_Jora_WegenDieb);
	
	if (Npc_IsDead (Rengaru))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"No, stala se mu takov· tragick· nehoda...",DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{	
		Info_AddChoice (DIA_Jora_WegenDieb,"Uû jsem ho dostal. Je to v klidu.",DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo (other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice (DIA_Jora_WegenDieb,"Utekl mi.",DIA_Jora_WegenDieb_Entkommen);
	};
	
	Info_AddChoice (DIA_Jora_WegenDieb,"JeötÏ st·le na tom pracuji.",DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //JeötÏ st·le na tom pracuji.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //Tak koukej, aù uû to zlato m·m zp·tky!
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //Utekl mi.
	AI_Output (self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //A co moje zlato? To se taky ztratilo s nÌm?
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);

};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //Ano, chytil jsem ho. TeÔ bude chvÌli bruËet v base.
	AI_Output (self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //A co moje zlato?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output (other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //No, stala se mu takov· tragick· nehoda...
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //AspoÚ uû nikomu nic neukradne. Innosova spravedlnost zvÌtÏzila!
	AI_Output (self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //Kde je moje zlato?
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices (DIA_Jora_WegenDieb);
};


// *******************************************************
// 					Gold zur¸ckbringen
// *******************************************************
instance DIA_Jora_BringGold (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BringGold_Condition;
	information	 = 	DIA_Jora_BringGold_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tady je tÏch 50 zlaù·k˘, co ti ukradl.";
};

func int DIA_Jora_BringGold_Condition ()
{
	if ( (Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS) )
	&& (Jora_Gold == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_BringGold_Info ()
{
	AI_Output (other, self, "DIA_Jora_BringGold_15_00"); //Tady je tÏch 50 zlaù·k˘, co ti ukradl.
	
	if (B_GiveInvItems (other, self, itmi_gold, 50))
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_01"); //Innos buÔ pochv·len! Tak p¯ece je tady ve mÏstÏ jeötÏ nÏjak· spravedlnost!
	
		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output (self, other,"DIA_Jora_BringGold_08_03"); //Hej, tohle nenÌ 50 zlaù·k˘! SnaûÌö se mÏ taky oökubat, nebo co?
	};
};

// *******************************************************
// 					GHDG Info
// *******************************************************

var int Jora_GhdgHinweis;
// ----------------------

instance DIA_Jora_GHDgInfo (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_GHDgInfo_Condition;
	information	 = 	DIA_Jora_GHDgInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co vÌö o cechu zlodÏj˘?";
};

func int DIA_Jora_GHDgInfo_Condition ()
{
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jora_Bestohlen))
	&& (Jora_GhdgHinweis == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jora_GHDgInfo_Info ()
{
	AI_Output (other, self,"DIA_Jora_Add_15_05"); //Co vÌö o cechu zlodÏj˘?
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_06"); //No dob¯e, tak poslouchej- ale jako bych ti nic ne¯ekl, kapiöto?
		AI_Output (self ,other,"DIA_Jora_Add_08_07"); //Do krËmy v docÌch chodÌ p·r podez¯el˝ch t˝pk˘.
		AI_Output (self ,other,"DIA_Jora_Add_08_08"); //VsadÌm se, ûe i s·m krËm·¯ jich nÏkolik zn·.
		AI_Output (self ,other,"DIA_Jora_Add_08_09"); //Jestli chceö vystopovat zlodÏje, zkus si promluvit pr·vÏ s NÕM.
		AI_Output (self ,other,"DIA_Jora_Add_08_10"); //M˘ûeö t¯eba p¯edstÌrat, ûe ses zapletl do nÏËeho nekalÈho. Na to by mohl naletÏt.
		AI_Output (self ,other,"DIA_Jora_Add_08_11"); //Ale mÏj p¯itom oËi otev¯enÈ - s tÏmi lidmi si nenÌ radno zahr·vat.
		
		Jora_GhdgHinweis = TRUE;
	};
};

// *******************************************************
// 						Belohnung
// *******************************************************
instance DIA_Jora_Belohnung (C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_Belohnung_Condition;
	information	 = 	DIA_Jora_Belohnung_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ale za odmÏnu chci Ë·st zlata!";
};

func int DIA_Jora_Belohnung_Condition ()
{
	if (Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Jora_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Jora_Belohnung_15_00"); //Ale za odmÏnu chci Ë·st zlata!
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output (self ,other,"DIA_Jora_Add_08_12"); //Ale j· uû jsem ti dal cennou radu.
		AI_Output (self ,other,"DIA_Jora_Add_08_13"); //Tohle by jako odmÏna mÏlo staËit.
	};
	AI_Output (self ,other,"DIA_Jora_Add_08_14"); //Jestli chceö zlato, tak vyp·trej zlodÏje a pak si u lorda Andre vyzvedni odmÏnu.
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output (self, other, "DIA_Jora_Belohnung_08_03"); //TeÔ se musÌm zase vÏnovat z·kaznÌk˘m.
	};
	AI_StopProcessInfos (self); 
};

// *****************************************************
// 				Nach Alriks Schwert fragen
// *****************************************************
instance DIA_Jora_AlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	1;
	condition	 = 	DIA_Jora_AlriksSchwert_Condition;
	information	 = 	DIA_Jora_AlriksSchwert_Info;
	permanent	 = 	FALSE;
	description	 = 	"Alrik tvrdÌ, ûe m·ö jeho meË.";
};
func int DIA_Jora_AlriksSchwert_Condition ()
{
	if (MIS_Alrik_Sword == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Jora_AlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_00"); //Alrik tvrdÌ, ûe m·ö jeho meË.
	AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_01"); //MyslÌö toho otrhance, co mi prodal svou zbraÚ za p·r pochodnÌ a kousk˘ masa?
	AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_02"); //Jo, to je on.
	
	if (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_03"); //Jeho meË po¯·d jeötÏ m·m.
		AI_Output (other, self, "DIA_Jora_AlriksSchwert_15_04"); //A kolik za nÏj budeö chtÌt?
		if (Jora_Gold == LOG_SUCCESS) 
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_05"); //No, ûe jsi to ty...
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_06"); //¡le, vÌö co? Vem si ho zadarmo. Kdyû uû nic jinÈho, vr·tils mi moje penÌze.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_07"); //No, ûe jsi to ty - 50 zlaù·k˘.
		};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_AlriksSchwert_08_08"); //(mrzutÏ) J· uû ho ale nem·m! »ert vÌ, kam se podÏl.
	};
};


// *****************************************************
// 				Alriks Schwert KAUFEN
// *****************************************************
instance DIA_Jora_BUYAlriksSchwert	(C_INFO)
{
	npc			 = 	VLK_408_Jora;
	nr			 = 	2;
	condition	 = 	DIA_Jora_BUYAlriksSchwert_Condition;
	information	 = 	DIA_Jora_BUYAlriksSchwert_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tady je 50 zlaù·k˘, a teÔ mi dej Alrik˘v meË.";
};
func int DIA_Jora_BUYAlriksSchwert_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jora_AlriksSchwert))
	&& (Npc_HasItems (self, ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};
func void DIA_Jora_BUYAlriksSchwert_Info ()
{
	AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //Tady je 50 zlaù·k˘, a teÔ mi dej Alrik˘v meË.

	if (B_GiveInvItems(other,self,itmi_gold,50))
	{
		//if (Jora_Gold == LOG_RUNNING)
		//{
			//AI_Output (other, self, "DIA_Jora_BUYAlriksSchwert_15_02"); //Moment, ich wollte das Schwert kaufen...
			//AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_03"); //Das kannst du doch immer noch tun - f¸r 50 Goldst¸cke ist es deins...
			//Jora_Gold = LOG_SUCCESS;
		//}
		//else
		//{
			AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //Tum·ö - (vychytrale) byl to dobr˝ obchod.
			B_GiveInvItems (self, other, ItMw_AlriksSword_Mis, 1);
		//};
	}
	else
	{
		AI_Output (self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //Nem·ö sice dost zlata, ale to nevadÌ - nÏjak˝ Ëas ti tu ten meË odloûÌm. Takûe se m˘ûeö vr·tit pozdÏji.
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jora_PICKPOCKET (C_INFO)
{
	npc			= VLK_408_Jora;
	nr			= 900;
	condition	= DIA_Jora_PICKPOCKET_Condition;
	information	= DIA_Jora_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Jora_PICKPOCKET_Condition()
{
	C_Beklauen (31, 45);
};
 
FUNC VOID DIA_Jora_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jora_PICKPOCKET);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_BACK 		,DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jora_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};
	
func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jora_PICKPOCKET);
};









