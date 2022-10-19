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
	description	= "Was machst du hier?";
};
func int DIA_Pepe_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Pepe_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Hallo_15_00"); //Was machst du hier?
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //(gelangweilt) Schafe hüten! (seufzt) Und wenn es geht, allem Ärger aus dem Weg gehen.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //Gelingt dir nicht immer, was?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //Nee, vor allem nicht bei den Söldnern. Da bin ich eigentlich froh, draußen auf der Weide zu sein. Obwohl das auch sehr gefährlich sein kann.
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
	description	= "Was ist denn auf der Weide so gefährlich?";
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
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //Was ist denn auf der Weide so gefährlich?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //Hier in der Gegend treibt sich ein kleines Rudel von Wölfen herum. In letzter Zeit sind die Mistviecher fast täglich gekommen und haben eins meiner Schafe gefressen.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //Vor ein paar Tagen hatte ich fast doppelt so viel Schafe. Ich mag gar nicht daran denken, was Onar mit mir macht, wenn er es erfährt.
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
	description	= "Warum hast du das mit den Wölfen nicht den Söldnern gesagt?";
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
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //Warum hast du das mit den Wölfen nicht den Söldnern gesagt? Ich dachte, die arbeiten für euch.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //Ja, ich weiß. Das hätte ich tun sollen. Hab ich aber nicht gemacht, verdammt noch mal.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //Und jetzt, wo schon so viel Schafe weg sind, habe ich Angst, es überhaupt noch jemandem zu erzählen.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //MIR hast du es doch gerade erzählt ...
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //(verärgert) Das bereue ich auch jetzt schon.
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
	description	= "Was, wenn ich die Wölfe töte?";
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
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_00"); //Was, wenn ich die Wölfe töte?
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //(spottet) Du allein? Haha. Das glaube ich nicht. Das würde ich noch eher meinem Leithammel zutrauen.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //Dann eben nicht. War nur so ein Vorschlag. Ich werde mal zu den Jungs rübergehen und sehen, was die dazu sagen ...
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //(ängstlich) Warte doch mal. Ok, ok! Ähm ... du bist der Größte, und du wirst es mit hundert Wölfen gleichzeitig aufnehmen können. Kein Problem!
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //Sie lauern meistens zwischen den Bäumen in der Nähe der Weide. (beiläufig) Ich glaube, es waren nur vier ...
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"Pepe's Schafe werden von vier Wölfen bedroht. Die sollte ich vertreiben.");
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
	description	 = 	"Die Wölfe sind erledigt.";
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
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //Die Wölfe sind erledigt.

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //(verblüfft) Du hast es geschafft! Innos sei Dank!
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //Jetzt weiß ich nur noch nicht, wie ich es Onar beibringe, dass mir die ganzen Schafe fehlen.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //(zu sich selbst) Dieser verdammte Bullco ist an allem Schuld!

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //Verarschen kann ich mich alleine. Die Biester sind noch nicht alle tot.
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
	description	 = 	"Was hast du über Bullco gesagt?";
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
	AI_Output (other, self, "DIA_Pepe_Bullco_15_00"); //Was hast du über Bullco gesagt?
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //Er ist einer der Söldner. Es wäre eigentlich seine Aufgabe gewesen, die Weide zu bewachen.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //Aber stattdessen hängt er mit seinem Kumpel Sylvio den ganzen Tag bei Thekla in der Küche rum.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //Dieser Mistkerl ist schuld, wenn ich jetzt wegen der verlorenen Schafe wochenlang keinen Lohn kriege.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //Ich wünschte, ich könnte ihm wenigstens dafür aufs Maul hauen. Aber gegen den hat keiner 'ne Chance. Der Typ ist ein Killer.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"Bullco hätte auf die Schafe von Pepe aufpassen sollen. Pepe wünscht sich, das ihm mal jemand ordentlich auf's Maul haut.");
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
	description	 = 	"Bullco hat seine gerechte Strafe erhalten.";
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
	AI_Output (other, self, "DIA_Pepe_BullcoDefeated_15_00"); //Bullco hat seine gerechte Strafe erhalten. Ich habe ihm eine Lektion erteilt.
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //Das hat das Schwein verdient.

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
	description	= "Wie geht's dir und deinen Schafen?";
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
	AI_Output (other, self, "DIA_Pepe_PERM_15_00"); //Wie geht's dir und deinen Schafen?

	if (kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //Gut. Und den Schafen auch. Das heißt, denen, die noch da sind, geht es gut.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //Gut. Aber die Wölfe kommen bestimmt irgendwann wieder. Und dann werden es bestimmt mehr sein!
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //Ich habe die seltsamsten Dinge gehört. Bei Sekob sollen recht düstere Gestalten aufgetaucht sein. Sie belagern sein Haus.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //Ich habe gehört, dass irgendwelche Schergen sich auf Lobarts Hof breit gemacht haben. Vielleicht sollte man ihm helfen.
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
	description	 = 	"Kann ich ein Schaf kaufen?";
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
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //Kann ich ein Schaf kaufen?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //Jederzeit, wenn du den Preis bezahlen kannst. Ein Schaf kostet dich 100 Goldstücke.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //Wenn du die bezahlst, kannst du dir ein Schaf mitnehmen. Aber du musst es gut behandeln.
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
	description	 = 	"Hier sind 100 Goldstücke. Gib mir ein Schaf.";
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
	AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_00"); //Hier sind 100 Goldstücke. Gib mir ein Schaf.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //Gut. Dann nimm dir die Liesel mit - du findest sie hier auf der Weide.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //Sag ihr einfach, sie soll dir folgen. Sie ist ziemlich klug für ein Schaf. Behandele sie gut!
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //Schon wieder? Na schön. Nimm dir die Liesel mit.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //Liesel? Das letzte Schaf hieß schon Liesel ...
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //Alle Schafe heißen Liesel.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //Bis auf die Hammel, natürlich.
				AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_07"); //Und wie heißen die?
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_08"); //Horst.
			};
		};
		
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");  // *** FIXME *** noch entsprechenden WP/FP eintragen
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //Soviel Gold hast du nicht. Billiger kann ich dir keins geben.
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















