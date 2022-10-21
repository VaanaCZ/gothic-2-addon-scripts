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
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_00"); //VÌtej v kruhu vody, brat¯e.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_01"); //TeÔ bys mÏl zajÌt za Vatrasem.
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
	AI_Output (self ,other, "DIA_Cord_Hallo_14_00"); //Jestli m·ö problÈm s vlky nebo polnÌmi ök˘dci, tak si bÏû promluvit s jednÌm z naöich mladöÌch ûold·k˘.
	AI_Output (self ,other, "DIA_Cord_Hallo_14_01"); //M˘ûeö ke mnÏ p¯ijÌt, aû se tu uk·ûou paladinovÈ.
	
	if (SC_IsRanger == FALSE)
	{	
		AI_Output (other, self, "DIA_Cord_Hallo_15_02"); //Co?
		AI_Output (self ,other, "DIA_Cord_Hallo_14_03"); //Vûdycky kdyû za mnou p¯ijde nÏkdo z v·s rolnÌk˘, jde mu pokaûd˝ o vraûdÏnÌ nevinnejch zvÌ¯at.
		AI_Output (other, self, "DIA_Cord_Hallo_15_04"); //Nejsem rolnÌk.
		AI_Output (self ,other, "DIA_Cord_Hallo_14_05"); //Hm? A co tedy potom chceö?
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
	description = "ChtÏl bych se st·t ûold·kem!";
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
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_14"); //A protoûe ty sotva vÌö, jak se zach·zÌ se zbranÌ, ¯ekl bych, ûe jsi tady na öpatn˝m mÌstÏ!
};

FUNC VOID DIA_Cord_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Cord_WannaJoin_15_00"); //ChtÏl bych se st·t ûold·kem!
	if (Cord_SchonmalGefragt == FALSE)
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_01"); //Vypad·ö spÌö jako nÏkdo, kdo se narodil pro pr·ci na poli, chlapËe.
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_02"); //UmÌö tedy ovl·dat zbraÚ?
		Cord_SchonmalGefragt = TRUE;
	}
	else
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_03"); //Uû ses zlepöil?
	};
	
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_04"); //Takûe umÌö ovl·dat jednoruËnÌ zbranÏ?
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_05"); //Nejsem v tom öpatnej.
	}
	else
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_06"); //Noooo...
	};
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_07"); //A umÌö ovl·dat obouruËnÌ zbranÏ?
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_08"); //UmÌm s nimi zach·zet.
	}
	else
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_09"); //UrËitÏ se zlepöÌm!
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	|| (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_10"); //No, alespoÚ nejsi ˙plnej zaË·teËnÌk. V po¯·dku. Budu pro tebe hlasovat.
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_11"); //Kdyû budeö pot¯ebovat nÏco dalöÌho, m˘ûeö se to nauËit ode mÏ.
		Cord_Approved = TRUE;
		B_GivePlayerXP (XP_Cord_Approved);
		B_LogEntry (TOPIC_SLDRespekt,"Cordovu p¯Ìmluvu uû m·m v kapse.");
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Cord mÏ vycviËÌ v pouûÌv·nÌ jedno- a obouruËnÌch zbranÌ.");
	}
	else
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_12"); //Jin˝mi slovy: jsi mizernej zelen·Ë!
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_13"); //Kaûd˝ ûoldnÈ¯ se musÌ spolehnout na svÈ kamar·dy. Z·visÌ na tom naöe ûivoty.
		B_Cord_BeBetter ();
		
		Log_CreateTopic (TOPIC_CordProve,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_CordProve,LOG_RUNNING); 
		B_LogEntry (TOPIC_CordProve,"Cord se za mÏ p¯imluvÌ aû potÈ, co se nauËÌm lÈpe bojovat."); 
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

	description	 = 	"Zaslechl jsem, ûe pr˝ pat¯Ìö ke 'kruhu vody'.";
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
	AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_00"); //Slyöel jsem, ûe pat¯Ìö ke kruhu vody.
	
	if (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_01"); //A kter·pak krysa to nedok·zala drûet jazyk za zuby?
		
		if (SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_02"); //PovÏdÏl mi to Lee.
		};
	
		if (SC_KnowsCordAsRangerFromLares == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_03"); //Lares se zmÌnil, ûe bys mi mohl pomoct, kdyû ti povÌm, ûe nade mnou drûÌ ochrannou ruku.
		};
	};
	
	AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_04"); //(povzdech) Tak to bych se s tebou asi mÏl paktovat, co?
	//AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_05"); //Was muss ich denn jetzt f¸r dich machen, damit du die Schnauze h‰lst?
	AI_Output	(self, other, "DIA_Addon_Cord_Add_14_01"); //No jo, tak co pot¯ebujeö?
	AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_06"); //A d·vej si sakra pozor, co mi teÔka povÌö. Protoûe kdyû se mi to nebude lÌbit, st·hnu tÏ zaûiva z k˘ûe.
	
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "VlastnÏ nic nepot¯ebuju, postar·m se o sebe s·m.", DIA_Addon_Cord_YouAreRanger_nix );
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Chci tvou zbroj.", DIA_Addon_Cord_YouAreRanger_ruestung );
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Chci tvou zbraÚ!", DIA_Addon_Cord_YouAreRanger_waffe );
	if (Cord_Approved == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "NauË mÏ bojovat.", DIA_Addon_Cord_YouAreRanger_kampf );
	};
	if (hero.guild == GIL_NONE)
	{
		//Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Verschwinde hier. Ich will deinen Platz auf dem Hof einnehmen.", DIA_Addon_Cord_YouAreRanger_weg );
	};
	if (hero.guild == GIL_NONE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Mohl bys mi pomoci dostat se mezi ûold·ky.", DIA_Addon_Cord_YouAreRanger_SLDAufnahme );
	};
	//Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Bezahl mich f¸r mein Schweigen.", DIA_Addon_Cord_YouAreRanger_Gold );
};
var int Cord_SC_Dreist;
func void 	B_DIA_Addon_Cord_YouAreRanger_WARN ()
{
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_WARN_14_00"); //(hrozivÏ) A bÏda ti, jestli se dozvÌm, ûes nedrûel jazyk za zuby! A nebudu to vÌckr·t opakovat, jasn˝?
};
func void 	B_DIA_Addon_Cord_YouAreRanger_FRESSE ()
{
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_FRESSE_14_00"); //(zu¯ivÏ) Tak teÔ uû jsi to p¯epÌsknul. Roztrhnu tÏ jako hada!
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
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_ruestung_14_01"); //ÿekni to jeötÏ jednou a budeö sbÌrat sv˝ zuby ze zemÏ!
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Cord_YouAreRanger_Add_15_00"); //Chci tvou zbraÚ!

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Cord_Add_14_03"); //(hrozivÏ) Opravdu?
		AI_Output (self, other, "DIA_Addon_Cord_Add_14_02"); //(p¯Ìk¯e) Tak si to zkus!
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
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_weg_14_01"); //Nehraj si se mnou, mladej, nebo ti zp¯el·mu vöecky kosti v tÏle!
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
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_kampf_15_00"); //NauË mÏ bojovat.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_kampf_14_01"); //Dobr·, co d·l?
	Cord_RangerHelp_Fight = TRUE;

	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Toù vöe.", DIA_Addon_Cord_YouAreRanger_reicht );
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};
func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00"); //Mohl bys mi pomoct, aby mÏ vzali mezi ûold·ky.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01"); //(smÏje se) Tak teÔ uû to ch·pu, dob¯e. ZkusÌm to. Co d·l?

	Cord_RangerHelp_GetSLD = TRUE;
	
	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Toù vöe.", DIA_Addon_Cord_YouAreRanger_reicht );
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};
func void DIA_Addon_Cord_YouAreRanger_Gold ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_Gold_15_00"); //Zaplaù mi a j· budu mlËet.
	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_Gold_14_01"); //NelÌbÌ se ti to? Ale m·ö sm˘lu. J· se vydÌrat nenech·m, milej zlatej.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};
func void DIA_Addon_Cord_YouAreRanger_nix ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_nix_15_00"); //VlastnÏ nic nepot¯ebuju, postar·m se o sebe s·m.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_nix_14_01"); //Kdyû chceö. MÏls öanci.
	B_DIA_Addon_Cord_YouAreRanger_WARN ();
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
};
func void DIA_Addon_Cord_YouAreRanger_reicht ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_reicht_15_00"); //To je vöecko.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_reicht_14_01"); //To by nemÏl bejt problÈm.
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

	description	 = 	"Pomoz mi st·t se ûoldnÈ¯em.";
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
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_00"); //Uû je to za¯Ìzen˝.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_01"); //No, tak v tom ti teda nepom˘ûu.
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_02"); //Co tÌm myslÌö?
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_03"); //No, znamen· to, ûe ti nem˘ûu pomoct.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_04"); //Nebo chceö, abych tu obch·zel vöecky ûold·ky a p¯esvÏdËoval je, aby ses k n·m moh p¯idat?
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_05"); //To musÌö udÏlat s·m.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
};
func void B_Cord_ComeLaterWhenDone ()
{
	AI_Output	(self, other, "DIA_Addon_Cord_ComeLaterWhenDone_14_00"); //Tak pokraËuj, postarej se o to a pak se sem vraù.
	AI_StopProcessInfos (self);
};
func void B_Cord_IDoItForYou ()
{
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_00"); //No jo, to je jednoduch˝. Poslouchej. Vraù se zÌtra a j· se o to zatÌm postar·m.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_01"); //Ale na opl·tku mi budeö muset nÏco d·t.
	AI_Output	(other, self, "DIA_Addon_Cord_IDoItForYou_15_02"); //A co to m· b˝t?
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_03"); //V hor·ch kousek na jihov˝chod odsud leûÌ malej t·bor bandit˘.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_04"); //Kdyû odsud p˘jdeö na jihov˝chod, brzo uvidÌö vÏû.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_05"); //Jeden z mejch lidÌ jmÈnem Patrick uû p¯ed p·r dny odeöel, aby s tÏma smradama köeftoval.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_06"); //J· mu ¯Ìkal, ûe je to blbej n·pad, ale ten trouba mÏ neposlouchal.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_07"); //MyslÌm, ûe s nÌm udÏlali kr·tkej proces, ale nevÌm to jistÏ.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_08"); //Takûe to musÌö zjistit ty.

	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Torlofovu zkouöku se postar· Cord, jehoû kamar·d Patrick ned·vno zmizel. M·m se proto vypravit na jihov˝chod do malÈho horskÈho t·bora bandit˘ a podÌvat se, jestli tam Patrick nenÌ."); 

	
	Info_ClearChoices	(DIA_Addon_Cord_RangerHelp2GetSLD);	
	Info_AddChoice	(DIA_Addon_Cord_RangerHelp2GetSLD, "ZapomeÚ na to. To je mnohem horöÌ neû ten Torlof˘v ˙kol.", B_Cord_IDoItForYou_mist );
	Info_AddChoice	(DIA_Addon_Cord_RangerHelp2GetSLD, "A coûe vÌö tak jistÏ, ûe SE MNOU ten kr·tk˝ proces neudÏlajÌ?", B_Cord_IDoItForYou_Dexter );
		
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};
func void B_Cord_IDoItForYou_mist ()
{
	AI_Output			(other, self, "Dia_Addon_Cord_IDoItForYou_mist_15_00"); //Na to zapomeÚ. To je jeötÏ horöÌ neû ten ˙kol, co mi zadal Torlof.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_01"); //Ale tak to bejt nemusÌ. Takovej malej, umaötÏnej a nev˝raznej chl·pek jako ty jim urËitÏ bude öumafuk.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_02"); //A j· s·m to udÏlat nem˘ûu, protoûe kdyby ti chlapi jenom zahlÌdli nÏkoho ze ûold·k˘, byla by z toho po¯·dn· mela.
};
func void B_Cord_IDoItForYou_Dexter ()
{
	AI_Output			(other, self, "Dia_Addon_Cord_IDoItForYou_Dexter_15_00"); //A proË seö si tak jistej, ûe stejnej kr·tkej proces neudÏlajÌ i SE MNOU?
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_01"); //Protoûe j· vÌm, jak se jmenuje jejich k·po. Je to Dexter. StaËÌ tvrdit, ûe ho zn·ö.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_02"); //Jeho chlapi si pak sakra rozmyslej, neû ti zakroutÏj krkem.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_03"); //Samoz¯ejmÏ to i tak bude o hubu.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_04"); //Ale ty to zvl·dneö.
	Info_ClearChoices	(DIA_Addon_Cord_RangerHelp2GetSLD);	
	
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Velitel bandit˘ se jmenuje Dexter."); 

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"éoldnÈ¯ Cord hled· svÈho kamar·da Patricka."); 
		
	MIS_Addon_Cord_Look4Patrick = LOG_RUNNING;
	Ranger_SCKnowsDexter = TRUE; 
};
func void DIA_Addon_Cord_RangerHelp2GetSLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_00"); //Pomoz mi st·t se ûold·kem.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_01"); //Tak j· nad tÌm zauvaûuju. Hmm. Jestli tu chceö udÏlat nÏjakej pokrok, musÌö projÌt p¯es Torlofa.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_02"); //Uû jsi to za¯Ìdil s Torlofem?

	if (Torlof_Go == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_03"); //VlastnÏ ne.
		B_Cord_ComeLaterWhenDone ();
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_04"); //Ano, jde o tu zkouöku a tak.
		AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_05"); //Aha, a jak· zkouöka by to mÏla b˝t?
		
		if	(Torlof_ProbeBestanden == TRUE)
		|| ((MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)&& (Npc_IsDead (Rumbold))&& (Npc_IsDead (Rick)))
		|| ((MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)&&((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE)||(Npc_IsDead (Sekob))))
		{
			B_Cord_RangerHelpObsolete ();
		}		
		else if (Torlof_Probe == 0)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_06"); //JeötÏ jsem ji nep¯ijal.
			B_Cord_ComeLaterWhenDone ();
		}		
		else if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_07"); //M·m vybrat n·jem na SekobovÏ statku.
			B_Cord_IDoItForYou ();
		}
		else if (Torlof_Probe == Probe_Bengar)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_08"); //M·m vyhnat domobranu z Bengarova statku.
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

	description	 = 	"Zaöel jsem za Dexterem.";
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
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_02"); //Dexter je mrtv˝.
	};
	
	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_03"); //Ale po tvÈm k·moöi Patrickovi nenÌ nikde ani stopy.
	
	if (Dexter_KnowsPatrick == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_04"); //Dexter si ho pamatuje, ale tvrdil, ûe uû ho jak dlouho nevidÏl.
		AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_05"); //A vÌö urËitÏ, ûe ti Dexter nelhal?
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_06"); //To ne, ale vÌc uû nevÌm.
		
	};
	
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_07"); //Nech·pu to. Jako by se po nÏm slehla zem.
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_08"); //No, svou Ë·st dohody jsi dodrûel.

	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_GivePlayerXP (XP_Addon_Cord_Look4Patrick);

	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_09"); //A co teÔ bude s Torlofovou zkouökou?
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_10"); //Neboj, m˘ûeö se vr·tit k Torlofovi. Sv˘j ˙kol jsi splnil a proöel jsi zkouökou. ÿÌkal jsem ti, ûe to za¯ÌdÌm.

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
	description = "Patrick se vr·til.";
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
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_00"); //Patrick je zp·tky.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_01"); //Jojo. A j· m·lem ztratil nadÏji.
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_02"); //Hele, udÏlej pro mÏ nÏco.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_03"); //A co?
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_04"); //Uöet¯i n·s dÏkovnejch kec˘.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_05"); //V˘bec jsem ti nechtÏl podÏkovat.
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_06"); //Ale?
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_07"); //(öklebÌ se) ChtÏl jsem ti ¯Ìct, ûe seö sakra drzej parchant.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_09"); //(öklebÌ se) To chce klid!
	
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
	description = "Co bych se mÏl nauËit jako prvnÌ, boj s jednoruËnÌmi nebo obouruËnÌmi zbranÏmi?";
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
	AI_Output (other, self, "DIA_Cord_ExplainSkills_15_00"); //Co bych se mÏl nauËit jako prvnÌ, boj s jednoruËnÌmi, nebo obouruËnÌmi zbranÏmi?
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_01"); //Oba dva druhy boje jsou si hodnÏ podobnÈ.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_02"); //Jakmile dos·hneö u jednoho typu zbranÌ dalöÌ ˙rovnÏ, automaticky se to nauËÌö takÈ pro druh˝ typ zbranÌ.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_03"); //Jestliûe jsi nap¯Ìklad dobr˝ v boji s jednoruËnÌmi meËi, ale jsi st·le zaË·teËnÌk v boji s obouruËnÌmi zbranÏmi...
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_04"); //...tvÈ dovednosti s obouruËnÌmi zbranÏmi se zv˝öÌ, i kdyû trÈnujeö s jednoruËnÌ zbranÌ.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_05"); //Pokud trÈnujeö pouze s jednÌm typem zbranÌ, zjistÌö, ûe v˝cvik je mnohem vÌce vyËerp·vajÌcÌ.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_06"); //Pokud trÈnujeö vûdy s obÏma typy zbranÌ, dos·hneö stejnÈho v˝sledku s menöÌm ˙silÌm.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_07"); //V koneËnÈm d˘sledku dos·hneö stejnÈho v˝sledku obÏma zp˘soby - v˝bÏr je na tobÏ.
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
	description = "JakÈ jsou v˝hody jednoruËnÌch a obouruËnÌch zbranÌ?";
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
	AI_Output (other, self, "DIA_Cord_ExplainWeapons_15_00"); //JakÈ jsou v˝hody jednoruËnÌch a obouruËnÌch zbranÌ?
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_01"); //Dobr· ot·zka. VidÌm, ûe tÈhle vÏci vÏnujeö dostateËnou pozornost.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_02"); //JednoruËnÌ zbranÏ jsou rychlejöÌ, ale trochu slaböÌ.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_03"); //ObouruËnÌ zbranÏ zp˘sobujÌ vÏtöÌ poökozenÌ, ale nem˘ûeö s nimi ˙toËit tak rychle.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_04"); //K ovl·d·nÌ obouruËnÌch zbranÌ takÈ pot¯ebujeö vÌce sÌly. To znamen· dodateËn˝ trÈnink.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_05"); //Jedin˝ zp˘sob, jak se st·t skuteËnÏ dobr˝m, je vloûit do toho mnoho ˙silÌ.
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
	description = "NauË mÏ bojovat!";
};                       

FUNC INT DIA_Cord_Teach_Condition()
{
	return TRUE;
};

FUNC VOID B_Cord_Zeitverschwendung ()
{
	AI_Output (self ,other,"DIA_Cord_Teach_14_03"); //Nebudu pl˝tvat sv˝m Ëasem se zaË·teËnÌky.
};

FUNC VOID DIA_Cord_Teach_Info()
{	
	AI_Output (other,self, "DIA_Cord_Teach_15_00"); //NauË mÏ bojovat!
	if (Cord_Approved == TRUE)
	|| (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	|| (Cord_RangerHelp_Fight == TRUE)//ADDON
	{
		if ((Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)&&(Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0))
		|| (Cord_RangerHelp_Fight == TRUE)//ADDON
		{
		
		
			AI_Output (self ,other,"DIA_Cord_Teach_14_01"); //Mohu tÏ nauËit pouûÌvat jakoukoliv zbraÚ - kde zaËneme?
			Cord_Approved = TRUE;
		}
		else if  (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
		{
			AI_Output (self ,other,"DIA_Cord_Teach_14_02"); //Mohu tÏ nauËit pouûÌvat jednoruËnÌ meË. Ale nejsi dost dobrej na to, abys pouûÌval obouruË·k.
			B_Cord_Zeitverschwendung();
			Cord_Approved = TRUE;
		}
		else if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
		{
			AI_Output (self ,other,"DIA_Cord_Teach_14_04"); //Co se t˝Ëe jednoruËnÌch zbranÌ, jsi naprost˝ zaË·teËnÌk! Ale tvÈ dovednosti v obouruËnÌch zbranÌch nejsou tak öpatnÈ.
			AI_Output (self ,other,"DIA_Cord_Teach_14_05"); //Pokud pot¯ebujeö vÌce zkuöenostÌ s jednoruËnÌmi zbranÏmi, jdi si najÌt jinÈho uËitele.
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
		AI_Output (self ,other,"DIA_Cord_Teach_14_06"); //J· trÈnuji pouze ûold·ky nebo vhodnÈ uchazeËe!
	};
};

FUNC VOID DIA_Cord_Teach_Back ()
{
	if (Cord_Merke_1h < other.HitChance[NPC_TALENT_1H])
	|| (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output (self ,other,"DIA_Cord_Teach_BACK_14_00"); //Jestli ses uû zlepöil, tak v tom pokraËuj!
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












