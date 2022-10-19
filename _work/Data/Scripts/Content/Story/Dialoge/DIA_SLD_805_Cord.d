// ************************************************************
// 			  					EXIT
// ************************************************************
INSTANCE DIA_Cord_EXIT   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 999;
	condition   = DIA_Cord_EXIT_Condition;
	information = DIA_Cord_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_MeetingIsRunning		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Cord_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Cord_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Cord_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Cord_MeetingIsRunning_OneTime;
func void DIA_Addon_Cord_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Cord_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_00"); //Vítej v kruhu vody, bratâe.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_01"); //Teë bys mêl zajít za Vatrasem.
	};
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  					Hallo
// ************************************************************
INSTANCE DIA_Cord_Hallo   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 2;
	condition   = DIA_Cord_Hallo_Condition;
	information = DIA_Cord_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Cord_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cord_Hallo_Info()
{
	AI_Output (self ,other, "DIA_Cord_Hallo_14_00"); //Jestli máš problém s vlky nebo polními škùdci, tak si bêž promluvit s jedním z našich mladších žoldákù.
	AI_Output (self ,other, "DIA_Cord_Hallo_14_01"); //Mùžeš ke mnê pâijít, až se tu ukážou paladinové.
	
	if (SC_IsRanger == FALSE)
	{	
		AI_Output (other, self, "DIA_Cord_Hallo_15_02"); //Co?
		AI_Output (self ,other, "DIA_Cord_Hallo_14_03"); //Vždycky když za mnou pâijde nêkdo z vás rolníkù, jde mu pokaždý o vraždêní nevinnejch zvíâat.
		AI_Output (other, self, "DIA_Cord_Hallo_15_04"); //Nejsem rolník.
		AI_Output (self ,other, "DIA_Cord_Hallo_14_05"); //Hm? A co tedy potom chceš?
	};
};

// ************************************************************
// 			  					WannaJoin
// ************************************************************
var int Cord_SchonmalGefragt;
// ------------------------------------------------------------
INSTANCE DIA_Cord_WannaJoin   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 5;
	condition   = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent   = TRUE;
	description = "Chtêl bych se stát žoldákem!";
};

FUNC INT DIA_Cord_WannaJoin_Condition()
{
	if (Cord_Approved == FALSE)
	&& (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID B_Cord_BeBetter ()
{
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_14"); //A protože ty sotva víš, jak se zachází se zbraní, âekl bych, že jsi tady na špatným místê!
};

FUNC VOID DIA_Cord_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Cord_WannaJoin_15_00"); //Chtêl bych se stát žoldákem!
	if (Cord_SchonmalGefragt == FALSE)
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_01"); //Vypadáš spíš jako nêkdo, kdo se narodil pro práci na poli, chlapèe.
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_02"); //Umíš tedy ovládat zbraà?
		Cord_SchonmalGefragt = TRUE;
	}
	else
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_03"); //Už ses zlepšil?
	};
	
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_04"); //Takže umíš ovládat jednoruèní zbranê?
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_05"); //Nejsem v tom špatnej.
	}
	else
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_06"); //Noooo...
	};
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_07"); //A umíš ovládat obouruèní zbranê?
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_08"); //Umím s nimi zacházet.
	}
	else
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_09"); //Urèitê se zlepším!
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	|| (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_10"); //No, alespoà nejsi úplnej zaèáteèník. V poâádku. Budu pro tebe hlasovat.
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_11"); //Když budeš potâebovat nêco dalšího, mùžeš se to nauèit ode mê.
		Cord_Approved = TRUE;
		B_GivePlayerXP (XP_Cord_Approved);
		B_LogEntry (TOPIC_SLDRespekt,"Cordovu pâímluvu už mám v kapse.");
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Cord mê vycvièí v používání jedno- a obouruèních zbraní.");
	}
	else
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_12"); //Jinými slovy: jsi mizernej zelenáè!
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_13"); //Každý žoldnéâ se musí spolehnout na své kamarády. Závisí na tom naše životy.
		B_Cord_BeBetter ();
		
		Log_CreateTopic (TOPIC_CordProve,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_CordProve,LOG_RUNNING); 
		B_LogEntry (TOPIC_CordProve,"Cord se za mê pâimluví až poté, co se nauèím lépe bojovat."); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info YouAreRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_YouAreRanger		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Cord_YouAreRanger_Condition;
	information	 = 	DIA_Addon_Cord_YouAreRanger_Info;

	description	 = 	"Zaslechl jsem, že prý patâíš ke 'kruhu vody'.";
};

func int DIA_Addon_Cord_YouAreRanger_Condition ()
{
	if (RangerHelp_gildeSLD == TRUE)
	&& (Cord_SchonmalGefragt == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cord_YouAreRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_00"); //Slyšel jsem, že patâíš ke kruhu vody.
	
	if (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_01"); //A kterápak krysa to nedokázala držet jazyk za zuby?
		
		if (SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_02"); //Povêdêl mi to Lee.
		};
	
		if (SC_KnowsCordAsRangerFromLares == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_03"); //Lares se zmínil, že bys mi mohl pomoct, když ti povím, že nade mnou drží ochrannou ruku.
		};
	};
	
	AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_04"); //(povzdech) Tak to bych se s tebou asi mêl paktovat, co?
	//AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_05"); //Was muss ich denn jetzt für dich machen, damit du die Schnauze hälst?
	AI_Output	(self, other, "DIA_Addon_Cord_Add_14_01"); //No jo, tak co potâebuješ?
	AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_06"); //A dávej si sakra pozor, co mi teëka povíš. Protože když se mi to nebude líbit, stáhnu tê zaživa z kùže.
	
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Vlastnê nic nepotâebuju, postarám se o sebe sám.", DIA_Addon_Cord_YouAreRanger_nix );
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Chci tvou zbroj.", DIA_Addon_Cord_YouAreRanger_ruestung );
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Chci tvou zbraà!", DIA_Addon_Cord_YouAreRanger_waffe );
	if (Cord_Approved == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Nauè mê bojovat.", DIA_Addon_Cord_YouAreRanger_kampf );
	};
	if (hero.guild == GIL_NONE)
	{
		//Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Verschwinde hier. Ich will deinen Platz auf dem Hof einnehmen.", DIA_Addon_Cord_YouAreRanger_weg );
	};
	if (hero.guild == GIL_NONE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Mohl bys mi pomoci dostat se mezi žoldáky.", DIA_Addon_Cord_YouAreRanger_SLDAufnahme );
	};
	//Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Bezahl mich für mein Schweigen.", DIA_Addon_Cord_YouAreRanger_Gold );
};
var int Cord_SC_Dreist;
func void 	B_DIA_Addon_Cord_YouAreRanger_WARN ()
{
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_WARN_14_00"); //(hrozivê) A bêda ti, jestli se dozvím, žes nedržel jazyk za zuby! A nebudu to víckrát opakovat, jasný?
};
func void 	B_DIA_Addon_Cord_YouAreRanger_FRESSE ()
{
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_FRESSE_14_00"); //(zuâivê) Tak teë už jsi to pâepísknul. Roztrhnu tê jako hada!
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Cord_RangerHelp_GetSLD = FALSE;
	Cord_RangerHelp_Fight = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
};
func void DIA_Addon_Cord_YouAreRanger_ruestung ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_ruestung_15_00"); //Chci tvou zbroj.

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_ruestung_14_01"); //Âekni to ještê jednou a budeš sbírat svý zuby ze zemê!
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Cord_YouAreRanger_Add_15_00"); //Chci tvou zbraà!

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Cord_Add_14_03"); //(hrozivê) Opravdu?
		AI_Output (self, other, "DIA_Addon_Cord_Add_14_02"); //(pâíkâe) Tak si to zkus!
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_weg_15_00"); //Odprejskni. Chcem se na tomhle statku usadit.

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_weg_14_01"); //Nehraj si se mnou, mladej, nebo ti zpâelámu všecky kosti v têle!
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

var int DIA_Addon_Cord_YouAreRanger_SCGotOffer;

func void DIA_Addon_Cord_YouAreRanger_kampf ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_kampf_15_00"); //Nauè mê bojovat.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_kampf_14_01"); //Dobrá, co dál?
	Cord_RangerHelp_Fight = TRUE;

	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Toã vše.", DIA_Addon_Cord_YouAreRanger_reicht );
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};
func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00"); //Mohl bys mi pomoct, aby mê vzali mezi žoldáky.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01"); //(smêje se) Tak teë už to chápu, dobâe. Zkusím to. Co dál?

	Cord_RangerHelp_GetSLD = TRUE;
	
	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Toã vše.", DIA_Addon_Cord_YouAreRanger_reicht );
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};
func void DIA_Addon_Cord_YouAreRanger_Gold ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_Gold_15_00"); //Zaplaã mi a já budu mlèet.
	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_Gold_14_01"); //Nelíbí se ti to? Ale máš smùlu. Já se vydírat nenechám, milej zlatej.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};
func void DIA_Addon_Cord_YouAreRanger_nix ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_nix_15_00"); //Vlastnê nic nepotâebuju, postarám se o sebe sám.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_nix_14_01"); //Když chceš. Mêls šanci.
	B_DIA_Addon_Cord_YouAreRanger_WARN ();
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
};
func void DIA_Addon_Cord_YouAreRanger_reicht ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_reicht_15_00"); //To je všecko.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_reicht_14_01"); //To by nemêl bejt problém.
	B_DIA_Addon_Cord_YouAreRanger_WARN ();
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
};

///////////////////////////////////////////////////////////////////////
//	Info RangerHelp2GetSLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_RangerHelp2GetSLD		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Cord_RangerHelp2GetSLD_Condition;
	information	 = 	DIA_Addon_Cord_RangerHelp2GetSLD_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pomoz mi stát se žoldnéâem.";
};
var int DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm;
func int DIA_Addon_Cord_RangerHelp2GetSLD_Condition ()
{
	if (Cord_RangerHelp_GetSLD == TRUE)
	&& (hero.guild == GIL_NONE)
	&& (DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm == FALSE)
		{
			return TRUE;
		};
};
func void B_Cord_RangerHelpObsolete ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_00"); //Už je to zaâízený.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_01"); //No, tak v tom ti teda nepomùžu.
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_02"); //Co tím myslíš?
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_03"); //No, znamená to, že ti nemùžu pomoct.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_04"); //Nebo chceš, abych tu obcházel všecky žoldáky a pâesvêdèoval je, aby ses k nám moh pâidat?
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_05"); //To musíš udêlat sám.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
};
func void B_Cord_ComeLaterWhenDone ()
{
	AI_Output	(self, other, "DIA_Addon_Cord_ComeLaterWhenDone_14_00"); //Tak pokraèuj, postarej se o to a pak se sem vraã.
	AI_StopProcessInfos (self);
};
func void B_Cord_IDoItForYou ()
{
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_00"); //No jo, to je jednoduchý. Poslouchej. Vraã se zítra a já se o to zatím postarám.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_01"); //Ale na oplátku mi budeš muset nêco dát.
	AI_Output	(other, self, "DIA_Addon_Cord_IDoItForYou_15_02"); //A co to má být?
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_03"); //V horách kousek na jihovýchod odsud leží malej tábor banditù.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_04"); //Když odsud pùjdeš na jihovýchod, brzo uvidíš vêž.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_05"); //Jeden z mejch lidí jménem Patrick už pâed pár dny odešel, aby s têma smradama kšeftoval.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_06"); //Já mu âíkal, že je to blbej nápad, ale ten trouba mê neposlouchal.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_07"); //Myslím, že s ním udêlali krátkej proces, ale nevím to jistê.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_08"); //Takže to musíš zjistit ty.

	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Torlofovu zkoušku se postará Cord, jehož kamarád Patrick nedávno zmizel. Mám se proto vypravit na jihovýchod do malého horského tábora banditù a podívat se, jestli tam Patrick není."); 

	
	Info_ClearChoices	(DIA_Addon_Cord_RangerHelp2GetSLD);	
	Info_AddChoice	(DIA_Addon_Cord_RangerHelp2GetSLD, "Zapomeà na to. To je mnohem horší než ten Torlofùv úkol.", B_Cord_IDoItForYou_mist );
	Info_AddChoice	(DIA_Addon_Cord_RangerHelp2GetSLD, "A cože víš tak jistê, že SE MNOU ten krátký proces neudêlají?", B_Cord_IDoItForYou_Dexter );
		
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};
func void B_Cord_IDoItForYou_mist ()
{
	AI_Output			(other, self, "Dia_Addon_Cord_IDoItForYou_mist_15_00"); //Na to zapomeà. To je ještê horší než ten úkol, co mi zadal Torlof.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_01"); //Ale tak to bejt nemusí. Takovej malej, umaštênej a nevýraznej chlápek jako ty jim urèitê bude šumafuk.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_02"); //A já sám to udêlat nemùžu, protože kdyby ti chlapi jenom zahlídli nêkoho ze žoldákù, byla by z toho poâádná mela.
};
func void B_Cord_IDoItForYou_Dexter ()
{
	AI_Output			(other, self, "Dia_Addon_Cord_IDoItForYou_Dexter_15_00"); //A proè seš si tak jistej, že stejnej krátkej proces neudêlají i SE MNOU?
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_01"); //Protože já vím, jak se jmenuje jejich kápo. Je to Dexter. Staèí tvrdit, že ho znáš.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_02"); //Jeho chlapi si pak sakra rozmyslej, než ti zakroutêj krkem.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_03"); //Samozâejmê to i tak bude o hubu.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_04"); //Ale ty to zvládneš.
	Info_ClearChoices	(DIA_Addon_Cord_RangerHelp2GetSLD);	
	
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Velitel banditù se jmenuje Dexter."); 

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Žoldnéâ Cord hledá svého kamaráda Patricka."); 
		
	MIS_Addon_Cord_Look4Patrick = LOG_RUNNING;
	Ranger_SCKnowsDexter = TRUE; 
};
func void DIA_Addon_Cord_RangerHelp2GetSLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_00"); //Pomoz mi stát se žoldákem.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_01"); //Tak já nad tím zauvažuju. Hmm. Jestli tu chceš udêlat nêjakej pokrok, musíš projít pâes Torlofa.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_02"); //Už jsi to zaâídil s Torlofem?

	if (Torlof_Go == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_03"); //Vlastnê ne.
		B_Cord_ComeLaterWhenDone ();
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_04"); //Ano, jde o tu zkoušku a tak.
		AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_05"); //Aha, a jaká zkouška by to mêla být?
		
		if	(Torlof_ProbeBestanden == TRUE)
		|| ((MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)&& (Npc_IsDead (Rumbold))&& (Npc_IsDead (Rick)))
		|| ((MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)&&((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE)||(Npc_IsDead (Sekob))))
		{
			B_Cord_RangerHelpObsolete ();
		}		
		else if (Torlof_Probe == 0)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_06"); //Ještê jsem ji nepâijal.
			B_Cord_ComeLaterWhenDone ();
		}		
		else if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_07"); //Mám vybrat nájem na Sekobovê statku.
			B_Cord_IDoItForYou ();
		}
		else if (Torlof_Probe == Probe_Bengar)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_08"); //Mám vyhnat domobranu z Bengarova statku.
			B_Cord_IDoItForYou ();
		}
		else 
		{
			B_Cord_RangerHelpObsolete ();
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToDexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_TalkedToDexter		(C_INFO)
{
	npc		 = 	SLD_805_Cord;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Cord_TalkedToDexter_Condition;
	information	 = 	DIA_Addon_Cord_TalkedToDexter_Info;

	description	 = 	"Zašel jsem za Dexterem.";
};

func int DIA_Addon_Cord_TalkedToDexter_Condition ()
{
	if ((BDT_1060_Dexter.aivar[AIV_TalkedToPlayer] == TRUE)
	|| (Npc_IsDead(BDT_1060_Dexter)))
	&& (MIS_Addon_Cord_Look4Patrick == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Cord_TalkedToDexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_00"); //Byl jsem u Dextera.
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_01"); //A co?
	
	if (Npc_IsDead(BDT_1060_Dexter))
	{
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_02"); //Dexter je mrtvý.
	};
	
	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_03"); //Ale po tvém kámoši Patrickovi není nikde ani stopy.
	
	if (Dexter_KnowsPatrick == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_04"); //Dexter si ho pamatuje, ale tvrdil, že už ho jak dlouho nevidêl.
		AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_05"); //A víš urèitê, že ti Dexter nelhal?
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_06"); //To ne, ale víc už nevím.
		
	};
	
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_07"); //Nechápu to. Jako by se po nêm slehla zem.
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_08"); //No, svou èást dohody jsi dodržel.

	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_GivePlayerXP (XP_Addon_Cord_Look4Patrick);

	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_09"); //A co teë bude s Torlofovou zkouškou?
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_10"); //Neboj, mùžeš se vrátit k Torlofovi. Svùj úkol jsi splnil a prošel jsi zkouškou. Âíkal jsem ti, že to zaâídím.

	Cord_RangerHelp_TorlofsProbe = TRUE;

	if (Torlof_Probe == Probe_Sekob)
	{
		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
	}
	else if (Torlof_Probe == Probe_Bengar)
	{
		MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	};
};

// ************************************************************
// 			  ReturnPatrick
// ************************************************************
INSTANCE DIA_Cord_ReturnPatrick   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 8;
	condition   = DIA_Cord_ReturnPatrick_Condition;
	information = DIA_Cord_ReturnPatrick_Info;
	permanent   = FALSE;
	description = "Patrick se vrátil.";
};

FUNC INT DIA_Cord_ReturnPatrick_Condition()
{
	if (Npc_GetDistToWP (Patrick_NW, "NW_BIGFARM_PATRICK") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cord_ReturnPatrick_Info()
{
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_00"); //Patrick je zpátky.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_01"); //Jojo. A já málem ztratil nadêji.
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_02"); //Hele, udêlej pro mê nêco.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_03"); //A co?
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_04"); //Ušetâi nás dêkovnejch kecù.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_05"); //Vùbec jsem ti nechtêl podêkovat.
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_06"); //Ale?
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_07"); //(šklebí se) Chtêl jsem ti âíct, že seš sakra drzej parchant.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_09"); //(šklebí se) To chce klid!
	
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				ExplainSkills
// ************************************************************
INSTANCE DIA_Cord_ExplainSkills   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 1;
	condition   = DIA_Cord_ExplainSkills_Condition;
	information = DIA_Cord_ExplainSkills_Info;
	permanent   = FALSE;
	description = "Co bych se mêl nauèit jako první, boj s jednoruèními nebo obouruèními zbranêmi?";
};

FUNC INT DIA_Cord_ExplainSkills_Condition()
{
	if (Cord_Approved == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Cord_ExplainSkills_Info()
{
	AI_Output (other, self, "DIA_Cord_ExplainSkills_15_00"); //Co bych se mêl nauèit jako první, boj s jednoruèními, nebo obouruèními zbranêmi?
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_01"); //Oba dva druhy boje jsou si hodnê podobné.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_02"); //Jakmile dosáhneš u jednoho typu zbraní další úrovnê, automaticky se to nauèíš také pro druhý typ zbraní.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_03"); //Jestliže jsi napâíklad dobrý v boji s jednoruèními meèi, ale jsi stále zaèáteèník v boji s obouruèními zbranêmi...
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_04"); //...tvé dovednosti s obouruèními zbranêmi se zvýší, i když trénuješ s jednoruèní zbraní.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_05"); //Pokud trénuješ pouze s jedním typem zbraní, zjistíš, že výcvik je mnohem více vyèerpávající.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_06"); //Pokud trénuješ vždy s obêma typy zbraní, dosáhneš stejného výsledku s menším úsilím.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_07"); //V koneèném dùsledku dosáhneš stejného výsledku obêma zpùsoby - výbêr je na tobê.
};
// ************************************************************
// 			  				ExplainWeapons
// ************************************************************
INSTANCE DIA_Cord_ExplainWeapons   (C_INFO)
{
	npc         = SLD_805_Cord;
	nr          = 2;
	condition   = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent   = FALSE;
	description = "Jaké jsou výhody jednoruèních a obouruèních zbraní?";
};

FUNC INT DIA_Cord_ExplainWeapons_Condition()
{
	if (Cord_Approved == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Cord_ExplainWeapons_Info()
{
	AI_Output (other, self, "DIA_Cord_ExplainWeapons_15_00"); //Jaké jsou výhody jednoruèních a obouruèních zbraní?
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_01"); //Dobrá otázka. Vidím, že téhle vêci vênuješ dostateènou pozornost.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_02"); //Jednoruèní zbranê jsou rychlejší, ale trochu slabší.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_03"); //Obouruèní zbranê zpùsobují vêtší poškození, ale nemùžeš s nimi útoèit tak rychle.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_04"); //K ovládání obouruèních zbraní také potâebuješ více síly. To znamená dodateèný trénink.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_05"); //Jediný zpùsob, jak se stát skuteènê dobrým, je vložit do toho mnoho úsilí.
};

// ******************************************************
//							Teach
// ******************************************************

var int Cord_Merke_1h;
var int Cord_Merke_2h;
// ------------------------------------------------------

INSTANCE DIA_Cord_Teach(C_INFO)
{
	npc			= SLD_805_Cord;
	nr			= 3;
	condition	= DIA_Cord_Teach_Condition;
	information	= DIA_Cord_Teach_Info;
	permanent	= TRUE;
	description = "Nauè mê bojovat!";
};                       

FUNC INT DIA_Cord_Teach_Condition()
{
	return TRUE;
};

FUNC VOID B_Cord_Zeitverschwendung ()
{
	AI_Output (self ,other,"DIA_Cord_Teach_14_03"); //Nebudu plýtvat svým èasem se zaèáteèníky.
};

FUNC VOID DIA_Cord_Teach_Info()
{	
	AI_Output (other,self, "DIA_Cord_Teach_15_00"); //Nauè mê bojovat!
	if (Cord_Approved == TRUE)
	|| (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	|| (Cord_RangerHelp_Fight == TRUE)//ADDON
	{
		if ((Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)&&(Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0))
		|| (Cord_RangerHelp_Fight == TRUE)//ADDON
		{
		
		
			AI_Output (self ,other,"DIA_Cord_Teach_14_01"); //Mohu tê nauèit používat jakoukoliv zbraà - kde zaèneme?
			Cord_Approved = TRUE;
		}
		else if  (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
		{
			AI_Output (self ,other,"DIA_Cord_Teach_14_02"); //Mohu tê nauèit používat jednoruèní meè. Ale nejsi dost dobrej na to, abys používal obouruèák.
			B_Cord_Zeitverschwendung();
			Cord_Approved = TRUE;
		}
		else if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
		{
			AI_Output (self ,other,"DIA_Cord_Teach_14_04"); //Co se týèe jednoruèních zbraní, jsi naprostý zaèáteèník! Ale tvé dovednosti v obouruèních zbraních nejsou tak špatné.
			AI_Output (self ,other,"DIA_Cord_Teach_14_05"); //Pokud potâebuješ více zkušeností s jednoruèními zbranêmi, jdi si najít jiného uèitele.
			Cord_Approved = TRUE;
		}
		else
		{
			B_Cord_Zeitverschwendung();
			B_Cord_BeBetter ();
		};
		
		if (Cord_Approved == TRUE)
		{
			Info_ClearChoices (DIA_Cord_Teach);
			Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
		
			if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
			|| (Cord_RangerHelp_Fight == TRUE)//ADDON
			{
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
			};
		
			if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
			|| (Cord_RangerHelp_Fight == TRUE)//ADDON
			{
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
				Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
			};
		
			Cord_Merke_1h = other.HitChance[NPC_TALENT_1H];
			Cord_Merke_2h = other.HitChance[NPC_TALENT_2H];
		};	
	}
	else 
	{
		AI_Output (self ,other,"DIA_Cord_Teach_14_06"); //Já trénuji pouze žoldáky nebo vhodné uchazeèe!
	};
};

FUNC VOID DIA_Cord_Teach_Back ()
{
	if (Cord_Merke_1h < other.HitChance[NPC_TALENT_1H])
	|| (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output (self ,other,"DIA_Cord_Teach_BACK_14_00"); //Jestli ses už zlepšil, tak v tom pokraèuj!
	};
	
	Info_ClearChoices (DIA_Cord_Teach);
};

FUNC VOID DIA_Cord_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

FUNC VOID DIA_Cord_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

FUNC VOID DIA_Cord_Teach_1H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

FUNC VOID DIA_Cord_Teach_1H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 90);
	
	Info_ClearChoices (DIA_Cord_Teach);
	Info_AddChoice (DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))	,DIA_Cord_Teach_2H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5 , B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)),DIA_Cord_Teach_2H_5);
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))  , DIA_Cord_Teach_1H_1);
		Info_AddChoice (DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5 , B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Cord_PICKPOCKET (C_INFO)
{
	npc			= SLD_805_Cord;
	nr			= 900;
	condition	= DIA_Cord_PICKPOCKET_Condition;
	information	= DIA_Cord_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Cord_PICKPOCKET_Condition()
{
	C_Beklauen (65, 75);
};
 
FUNC VOID DIA_Cord_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Cord_PICKPOCKET);
	Info_AddChoice		(DIA_Cord_PICKPOCKET, DIALOG_BACK 		,DIA_Cord_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Cord_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Cord_PICKPOCKET_DoIt);
};

func void DIA_Cord_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cord_PICKPOCKET);
};
	
func void DIA_Cord_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cord_PICKPOCKET);
};












