// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Pepe_EXIT   (C_INFO)
{
	npc         = BAU_912_Pepe;
	nr          = 999;
	condition   = DIA_Pepe_EXIT_Condition;
	information = DIA_Pepe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Pepe_Hallo (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 1;
	condition	= DIA_Pepe_Hallo_Condition;
	information	= DIA_Pepe_Hallo_Info;
	permanent	= FALSE;
	description	= "Co tady dÏl·ö?";
};
func int DIA_Pepe_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Pepe_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Hallo_15_00"); //Co tady dÏl·ö?
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //(otr·venÏ) HlÌd·m ovce! (vzdych·) A pokud je to moûnÈ, vyh˝b·m se problÈm˘m.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //Moc to nefunguje, co?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //Pff, zvl·öù s tÏmi ûold·ky. Jsem opravdu r·d, ûe m˘ûu b˝t tady na pastvinÏ. I kdyû to m˘ûe b˝t nebezpeËnÈ tak jako tak.
	};
};

// ************************************************************
// 								Danger
// ************************************************************
instance DIA_Pepe_Danger (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 2;
	condition	= DIA_Pepe_Danger_Condition;
	information	= DIA_Pepe_Danger_Info;
	permanent 	= FALSE;
	description	= "Co je na pastvinÏ tak nebezpeËnÈho?";
};
func int DIA_Pepe_Danger_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};
func void DIA_Pepe_Danger_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //Co je tak nebezpeËnÈho na pastvinÏ?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //Po okolÌ se tu potuluje smeËka vlk˘. PoslednÌ dobou sem ty zatracen˝ bestie p¯ich·zej seûrat nÏkterou z mejch ovcÌ skoro kaûdej den.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //JeötÏ p¯ed p·r dny jsem mÏl dvakr·t tolik ovcÌ. Nechci ani pomyslet na to, co se mnou Onar udÏl·, aû na to p¯ijde.
};

// ************************************************************
// 								WhyNotSLD
// ************************************************************
instance DIA_Pepe_WhyNotSLD	(C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 3;
	condition	= DIA_Pepe_WhyNotSLD_Condition;
	information	= DIA_Pepe_WhyNotSLD_Info;
	PERMANENT 	= FALSE;
	description	= "ProË jsi o tÏch vlcÌch ne¯ekl ûold·k˘m? MÏl jsem dojem, ûe pro v·s pracujÌ.";
};
func int DIA_Pepe_WhyNotSLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	&& ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
func void DIA_Pepe_WhyNotSLD_Info ()
{
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //ProË jsi o tÏch vlcÌch ne¯ekl ûold·k˘m? MÏl jsem dojem, ûe pro v·s pracujÌ.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //Jo, j· vim. MÏl jsem to udÏlat. Ale nestalo se, sakra.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //A teÔ, kdyû je tolik ovcÌ pryË, m·m strach o tom nÏkomu cokoli ¯Ìct.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //Ale pr·vÏ jsi to ¯ekl MNÃ.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //(zlostnÏ) Uû toho taky lituju.
};

// ************************************************************
// 								KillWolves
// ************************************************************
instance DIA_Pepe_KillWolves (C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr			= 4;
	condition	= DIA_Pepe_KillWolves_Condition;
	information	= DIA_Pepe_KillWolves_Info;
	permanent 	= FALSE;
	description	= "Co kdyû ty vlky zabiju?";
};
func int DIA_Pepe_KillWolves_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	{
		return TRUE;
	};
};
func void DIA_Pepe_KillWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_00"); //Co kdyû ty vlky zabiju?
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //(posmÏönÏ) Ty? A s·m? Ha, ha. Tomu nevÏ¯Ìm. To bych d¯Ìv uvÏ¯il tomu, ûe to udÏl· m˘j chlebod·rce.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //ZapomeÚ na to. Byl to jen n·vrh. Zajdu za chlapama a uvidÌm, co tomu ¯eknou ONI.
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //(vydÏöenÏ) PoËkej chvilku. Fajn, fajn! Ehm... Jsi nejvÏtöÌ ze vöech nejvÏtöÌch a klidnÏ zvl·dneö sto vlk˘ najednou. é·dn˝ problÈm!
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //NejËastÏji se skr˝vajÌ mezi stromy poblÌû pastviny. (stranou) M·m dojem, ûe jsou jen Ëty¯i.
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"Pepeho ovce ohroûujÌ Ëty¯i vlci. MÏl bych je zahnat.");
};

// ************************************************************
// 								KilledWolves
// ************************************************************
instance DIA_Pepe_KilledWolves		(C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_KilledWolves_Condition;
	information	 = 	DIA_Pepe_KilledWolves_Info;
	permanent	 = 	TRUE;
	description	 = 	"OddÏlal jsem ty vlky.";
};
func int DIA_Pepe_KilledWolves_Condition ()
{
	if  (MIS_Pepe_KillWolves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Pepe_KilledWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //OddÏlal jsem ty vlky.

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //(uûasle) Dok·zals to! DÌky Innosovi!
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //Ale jeötÏ po¯·d nevÌm, jak ¯Ìct Onarovi, ûe p¯iöel o tolik ovcÌ.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //(pro sebe) Vöechno je to chyba toho zatracenÈho Bullca!

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //NedÏlej si ze mÏ bl·zny. Ty bestie jeötÏ nejsou vöechny mrtvÈ.
	};
};

// ************************************************************
// 					Was hast du ¸ber Bullco gesagt?
// ************************************************************
instance DIA_Pepe_Bullco (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_Bullco_Condition;
	information	 = 	DIA_Pepe_Bullco_Info;
	permanent	 = 	FALSE;
	description	 = 	"Cos to ¯Ìkal o tom Bullcovi?";
};
func int DIA_Pepe_Bullco_Condition ()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (!Npc_IsDead(Bullco))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Bullco_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Bullco_15_00"); //Cos to ¯Ìkal o tom Bullcovi?
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //Je to jeden ze ûold·k˘. Je to vlastnÏ jeho pr·ce, hlÌdat pastviny.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //Ale mÌsto toho se se sv˝m k·moöem Sylviem jen cel˝ dny poflakujou kolem Thekly v kuchyni.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //Je to chyba tÏch bastard˘, ûe kv˘li tÏm ovcÌm nedostanu tejdennÌ mzdu.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //Kdybych mu alespoÚ mohl za to d·t do zub˘. Ale proti nÏmu nikdo nem· û·dnou öanci. Ten chlap je zabij·k.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"Bullco se mÏl o Pepeho ovce lÌp starat. Pepe teÔ chce nÏkomu d·t po¯·dnÏ za vyuËenou.");
};

// ************************************************************
// 						Bullco geschlagen
// ************************************************************
instance DIA_Pepe_BullcoDefeated (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_BullcoDefeated_Condition;
	information	 = 	DIA_Pepe_BullcoDefeated_Info;
	permanent	 = 	FALSE;
	description	 = 	"Bullco dostal, co si zaslouûil.";
};
func int DIA_Pepe_BullcoDefeated_Condition ()
{
	if (MIS_Pepe_KickBullco == LOG_RUNNING)
	{
		if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	};
};
func void DIA_Pepe_BullcoDefeated_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BullcoDefeated_15_00"); //Bullco dostal, co si zaslouûil. Postaral jsem se o to.
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //Ta svinÏ si to zaslouûila.

	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP (XP_KickBullco);
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Pepe_PERM		(C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr		 	= 6;
	condition	= DIA_Pepe_PERM_Condition;
	information	= DIA_Pepe_PERM_Info;
	permanent	= TRUE;
	description	= "Jak se m·ö? A co tvoje ovce?";
};

func int DIA_Pepe_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info ()
{
	AI_Output (other, self, "DIA_Pepe_PERM_15_00"); //Jak se m·ö? A co tvoje ovce?

	if (kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //V pohodÏ. A stejnÏ tak ovce. Ty, co tu po¯·d jeötÏ jsou, se majÌ dob¯e.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //Fajn. Ale ty vlci se jednou vr·tÏj. A asi jich bude jeötÏ vÌc!
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //Slyöel jsem hodnÏ divn˝ vÏci. NÏjak˝ hrozivÏ vypadajÌcÌ postavy otravujÌ u Sekoba. ObklÌËily jeho d˘m.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //Slyöel jsem, ûe se na LobartovÏ farmÏ rozvalujÌ nÏjacÌ ûold·ci. NÏkdo by jim moûn· mÏl pomoct.
	};
};

// ************************************************************
// 			  					Liesel 
// ************************************************************
instance DIA_Pepe_Liesel		(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	7;
	condition	 = 	DIA_Pepe_Liesel_Condition;
	information	 = 	DIA_Pepe_Liesel_Info;
	permanent	 = 	FALSE;
	description	 = 	"M˘ûu si koupit ovci?";
};
func int DIA_Pepe_Liesel_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Pepe_Hallo)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Liesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //M˘ûu si koupit ovci?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //Kdykoli, kdyû za ni d·ö dost penÏz. Jedna ovce stojÌ 100 zlat˝ch.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //Kdyû zaplatÌö, m˘ûeö si ovci vzÌt. Ale musÌö se o ni dob¯e postarat.
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
var int Pepe_SchafGekauft;

instance DIA_Pepe_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	8;
	condition	 = 	DIA_Pepe_BuyLiesel_Condition;
	information	 = 	DIA_Pepe_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Tady je 100 zlat˝ch. Tak mi dej ovci.";
};
func int DIA_Pepe_BuyLiesel_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Pepe_LIESEL))
	{
		return TRUE;
	};
};
func void DIA_Pepe_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_00"); //Tady je 100 zlat˝ch. Tak mi dej ovci.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //Fajn. Tak si vezmi Betsy - najdeö ji na pastvinÏ.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //ProstÏ ¯ekni, aù jde za tebou. Na ovci je docela chytr·. Starej se o ni dob¯e!
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //Zase? Fajn. Vezmi si Betsy.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //Betsy? Ale uû ta minul· ovce se jmenovala Betsy.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //Vöechny ovce se jmenujÌ Betsy.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //Samoz¯ejmÏ kromÏ beran˘.
				AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_07"); //A jak se jmenujÌ oni?
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_08"); //Bruce.
			};
		};
		
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");  // *** FIXME *** noch entsprechenden WP/FP eintragen
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //Nem·ö dost zlata. Nem˘ûu ti tu ovci d·t levnÏji.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pepe_PICKPOCKET (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 900;
	condition	= DIA_Pepe_PICKPOCKET_Condition;
	information	= DIA_Pepe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Pepe_PICKPOCKET_Condition()
{
	C_Beklauen (15, 25);
};
 
FUNC VOID DIA_Pepe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pepe_PICKPOCKET);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_BACK 		,DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};
	
func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};















