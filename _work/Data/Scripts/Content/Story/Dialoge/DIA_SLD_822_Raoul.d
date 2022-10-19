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
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_00"); //Warte doch mal, Freundchen!
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_01"); //Ich hab gar nicht gesehen, dass Sentenza dich durchsucht hat.
	
	if (Hlp_IsValidNpc(Sentenza))
	&& (!C_NpcIsDown(Sentenza))
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_02"); //SENTENZA! Komm doch mal her!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_03"); //(gespielt höflich) Einen Moment, er ist sofort hier!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_04"); //Dann wirst du dein blaues Wunder erleben!
		
		B_Attack (Sentenza, other, AR_NONE, 0);
	}
	else 
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_05"); //Wo ist er überhaupt? Na ja, egal, da hast du ja noch mal Glück gehabt ...
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
		AI_Output (self ,other,"DIA_Raoul_Hello_01_00"); //(gelangweilt) Was willst du?
	}
	else
	{
		AI_Output (self ,other,"DIA_Raoul_Hello_01_01"); //(genervt) Was willst du schon wieder?
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
	description = "Ich will mich auf dem Hof umsehen!"; 
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
		AI_Output (other, self, "DIA_Raoul_PERMNone_15_00"); //Ich will mich auf dem Hof umsehen!
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_01"); //Geh nicht in das linke Haus. Da drin sitzt Sylvio. Er ist zurzeit nicht besonders gut gelaunt.
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_02"); //Wenn er einen Schwächling sieht, der nicht zum Hof gehört, könnte er auf die Idee kommen, seine schlechte Laune an ihm auszulassen.
		Raoul_gesagt = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_03"); //Viel Spaß!
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
	description = "Ich will mich Lee anschließen! "; 
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
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_00"); //Ich will mich Lee anschließen!
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_01"); //Lee hat hier bald nichts mehr zu sagen, wenn er so weiter macht!
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_02"); //Was soll das heißen?
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_03"); //Er will, dass wir hier alle sitzen und Däumchen drehen. Ab uns zu mal ein paar Bauern einschüchtern und das war's.
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_04"); //Sylvio sagt immer, Angriff ist die beste Verteidigung, und da hat er verdammt Recht.
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
	description = "Wer ist Sylvio?"; 
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
	AI_Output (other, self, "DIA_Raoul_AboutSylvio_15_00"); //Wer ist Sylvio?
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_01"); //Wenn du mich fragst, unser nächster Anführer. Wenn du vorhast, ihn zu fragen, ob du bei uns mitmachen kannst - vergiss es!
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_02"); //Du siehst so aus, als ob du gerade mal zum Schafehüten taugst.
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
	description = "Hast du was dagegen, wenn ich hier als Söldner anfange?"; 
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
	AI_Output (other, self, "DIA_Raoul_Stimme_15_00"); //Hast du was dagegen, wenn ich hier als Söldner anfange?
	AI_Output (self, other, "DIA_Raoul_Stimme_01_01"); //Ach, mach doch, was du willst ...
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"Raoul hat nichts dagegen, dass ich mich den Söldnern anschließe.");
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
	description = "Ich glaube ich hau dir mal ein bisschen aufs Maul..."; 
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
	AI_Output (other, self, "DIA_Raoul_Duell_15_00"); //Ich glaube, ich hau dir mal ein bisschen aufs Maul ...
	AI_Output (self, other, "DIA_Raoul_Duell_01_01"); //Was?
	AI_Output (other, self, "DIA_Raoul_Duell_15_02"); //Das ist genau das, was du jetzt brauchst ...
	AI_Output (self, other, "DIA_Raoul_Duell_01_03"); //Ich bin wohl bisher zu nett zu dir gewesen, was?
	
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
	description	= "Sonst alles im Griff?";
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
	AI_Output			(other, self, "DIA_Raoul_PERM_15_00"); //Sonst alles im Griff?

	if (MIS_Raoul_KillTrollBlack == LOG_RUNNING)
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_01"); //Quatsch hier keine Arien! Geh und besorg mir das schwarze Trollfell.
	}
	else 
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_02"); //Willst du dich jetzt bei mir anbiedern, oder was soll das werden? Hau ab!

		 if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output			(self, other, "DIA_Raoul_PERM_01_03"); //Ich hab noch nicht vergessen, was du mit mir gemacht hast.
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
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_00"); //(zynisch) Sieh mal einer an!
	AI_Output			(other, self, "DIA_Raoul_TROLL_15_01"); //Was willst du?

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_02"); //Hast dich den Stadtpennern angeschlossen, wie ich sehe?
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_03"); //Glaub bloß nicht, dass ich dich jetzt respektiere, nur weil du einer von uns bist.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_04"); //Machst hier einen auf feinen Magier, was?
		};
	
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_05"); //Ich sag dir was. Egal, welche Klamotten du dir auch anziehst, ich durchschaue dich.
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_06"); //Für mich bist du nur ein kleiner schmieriger Tagedieb, nichts weiter.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "Ich muß gehen.", DIA_Raoul_TROLL_weg );
	Info_AddChoice	(DIA_Raoul_TROLL, "Was ist dein Problem?", DIA_Raoul_TROLL_rechnung );
};

func void DIA_Raoul_TROLL_weg ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_weg_15_00"); //Ich muss gehen.
	AI_Output			(self, other, "DIA_Raoul_TROLL_weg_01_01"); //Ja. Verschwinde.
	AI_StopProcessInfos (self);
};

func void DIA_Raoul_TROLL_rechnung ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_00"); //Was ist dein Problem?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_01"); //Leute von deiner Sorte kenne ich. Große Schnauze, nichts dahinter.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_02"); //Jemand, der sich groß rausputzt und von seinen Heldentaten prahlt, ist mir zuwider.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_03"); //Erst gestern noch hab ich einem der Jungs hier die Fresse poliert, weil er behauptet hat, dass er einen schwarzen Troll mit einer Hand auf dem Rücken zur Strecke bringen kann.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_04"); //Ja und?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_05"); //(sauer) Was soll das heißen, ja und?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_06"); //Hast du überhaupt schon mal einen schwarzen Troll gesehen, du Großmaul? Weißt du eigentlich, wie groß diese Ungeheuer sind, Mann?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_07"); //Wenn du ihnen nur einen Schritt zu nahe kommst, reißen sie dich glatt in Stücke.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "Interessiert mich nicht.", DIA_Raoul_TROLL_rechnung_hastrecht );

	if (Npc_IsDead(Troll_Black))
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "Ich hab´ schon einen schwarzen Troll getötet.", DIA_Raoul_TROLL_rechnung_ich );
	}
	else
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "Schwarzer Troll? Kein Problem für mich.", DIA_Raoul_TROLL_rechnung_noProb );
	};
};

func void B_Raoul_Blame ()
{
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00"); //Dir juckt wohl das Fell, was? Ich sollte dir den Kopf abreißen. Aber ich habe eine bessere Idee.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01"); //Wenn du so ein toller Kämpfer bist, dann beweise es.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02"); //Was habe ich davon?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03"); //Blöde Frage. Deine Ehre und einen heilen Unterkiefer?
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04"); //Ein bisschen dünn, findest du nicht?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05"); //Mmh. Sagen wir, ich würde dir eine Menge Geld bezahlen, wenn du mir das Fell eines schwarzen Trolls bringen kannst. Wie hört sich das an?
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06"); //Besser.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07"); //Worauf wartest du dann noch?
	
	Log_CreateTopic (TOPIC_KillTrollBlack, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillTrollBlack, LOG_RUNNING);
	B_LogEntry (TOPIC_KillTrollBlack,"Raoul will, dass ich ihm das Fell eines schwarzen Trolls bringe."); 
	
	MIS_Raoul_KillTrollBlack = LOG_RUNNING;

	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_hastrecht ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_hastrecht_15_00"); //Interessiert mich nicht.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_hastrecht_01_01"); //Ist auch besser für dich.
	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_ich ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_ich_15_00"); //Ich hab schon einen schwarzen Troll getötet.
	B_Raoul_Blame ();
};
func void DIA_Raoul_TROLL_rechnung_noProb ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_noProb_15_00"); //Schwarzer Troll? Kein Problem.
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

	description	 = 	"Erzähl mir erst, wie ich dem Troll das Fell abziehe.";
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
	AI_Output			(other, self, "DIA_Raoul_TrophyFur_15_00"); //Erzähl mir erst, wie ich dem Troll das Fell abziehe.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_01"); //Dann mach mal deine Lauscher auf. Dieser Tipp ist jetzt ganz umsonst.
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_02"); //Du greifst dir das Vieh und schneidest ihm jeweils eine Kerbe in die Läufe.
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_03"); //Dann ziehst du dem Ding das Fell über die Ohren. Ist das etwa schwierig oder was?
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

	description	 = 	"Ich habe das Fell eines schwarzen Trolls.";
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
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_00"); //Ich habe das Fell eines schwarzen Trolls.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_01"); //Nicht möglich. Zeig her.
	B_GiveInvItems 		(other, self, ItAt_TrollBlackFur,1);
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_02"); //Wahnsinn. Was willst du dafür haben?
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_03"); //Gib mir, was du hast.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_04"); //Okay. Ich gebe dir 500 Goldmünzen dafür und lege noch drei starke Heiltränke oben drauf, was meinst du?
	
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "Das ist mir zu wenig.", DIA_Raoul_TROLLFELL_nein );
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "Gekauft.", DIA_Raoul_TROLLFELL_ja );

	MIS_Raoul_KillTrollBlack = LOG_SUCCESS;
	B_GivePlayerXP (XP_Raoul_KillTrollBlack);
};

func void DIA_Raoul_TROLLFELL_ja ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_ja_15_00"); //Gekauft.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_ja_01_01"); //War mir ein Vergnügen.
	CreateInvItems (self, ItPo_Health_03, 3);									
	B_GiveInvItems (self, other, ItPo_Health_03, 3);					
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);					
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);

};

func void DIA_Raoul_TROLLFELL_nein ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_nein_15_00"); //Das ist mir zu wenig.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_01"); //Dann eben nicht. Das Fell werde ich trotzdem behalten.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_02"); //Diese Chance werde ich mir nicht durch die Lappen gehen lassen.
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

	description	 = 	"Gib mir mein Trollfell zurück.";
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
	AI_Output			(other, self, "DIA_Raoul_FELLZURUECK_15_00"); //Gib mir mein Trollfell zurück.
	AI_Output			(self, other, "DIA_Raoul_FELLZURUECK_01_01"); //Nein.
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

	description	 = 	"Komm nie wieder auf die Idee, mich zu verarschen, klar?";
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
	AI_Output			(other, self, "DIA_Raoul_GotTrollFurBack_15_00"); //Komm nie wieder auf die Idee, mich zu verarschen, klar?
	AI_Output			(self, other, "DIA_Raoul_GotTrollFurBack_01_01"); //Schon gut. Du weißt doch, wie die Sache hier läuft, oder? Also reg dich wieder ab.
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

	description	 = 	"Wie wär's mit 'ner Schiffsreise hier raus?";
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
	AI_Output			(other, self, "DIA_Raoul_Ship_15_00"); //Wie wär's mit 'ner Schiffsreise hier raus?
	AI_Output			(self, other, "DIA_Raoul_Ship_01_01"); //Was hast du vor? Willst du das Schiff der Paladine kapern? (lacht)
	AI_Output			(other, self, "DIA_Raoul_Ship_15_02"); //Und wenn es so wäre?
	AI_Output			(self, other, "DIA_Raoul_Ship_01_03"); //(ernst) Du bist doch komplett verrückt. Nein, danke. Nichts für mich.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_04"); //Ich sehe keinen Grund, Khorinis zu verlassen. Ob ich nun hier meine Kohle verdiene oder auf dem Festland, das ist mir gleich.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_05"); //Such dir einen anderen.

	if ((Npc_IsDead(Torlof))== FALSE)
	{
		AI_Output			(self, other, "DIA_Raoul_Ship_01_06"); //Frag doch mal Torlof. Der ist damals zur See gefahren, soviel ich weiß.
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


































	
	
	
	


























