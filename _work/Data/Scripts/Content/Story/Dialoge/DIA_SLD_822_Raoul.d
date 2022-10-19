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
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_00"); //Poèkej chvíli, kámo!
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_01"); //Nevšiml jsem si, že by tê Sentenza hledal.
	
	if (Hlp_IsValidNpc(Sentenza))
	&& (!C_NpcIsDown(Sentenza))
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_02"); //SENTENZO! Pojë sem!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_03"); //(falešnê slušnê) Chvilku strpení, bude tu coby dup!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_04"); //Pak tê ale èeká nepâíjemné pâekvapení!
		
		B_Attack (Sentenza, other, AR_NONE, 0);
	}
	else 
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_05"); //Kde teda je? No, to nevadí, mêls prostê kliku.
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
		AI_Output (self ,other,"DIA_Raoul_Hello_01_00"); //(znudênê) Co chceš?
	}
	else
	{
		AI_Output (self ,other,"DIA_Raoul_Hello_01_01"); //(otrávenê) Co chceš teë?
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
	description = "Chci se trochu porozhlédnout po farmê!"; 
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
	if (Raoul_gesagt == FALSE)
	{
		AI_Output (other, self, "DIA_Raoul_PERMNone_15_00"); //Chci se trochu porozhlédnout po farmê!
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_01"); //Do toho stavení nalevo radši nechoë. Bydlí tam Sylvio a teë zrovna nemá nijak dobrou náladu.
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_02"); //Když narazí na nêjakého slabocha, který nepatâí ke statku, mohlo by ho napadnout, že by si na nêm mohl vylít vztek.
		Raoul_gesagt = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_03"); //Tak si to užij!
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
	description = "Chci se pâidat k Leeovi!"; 
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
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_00"); //Chci se pâidat k Leeovi!
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_01"); //Jestli to bude takhle pokraèovat, Lee už za chvíli nebude mít hlavní slovo!
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_02"); //Co tím myslíš?
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_03"); //Chce, abychom tu všichni sedêli s rukama v klínê. Jen tu a tam postrašíme pár sedlákù, a to je všechno.
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_04"); //Sylvio naopak vždycky âíká, že nejlepší obrana je útok, a má sakra pravdu!
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
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_01"); //Podle mê je to náš budoucí vùdce. Jestli se ho ale chceš zeptat, jestli se k nám mùžeš pâidat, tak na to rovnou zapomeà!
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_02"); //Vypadáš, že bys umêl leda tak pást ovce.
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
	description = "Nevadilo by ti, kdybych se tu stal žoldákem?"; 
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
	AI_Output (other, self, "DIA_Raoul_Stimme_15_00"); //Nevadilo by ti, kdybych se tu stal žoldákem?
	AI_Output (self, other, "DIA_Raoul_Stimme_01_01"); //Ále, dêlej si, co chceš...
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Raoul nemá nic proti tomu, abych se pâidal k žoldnéâùm.");
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
	description = "Já myslím, že bych ti mêl dát pár pâes držku."; 
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
	AI_Output (other, self, "DIA_Raoul_Duell_15_00"); //Já myslím, že bych ti mêl dát pár pâes držku.
	AI_Output (self, other, "DIA_Raoul_Duell_01_01"); //Co?
	AI_Output (other, self, "DIA_Raoul_Duell_15_02"); //Pâesnê to bys teë potâeboval.
	AI_Output (self, other, "DIA_Raoul_Duell_01_03"); //Zatím jsem k tobê byl asi až moc milý, co?
	
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
	description	= "A co jinak. Všechno v poâádku?";
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
	AI_Output			(other, self, "DIA_Raoul_PERM_15_00"); //A co jinak. Všechno v poâádku?

	if (MIS_Raoul_KillTrollBlack == LOG_RUNNING)
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_01"); //Pâestaà žvanit a radši mi obstarej tu kùži z èernýho trola.
	}
	else 
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_02"); //Snažíš se mi podlejzat, nebo co? Zmizni!

		 if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output			(self, other, "DIA_Raoul_PERM_01_03"); //Nezapomnêl jsem, cos mi provedl.
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
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_00"); //(cynicky) Jen se na to podívej!
	AI_Output			(other, self, "DIA_Raoul_TROLL_15_01"); //Co chceš?

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_02"); //Ty ses pâidal k mêstským žebrákùm? Skoro to tak vypadá.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_03"); //Nemysli si, že si tê teë budu vážit. To, že jsi jedním z nás, ještê nic neznamená.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_04"); //Hraješ si na velkého mága, co?
		};
	
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_05"); //Nêco ti povím. Vùbec nesejde na tom, co máš zrovna na sobê. Já ti stejnê vidím až do žaludku.
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_06"); //Pro mê nikdy nebudeš nic víc než špinavej flákaè.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "Už musím jít.", DIA_Raoul_TROLL_weg );
	Info_AddChoice	(DIA_Raoul_TROLL, "Co máš za problém?", DIA_Raoul_TROLL_rechnung );
};

func void DIA_Raoul_TROLL_weg ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_weg_15_00"); //Už musím jít.
	AI_Output			(self, other, "DIA_Raoul_TROLL_weg_01_01"); //Jo, vymajzni.
	AI_StopProcessInfos (self);
};

func void DIA_Raoul_TROLL_rechnung ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_00"); //Co máš za problém?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_01"); //Takový jako ty moc dobâe znám. Mají akorát plnou hubu kecù.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_02"); //Nesnáším lidi, co dêlají haura a kasají se, jaký hrdinské skutky vykonají.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_03"); //Zrovna vèera jsem tu jednomu chlápkovi dal pár do zubù, protože tvrdil, že by èernýho trola sundal i s jednou rukou pâivázanou za zády.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_04"); //A co?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_05"); //(ostâe) Co myslíš tím "a co"?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_06"); //Už jsi nêkdy vidêl èernýho trola, ty velkohubej nádivo? Máš vùbec ponêtí, jak obrovská potvora to je?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_07"); //Když se k nêmu pâiblížíš jen o krok víc, než je zdrávo, roztrhá tê na cucky.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "To jde mimo mê.", DIA_Raoul_TROLL_rechnung_hastrecht );

	if (Npc_IsDead(Troll_Black))
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "Už jsem zabil toho èerného trola.", DIA_Raoul_TROLL_rechnung_ich );
	}
	else
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "Èerný trol? Žádný problém!", DIA_Raoul_TROLL_rechnung_noProb );
	};
};

func void B_Raoul_Blame ()
{
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00"); //Ty si o to ale pâímo koleduješ, co? Mêl bych ti rovnou zakroutit krkem, ale mám lepší nápad.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01"); //Jestli jsi fakt tak dobrej bojovník, tak to dokaž.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02"); //Co z toho budu mít?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03"); //To je ale hloupá otázka. Èest a nerozbitej ciferník?
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04"); //To teda není zrovna moc.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05"); //No, âeknême, že jestli mi pâineseš kùži èernýho trola, dám ti pêknou hromadu penêz. Co ty na to?
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06"); //To už je lepší.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07"); //Tak na co èekáš?
	
	Log_CreateTopic (TOPIC_KillTrollBlack, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillTrollBlack, LOG_RUNNING);
	B_LogEntry (TOPIC_KillTrollBlack,"Raoul žádá, abych mu pâinesl kùži èerného trola."); 
	
	MIS_Raoul_KillTrollBlack = LOG_RUNNING;

	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_hastrecht ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_hastrecht_15_00"); //Nemám zájem.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_hastrecht_01_01"); //To je pro tebe nejspíš lepší.
	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_ich ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_ich_15_00"); //Už jsem zabil toho èerného trola.
	B_Raoul_Blame ();
};
func void DIA_Raoul_TROLL_rechnung_noProb ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_noProb_15_00"); //Èerný trol? Žádný problém!
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

	description	 = 	"Nejdâív mi prozraë, jak z trola tu kùži stáhnout.";
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
	AI_Output			(other, self, "DIA_Raoul_TrophyFur_15_00"); //Nejdâív mi prozraë, jak z trola tu kùži stáhnout.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_01"); //Tak pozornê poslouchej, tuhle radu ti dám zadarmo.
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_02"); //Každou nohu té bestie opatrnê naâízneš...
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_03"); //...a pak jí stáhneš kùži až k uším. Je to na tebe moc složité nebo co?
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

	description	 = 	"Mám u sebe tu kùži èerného trola.";
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
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_00"); //Mám u sebe tu kùži èerného trola.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_01"); //To není možný. Ukaž mi ji.
	B_GiveInvItems 		(other, self, ItAt_TrollBlackFur,1);
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_02"); //To je fakt neuvêâitelný. Co za ni chceš?
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_03"); //Dej mi, co máš.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_04"); //Fajn, dám ti 500 zlaãákù a tâi léèivé lektvary, co ty na to?
	
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "To nestaèí.", DIA_Raoul_TROLLFELL_nein );
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "Už je to.", DIA_Raoul_TROLLFELL_ja );

	MIS_Raoul_KillTrollBlack = LOG_SUCCESS;
	B_GivePlayerXP (XP_Raoul_KillTrollBlack);
};

func void DIA_Raoul_TROLLFELL_ja ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_ja_15_00"); //Platí.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_ja_01_01"); //Têšilo mê.
	CreateInvItems (self, ItPo_Health_03, 3);									
	B_GiveInvItems (self, other, ItPo_Health_03, 3);					
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);					
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);

};

func void DIA_Raoul_TROLLFELL_nein ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_nein_15_00"); //To nestaèí.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_01"); //Jen si posluž, já si tu kùži stejnê nechám.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_02"); //Nenechám si mezi prsty proklouznout takovouhle šanci.
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

	description	 = 	"Vraã mi tu trolí kùži.";
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
	AI_Output			(other, self, "DIA_Raoul_FELLZURUECK_15_00"); //Vraã mi tu trolí kùži.
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

	description	 = 	"Už se mê nikdy nesnaž oškubat, rozumíš?";
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
	AI_Output			(other, self, "DIA_Raoul_GotTrollFurBack_15_00"); //Už se mê nikdy nesnaž oškubat, rozumíš?
	AI_Output			(self, other, "DIA_Raoul_GotTrollFurBack_01_01"); //No jo. Víš pâece, jak to tady chodí, ne? Tak se uklidni.
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

	description	 = 	"Jak by se ti líbilo vyplout na moâe?";
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
	AI_Output			(other, self, "DIA_Raoul_Ship_15_00"); //Nechtêl by sis vyjet na moâe?
	AI_Output			(self, other, "DIA_Raoul_Ship_01_01"); //Co máš v plánu? Chceš zabrat tu paladinskou loë? (smêje se)
	AI_Output			(other, self, "DIA_Raoul_Ship_15_02"); //A co když jo?
	AI_Output			(self, other, "DIA_Raoul_Ship_01_03"); //(vážnê) Ty ses úplnê zbláznil. Ne, díky, to není nic pro mê.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_04"); //Nemám dùvod opustit Khorinis. Buë si nêjaké prachy vydêlám tady, nebo na pevninê - mnê to pâijde prašã jak uhoë.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_05"); //Najdi si nêkoho jiného.

	if ((Npc_IsDead(Torlof))== FALSE)
	{
		AI_Output			(self, other, "DIA_Raoul_Ship_01_06"); //Zeptej se Torlofa. Pokud vím, tak se po moâi kdysi plavil.
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


































	
	
	
	


























