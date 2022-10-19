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
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_00"); //Willkommen im ´Ring des Wassers´, Bruder.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_01"); //Du solltest jetzt zu Vatras gehen ...
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
	AI_Output (self ,other, "DIA_Cord_Hallo_14_00"); //Wenn du ein Problem mit den Wölfen oder Feldräubern hast, dann frag einen der jüngeren Söldner.
	AI_Output (self ,other, "DIA_Cord_Hallo_14_01"); //Zu mir kannst du kommen, wenn hier die Paladine anrücken.
	
	if (SC_IsRanger == FALSE)
	{	
		AI_Output (other, self, "DIA_Cord_Hallo_15_02"); //Was?
		AI_Output (self ,other, "DIA_Cord_Hallo_14_03"); //Jedes Mal, wenn einer von euch Bauern zu mir kommt, geht's darum, harmlose Tiere abzumetzeln.
		AI_Output (other, self, "DIA_Cord_Hallo_15_04"); //Ich bin keiner der Bauern.
		AI_Output (self ,other, "DIA_Cord_Hallo_14_05"); //Ach? Was willst du dann?
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
	description = "Ich will Söldner werden!";
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
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_14"); //Solange du nicht vernünftig mit einer Waffe umgehen kannst, bist du hier falsch!
};

FUNC VOID DIA_Cord_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Cord_WannaJoin_15_00"); //Ich will Söldner werden!
	if (Cord_SchonmalGefragt == FALSE)
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_01"); //Du siehst mir eher wie ein Kandidat für die Feldarbeit aus, Junge.
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_02"); //Kannst du denn mit einer Waffe umgehen?
		Cord_SchonmalGefragt = TRUE;
	}
	else
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_03"); //Bist du mittlerweile besser geworden?
	};
	
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_04"); //Wie sieht's mit Einhandwaffen aus?
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_05"); //Damit bin ich schon ganz gut.
	}
	else
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_06"); //Na ja ...
	};
	AI_Output (self ,other, "DIA_Cord_WannaJoin_14_07"); //Und wie steht's mit Zweihändern?
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_08"); //Damit kann ich umgehen.
	}
	else
	{
		AI_Output (other, self, "DIA_Cord_WannaJoin_15_09"); //Ich werde bestimmt besser!
	};
	
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	|| (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_10"); //Du bist jedenfalls kein blutiger Anfänger mehr. Gut. Ich werde für dich stimmen.
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_11"); //Was dir noch an Wissen fehlt, kannst du von mir lernen.
		Cord_Approved = TRUE;
		B_GivePlayerXP (XP_Cord_Approved);
		B_LogEntry (TOPIC_SLDRespekt,"Cord's Stimme habe ich im Sack.");
		Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry (Topic_SoldierTeacher,"Cord kann mich im Umgang mit Ein - und Zweihändern unterrichten.");
	}
	else
	{
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_12"); //Das heißt mit anderen Worten: Du bist ein blutiger Anfänger!
		AI_Output (self ,other, "DIA_Cord_WannaJoin_14_13"); //Jeder Söldner muss sich auf seine Kameraden verlassen können. Unser aller Leben hängt davon ab.
		B_Cord_BeBetter ();
		
		Log_CreateTopic (TOPIC_CordProve,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_CordProve,LOG_RUNNING); 
		B_LogEntry (TOPIC_CordProve,"Cord wird mir seine Stimme geben, wenn ich ein besserer Kämpfer bin."); 
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

	description	 = 	"Ich habe gehört, dass du dem ´Ring des Wassers´ angehörst.";
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
	AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_00"); //Ich habe gehört, dass du dem ´Ring des Wassers´ angehörst.
	
	if (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_01"); //Welcher Dreckskerl konnte denn da schon wieder seine Schnauze nicht halten?
		
		if (SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_02"); //Lee erzählte mir davon.
		};
	
		if (SC_KnowsCordAsRangerFromLares == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_YouAreRanger_15_03"); //Lares sagte mir, du könntest mir helfen, wenn ich dir sage, dass ich `unter seinem Flügel wohne`.
		};
	};
	
	AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_04"); //(seufz) Sieht so aus, als ob ich mich jetzt mit dir herumschlagen müsste, was?
	//AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_05"); //Was muss ich denn jetzt für dich machen, damit du die Schnauze hälst?
	AI_Output	(self, other, "DIA_Addon_Cord_Add_14_01"); //Also gut, was brauchst du?
	AI_Output	(self, other, "DIA_Addon_Cord_YouAreRanger_14_06"); //Und pass bloß auf, was du jetzt sagst. Wenn mir nicht gefällt, was ich von dir zu hören kriege, dann zieh ich dir das Fell über die Ohren.
	
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Ich brauche eigentlich gar nichts. Ich komme schon alleine klar.", DIA_Addon_Cord_YouAreRanger_nix );
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Ich will deine Rüstung.", DIA_Addon_Cord_YouAreRanger_ruestung );
	Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Ich will deine Waffe!", DIA_Addon_Cord_YouAreRanger_waffe );
	if (Cord_Approved == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Bring mir bei, wie man kämpft.", DIA_Addon_Cord_YouAreRanger_kampf );
	};
	if (hero.guild == GIL_NONE)
	{
		//Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Verschwinde hier. Ich will deinen Platz auf dem Hof einnehmen.", DIA_Addon_Cord_YouAreRanger_weg );
	};
	if (hero.guild == GIL_NONE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Du könntest mir helfen bei den Söldnern aufgenommen zu werden.", DIA_Addon_Cord_YouAreRanger_SLDAufnahme );
	};
	//Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Bezahl mich für mein Schweigen.", DIA_Addon_Cord_YouAreRanger_Gold );
};
var int Cord_SC_Dreist;
func void 	B_DIA_Addon_Cord_YouAreRanger_WARN ()
{
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_WARN_14_00"); //(droht) Und wehe dir, wenn mir zu Ohren kommt, dass du die Klappe nicht halten kannst. Und das sage ich nur einmal, klar?
};
func void 	B_DIA_Addon_Cord_YouAreRanger_FRESSE ()
{
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_FRESSE_14_00"); //(böse) Das war´s. Jetzt hast du den Bogen überspannt. Ich werde mit dir den Hof fegen.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	Cord_RangerHelp_GetSLD = FALSE;
	Cord_RangerHelp_Fight = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
};
func void DIA_Addon_Cord_YouAreRanger_ruestung ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_ruestung_15_00"); //Ich will deine Rüstung.

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_ruestung_14_01"); //Noch so ein Spruch und du kannst deine Zähne vom Boden aufsammeln.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe ()
{
	AI_Output (other, self, "DIA_Addon_Cord_YouAreRanger_Add_15_00"); //Ich will deine Waffe!

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Cord_Add_14_03"); //(gefährlich) Ach ja?
		AI_Output (self, other, "DIA_Addon_Cord_Add_14_02"); //(grimmig) Das könnte dir so passen!
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_weg_15_00"); //Verschwinde hier. Ich will deinen Platz auf dem Hof einnehmen.

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_weg_14_01"); //Werd mal hier nicht ulkig, Kleiner, sonst brech´ ich dir sämtliche Knochen.
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
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_kampf_15_00"); //Bring mir bei, wie man kämpft.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_kampf_14_01"); //Na gut. Was noch?
	Cord_RangerHelp_Fight = TRUE;

	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Das reicht mir.", DIA_Addon_Cord_YouAreRanger_reicht );
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};
func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00"); //Du könntest mir helfen, bei den Söldnern aufgenommen zu werden.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01"); //(lacht) Das kann ja heiter werden. Gut. Werd´s versuchen. Was noch?

	Cord_RangerHelp_GetSLD = TRUE;
	
	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Cord_YouAreRanger, "Das reicht mir.", DIA_Addon_Cord_YouAreRanger_reicht );
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};
func void DIA_Addon_Cord_YouAreRanger_Gold ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_Gold_15_00"); //Bezahl mich für mein Schweigen.
	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_Gold_14_01"); //Das könnte dir so passen. Da hast du aber leider Pech. Ich lasse mich nicht erpressen, du Mistkerl.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE ();
	};
};
func void DIA_Addon_Cord_YouAreRanger_nix ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_nix_15_00"); //Ich brauche eigentlich gar nichts. Ich komme schon alleine klar.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_nix_14_01"); //Na gut. Wie du willst. Du hattest deine Chance.
	B_DIA_Addon_Cord_YouAreRanger_WARN ();
	Info_ClearChoices	(DIA_Addon_Cord_YouAreRanger);
};
func void DIA_Addon_Cord_YouAreRanger_reicht ()
{
	AI_Output			(other, self, "DIA_Addon_Cord_YouAreRanger_reicht_15_00"); //Das reicht mir.
	AI_Output			(self, other, "DIA_Addon_Cord_YouAreRanger_reicht_14_01"); //Wenn´s mehr nicht ist.
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

	description	 = 	"Hilf mir Söldner zu werden.";
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
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_00"); //Hat sich schon erledigt.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_01"); //Oh. Dann wird´s schwierig mit der Hilfe.
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_02"); //Was soll das heißen?
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_03"); //Tja. Das bedeutet, dass ich dir nicht helfen kann.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_04"); //Oder willst du, dass ich mich mit jedem einzelnen Söldner anlege, damit du hier aufgenommen wirst?
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_05"); //Das musst du schon selber machen.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
};
func void B_Cord_ComeLaterWhenDone ()
{
	AI_Output	(self, other, "DIA_Addon_Cord_ComeLaterWhenDone_14_00"); //Dann mach das erst mal und komm später wieder her.
	AI_StopProcessInfos (self);
};
func void B_Cord_IDoItForYou ()
{
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_00"); //Ahja. Das ist einfach. Pass auf. Komm morgen wieder, dann habe ich die Sache für dich erledigt.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_01"); //Allerdings musst du dafür auch etwas für mich tun.
	AI_Output	(other, self, "DIA_Addon_Cord_IDoItForYou_15_02"); //Und das wäre?
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_03"); //Nicht weit von hier im Südosten gibt es in den Bergen ein kleines Lager der Banditen.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_04"); //Wenn du von hier aus nach Südosten gehst kannstdu schon den Turm sehen, der dort steht.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_05"); //Einer meiner Leute, sein Name ist Patrick, ist vor einigen Tagen dorthin aufgebrochen, um mit den Dreckskerlen zu handeln.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_06"); //Tja. Ich hab ihm gesagt, dass es eine Schnapsidee ist. Aber der Idiot wollte nicht auf mich hören.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_07"); //Ich nehme an, dass sie aus ihm Kleinholz gemacht haben. Sicher weiß ich das allerdings nicht.
	AI_Output	(self, other, "DIA_Addon_Cord_IDoItForYou_14_08"); //Du wirst es für mich heraus finden.

	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Cord wird sich um Torlofs Probe kümmern. Cords Kumpel Patrick ist verschwunden. Ich soll zum kleinen Berglager der Banditen im Südosten gehen und nachsehen, ob Patrick dort ist."); 

	
	Info_ClearChoices	(DIA_Addon_Cord_RangerHelp2GetSLD);	
	Info_AddChoice	(DIA_Addon_Cord_RangerHelp2GetSLD, "Vergiss es. Die Aufgabe ist viel schwieriger als die von Torlof.", B_Cord_IDoItForYou_mist );
	Info_AddChoice	(DIA_Addon_Cord_RangerHelp2GetSLD, "Was sagt mir, dass sie nicht auch aus MIR Kleinholz machen?", B_Cord_IDoItForYou_Dexter );
		
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};
func void B_Cord_IDoItForYou_mist ()
{
	AI_Output			(other, self, "Dia_Addon_Cord_IDoItForYou_mist_15_00"); //Vergiss es. Die Aufgabe ist viel schwieriger als die von Torlof.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_01"); //Das muss es ja nicht. So ein kleines schmieriges Kerlchen wie du ist unscheinbar und wird sie nicht weiter interessieren.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_02"); //Außerdem kann ich es nicht tun. Wenn die Jungs einen Söldner sehen, dann fängt ihnen gleich der Buckel an zu brennen.
};
func void B_Cord_IDoItForYou_Dexter ()
{
	AI_Output			(other, self, "Dia_Addon_Cord_IDoItForYou_Dexter_15_00"); //Was sagt mir, dass sie nicht auch aus MIR Kleinholz machen?
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_01"); //Weil ich den Namen ihres Anführers kenne. Er heißt Dexter. Du wirst einfach behaupten, dass du den Kerl kennst.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_02"); //Dann werden sich seine Jungs zweimal überlegen, ob sie dir einfach so auf Verdacht das Fell über die Ohren ziehen.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_03"); //Es kann natürlich trotzdem gefährlich werden.
	AI_Output			(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_04"); //Aber du machst das schon.
	Info_ClearChoices	(DIA_Addon_Cord_RangerHelp2GetSLD);	
	
	B_LogEntry (TOPIC_Addon_RangerHelpSLD,"Der Anführer der Banditen heißt Dexter."); 

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Der Söldner Cord sucht nach seinem Kumpel Patrick."); 
		
	MIS_Addon_Cord_Look4Patrick = LOG_RUNNING;
	Ranger_SCKnowsDexter = TRUE; 
};
func void DIA_Addon_Cord_RangerHelp2GetSLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_00"); //Hilf mir, Söldner zu werden.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_01"); //Lass mal überlegen. Mmh. An Torlof wirst du wohl vorbei müssen, wenn du hier was werden willst.
	AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_02"); //Warst du schon bei Torlof deswegen?

	if (Torlof_Go == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_03"); //Nicht wirklich.
		B_Cord_ComeLaterWhenDone ();
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_04"); //Ja. Das ist die Geschichte mit der Probe.
		AI_Output	(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_05"); //Aha. Und wie sieht die aus?
		
		if	(Torlof_ProbeBestanden == TRUE)
		|| ((MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)&& (Npc_IsDead (Rumbold))&& (Npc_IsDead (Rick)))
		|| ((MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)&&((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE)||(Npc_IsDead (Sekob))))
		{
			B_Cord_RangerHelpObsolete ();
		}		
		else if (Torlof_Probe == 0)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_06"); //Bisher habe ich sie noch nicht angenommen.
			B_Cord_ComeLaterWhenDone ();
		}		
		else if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_07"); //Ich soll auf Sekobs Hof die Pacht eintreiben.
			B_Cord_IDoItForYou ();
		}
		else if (Torlof_Probe == Probe_Bengar)
		{
			AI_Output	(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_08"); //Ich soll die Miliz von Bengars Hof vertreiben.
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

	description	 = 	"Ich war bei Dexter.";
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
	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_00"); //Ich war bei Dexter.
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_01"); //Und?
	
	if (Npc_IsDead(BDT_1060_Dexter))
	{
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_02"); //Dexter ist tot.
	};
	
	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_03"); //Von deinem Kollegen Patrick gab´s da oben keine Spur.
	
	if (Dexter_KnowsPatrick == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_04"); //Dexter konnte sich zwar an ihn erinnern, aber er sagte, Patrick sei schon länger nicht mehr da gewesen.
		AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_05"); //Und du bist dir sicher, dass Dexter dich nicht belogen hat?
		AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_06"); //Nein. Das bin ich nicht. Aber mehr kann ich dir auch nicht sagen.
		
	};
	
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_07"); //Ich versteh´ das nicht. Der Kerl ist wie vom Erdboden verschluckt.
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_08"); //Tja, du hast dich an deinen Teil der Abmachung gehalten ...

	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_GivePlayerXP (XP_Addon_Cord_Look4Patrick);

	AI_Output	(other, self, "DIA_Addon_Cord_TalkedToDexter_15_09"); //Was ist jetzt mit Torlofs Probe?
	AI_Output	(self, other, "DIA_Addon_Cord_TalkedToDexter_14_10"); //Du kannst ruhig zurück zu Torlof gehen. Betrachte den Auftrag und damit die Probe als erledigt. Ich hab' dir doch gesagt, ich kümmere mich darum.

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
	description = "Patrick ist wieder da.";
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
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_00"); //Patrick ist wieder da.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_01"); //Ja, Mann. Daran habe ich schon nicht mehr geglaubt. Du ...
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_02"); //Hey, tu mir einen Gefallen.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_03"); //Ja?
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_04"); //Spar dir deine Dankesrede.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_05"); //Ich wollte mich gar nicht bedanken.
	AI_Output (other, self, "DIA_Addon_Cord_ReturnPatrick_15_06"); //Sondern ... ?
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_07"); //(grinst) … dir nur sagen, dass du ein verfluchter Teufelskerl bist.
	AI_Output (self ,other, "DIA_Addon_Cord_ReturnPatrick_14_09"); //(grinst) Bleib sauber!
	
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
	description = "Was soll ich eher lernen, einhändigen oder zweihändigen Kampf?";
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
	AI_Output (other, self, "DIA_Cord_ExplainSkills_15_00"); //Was soll ich eher lernen, einhändigen oder zweihändigen Kampf?
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_01"); //Die beiden Waffengattungen sind recht ähnlich.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_02"); //Sobald du die nächste Stufe bei einer Waffengattung erreicht hast, lernst du automatisch die andere mit.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_03"); //Wenn du zum Beispiel ein guter Kämpfer mit der Einhandwaffe bist, aber noch ein Anfänger mit der Zweihandwaffe ...
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_04"); //... wirst du bei allem, was du an Training in Einhandwaffen investierst, auch mit Zweihandwaffen besser werden.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_05"); //Wenn du immer nur eine Waffengattung trainierst, wird das Training für dich anstrengender.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_06"); //Trainierst du immer beide, kommst du mit weniger Einsatz genauso weit.
	AI_Output (self ,other, "DIA_Cord_ExplainSkills_14_07"); //Im Endeffekt kommt es aufs selbe raus - es ist deine Wahl.
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
	description = "Wo liegt der Vorteil von Einhand- oder Zweihandwaffen?";
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
	AI_Output (other, self, "DIA_Cord_ExplainWeapons_15_00"); //Wo liegt der Vorteil von Einhand- oder Zweihandwaffen?
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_01"); //Eine gute Frage. Ich sehe, du hast dich schon mit dem Thema auseinandergesetzt.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_02"); //Einhänder sind schneller, aber etwas schwächer.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_03"); //Zweihänder richten mehr Schaden an, aber du kannst nicht so schnell zuschlagen.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_04"); //Außerdem ist mehr Stärke erforderlich, um einen Zweihänder zu führen. Das bedeutet zusätzliches Training.
	AI_Output (self ,other, "DIA_Cord_ExplainWeapons_14_05"); //Nur, wenn du bereit bist, viel zu investieren, hast du eine Chance, richtig gut zu werden.
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
	description = "Bring mir bei, wie man kämpft!";
};                       

FUNC INT DIA_Cord_Teach_Condition()
{
	return TRUE;
};

FUNC VOID B_Cord_Zeitverschwendung ()
{
	AI_Output (self ,other,"DIA_Cord_Teach_14_03"); //Ich verschwende meine Zeit nicht mit Anfängern.
};

FUNC VOID DIA_Cord_Teach_Info()
{	
	AI_Output (other,self, "DIA_Cord_Teach_15_00"); //Bring mir bei, wie man kämpft!
	if (Cord_Approved == TRUE)
	|| (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	|| (Cord_RangerHelp_Fight == TRUE)//ADDON
	{
		if ((Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)&&(Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0))
		|| (Cord_RangerHelp_Fight == TRUE)//ADDON
		{
		
		
			AI_Output (self ,other,"DIA_Cord_Teach_14_01"); //Ich kann dich an jeder Waffe ausbilden - womit wollen wir anfangen.
			Cord_Approved = TRUE;
		}
		else if  (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
		{
			AI_Output (self ,other,"DIA_Cord_Teach_14_02"); //Ich kann dich im Umgang mit Einhandwaffen trainieren. Aber für Zweihänder bist du noch zu schlecht.
			B_Cord_Zeitverschwendung();
			Cord_Approved = TRUE;
		}
		else if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
		{
			AI_Output (self ,other,"DIA_Cord_Teach_14_04"); //Also mit Einhandwaffen bist du noch ein blutiger Anfänger! Aber du kannst schon ganz passabel mit einem Zweihänder umgehen.
			AI_Output (self ,other,"DIA_Cord_Teach_14_05"); //Wenn du Erfahrung mit Einhandwaffen brauchst, such dir einen anderen Lehrer.
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
		AI_Output (self ,other,"DIA_Cord_Teach_14_06"); //Ich trainiere nur Söldner oder würdige Anwärter!
	};
};

FUNC VOID DIA_Cord_Teach_Back ()
{
	if (Cord_Merke_1h < other.HitChance[NPC_TALENT_1H])
	|| (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output (self ,other,"DIA_Cord_Teach_BACK_14_00"); //Du bist schon besser geworden - weiter so!
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












