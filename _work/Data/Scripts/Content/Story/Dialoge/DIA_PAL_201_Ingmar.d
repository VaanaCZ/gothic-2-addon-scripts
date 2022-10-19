///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ingmar_EXIT   (C_INFO)
{
	npc         = Pal_201_Ingmar;
	nr          = 999;
	condition   = DIA_Ingmar_EXIT_Condition;
	information = DIA_Ingmar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ingmar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Hallo		(C_INFO)
{
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  2;
	condition	 = 	DIA_Ingmar_Hallo_Condition;
	information	 = 	DIA_Ingmar_Hallo_Info;
	permanent    =  TRUE;
	important	 = 	TRUE;
};
//------------------------------------
var int DIA_Ingmar_Hallo_permanent;
//------------------------------------
func int DIA_Ingmar_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (DIA_Ingmar_Hallo_permanent == FALSE)
	&& (Kapitel < 4)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Hallo_Info ()
{
	if (EnterOW_Kapitel2 == FALSE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE)
	{ 
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_00"); //Laut der mir vorliegenden Berichte ist das Minental ein gefährlicher Ort.
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_01"); //Du solltest dich gut ausrüsten, bevor du losziehst.
	}
	else if (MIS_OLDWORLD == LOG_SUCCESS)
	&& 		(LordHagen.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_02"); //Die Situation im Minental ist beunruhigend. Aber wir werden Pläne entwickeln, um die Gefahren zu beseitigen und das Erz und unsere Jungs da rauszuholen.
		DIA_Ingmar_Hallo_permanent = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Ingmar_Hallo_06_03"); //Ich denke, du bist gekommen, um mit Lord Hagen zu sprechen. Also solltest du das auch tun.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info Krieg mit den Orks 
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Krieg		(C_INFO)
{
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  99;
	condition	 = 	DIA_Ingmar_Krieg_Condition;
	information	 = 	DIA_Ingmar_Krieg_Info;
	permanent    =  FALSE;
	description	 =  "Wie ist die Lage auf dem Festland?";
};
func int DIA_Ingmar_Krieg_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Krieg_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_Krieg_15_00"); //Wie ist die Lage auf dem Festland?
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_01"); //Der Krieg ist noch nicht gewonnen, obwohl die königlichen Truppen die Orks bereits zurücktreiben.
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_02"); //Doch an vielen Stellen sammeln sich kleine Orkhorden und versuchen, unsere Armee auseinander zu reißen.
	AI_Output (self, other, "DIA_Ingmar_Krieg_06_03"); //Sie kämpfen ohne Ehre, ohne Glauben - und genau deshalb werden wir letztendlich siegreich sein.
};	

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_CanTeach		(C_INFO)
{ 
	npc		 	 = 	Pal_201_Ingmar;
	nr			 =  100;
	condition	 = 	DIA_Ingmar_CanTeach_Condition;
	information	 = 	DIA_Ingmar_CanTeach_Info;
	permanent    =  TRUE;
	description	 = 	"Kann ich von dir lernen?";
};

func int DIA_Ingmar_CanTeach_Condition ()
{	
	if (Ingmar_TeachSTR == FALSE)
	{	
		return TRUE;
	};
};
func void DIA_Ingmar_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_CanTeach_15_00"); //Kann ich von dir lernen?
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Ingmar_CanTeach_06_01"); //Lerne von mir, wie du deinen Arm stärkst, um deinen Waffen die nötige Schlagkraft zu verleihen.
			Ingmar_TeachSTR = TRUE;
			B_LogEntry (TOPIC_CityTeacher,"Paladin Ingmar kann mir helfen, stärker zu werden.");
	}
	else 
	{
		AI_Output (self, other, "DIA_Ingmar_CanTeach_06_02"); //Ich unterweise nur die Anhänger unseres Ordens.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Teach		(C_INFO)
{
	npc		  	 = 	Pal_201_Ingmar;
	nr			 = 	6;
	condition	 = 	DIA_Ingmar_Teach_Condition;
	information	 = 	DIA_Ingmar_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich will stärker werden.";
};
func int DIA_Ingmar_Teach_Condition ()
{	
	if (Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Ingmar_Teach_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_Teach_15_00"); //Ich will stärker werden.
	
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_Teach_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
};
func void DIA_Ingmar_Teach_BACK()
{
	if (other.attribute [ATR_STRENGTH] >= T_MAX)
	{
		AI_Output (self, other, "DIA_Ingmar_Teach_06_00"); //Du bist stark wie ein Troll! Mehr kannst du von mir nicht lernen.
	};
	Info_ClearChoices (DIA_Ingmar_TEACH);
};
func void DIA_Ingmar_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_TEACH_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
	
};
func void DIA_Ingmar_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	
	Info_ClearChoices   (DIA_Ingmar_Teach);
	
	Info_AddChoice 		(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_Teach_BACK);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Ingmar_Teach_1);
	Info_AddChoice		(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Ingmar_Teach_5);
	
	
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

INSTANCE DIA_Ingmar_KAP3_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP3_EXIT_Condition;
	information	= DIA_Ingmar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP3_EXIT_Info()
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

INSTANCE DIA_Ingmar_KAP4_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP4_EXIT_Condition;
	information	= DIA_Ingmar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

	
///////////////////////////////////////////////////////////////////////
//	Info Orkelite
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_ORKELITE		(C_INFO)
{
	npc		 = 	Pal_201_Ingmar;
	nr		 = 	40;
	condition	 = 	DIA_Ingmar_ORKELITE_Condition;
	information	 = 	DIA_Ingmar_ORKELITE_Info;

	description	 = 	"Die Orks planen eine Großoffensive.";
};

func int DIA_Ingmar_ORKELITE_Condition ()
{
	if ((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems (other,ItRi_OrcEliteRing)) || (Hagen_SawOrcRing == TRUE))
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};

func void DIA_Ingmar_ORKELITE_Info ()
{

	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_00"); //Die Orks planen eine Großoffensive.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_06_01"); //Tatsächlich. Ist ja sehr interessant. Woher willst du das wissen?

	if (TalkedTo_AntiPaladin == TRUE)
	{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_02"); //Ich habe mit ihnen gesprochen.
	};

	AI_Output (other, self, "DIA_Ingmar_ORKELITE_15_03"); //Einige von ihren Anführern treiben sich hier in der Gegend herum.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_06_04"); //Mmh. Das klingt nicht nach der typischen Kriegsführung der Orks.

	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Seht mal zu, wie ihr sie wieder los werdet.", DIA_Ingmar_ORKELITE_loswerden );
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Was sollten wir jetzt tun?", DIA_Ingmar_ORKELITE_wasTun );
	Info_AddChoice	(DIA_Ingmar_ORKELITE, "Was hat das zu bedeuten?", DIA_Ingmar_ORKELITE_wieso );

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"Ingmar war sehr interessiert an der Geschichte mit den orkischen Elitekämpfern."); 

	MIS_KillOrkOberst = LOG_RUNNING;
};
func void DIA_Ingmar_ORKELITE_loswerden ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_loswerden_15_00"); //Seht mal zu, wie ihr sie wieder los werdet.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_loswerden_06_01"); //Es würde schon reichen, wenn wir mehr Informationen hätten. Ich werde jemanden entsenden, die Umgebung auszukundschaften.
	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_wieso_15_00"); //Was hat das zu bedeuten?
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_01"); //Wenn es stimmt, was du behauptest, dann hoffen sie uns mit einem Angriff ihrer besten Krieger von innen her zu schwächen.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_02"); //Normalerweise kommen auf einen Kriegsherr eine ganze Horde von Orkkriegern. Nur selten sieht man sie selbst zu zweit oder mehreren.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_03"); //Das tun sie aus gutem Grund. Ihre Anführer sind die Herzstücke ihrer Angriffsstrategie und werden normalerweise von den Orkkriegern umringt.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wieso_06_04"); //Somit ist es sehr schwer, an einen von ihnen näher heran zu kommen, ohne sich durch eine Horde von mindestens 30 Kriegern kämpfen zu müssen.
	
	B_LogEntry (TOPIC_OrcElite,"Ingmar erzählte etwas von einem Anführer der orkischen Kriegsherren. "); 
};

func void DIA_Ingmar_ORKELITE_wasTun ()
{
	AI_Output (other, self, "DIA_Ingmar_ORKELITE_wasTun_15_00"); //Was sollen wir jetzt tun?
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_01"); //Wenn sie so gehäuft auftreten, bilden sie eine Art Stoßtrupp, der von dem Höchsten ihres Standes angeführt wird.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_02"); //Dieser oberste Kriegsherr bildet das Hauptquartier und zieht sich in irgendeine Höhle zurück, um von dort aus seine Truppen in die Schlacht zu schicken.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_03"); //Wenn wir an diesen Oberst heran kommen könnten, hätten wir einen entscheidenden Vorteil.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_04"); //Ein Oberst der Orks hält sich gerne in der Nähe seiner Feinde auf. Es wäre ratsam, in der näheren Umgebung der Stadt nach seiner Höhle zu suchen.
	AI_Output (self, other, "DIA_Ingmar_ORKELITE_wasTun_06_05"); //Bei Lobarts Hof sind einige Orks gesehen worden. Vielleicht solltest du dort deine Suche beginnen.

	B_LogEntry (TOPIC_OrcElite,"Den Oberst der Orks soll ich laut Ingmar in irgendeiner Höhle in der Umgebung von Lobarts Hof finden. Ingmar will, dass ich ihn finde und zur Strecke bringe. "); 
	
	Info_ClearChoices	(DIA_Ingmar_ORKELITE);
};


///////////////////////////////////////////////////////////////////////
//	Info Hauptquartier
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_HAUPTQUARTIER		(C_INFO)
{
	npc			 = 	Pal_201_Ingmar;
	nr			 = 	41;
	condition	 = 	DIA_Ingmar_HAUPTQUARTIER_Condition;
	information	 = 	DIA_Ingmar_HAUPTQUARTIER_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich habe das Hauptquartier der Orks ausfindig machen können";
};

func int DIA_Ingmar_HAUPTQUARTIER_Condition ()
{
	if (Npc_IsDead(OrkElite_AntiPaladinOrkOberst))
	&& (Npc_KnowsInfo(other, DIA_Ingmar_ORKELITE))
		{
				return TRUE;
		};
};

func void DIA_Ingmar_HAUPTQUARTIER_Info ()
{
	AI_Output (other, self, "DIA_Ingmar_HAUPTQUARTIER_15_00"); //Ich habe das Hauptquartier der Orks ausfindig machen können. Der oberste Kriegsherr ist gefallen.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_01"); //Das sind großartige Neuigkeiten. Das wird die Orks für eine Weile beschäftigen.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_02"); //Alle Achtung. Wenn wir noch mehr Ritter deiner Art hätten, wäre die bevorstehende Schlacht ein Zuckerschlecken.
	AI_Output (self, other, "DIA_Ingmar_HAUPTQUARTIER_06_03"); //Hier. Lass dir von unserem Gold deine Ausrüstung richten.

	B_GivePlayerXP (XP_KilledOrkOberst);
	CreateInvItems (self, ItMi_Gold, 300);									
	B_GiveInvItems (self, other, ItMi_Gold, 300);					
	MIS_KillOrkOberst = LOG_SUCCESS;
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

INSTANCE DIA_Ingmar_KAP5_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP5_EXIT_Condition;
	information	= DIA_Ingmar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Ingmar_KAP6_EXIT(C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 999;
	condition	= DIA_Ingmar_KAP6_EXIT_Condition;
	information	= DIA_Ingmar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ingmar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ingmar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ingmar_PICKPOCKET (C_INFO)
{
	npc			= Pal_201_Ingmar;
	nr			= 900;
	condition	= DIA_Ingmar_PICKPOCKET_Condition;
	information	= DIA_Ingmar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Es wäre fast unmöglich seine Schriftrolle zu stehlen)";
};                       

FUNC INT DIA_Ingmar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (105 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Ingmar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ingmar_PICKPOCKET);
	Info_AddChoice		(DIA_Ingmar_PICKPOCKET, DIALOG_BACK 		,DIA_Ingmar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ingmar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ingmar_PICKPOCKET_DoIt);
};

func void DIA_Ingmar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 105)
	{
		B_GiveInvItems (self, other, ITWr_Manowar, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Ingmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Ingmar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ingmar_PICKPOCKET);
};






































