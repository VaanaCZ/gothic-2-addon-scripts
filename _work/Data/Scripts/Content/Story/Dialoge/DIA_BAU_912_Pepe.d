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
	description	= "Co tady dęláš?";
};
func int DIA_Pepe_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Pepe_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Hallo_15_00"); //Co tady dęláš?
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //(otrávenę) Hlídám ovce! (vzdychá) A pokud je to možné, vyhýbám se problémům.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //Moc to nefunguje, co?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //Pff, zvlášă s tęmi žoldáky. Jsem opravdu rád, že můžu být tady na pastvinę. I když to může být nebezpečné tak jako tak.
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
	description	= "Co je na pastvinę tak nebezpečného?";
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
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //Co je tak nebezpečného na pastvinę?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //Po okolí se tu potuluje smečka vlků. Poslední dobou sem ty zatracený bestie pâicházej sežrat nękterou z mejch ovcí skoro každej den.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //Ještę pâed pár dny jsem męl dvakrát tolik ovcí. Nechci ani pomyslet na to, co se mnou Onar udęlá, až na to pâijde.
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
	description	= "Proč jsi o tęch vlcích neâekl žoldákům? Męl jsem dojem, že pro vás pracují.";
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
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //Proč jsi o tęch vlcích neâekl žoldákům? Męl jsem dojem, že pro vás pracují.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //Jo, já vim. Męl jsem to udęlat. Ale nestalo se, sakra.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //A teë, když je tolik ovcí pryč, mám strach o tom nękomu cokoli âíct.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //Ale právę jsi to âekl MNĘ.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //(zlostnę) Už toho taky lituju.
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
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //(posmęšnę) Ty? A sám? Ha, ha. Tomu nevęâím. To bych dâív uvęâil tomu, že to udęlá můj chlebodárce.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //Zapomeŕ na to. Byl to jen návrh. Zajdu za chlapama a uvidím, co tomu âeknou ONI.
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //(vydęšenę) Počkej chvilku. Fajn, fajn! Ehm... Jsi nejvętší ze všech nejvętších a klidnę zvládneš sto vlků najednou. Žádný problém!
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //Nejčastęji se skrývají mezi stromy poblíž pastviny. (stranou) Mám dojem, že jsou jen čtyâi.
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"Pepeho ovce ohrožují čtyâi vlci. Męl bych je zahnat.");
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
	description	 = 	"Oddęlal jsem ty vlky.";
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
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //Oddęlal jsem ty vlky.

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //(užasle) Dokázals to! Díky Innosovi!
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //Ale ještę poâád nevím, jak âíct Onarovi, že pâišel o tolik ovcí.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //(pro sebe) Všechno je to chyba toho zatraceného Bullca!

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //Nedęlej si ze mę blázny. Ty bestie ještę nejsou všechny mrtvé.
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
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //Je to jeden ze žoldáků. Je to vlastnę jeho práce, hlídat pastviny.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //Ale místo toho se se svým kámošem Sylviem jen celý dny poflakujou kolem Thekly v kuchyni.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //Je to chyba tęch bastardů, že kvůli tęm ovcím nedostanu tejdenní mzdu.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //Kdybych mu alespoŕ mohl za to dát do zubů. Ale proti nęmu nikdo nemá žádnou šanci. Ten chlap je zabiják.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"Bullco se męl o Pepeho ovce líp starat. Pepe teë chce nękomu dát poâádnę za vyučenou.");
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
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //Ta svinę si to zasloužila.

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
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //V pohodę. A stejnę tak ovce. Ty, co tu poâád ještę jsou, se mají dobâe.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //Fajn. Ale ty vlci se jednou vrátęj. A asi jich bude ještę víc!
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //Slyšel jsem hodnę divný vęci. Nęjaký hrozivę vypadající postavy otravují u Sekoba. Obklíčily jeho dům.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //Slyšel jsem, že se na Lobartovę farmę rozvalují nęjací žoldáci. Nękdo by jim možná męl pomoct.
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
	description	 = 	"Můžu si koupit ovci?";
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
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //Můžu si koupit ovci?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //Kdykoli, když za ni dáš dost penęz. Jedna ovce stojí 100 zlatých.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //Když zaplatíš, můžeš si ovci vzít. Ale musíš se o ni dobâe postarat.
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
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //Fajn. Tak si vezmi Betsy - najdeš ji na pastvinę.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //Prostę âekni, aă jde za tebou. Na ovci je docela chytrá. Starej se o ni dobâe!
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //Zase? Fajn. Vezmi si Betsy.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //Betsy? Ale už ta minulá ovce se jmenovala Betsy.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //Všechny ovce se jmenují Betsy.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //Samozâejmę kromę beranů.
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
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //Nemáš dost zlata. Nemůžu ti tu ovci dát levnęji.
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















