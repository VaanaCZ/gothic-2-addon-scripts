// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Raoul_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_EXIT_Condition;
	information	= DIA_Raoul_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Raoul_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Raoul_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				NoSentenza
// ************************************************************
instance DIA_Raoul_NoSentenza (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_NoSentenza_Condition;
	information	= DIA_Raoul_NoSentenza_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Raoul_NoSentenza_Condition()
{
	if (!Npc_KnowsInfo(other, DIA_Sentenza_Hello))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_NoSentenza_Info()
{	
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_00"); //PoËkej chvÌli, k·mo!
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_01"); //Nevöiml jsem si, ûe by tÏ Sentenza hledal.
	
	if (Hlp_IsValidNpc(Sentenza))
	&& (!C_NpcIsDown(Sentenza))
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_02"); //SENTENZO! PojÔ sem!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_03"); //(faleönÏ sluönÏ) Chvilku strpenÌ, bude tu coby dup!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_04"); //Pak tÏ ale Ëek· nep¯ÌjemnÈ p¯ekvapenÌ!
		
		B_Attack (Sentenza, other, AR_NONE, 0);
	}
	else 
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_05"); //Kde teda je? No, to nevadÌ, mÏls prostÏ kliku.
	};
	
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				Hello
// ************************************************************
instance DIA_Raoul_Hello (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_Hello_Condition;
	information	= DIA_Raoul_Hello_Info;
	permanent	= TRUE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Raoul_Hello_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Hello_Info()
{	
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self ,other,"DIA_Raoul_Hello_01_00"); //(znudÏnÏ) Co chceö?
	}
	else
	{
		AI_Output (self ,other,"DIA_Raoul_Hello_01_01"); //(otr·venÏ) Co chceö teÔ?
	};
};

// ************************************************************
// 			  				PERM (Gil_None)
// ************************************************************

var int Raoul_gesagt;
// -------------------------
instance DIA_Raoul_PERMNone (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_PERMNone_Condition;
	information	= DIA_Raoul_PERMNone_Info;
	permanent	= TRUE;
	description = "Chci se trochu porozhlÈdnout po farmÏ!"; 
};                       

FUNC INT DIA_Raoul_PERMNone_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_PERMNone_Info()
{
	AI_Output (other, self, "DIA_Raoul_PERMNone_15_00"); //Chci se trochu porozhlÈdnout po farmÏ!
	
	if (Raoul_gesagt == FALSE)
	{
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_01"); //Do toho stavenÌ nalevo radöi nechoÔ. BydlÌ tam Sylvio a teÔ zrovna nem· nijak dobrou n·ladu.
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_02"); //Kdyû narazÌ na nÏjakÈho slabocha, kter˝ nepat¯Ì ke statku, mohlo by ho napadnout, ûe by si na nÏm mohl vylÌt vztek.
		Raoul_gesagt = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_03"); //Tak si to uûij!
		AI_StopProcessInfos (self);
	};
};

// ************************************************************
// 			  				Wanna Join
// ************************************************************
instance DIA_Raoul_WannaJoin (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_WannaJoin_Condition;
	information	= DIA_Raoul_WannaJoin_Info;
	permanent	= FALSE;
	description = "Chci se p¯idat k Leeovi!"; 
};                       

FUNC INT DIA_Raoul_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_00"); //Chci se p¯idat k Leeovi!
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_01"); //Jestli to bude takhle pokraËovat, Lee uû za chvÌli nebude mÌt hlavnÌ slovo!
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_02"); //Co tÌm myslÌö?
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_03"); //Chce, abychom tu vöichni sedÏli s rukama v klÌnÏ. Jen tu a tam postraöÌme p·r sedl·k˘, a to je vöechno.
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_04"); //Sylvio naopak vûdycky ¯Ìk·, ûe nejlepöÌ obrana je ˙tok, a m· sakra pravdu!
};
	
// ************************************************************
// 			  				AboutSylvio
// ************************************************************
instance DIA_Raoul_AboutSylvio (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_AboutSylvio_Condition;
	information	= DIA_Raoul_AboutSylvio_Info;
	permanent	= FALSE;
	description = "Kdo je Sylvio?"; 
};                       

FUNC INT DIA_Raoul_AboutSylvio_Condition()
{
	if (Raoul_gesagt == TRUE)
	|| (Npc_KnowsInfo (other, DIA_Raoul_WannaJoin))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_AboutSylvio_Info()
{	
	AI_Output (other, self, "DIA_Raoul_AboutSylvio_15_00"); //Kdo je Sylvio?
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_01"); //Podle mÏ je to n·ö budoucÌ v˘dce. Jestli se ho ale chceö zeptat, jestli se k n·m m˘ûeö p¯idat, tak na to rovnou zapomeÚ!
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_02"); //Vypad·ö, ûe bys umÏl leda tak p·st ovce.
};

// ************************************************************
// 			  				Stimme
// ************************************************************
instance DIA_Raoul_Stimme (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_Stimme_Condition;
	information	= DIA_Raoul_Stimme_Info;
	permanent	= FALSE;
	description = "Nevadilo by ti, kdybych se tu stal ûold·kem?"; 
};                       

FUNC INT DIA_Raoul_Stimme_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Stimme_Info()
{	
	AI_Output (other, self, "DIA_Raoul_Stimme_15_00"); //Nevadilo by ti, kdybych se tu stal ûold·kem?
	AI_Output (self, other, "DIA_Raoul_Stimme_01_01"); //¡le, dÏlej si, co chceö...
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Raoul nem· nic proti tomu, abych se p¯idal k ûoldnÈ¯˘m.");
};

// ************************************************************
// 			  					Duell
// ************************************************************
instance DIA_Raoul_Duell (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_Duell_Condition;
	information	= DIA_Raoul_Duell_Info;
	permanent	= TRUE;
	description = "J· myslÌm, ûe bych ti mÏl d·t p·r p¯es drûku."; 
};                       

FUNC INT DIA_Raoul_Duell_Condition()
{
	if (Raoul_gesagt == TRUE)
	|| (Npc_KnowsInfo (other, DIA_Raoul_AboutSylvio))
	|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Duell_Info()
{	
	AI_Output (other, self, "DIA_Raoul_Duell_15_00"); //J· myslÌm, ûe bych ti mÏl d·t p·r p¯es drûku.
	AI_Output (self, other, "DIA_Raoul_Duell_01_01"); //Co?
	AI_Output (other, self, "DIA_Raoul_Duell_15_02"); //P¯esnÏ to bys teÔ pot¯eboval.
	AI_Output (self, other, "DIA_Raoul_Duell_01_03"); //ZatÌm jsem k tobÏ byl asi aû moc mil˝, co?
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

//#####################################################################

//							Mit erster Gilde

//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_PERM		(C_INFO)
{
	npc		 	= Sld_822_Raoul;
	nr		 	= 900;
	condition	= DIA_Raoul_PERM_Condition;
	information	= DIA_Raoul_PERM_Info;
	permanent	= TRUE;
	description	= "A co jinak. Vöechno v po¯·dku?";
};

func int DIA_Raoul_PERM_Condition ()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_PERM_15_00"); //A co jinak. Vöechno v po¯·dku?

	if (MIS_Raoul_KillTrollBlack == LOG_RUNNING)
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_01"); //P¯estaÚ ûvanit a radöi mi obstarej tu k˘ûi z Ëern˝ho trola.
	}
	else 
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_02"); //SnaûÌö se mi podlejzat, nebo co? Zmizni!

		 if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output			(self, other, "DIA_Raoul_PERM_01_03"); //NezapomnÏl jsem, cos mi provedl.
		};
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_TROLL		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	2;
	condition	 = 	DIA_Raoul_TROLL_Condition;
	information	 = 	DIA_Raoul_TROLL_Info;
	important	 = 	TRUE;

};

func int DIA_Raoul_TROLL_Condition ()
{
	if (hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLL_Info ()
{
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_00"); //(cynicky) Jen se na to podÌvej!
	AI_Output			(other, self, "DIA_Raoul_TROLL_15_01"); //Co chceö?

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_02"); //Ty ses p¯idal k mÏstsk˝m ûebr·k˘m? Skoro to tak vypad·.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_03"); //Nemysli si, ûe si tÏ teÔ budu v·ûit. To, ûe jsi jednÌm z n·s, jeötÏ nic neznamen·.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_04"); //Hrajeö si na velkÈho m·ga, co?
		};
	
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_05"); //NÏco ti povÌm. V˘bec nesejde na tom, co m·ö zrovna na sobÏ. J· ti stejnÏ vidÌm aû do ûaludku.
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_06"); //Pro mÏ nikdy nebudeö nic vÌc neû öpinavej fl·kaË.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "Uû musÌm jÌt.", DIA_Raoul_TROLL_weg );
	Info_AddChoice	(DIA_Raoul_TROLL, "Co m·ö za problÈm?", DIA_Raoul_TROLL_rechnung );
};

func void DIA_Raoul_TROLL_weg ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_weg_15_00"); //Uû musÌm jÌt.
	AI_Output			(self, other, "DIA_Raoul_TROLL_weg_01_01"); //Jo, vymajzni.
	AI_StopProcessInfos (self);
};

func void DIA_Raoul_TROLL_rechnung ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_00"); //Co m·ö za problÈm?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_01"); //Takov˝ jako ty moc dob¯e zn·m. MajÌ akor·t plnou hubu kec˘.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_02"); //Nesn·öÌm lidi, co dÏlajÌ haura a kasajÌ se, jak˝ hrdinskÈ skutky vykonajÌ.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_03"); //Zrovna vËera jsem tu jednomu chl·pkovi dal p·r do zub˘, protoûe tvrdil, ûe by Ëern˝ho trola sundal i s jednou rukou p¯iv·zanou za z·dy.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_04"); //A co?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_05"); //(ost¯e) Co myslÌö tÌm "a co"?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_06"); //Uû jsi nÏkdy vidÏl Ëern˝ho trola, ty velkohubej n·divo? M·ö v˘bec ponÏtÌ, jak obrovsk· potvora to je?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_07"); //Kdyû se k nÏmu p¯iblÌûÌö jen o krok vÌc, neû je zdr·vo, roztrh· tÏ na cucky.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "To jde mimo mÏ.", DIA_Raoul_TROLL_rechnung_hastrecht );

	if (Npc_IsDead(Troll_Black))
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "Uû jsem zabil toho ËernÈho trola.", DIA_Raoul_TROLL_rechnung_ich );
	}
	else
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "»ern˝ trol? é·dn˝ problÈm!", DIA_Raoul_TROLL_rechnung_noProb );
	};
};

func void B_Raoul_Blame ()
{
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00"); //Ty si o to ale p¯Ìmo koledujeö, co? MÏl bych ti rovnou zakroutit krkem, ale m·m lepöÌ n·pad.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01"); //Jestli jsi fakt tak dobrej bojovnÌk, tak to dokaû.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02"); //Co z toho budu mÌt?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03"); //To je ale hloup· ot·zka. »est a nerozbitej cifernÌk?
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04"); //To teda nenÌ zrovna moc.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05"); //No, ¯eknÏme, ûe jestli mi p¯ineseö k˘ûi Ëern˝ho trola, d·m ti pÏknou hromadu penÏz. Co ty na to?
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06"); //To uû je lepöÌ.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07"); //Tak na co Ëek·ö?
	
	Log_CreateTopic (TOPIC_KillTrollBlack, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillTrollBlack, LOG_RUNNING);
	B_LogEntry (TOPIC_KillTrollBlack,"Raoul û·d·, abych mu p¯inesl k˘ûi ËernÈho trola."); 
	
	MIS_Raoul_KillTrollBlack = LOG_RUNNING;

	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_hastrecht ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_hastrecht_15_00"); //Nem·m z·jem.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_hastrecht_01_01"); //To je pro tebe nejspÌö lepöÌ.
	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_ich ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_ich_15_00"); //Uû jsem zabil toho ËernÈho trola.
	B_Raoul_Blame ();
};
func void DIA_Raoul_TROLL_rechnung_noProb ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_noProb_15_00"); //»ern˝ trol? é·dn˝ problÈm!
	B_Raoul_Blame ();
};
	
///////////////////////////////////////////////////////////////////////
//	Info TrophyFur
///////////////////////////////////////////////////////////////////////

instance DIA_Raoul_TrophyFur		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_TrophyFur_Condition;
	information	 = 	DIA_Raoul_TrophyFur_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nejd¯Ìv mi prozraÔ, jak z trola tu k˘ûi st·hnout.";
};

func int DIA_Raoul_TrophyFur_Condition ()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)		
	&& (MIS_Raoul_KillTrollBlack == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Raoul_TrophyFur_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_TrophyFur_15_00"); //Nejd¯Ìv mi prozraÔ, jak z trola tu k˘ûi st·hnout.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_01"); //Tak pozornÏ poslouchej, tuhle radu ti d·m zadarmo.
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_02"); //Kaûdou nohu tÈ bestie opatrnÏ na¯Ìzneö...
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_03"); //...a pak jÌ st·hneö k˘ûi aû k uöÌm. Je to na tebe moc sloûitÈ nebo co?
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info TrollFell
///////////////////////////////////////////////////////////////////////

instance DIA_Raoul_TROLLFELL		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_TROLLFELL_Condition;
	information	 = 	DIA_Raoul_TROLLFELL_Info;

	description	 = 	"M·m u sebe tu k˘ûi ËernÈho trola.";
};

func int DIA_Raoul_TROLLFELL_Condition ()
{
	if (Npc_HasItems (other,ItAt_TrollBlackFur))
	&& (Npc_KnowsInfo(other, DIA_Raoul_TROLL))
		{
				return TRUE;
		};
};

func void DIA_Raoul_TROLLFELL_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_00"); //M·m u sebe tu k˘ûi ËernÈho trola.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_01"); //To nenÌ moûn˝. Ukaû mi ji.
	B_GiveInvItems 		(other, self, ItAt_TrollBlackFur,1);
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_02"); //To je fakt neuvÏ¯iteln˝. Co za ni chceö?
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_03"); //Dej mi, co m·ö.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_04"); //Fajn, d·m ti 500 zlaù·k˘ a t¯i lÈËivÈ lektvary, co ty na to?
	
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "To nestaËÌ.", DIA_Raoul_TROLLFELL_nein );
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "Uû je to.", DIA_Raoul_TROLLFELL_ja );

	MIS_Raoul_KillTrollBlack = LOG_SUCCESS;
	B_GivePlayerXP (XP_Raoul_KillTrollBlack);
};

func void DIA_Raoul_TROLLFELL_ja ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_ja_15_00"); //PlatÌ.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_ja_01_01"); //TÏöilo mÏ.
	CreateInvItems (self, ItPo_Health_03, 3);									
	B_GiveInvItems (self, other, ItPo_Health_03, 3);					
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);					
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);

};

func void DIA_Raoul_TROLLFELL_nein ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_nein_15_00"); //To nestaËÌ.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_01"); //Jen si posluû, j· si tu k˘ûi stejnÏ nech·m.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_02"); //Nenech·m si mezi prsty proklouznout takovouhle öanci.
	MIS_Raoul_DoesntPayTrollFur = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info FellZurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_FELLZURUECK		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_FELLZURUECK_Condition;
	information	 = 	DIA_Raoul_FELLZURUECK_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vraù mi tu trolÌ k˘ûi.";
};

func int DIA_Raoul_FELLZURUECK_Condition ()
{
	if (MIS_Raoul_DoesntPayTrollFur == LOG_RUNNING)
	&& (Npc_HasItems (self,ItAt_TrollBlackFur))
		{
				return TRUE;
		};
};

func void DIA_Raoul_FELLZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_FELLZURUECK_15_00"); //Vraù mi tu trolÌ k˘ûi.
	AI_Output			(self, other, "DIA_Raoul_FELLZURUECK_01_01"); //Ne.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GotTrollFurBack
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_GotTrollFurBack		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_GotTrollFurBack_Condition;
	information	 = 	DIA_Raoul_GotTrollFurBack_Info;

	description	 = 	"Uû se mÏ nikdy nesnaû oökubat, rozumÌö?";
};

func int DIA_Raoul_GotTrollFurBack_Condition ()
{
	if (MIS_Raoul_DoesntPayTrollFur == LOG_RUNNING)
	&& (Npc_HasItems (self,ItAt_TrollBlackFur) == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
				return TRUE;
		};
};

func void DIA_Raoul_GotTrollFurBack_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_GotTrollFurBack_15_00"); //Uû se mÏ nikdy nesnaû oökubat, rozumÌö?
	AI_Output			(self, other, "DIA_Raoul_GotTrollFurBack_01_01"); //No jo. VÌö p¯ece, jak to tady chodÌ, ne? Tak se uklidni.
	MIS_Raoul_DoesntPayTrollFur = LOG_SUCCESS;
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Raoul_KAP3_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP3_EXIT_Condition;
	information	= DIA_Raoul_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Raoul_KAP4_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP4_EXIT_Condition;
	information	= DIA_Raoul_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP4_EXIT_Info()
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

INSTANCE DIA_Raoul_KAP5_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP5_EXIT_Condition;
	information	= DIA_Raoul_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Ship
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_Ship		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	2;
	condition	 = 	DIA_Raoul_Ship_Condition;
	information	 = 	DIA_Raoul_Ship_Info;

	description	 = 	"Jak by se ti lÌbilo vyplout na mo¯e?";
};

func int DIA_Raoul_Ship_Condition ()
{
	if (Kapitel >= 5)	
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_Ship_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_Ship_15_00"); //NechtÏl by sis vyjet na mo¯e?
	AI_Output			(self, other, "DIA_Raoul_Ship_01_01"); //Co m·ö v pl·nu? Chceö zabrat tu paladinskou loÔ? (smÏje se)
	AI_Output			(other, self, "DIA_Raoul_Ship_15_02"); //A co kdyû jo?
	AI_Output			(self, other, "DIA_Raoul_Ship_01_03"); //(v·ûnÏ) Ty ses ˙plnÏ zbl·znil. Ne, dÌky, to nenÌ nic pro mÏ.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_04"); //Nem·m d˘vod opustit Khorinis. BuÔ si nÏjakÈ prachy vydÏl·m tady, nebo na pevninÏ - mnÏ to p¯ijde praöù jak uhoÔ.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_05"); //Najdi si nÏkoho jinÈho.

	if ((Npc_IsDead(Torlof))== FALSE)
	{
		AI_Output			(self, other, "DIA_Raoul_Ship_01_06"); //Zeptej se Torlofa. Pokud vÌm, tak se po mo¯i kdysi plavil.
	};
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


INSTANCE DIA_Raoul_KAP6_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP6_EXIT_Condition;
	information	= DIA_Raoul_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Raoul_PICKPOCKET (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 900;
	condition	= DIA_Raoul_PICKPOCKET_Condition;
	information	= DIA_Raoul_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Raoul_PICKPOCKET_Condition()
{
	C_Beklauen (45, 85);
};
 
FUNC VOID DIA_Raoul_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Raoul_PICKPOCKET);
	Info_AddChoice		(DIA_Raoul_PICKPOCKET, DIALOG_BACK 		,DIA_Raoul_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Raoul_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Raoul_PICKPOCKET_DoIt);
};

func void DIA_Raoul_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Raoul_PICKPOCKET);
};
	
func void DIA_Raoul_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Raoul_PICKPOCKET);
};


































	
	
	
	


























