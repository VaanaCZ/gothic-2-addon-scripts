
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

INSTANCE DIA_Jorgen_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP3_EXIT_Condition;
	information	= DIA_Jorgen_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Jorgen_PICKPOCKET (C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 900;
	condition	= DIA_Jorgen_PICKPOCKET_Condition;
	information	= DIA_Jorgen_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jorgen_PICKPOCKET_Condition()
{
	C_Beklauen (59, 70);
};
 
FUNC VOID DIA_Jorgen_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jorgen_PICKPOCKET);
	Info_AddChoice		(DIA_Jorgen_PICKPOCKET, DIALOG_BACK 		,DIA_Jorgen_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jorgen_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jorgen_PICKPOCKET_DoIt);
};

func void DIA_Jorgen_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jorgen_PICKPOCKET);
};
	
func void DIA_Jorgen_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jorgen_PICKPOCKET);
};
//*********************************************************************
//	Info Hallo 
//*********************************************************************
INSTANCE DIA_Jorgen_Hallo   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 4;
	condition   = DIA_Jorgen_Hallo_Condition;
	information = DIA_Jorgen_Hallo_Info;
	permanent   = FALSE;
	important	= TRUE;
};

FUNC INT DIA_Jorgen_Hallo_Condition()
{
	if (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Hallo_Info()
{
	AI_Output (self ,other,"DIA_Jorgen_Hallo_07_00"); //Hey, du!

	if ((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_01"); //Ich sehe, du gehörst zum Magierkloster.
		AI_Output (other,self ,"DIA_Jorgen_Hallo_15_02"); //Ja, warum?
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_03"); //Könnt ihr noch eine Arbeitskraft gebrauchen?
	}
	else
	{
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_04"); //Hey du, warst du schon mal im Kloster?
		AI_Output (other,self ,"DIA_Jorgen_Hallo_15_05"); //Kann sein, wieso?
		AI_Output (self ,other,"DIA_Jorgen_Hallo_07_06"); //Nehmen die noch Leute?
	};

	AI_Output (self ,other,"DIA_Jorgen_Hallo_07_07"); //Ich weiß sonst nicht, wo ich bleiben soll.
}; 

//*********************************************************************
//	Hast du einen Novizen hier vorbeirennen gesehen? 
//*********************************************************************
INSTANCE DIA_Jorgen_Novice   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 6;
	condition   = DIA_Jorgen_Novice_Condition;
	information = DIA_Jorgen_Novice_Info;
	permanent   = FALSE;
	description	= "Hast du einen Novizen vorbeikommen sehen?";
};

FUNC INT DIA_Jorgen_Novice_Condition()
{
	IF (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Novice_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Novice_15_00"); //Hast du einen Novizen vorbeikommen sehen?
	AI_Output (self ,other,"DIA_Jorgen_Novice_07_01"); //Ja klar, er ist da lang.
	AI_PointAt	(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output (self,other,"DIA_Jorgen_Novice_07_02"); //Er ist von der Brücke ins Wasser gesprungen und geschwommen, als wenn ein Hai hinter ihm her wäre.
	AI_StopPointAt(self);
}; 

//*********************************************************************
//	Wenn du ins Kloster willst, solltest du mir Milten reden. 
//*********************************************************************
INSTANCE DIA_Jorgen_Milten   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 5;
	condition   = DIA_Jorgen_Milten_Condition;
	information = DIA_Jorgen_Milten_Info;
	permanent   = FALSE;
	description	= "Wenn du ins Kloster willst, solltest du mit Milten reden ...";
};

FUNC INT DIA_Jorgen_Milten_Condition()
{
	if (Kapitel == 3) 
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE)
	&& (MIS_OLDWORLD == LOG_SUCCESS)
	&& (MiltenNW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
			return TRUE;
	};
};

FUNC VOID DIA_Jorgen_Milten_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Milten_15_00"); //Wenn du ins Kloster willst, solltest du mit Milten reden. Er wird dir sicher weiterhelfen.
	AI_Output (self ,other,"DIA_Jorgen_Milten_07_01"); //Was meinst du, lassen die mich da überhaupt rein?
	AI_Output (other,self ,"DIA_Jorgen_Milten_15_02"); //Vielleicht. Aber so wie du aussiehst, kann ich dich mir nur schwer in einer Novizenrobe vorstellen.
	AI_Output (self ,other,"DIA_Jorgen_Milten_07_03"); //Quatsch keinen Unfug. Novizenrobe. Ich brauch was zwischen die Kiemen, sonst beiß ich noch in die nächste Baumrinde.
}; 

//*********************************************************************
//	DIA_Jorgen_Home
//*********************************************************************

INSTANCE DIA_Jorgen_Home   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 7;
	condition   = DIA_Jorgen_Home_Condition;
	information = DIA_Jorgen_Home_Info;

	description	= "Wo kommst du her?";
};

FUNC INT DIA_Jorgen_Home_Condition()
{
	if (Kapitel >= 3) 
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_Home_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_Home_15_00"); //Wo kommst du her?
	AI_Output (self ,other,"DIA_Jorgen_Home_07_01"); //Ich war Kapitän eines großen Walfängers, mein Junge. Die See ist mein Zuhause.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_02"); //Mein Schiff, die gute alte Magdalena, ist vor einigen Monden von Piraten versenkt worden und nun bin ich hier gestrandet.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_03"); //Ich wünschte mir nichts mehr, als wieder in See stechen zu können, doch seit ich hier bin, hat in dem verfluchten Hafen kein Schoner mehr angelegt.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_04"); //Das einzige Schiff, was in Khorinis vor Anker liegt, ist die verfluchte Kriegsgaleere des Königs, und die nehmen keine Leute.
	AI_Output (self ,other,"DIA_Jorgen_Home_07_05"); //Was bleibt mir denn noch? In der Stadt gibt es keine Arbeit für mich. Ich lasse nichts unversucht.
	
}; 

//*********************************************************************
//	DIA_Jorgen_BeCarefull
//*********************************************************************
INSTANCE DIA_Jorgen_BeCarefull   (C_INFO)
{
	npc         = VLK_4250_Jorgen;
	nr          = 8;
	condition   = DIA_Jorgen_BeCarefull_Condition;
	information = DIA_Jorgen_BeCarefull_Info;
	permanent   = TRUE;
	description	= "Besser, du verschwindest von der Straße. ";
};

FUNC INT DIA_Jorgen_BeCarefull_Condition()
{
	if (Kapitel == 3) 
		&& (Npc_KnowsInfo(other, DIA_Jorgen_Home))
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jorgen_BeCarefull_Info()
{
	AI_Output (other,self ,"DIA_Jorgen_BeCarefull_15_00"); //Besser, du verschwindest von der Straße.
	AI_Output (self ,other,"DIA_Jorgen_BeCarefull_07_01"); //Mach dir keine Sorgen. Ich hab schon gemerkt, dass die Wildnis hier draußen in den letzten paar Tagen verdammt gefährlich geworden ist.
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

INSTANCE DIA_Jorgen_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP4_EXIT_Condition;
	information	= DIA_Jorgen_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NeuHier
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_NEUHIER		(C_INFO)
{	
	npc		 	= 	VLK_4250_Jorgen;
	nr		 	= 	41;
	condition	= 	DIA_Jorgen_NEUHIER_Condition;
	information	= 	DIA_Jorgen_NEUHIER_Info;

	description	= 	"Wie lebt sich's im Kloster?";
};

func int DIA_Jorgen_NEUHIER_Condition ()
{
	if (Kapitel >= 4)	
	{
		return TRUE;
	};
};

func void DIA_Jorgen_NEUHIER_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_NEUHIER_15_00"); //Wie lebt sich's im Kloster?
	
	AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_01"); //Ich werd hier noch bekloppt!

	if (Npc_KnowsInfo(other, DIA_Jorgen_Milten))
	{
		AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_02"); //Aber trotzdem, danke für den Tipp. Milten konnte mir tatsächlich helfen, hier unter zu kommen.
		B_GivePlayerXP (XP_Ambient);
	};

	if (hero.guild != GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_03"); //Ich komme mir ganz schön dämlich vor bei diesen ewig meckernden Weltverbesserern.
	};

	AI_Output			(self, other, "DIA_Jorgen_NEUHIER_07_04"); //Tja. Was willst du machen? Bevor ich in der Stadt verhungere, mach ich lieber, was die Novizen von mir verlangen.
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_PERM4		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	400;
	condition	 = 	DIA_Jorgen_PERM4_Condition;
	information	 = 	DIA_Jorgen_PERM4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Du kommst schon zurecht, denke ich.";
};

func int DIA_Jorgen_PERM4_Condition ()
{
	if (Kapitel >= 4)	
		&&	(Npc_KnowsInfo(other, DIA_Jorgen_Home))
		&&	(Npc_KnowsInfo(other, DIA_Jorgen_NEUHIER))
		&& 	(JorgenIsCaptain == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Jorgen_PERM4_OneTime;
func void DIA_Jorgen_PERM4_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_PERM4_15_00"); //Du kommst schon zurecht, denke ich.
	if (DIA_Jorgen_PERM4_OneTime == FALSE)
	&& (hero.guild != GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Jorgen_PERM4_07_01"); //Stell dir vor, ich soll hier Unkraut jäten. Wenn das so weiter geht, dreh ich noch durch.
		DIA_Jorgen_PERM4_OneTime = TRUE;
	};
	
	AI_Output			(self, other, "DIA_Jorgen_PERM4_07_02"); //Ich brauche endlich wieder Planken unter meinen Füßen.
};

//#####################################################################
//##
//##
//##					KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Jorgen_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP5_EXIT_Condition;
	information	= DIA_Jorgen_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	51;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ich könnte dir vielleicht einen Job als Kapitän anbieten.";
};

func int DIA_Jorgen_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_PyrokarClearDemonTower != LOG_SUCCESS)
		&& (Npc_KnowsInfo(other, DIA_Jorgen_Home))

		{
				return TRUE;
		};
};
var int DIA_Jorgen_BEMYCAPTAIN_OneTime;
func void DIA_Jorgen_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN_15_00"); //Ich könnte dir vielleicht einen Job als Kapitän anbieten.
	if (DIA_Jorgen_BEMYCAPTAIN_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_01"); //Du willst mich doch wohl nicht verkohlen, mein Junge? Also, wenn das wahr ist, dann bin ich doch sofort dabei.
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_02"); //Ärrh. Es gibt da nur ein kleines Problem. Ich habe den Novizen hier die halbe Vorratskammer weggefressen.
		AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_03"); //Sind ganz schön sauer, die Jungs. Glaube nicht, dass mich der oberste Magier hier einfach wieder so gehen lässt.
		DIA_Jorgen_BEMYCAPTAIN_OneTime = TRUE;
	};
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN_07_04"); //Ich muss erst meine Zeche bei Pyrokar abarbeiten. Tut mir Leid.
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                                                                                                                                            
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                                                                                                                                          
    B_LogEntry (TOPIC_Captain,"Jorgen wäre bereit als Kapitän für die Überfahrst zu fungieren, allerdings muss ich ihn erst freikaufen. Er hat Schulden beim Kloster.");

};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	52;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN2_Info;

	description	 = 	"Die Sache mit deiner Zeche habe ich geregelt.";
};

func int DIA_Jorgen_BEMYCAPTAIN2_Condition ()
{
	if (MIS_PyrokarClearDemonTower == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_BEMYCAPTAIN2_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN2_15_00"); //Die Sache mit deiner Zeche habe ich geregelt. Du bist frei.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_01"); //Wirklich. Wie hast du das angestellt?
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN2_15_02"); //Das willst du nicht wissen.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_03"); //Na schön. Soll mir auch egal sein. Besten Dank, noch mal.

	if (SCGotCaptain == FALSE)
	{
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_04"); //Was ist mit deinem Angebot. Kann ich noch bei dir anheuern?
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN2_07_05"); //So. Und jetzt nichts wie raus hier.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"RausAusKloster");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	53;
	condition	 = 	DIA_Jorgen_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jorgen_BEMYCAPTAIN3_Info;

	description	 = 	"Sei mein Kapitän.";
};

func int DIA_Jorgen_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jorgen_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN3_15_00"); //Sei mein Kapitän.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_01"); //Ich fühle mich geehrt, aber hast du denn überhaupt schon ein Schiff und eine Mannschaft?
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_02"); //Ich sag mal, fünf Mann sollten es schon sein.
	AI_Output			(other, self, "DIA_Jorgen_BEMYCAPTAIN3_15_03"); //Gut. Ich werde sehen, was ich tun kann. Warte im Hafen auf mich.
	AI_Output			(self, other, "DIA_Jorgen_BEMYCAPTAIN3_07_04"); //Aye, Aye, Sir.
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JorgenIsCaptain = TRUE;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	59;
	condition	 = 	DIA_Jorgen_LOSFAHREN_Condition;
	information	 = 	DIA_Jorgen_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Bist du bereit, mich zur Insel überzusetzen?";
};

func int DIA_Jorgen_LOSFAHREN_Condition ()
{
	if (JorgenIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jorgen_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_LOSFAHREN_15_00"); //Bist du bereit, mich zur Insel überzusetzen?

	if ((B_CaptainConditions (self)) == TRUE)
	{
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_01"); //Aber klar doch. Her mit der Karte.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_02"); //Gut. Dann hoch die Segel und nichts wie weg hier.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_03"); //Überprüf vorher noch mal deine Ausrüstung. Wenn wir erstmal auf See sind, gibt es keinen Weg mehr zurück.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_04"); //Wenn du das gemacht hast, dann leg dich erst mal schlafen. In der Kapitänskajüte steht ein Bett für dich bereit. Gute Nacht.
	AI_StopProcessInfos (self);
	B_CaptainCallsAllOnBoard (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_05"); //Du brauchst ein Schiff, eine mindestens fünf Mann starke Mannschaft und eine Seekarte, nach der ich navigieren kann.
	AI_Output			(self, other, "DIA_Jorgen_LOSFAHREN_07_06"); //Erst, wenn ich sehe, dass du alles zusammen hast, werden wir in See stechen.
	AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_4250_Jorgen;
	nr		 = 	59;
	condition	 = 	DIA_Jorgen_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jorgen_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wie geht's dir?";
};

func int DIA_Jorgen_PERM5_NOTCAPTAIN_Condition ()
{
	if	(Npc_KnowsInfo(other, DIA_Jorgen_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JorgenIsCaptain == FALSE)
		{
				return TRUE;
		};
};
var int DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven;
func void DIA_Jorgen_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jorgen_PERM5_NOTCAPTAIN_15_00"); //Wie geht's dir?

	if 	(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06")<1000)  
	{
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_01"); //Gut. Hier lässt sich's aushalten.
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_02"); //Ich muss hier zwar auch schwachsinnige Arbeiten wie Schafe hüten, verrichten, aber es ist bei weitem nicht so spießig wie im Kloster.

		if (DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven == FALSE)
		{
		B_GivePlayerXP (XP_Ambient);
		DIA_Jorgen_PERM5_NOTCAPTAIN_XPGiven = TRUE;
		};
	AI_StopProcessInfos (self);
	}
	else
	{
	AI_Output			(self, other, "DIA_Jorgen_PERM5_NOTCAPTAIN_07_03"); //Ich muss mir jetzt eine andere Bleibe suchen. Mal sehen, wohin es mich verschlägt.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"RausAusKloster");
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


INSTANCE DIA_Jorgen_KAP6_EXIT(C_INFO)
{
	npc			= VLK_4250_Jorgen;
	nr			= 999;
	condition	= DIA_Jorgen_KAP6_EXIT_Condition;
	information	= DIA_Jorgen_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jorgen_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jorgen_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};












































