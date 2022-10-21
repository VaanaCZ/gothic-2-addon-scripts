//##################################################
//##
//##	Kapitel 1
//##
//##################################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Hodges_Kap1_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap1_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap1_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap1_EXIT_Condition ()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};

func void DIA_Hodges_Kap1_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				   Hallo 
// ************************************************************
instance DIA_Hodges_HALLO		(C_INFO)
{
	npc		 	= BAU_908_Hodges;
	nr		 	= 1;
	condition	= DIA_Hodges_HALLO_Condition;
	information	= DIA_Hodges_HALLO_Info;
	permanent	= FALSE;
	important 	= TRUE;
};

func int DIA_Hodges_HALLO_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Hodges_HALLO_15_00"); //Hallo, ich bin neu hier.
	AI_Output (self, other, "DIA_Hodges_HALLO_03_01"); //Nimm's mir nicht übel, aber ich hab nicht viel Lust mich zu unterhalten - bin ziemlich im Arsch.
	AI_Output (other, self, "DIA_Hodges_HALLO_15_02"); //Schwer beschäftigt, was?
	AI_Output (self, other, "DIA_Hodges_HALLO_03_03"); //Kann man wohl sagen. Bennet macht so viele Waffen, dass ich mit dem Schleifen kaum nachkomme.
};

// ************************************************************
// 			  				 About Farm
// ************************************************************
instance DIA_Hodges_TellAboutFarm	(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	2;
	condition	 = 	DIA_Hodges_TellAboutFarm_Condition;
	information	 = 	DIA_Hodges_TellAboutFarm_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Was kannst du mir über den Hof erzählen?";
};

func int DIA_Hodges_TellAboutFarm_Condition ()
{
	if ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};	
};

func void DIA_Hodges_TellAboutFarm_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_TellAboutFarm_15_00"); //Was kannst du mir über den Hof erzählen?
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_01"); //Das hier ist Onars Hof.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_02"); //Das große Haus ist sein Wohnhaus. Er hat einen Flügel freigemacht für die Söldner.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_03"); //Seitdem müssen wir Bauern in der Scheune pennen.
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_04"); //(hastig) Aber mir soll's recht sein, ist schon gut, dass wir jetzt Leute haben, die auf den Hof aufpassen.
	
	if (Npc_GetDistToWP (self, "NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_05"); //Das Haus hier ist die Küche.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_06"); //Im Haus mit der Schmiede davor ist die Küche.
	};
	AI_Output (self ,other,"DIA_Hodges_TellAboutFarm_03_07"); //Vielleicht hast du Glück und Thekla hat was zu essen für dich.
};

// ************************************************************
// 			  				   AboutSld 
// ************************************************************
instance DIA_Hodges_AboutSld	(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	2;
	condition	 = 	DIA_Hodges_AboutSld_Condition;
	information	 = 	DIA_Hodges_AboutSld_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Was ist mit den Söldnern?";
};

func int DIA_Hodges_AboutSld_Condition ()
{
	if (hero.guild != GIL_SLD) 
	&& (hero.guild != GIL_DJG)
	&& ((Kapitel != 3)
	|| (MIS_RescueBennet == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Hodges_AboutSld_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_AboutSld_15_00"); //Was ist mit den Söldnern?
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_01"); //Onar hat sie angeheuert, damit sie uns die Milizen aus der Stadt vom Hals halten.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_02"); //Aber sie passen auch auf den Hof, die Schafe und uns Bauern auf.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_03"); //Also lass dir bloß nicht einfallen, was zu klauen oder in irgendwelchen Truhen rumzukramen.
	AI_Output (self ,other,"DIA_Hodges_AboutSld_03_04"); //Die warten nur auf 'ne Gelegenheit, dich umzuhauen.
};

// ************************************************************
// 			  				   TRADE 
// ************************************************************
instance DIA_Hodges_TRADE	(C_INFO)
{
	npc			= BAU_908_Hodges;
	nr			= 2;
	condition	= DIA_Hodges_TRADE_Condition;
	information	= DIA_Hodges_TRADE_Info;
	permanent 	= TRUE;
	description	= "Kann ich bei dir Waffen kaufen?";
	trade		= TRUE;
};

func int DIA_Hodges_TRADE_Condition ()
{
	return TRUE;
};

func void DIA_Hodges_TRADE_Info ()
{	
	AI_Output (other, self ,"DIA_Hodges_TRADE_15_00"); //Kann ich bei dir Waffen kaufen?
	AI_Output (self, other, "DIA_Hodges_TRADE_03_01"); //Ich hab nicht viel. Die Schwerter und Äxte bringen wir fast alle in Onars Haus.
	
	Npc_RemoveInvItems (self,ItMiSwordblade,Npc_HasItems (self,ItMiSwordblade));
};


//##################################################
//##
//##	Kapitel 2
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap2_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap2_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap2_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap2_EXIT_Condition ()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap2_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

//##################################################
//##
//##	Kapitel 3
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap3_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap3_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap3_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap3_EXIT_Condition ()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap3_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Warum arbeitest du nicht?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_DontWork		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	31;
	condition	 = 	DIA_Hodges_DontWork_Condition;
	information	 = 	DIA_Hodges_DontWork_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Warum arbeitest du nicht?";
};

func int DIA_Hodges_DontWork_Condition ()
{
	if (Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_DontWork_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_DontWork_15_00"); //Warum arbeitest du nicht?
	AI_Output (self ,other,"DIA_Hodges_DontWork_03_01"); //Hast du es noch nicht gehört? Die Paladine haben Bennet verhaftet.

	MIS_RescueBennet = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_RESCUEBENNET, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET, LOG_RUNNING);
	B_LogEntry (TOPIC_RESCUEBENNET,"Der Schmied Bennet ist in der Stadt von den Paaldinen verhaftet worden."); 

};

///////////////////////////////////////////////////////////////////////
//	Was ist passiert?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_WhatHappened		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	31;
	condition	 = 	DIA_Hodges_WhatHappened_Condition;
	information	 = 	DIA_Hodges_WhatHappened_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Was ist passiert?";
};

func int DIA_Hodges_WhatHappened_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_WhatHappened_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_WhatHappened_15_00"); //Was ist passiert?
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_01"); //Na ja, wir waren in der Stadt, um einzukaufen, auf einmal haben wir einen Schrei gehört. Jemand rief: Da sind sie, packt sie!
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_02"); //Junge, hatte ich einen Schiss, ich hab die Beine in die Hand genommen und bin gerannt, als ob die Dämonen hinter mir her wären.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_03"); //Bennet war direkt hinter mir, ich weiß gar nicht, was passiert ist, aber als ich vor der Stadt war, war Bennet verschwunden.
	AI_Output (self ,other,"DIA_Hodges_WhatHappened_03_04"); //Ich hab ihn wohl noch in der Stadt verloren.
};

///////////////////////////////////////////////////////////////////////
//	Weswegen wurde Bennet denn verhaftet?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_BennetsCrime			(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	32;
	condition	 = 	DIA_Hodges_BennetsCrime_Condition;
	information	 = 	DIA_Hodges_BennetsCrime_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Weswegen wurde Bennet denn verhaftet?";
};

func int DIA_Hodges_BennetsCrime_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetsCrime_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_00"); //Weswegen wurde Bennet denn verhaftet?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_01"); //Mord! Bennet soll einen der Paladine ermordet haben. So ein Unsinn. Ich war doch bei ihm.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_02"); //Warum gehst du nicht in die Stadt und klärst das Ganze auf?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_03"); //Die stecken mich doch direkt in den Bau, als Komplize. Nee, schon gar nicht in der jetzigen Situation.
	AI_Output (other,self ,"DIA_Hodges_BennetsCrime_15_04"); //Situation?
	AI_Output (self ,other,"DIA_Hodges_BennetsCrime_03_05"); //Du weißt schon, Onar und die Stadt, das musste ja ein böses Ende nehmen.

	B_LogEntry (TOPIC_RESCUEBENNET,"Bennet soll einen der Paladine ermordet haben. Hodges, sein Gehilfe, bezeugt seine Unschuld, traut sich aber nicht in die Stadt."); 
};


///////////////////////////////////////////////////////////////////////
//	Wie reagieren die Söldner?
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_BennetAndSLD			(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	33;
	condition	 = 	DIA_Hodges_BennetAndSLD_Condition;
	information	 = 	DIA_Hodges_BennetAndSLD_Info;
	permanent 	 = 	FALSE;
	description	 = 	"Wie reagieren die Söldner hier auf dem Hof?";
};

func int DIA_Hodges_BennetAndSLD_Condition ()
{
	if (Npc_KnowsInfo (other,DIA_Hodges_DontWork))
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Hodges_BennetAndSLD_Info ()
{	
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_00"); //Wie reagieren die Söldner hier auf dem Hof?
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_01"); //Was die vorhaben, weiß ich natürlich nicht genau, aber einige sind wirklich stinksauer.
	AI_Output (other,self ,"DIA_Hodges_BennetAndSLD_15_02"); //Kann ich verstehen.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_03"); //Wenn es nach denen geht, würden sie lieber heute als morgen die Stadt angreifen, um Bennet da raus zu holen.
	AI_Output (self ,other,"DIA_Hodges_BennetAndSLD_03_04"); //Sprich mal mit Lee, vielleicht kannst du ja was unternehmen.
};
//##################################################
//##
//##	Kapitel 4
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap4_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap4_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap4_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap4_EXIT_Condition ()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap4_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};

//##################################################
//##
//##	Kapitel 5
//##
//##################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hodges_Kap5_EXIT		(C_INFO)
{
	npc			 = 	BAU_908_Hodges;
	nr			 = 	999;
	condition	 = 	DIA_Hodges_Kap5_EXIT_Condition;
	information	 = 	DIA_Hodges_Kap5_EXIT_Info;
	permanent 	 = 	TRUE;
	description	 = 	DIALOG_ENDE;
};

func int DIA_Hodges_Kap5_EXIT_Condition ()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hodges_Kap5_EXIT_Info ()
{	
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hodges_PICKPOCKET (C_INFO)
{
	npc			= BAU_908_Hodges;
	nr			= 900;
	condition	= DIA_Hodges_PICKPOCKET_Condition;
	information	= DIA_Hodges_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Hodges_PICKPOCKET_Condition()
{
	C_Beklauen (15, 10);
};
 
FUNC VOID DIA_Hodges_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hodges_PICKPOCKET);
	Info_AddChoice		(DIA_Hodges_PICKPOCKET, DIALOG_BACK 		,DIA_Hodges_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hodges_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hodges_PICKPOCKET_DoIt);
};

func void DIA_Hodges_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hodges_PICKPOCKET);
};
	
func void DIA_Hodges_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hodges_PICKPOCKET);
};




