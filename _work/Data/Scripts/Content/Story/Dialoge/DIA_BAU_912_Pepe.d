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
	description	= "Co tady dêláš?";
};
func int DIA_Pepe_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Pepe_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Hallo_15_00"); //Co tady dêláš?
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //(otrávenê) Hlídám ovce! (vzdychá) A pokud je to možné, vyhýbám se problémùm.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //Moc to nefunguje, co?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //Pff, zvlášã s têmi žoldáky. Jsem opravdu rád, že mùžu být tady na pastvinê. I když to mùže být nebezpeèné tak jako tak.
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
	description	= "Co je na pastvinê tak nebezpeèného?";
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
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //Co je tak nebezpeèného na pastvinê?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //Po okolí se tu potuluje smeèka vlkù. Poslední dobou sem ty zatracený bestie pâicházej sežrat nêkterou z mejch ovcí skoro každej den.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //Ještê pâed pár dny jsem mêl dvakrát tolik ovcí. Nechci ani pomyslet na to, co se mnou Onar udêlá, až na to pâijde.
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
	description	= "Proè jsi o têch vlcích neâekl žoldákùm? Mêl jsem dojem, že pro vás pracují.";
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
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //Proè jsi o têch vlcích neâekl žoldákùm? Mêl jsem dojem, že pro vás pracují.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //Jo, já vim. Mêl jsem to udêlat. Ale nestalo se, sakra.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //A teë, když je tolik ovcí pryè, mám strach o tom nêkomu cokoli âíct.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //Ale právê jsi to âekl MNÊ.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //(zlostnê) Už toho taky lituju.
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
	description	= "Co když ty vlky zabiju?";
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
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_00"); //Co když ty vlky zabiju?
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //(posmêšnê) Ty? A sám? Ha, ha. Tomu nevêâím. To bych dâív uvêâil tomu, že to udêlá mùj chlebodárce.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //Zapomeà na to. Byl to jen návrh. Zajdu za chlapama a uvidím, co tomu âeknou ONI.
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //(vydêšenê) Poèkej chvilku. Fajn, fajn! Ehm... Jsi nejvêtší ze všech nejvêtších a klidnê zvládneš sto vlkù najednou. Žádný problém!
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //Nejèastêji se skrývají mezi stromy poblíž pastviny. (stranou) Mám dojem, že jsou jen ètyâi.
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"Pepeho ovce ohrožují ètyâi vlci. Mêl bych je zahnat.");
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
	description	 = 	"Oddêlal jsem ty vlky.";
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
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //Oddêlal jsem ty vlky.

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //(užasle) Dokázals to! Díky Innosovi!
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //Ale ještê poâád nevím, jak âíct Onarovi, že pâišel o tolik ovcí.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //(pro sebe) Všechno je to chyba toho zatraceného Bullca!

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //Nedêlej si ze mê blázny. Ty bestie ještê nejsou všechny mrtvé.
	};
};

// ************************************************************
// 					Was hast du über Bullco gesagt?
// ************************************************************
instance DIA_Pepe_Bullco (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_Bullco_Condition;
	information	 = 	DIA_Pepe_Bullco_Info;
	permanent	 = 	FALSE;
	description	 = 	"Cos to âíkal o tom Bullcovi?";
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
	AI_Output (other, self, "DIA_Pepe_Bullco_15_00"); //Cos to âíkal o tom Bullcovi?
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //Je to jeden ze žoldákù. Je to vlastnê jeho práce, hlídat pastviny.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //Ale místo toho se se svým kámošem Sylviem jen celý dny poflakujou kolem Thekly v kuchyni.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //Je to chyba têch bastardù, že kvùli têm ovcím nedostanu tejdenní mzdu.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //Kdybych mu alespoà mohl za to dát do zubù. Ale proti nêmu nikdo nemá žádnou šanci. Ten chlap je zabiják.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"Bullco se mêl o Pepeho ovce líp starat. Pepe teë chce nêkomu dát poâádnê za vyuèenou.");
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
	description	 = 	"Bullco dostal, co si zasloužil.";
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
	AI_Output (other, self, "DIA_Pepe_BullcoDefeated_15_00"); //Bullco dostal, co si zasloužil. Postaral jsem se o to.
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //Ta svinê si to zasloužila.

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
	description	= "Jak se máš? A co tvoje ovce?";
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
	AI_Output (other, self, "DIA_Pepe_PERM_15_00"); //Jak se máš? A co tvoje ovce?

	if (kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //V pohodê. A stejnê tak ovce. Ty, co tu poâád ještê jsou, se mají dobâe.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //Fajn. Ale ty vlci se jednou vrátêj. A asi jich bude ještê víc!
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //Slyšel jsem hodnê divný vêci. Nêjaký hrozivê vypadající postavy otravují u Sekoba. Obklíèily jeho dùm.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //Slyšel jsem, že se na Lobartovê farmê rozvalují nêjací žoldáci. Nêkdo by jim možná mêl pomoct.
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
	description	 = 	"Mùžu si koupit ovci?";
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
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //Mùžu si koupit ovci?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //Kdykoli, když za ni dáš dost penêz. Jedna ovce stojí 100 zlatých.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //Když zaplatíš, mùžeš si ovci vzít. Ale musíš se o ni dobâe postarat.
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
	description	 = 	"Tady je 100 zlatých. Tak mi dej ovci.";
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
	AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_00"); //Tady je 100 zlatých. Tak mi dej ovci.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //Fajn. Tak si vezmi Betsy - najdeš ji na pastvinê.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //Prostê âekni, aã jde za tebou. Na ovci je docela chytrá. Starej se o ni dobâe!
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //Zase? Fajn. Vezmi si Betsy.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //Betsy? Ale už ta minulá ovce se jmenovala Betsy.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //Všechny ovce se jmenují Betsy.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //Samozâejmê kromê beranù.
				AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_07"); //A jak se jmenují oni?
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_08"); //Bruce.
			};
		};
		
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");  // *** FIXME *** noch entsprechenden WP/FP eintragen
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //Nemáš dost zlata. Nemùžu ti tu ovci dát levnêji.
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















