// *********************************************************
// 			  				EXIT
// *********************************************************
var int Vatras_SchickeLeuteWeg;
var int Vatras_LaresExit;
var int Vatras_MORE;

///////////////////////////////////////////////////////////////////////
//	Info KillerWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_KillerWarning		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_KillerWarning_Condition;
	information	 = 	DIA_Addon_Vatras_KillerWarning_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_KillerWarning_Condition ()
{
	if (Kapitel >= 5)
	&& (MadKillerCount >= 3)
	&& (MadKillerCount < 7)
	&& (VatrasPissedOffForever == FALSE)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Vatras_KillerWarning_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_00"); //Es gibt zahlreiche Gerüchte über dich in Khorinis.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_01"); //Demnach sollst du an der Ermordung unschuldiger Menschen beteiligt gewesen sein.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_02"); //Sollte dem wirklich so ist, kann ich dich nur warnen, mein Sohn. 
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_03"); //Verlasse nicht den Pfad des Gleichgewichts und dem Erhalt dieser Welt, sonst wird es weitreichende Konsequenzen für dich haben.
	AI_Output	(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_04"); //Sprich. Womit kann ich dir helfen?
};

///////////////////////////////////////////////////////////////////////
//	Info LastWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_LastWarning		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_LastWarning_Condition;
	information	 = 	DIA_Addon_Vatras_LastWarning_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_LastWarning_Condition ()
{
	if (Kapitel >= 5)
	&& (MadKillerCount >= 7)
	&& (VatrasPissedOffForever == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_LastWarning_Info ()
{
	B_LastWarningVatras ();
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_06"); //Was hast du dazu zu sagen?

	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Du kannst mich mal.", DIA_Addon_Vatras_LastWarning_Arsch );	 
	Info_AddChoice	(DIA_Addon_Vatras_LastWarning, "Tut mir leid. Ich wusste nicht, was ich tat.", DIA_Addon_Vatras_LastWarning_Reue );	 
};
func void DIA_Addon_Vatras_LastWarning_Arsch ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00"); //Du kannst mich mal.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00"); //In deinen Worten ist kein Funken Reue.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01"); //Du lässt mir keine andere Wahl.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff ();
};

func void DIA_Addon_Vatras_LastWarning_Reue ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00"); //Tut mir leid. Ich wusste nicht, was ich tat.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00"); //Ich will für dich beten und hoffen, dass du du wieder zur Besinnung zurück findest.
	AI_Output	(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01"); //Wehe dir, wenn ich noch einmal von einem Mord zu hören bekomme, den du zu verantworten hast.
	Info_ClearChoices	(DIA_Addon_Vatras_LastWarning);
	VatrasMadKillerCount = MadKillerCount;
};

///////////////////////////////////////////////////////////////////////
//	Info PissedOf
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PissedOff		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Vatras_PissedOff_Condition;
	information	 = 	DIA_Addon_Vatras_PissedOff_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Vatras_PissedOff_Condition ()
{
	if (MadKillerCount > VatrasMadKillerCount)
	&& (Npc_KnowsInfo (other, DIA_Addon_Vatras_LastWarning))
	&& (Kapitel >= 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_PissedOff_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_00"); //Deine Worte sind so falsch wie deine Taten.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_01"); //Dein sinnloses Morden will einfach nicht enden.
	AI_Output	(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_02"); //Du lässt mir keine Wahl. 
	B_VatrasPissedOff ();
};

// ----------------------------
instance DIA_Vatras_EXIT   (C_INFO)
{
	npc         = VLK_439_Vatras;
	nr          = 999;
	condition   = DIA_Vatras_EXIT_Condition;
	information = DIA_Vatras_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Vatras_EXIT_Info()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (Vatras_LaresExit == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_00"); //Warte!
		if (Vatras_GehZuLares == TRUE) 
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_01"); //Wenn du Lares siehst ...
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_02"); //Ich bitte dich noch um einen kleinen Gefallen.
			AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_03"); //Geh zum Hafen. Dort findest du einen Mann namens Lares.
			Vatras_GehZuLares = TRUE;
		};	
			
		AI_Output (self, other, "DIA_Addon_Vatras_LaresExit_05_04"); //Gib ihm dieses Ornament und sage ihm, dass es zurückgebracht werden muss. Er wird schon wissen, was er damit zu tun hat.
		CreateInvItems (self, ItMi_Ornament_Addon_Vatras, 1);									
		B_GiveInvItems (self, other, ItMi_Ornament_Addon_Vatras, 1);	
		
		Vatras_LaresExit = TRUE;
	};
	
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
	
	if (Vatras_SchickeLeuteWeg == TRUE)
	{
		B_StartOtherRoutine  (VLK_455_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_454_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_428_Buergerin,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_450_Buerger,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_426_Buergerin,"VATRASAWAY");	
		B_StartOtherRoutine  (VLK_421_Valentino,"VATRASAWAY");	
		
		Vatras_SchickeLeuteWeg = FALSE;
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Vatras_PICKPOCKET (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr			= 900;
	condition	= DIA_Vatras_PICKPOCKET_Condition;
	information	= DIA_Vatras_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       
func INT DIA_Vatras_PICKPOCKET_Condition()
{
	C_Beklauen (91, 250);
};
func VOID DIA_Vatras_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Vatras_PICKPOCKET);
	Info_AddChoice		(DIA_Vatras_PICKPOCKET, DIALOG_BACK 		,DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Vatras_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Vatras_PICKPOCKET_DoIt);
};
func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Vatras_PICKPOCKET);
};
func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Vatras_PICKPOCKET);
};



// *********************************************************
// 			  				Hallo
// *********************************************************
instance DIA_Vatras_GREET		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	2;
	condition	 = 	DIA_Vatras_GREET_Condition;
	information	 = 	DIA_Vatras_GREET_Info;

	important	 =  TRUE;
};
func int DIA_Vatras_GREET_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_GREET_Info ()
{
	AI_Output (self, other, "DIA_Vatras_GREET_05_00"); //Adanos sei mit dir.
	AI_Output (other, self, "DIA_Vatras_GREET_15_01"); //Wer bist du?
	AI_Output (self, other, "DIA_Vatras_GREET_05_02"); //Ich bin Vatras, ein Diener des Adanos, des Behüters des göttlichen und weltlichen Gleichgewichts.
	AI_Output (self, other, "DIA_Vatras_GREET_05_03"); //Was kann ich für dich tun?
};



// *********************************************************
// 		  				Brief abgeben
// *********************************************************
instance DIA_Addon_Vatras_Cavalorn		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_Cavalorn_Condition;
	information	= DIA_Addon_Vatras_Cavalorn_Info;

	description	= "Ich habe hier einen Brief für dich.";
};
func int DIA_Addon_Vatras_Cavalorn_Condition ()
{
	if 	(
			(Npc_HasItems (other,ItWr_SaturasFirstMessage_Addon_Sealed) >=1)
			&& (MIS_Addon_Cavalorn_Letter2Vatras == LOG_RUNNING)
		)
		||	(Npc_HasItems (other,ItWr_SaturasFirstMessage_Addon)>=1) 
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Cavalorn_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Cavalorn_15_00"); //Ich habe hier einen Brief für dich.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_01"); //Für mich?
	
	if (SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon_Sealed,1);
	}
	else
	{
		B_GivePlayerXP (XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems (other, self, ItWr_SaturasFirstMessage_Addon,1);
		AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_02"); //Ja, aber ... Er ist ja geöffnet. Hoffentlich ist er nicht in die falschen Hände geraten.
	};

	B_UseFakeScroll();
	
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_03"); //In der Tat. Das ist eine wichtige Botschaft, die du mir da übermittelt hast.
	AI_Output	(self, other, "DIA_Addon_Vatras_Cavalorn_05_04"); //Ich frage mich, wie du an diesen Brief gekommen bist.
	
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "Ich habe ihn einigen Banditen abgenommen.", DIA_Addon_Vatras_Cavalorn_Bandit );

	if (MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice	(DIA_Addon_Vatras_Cavalorn, "Von Cavalorn, dem Jäger", DIA_Addon_Vatras_Cavalorn_Cavalorn );
	};

	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};
func void DIA_Addon_Vatras_Cavalorn_Bandit ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Bandit_15_00"); //Ich habe ihn einigen Banditen abgenommen.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_01"); //(besorgt) Bei Adanos. Das ist nicht gut. Das ist gar nicht gut.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_02"); //Wenn es so ist, wie du sagst, dann haben wir ein großes Problem.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_03"); //Ich werde mich so schnell wie möglich darum kümmern müssen.
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};
func void DIA_Addon_Vatras_Cavalorn_Cavalorn ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00"); //Von Cavalorn, dem Jäger.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01"); //(überrascht) Cavalorn? Wo ist er?
	AI_Output (other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02"); //Er sagte mir, ich solle dir ausrichten, dass er es nicht mehr geschafft habe und auf dem Weg zum Treffpunkt sei. Was das auch immer heißen mag.
	AI_Output (self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03"); //Ich sehe, dass du Cavalorns Vertrauen gewinnen konntest. Das spricht für dich, mein Sohn.
	
	B_GivePlayerXP (XP_Addon_CavalornTrust);
	Info_ClearChoices	(DIA_Addon_Vatras_Cavalorn);
};

// ************************************************************
// 		Cavalorn Sent Me
// ************************************************************
var int Vatras_Why;
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CavalornSentMe (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_CavalornSentMe_Condition;
	information	= DIA_Addon_Vatras_CavalornSentMe_Info;
	permanent	= FALSE;
	description	= "Cavalorn hat mich zu dir geschickt!";
};
func int DIA_Addon_Vatras_CavalornSentMe_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	&& (Vatras_Why == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_CavalornSentMe_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_00"); //Cavalorn hat mich zu dir geschickt!
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_01"); //(schlau) Und was hat er dir erzählt?
	AI_Output (other, self, "DIA_Addon_Vatras_Add_15_02"); //Er sagte, ihr braucht dringend mehr gute Leute...
	AI_Output (self, other, "DIA_Addon_Vatras_Add_05_03"); //(schmunzelt) So... Also willst du dich uns ANSCHLIESSEN, mein Sohn?
};

// ************************************************************
// 		Tell Me About RING 		(Trigger für MIS_Waffenhändler)
// ************************************************************
instance DIA_Addon_Vatras_TellMe (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_TellMe_Condition;
	information	= DIA_Addon_Vatras_TellMe_Info;
	permanent	= TRUE;

	description	= "Erzähl' mir etwas über den Ring des Wassers.";
};
func int DIA_Addon_Vatras_TellMe_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_TellMe_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_15_00"); //Erzähl mir etwas über den Ring des Wassers.

	if (!Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_01"); //(erwartungsvoll) Und warum sollte ich das tun?
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_02"); //Als Anwärter auf den Eintritt in unsere Gemeinschaft darfst du natürlich nicht ALLES wissen.
		AI_Output (self, other, "DIA_Addon_Vatras_TellMe_05_03"); //Aber ich werde dir sagen, was ich kann.
		
		Info_ClearChoices (DIA_Addon_Vatras_TellMe);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, DIALOG_BACK, DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Was genau tut ihr eigentlich?", DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Wo sind die anderen Wassermagier?", DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Wer gehört alles zum Ring des Wassers?", DIA_Addon_Vatras_TellMe_WerNoch);
	};
};
func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_TellMe);
};
func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Philo_15_00"); //Was genau tut ihr eigentlich?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_01"); //Wir stehen zwischen der Ordnung Innos' und dem Chaos Beliars.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_02"); //Wenn eine der beiden Parteien die Überhand gewinnt, dann bedeutet das den Verlust der Freiheit auf der einen Seite oder das todbringende Chaos auf der anderen.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Philo_05_03"); //Und so sorgen wir dafür, dass Gleichgewicht herrscht zwischen ihnen. Nur so ist ein Leben auf dieser Welt überhaupt möglich.
	
	if (MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice (DIA_Addon_Vatras_TellMe, "Geht's auch etwas konkreter?", DIA_Addon_Vatras_TellMe_Konkret);
	};
};
func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Konkret_15_00"); //(stirnrunzelnd) Geht's auch etwas konkreter?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_01"); //Der Fall der Barriere hat viele Bedrohungen hervorgerufen.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_02"); //Die wohl offensichtlichste stellen die Banditen dar.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_03"); //Nicht nur, dass es fast unmöglich geworden ist, die Insel zu bereisen, ohne angegriffen zu werden ...
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_04"); //... es gibt auch noch jemanden in dieser Stadt, der die Banditen unterstützt!
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Add_05_00"); //Wir haben herausgefunden, daß die Banditen regelmäßig von einem Waffenhändler aus Khorinis versorgt werden. 
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_05"); //Wir kümmern uns beispielsweise darum, solche Männer zu finden und sie daran zu hindern, die Stadt zu gefährden.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_06"); //Wenn du etwas über die Sache rausfinden kannst, lass es mich wissen.
	MIS_Vatras_FindTheBanditTrader = LOG_RUNNING;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic (TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BanditTrader,"Es gibt einen Waffenhändler in Khorinis, der die Banditen unterstützt. Vatras will, dass ich der Sache nachgehe."); 
	B_LogEntry (TOPIC_Addon_BanditTrader,"Martin der Proviantmeister der Paladine kümmert sich um die Sache mit dem Waffenhändler. Ich finde ihn am Hafen, wo die Paladine ihren Proviant lagern."); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"Der 'Ring des Wassers' kümmernt sich um das Banditenproblem in Khorinis."); 
};
func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_OtherKdW_15_00"); //Wo sind die anderen Wassermagier?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_01"); //Sie erforschen die Ruinen einer alten Kultur nordöstlich von Khorinis.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_02"); //Wir vermuten, dass diese Ruinen den Zugang zu einem bisher unerforschten Teil der Insel darstellen.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"Die anderen Wassermagier erforschen die Ruinen einer alten Kultur nordöstlich von Khorinis. Es ist möglicherweise der Zugang zu einem bisher unerforschten Teil von Khorinis."); 

	Info_AddChoice (DIA_Addon_Vatras_TellMe, "Erzähl mir mehr über den unerforschten Teil.", DIA_Addon_Vatras_TellMe_Unexplored);
};
func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_00"); //Erzähl mir mehr über den unerforschten Teil.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_01"); //Wenn du daran interessiert bist, dich der Expedition anzuschließen, kann ich dich mit einem Schreiben zu Saturas schicken.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_02"); //Du kannst natürlich nur dann teilnehmen, wenn du einer von uns bist.
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_03"); //Natürlich.
	B_LogEntry (TOPIC_Addon_KDW,"Bevor ich mich der Expedition der Wassermagier anschließen kann, will Vatras erst, dass ich dem 'Ring des Wassers' beitrete."); 
};
func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output (other, self, "DIA_Addon_Vatras_TellMe_WerNoch_15_00"); //Wer gehört alles zum Ring des Wassers?
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_01"); //Das wirst du erst erfahren, wenn du in den Ring aufgenommen wirst.
	AI_Output (self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_02"); //Aber ich bin mir sicher, einige von uns wirst du schon kennengelernt haben, bis es soweit ist.
};

// *********************************************************
// 		  				Wanna JOIN (+ Ex-Segen)
// *********************************************************
instance DIA_Addon_Vatras_WannaBeRanger		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_WannaBeRanger_Condition;
	information	= DIA_Addon_Vatras_WannaBeRanger_Info;

	description	= "Ich will mich dem 'Ring des Wassers' anschließen!";
};
func int DIA_Addon_Vatras_WannaBeRanger_Condition ()
{
	if (SC_KnowsRanger == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_WannaBeRanger_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_00"); //Ich will mich dem 'Ring des Wassers' anschließen!
	
	if (Npc_KnowsInfo (other, DIA_Addon_Cavalorn_Ring))
	{
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_01"); //So? Dann hast du ja schon die erste Bedingung dazu erfüllt.
		AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_15_02"); //Was meinst du damit?
		AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_03"); //Naja. Du hast jemanden in den Reihen unserer Kinder, der dir vertaut. Sonst würdest du sicherlich nicht davon wissen.
	};
	
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_05_04"); //Aber ICH weiß gar nichts über dich ...
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_03"); //Ich will dich wohl segnen, Fremder, aber ich kenne dich nicht. Erzähle mir was über dich.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_04"); //Was willst du wissen?
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_05"); //Nun, du könntest mit erzählen, wo du herkommst und warum du in die Stadt gekommen bist.
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_06"); //Ich komme mit einer wichtigen Botschaft für den Anführer der Paladine.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_07"); //Was ist das für eine Botschaft?
		
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Es sind Drachen gekommen...",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Es werden bald schreckliche Dinge passieren.",DIA_Vatras_INFLUENCE_FIRST_LIE);
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00"); //Während wir reden, sammelt sich eine große Armee unter der Führung von Drachen, um das Land zu erobern.
	
	if (Vatras_First == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01"); //Wenn das tatsächlich wahr ist, wird das Gleichgewicht der Erde gestört. Wer hat dir das erzählt?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02"); //(überlegt) Drachen? Du sprichst von Wesen, die bisher nur in Sagen Erwähnung finden. Woher weißt du das?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Das habe ich irgendwo aufgeschnappt...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Xardas, der Magier hat es mir erzählt...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_FIRST_LIE_15_00"); //Es werden bald schreckliche Dinge passieren.
	
	if (Vatras_First == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_01"); //(verärgert) Aha. Und wer hat dir das erzählt?
	}
	else 
 	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_02"); //Schreckliche Dinge also, hm ... woher weißt du das?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Das habe ich irgendwo aufgeschnappt...",DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Xardas, der Magier hat es mir erzählt...",DIA_Vatras_INFLUENCE_SECOND_TRUTH);
	
	Vatras_First = 2;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00"); //Xardas, der Magier, hat es mir erzählt. Er hat mich geschickt, die Paladine zu warnen.
	
	if (Vatras_Second == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01"); //Ich kenne diesen Mann als mächtigen und weisen Meister der Magie. Und wo kommst du her?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02"); //Der Dämonenbeschwörer ... Er lebt also ... (überlegt) und er hat dich losgeschickt? Wer bist du eigentlich?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Ich bin nur ein Abenteurer aus dem Süden... ",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Ich bin ein ehemaliger Gefangener... ",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = TRUE;
};
FUNC VOID DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_SECOND_LIE_15_00"); //Das habe ich irgendwo aufgeschnappt...
	
	if (Vatras_Second == 2)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_01"); //(ärgerlich) Weißt du wenigstens noch, wo du herkommst?
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_02"); //Aha. Und deshalb hast du dich auf den Weg gemacht. Wer bist du eigentlich?
	};
	Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Ich bin ein Abenteurer aus dem Süden...",DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Ich bin ein ehemaliger Gefangener...",DIA_Vatras_INFLUENCE_THIRD_TRUTH);
	
	Vatras_Second = 2;
};
func VOID B_Vatras_INFLUENCE_REPEAT()
{
	//RAUS wegen ADDON
	//AI_Output (other, self, "DIA_Vatras_INFLUENCE_REPEAT_15_00"); //Und, gibst du mir jetzt deinen Segen?	
	
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_01"); //Gut, fassen wir mal zusammen:
	
	if (Vatras_Third == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_02"); //Du bist ein ehemaliger Gefangener, ...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_03"); //Du bist also ein Abenteurer aus dem Süden ...
	};
	if (Vatras_Second  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_04"); //... der von Xardas, dem Dämonenbeschwörer, erzählt bekommen hat, ...
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_05"); //... der irgendwo aufgeschnappt hat ...
	};
	if (Vatras_First  == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_06"); //... dass Drachen gekommen sind, um das Land zu erobern.
	}
	else
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_07"); //... dass bald schreckliche Dinge geschehen werden.
	};
		
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_08"); //Und du bist gekommen, um den Paladinen davon zu berichten ...
	if (Vatras_First   == TRUE)
	&& (Vatras_Second  == TRUE)
	&& (Vatras_Third   == TRUE)
	{
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_09"); //Das hört sich alles sehr abenteuerlich an, aber ich kann nicht erkennen, dass du mich anlügst.
		AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_10"); //Daher muss ich annehmen, dass deine Beweggründe ehrlich sind.
		
		AI_Output (self, other, "DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11"); //Ich will dir eine Chance geben, dich dem Ring des Wassers anzuschließen.
		
		Info_ClearChoices  (DIA_Addon_Vatras_WannaBeRanger);
	}
	else 
	{
		AI_Output (self, other, "DIA_Vatras_Add_05_00"); //Ich glaube du verschweigst mir etwas.
		AI_Output (self, other, "DIA_Vatras_Add_05_01"); //Falls du Sorge haben solltest, daß ich das, was du mir erzählst weitergebe, so kann ich dich beruhigen.
		AI_Output (self, other, "DIA_Vatras_Add_05_02"); //Ich habe geschworen, alle Geheimnisse, die mir anvertraut wurden, für mich zu behalten.
		if (Wld_IsTime(05,05,20,10))
		{
			AI_Output (other, self, "DIA_Vatras_Add_15_03"); //Und was ist mit den ganzen Leuten hier?
			AI_Output (self, other, "DIA_Vatras_Add_05_04"); //Sie verstehen nur die Hälfte von dem, was ich ihnen PREDIGE. Mach dir also keine Sorgen.
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_05"); //Fangen wir also noch einmal von vorne an. Was ist das für eine Botschaft?
		
		//ADDON - SC kann nicht mehr versagen!
		//Vatras_Chance = TRUE; 
		Info_ClearChoices   (DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Es sind Drachen gekommen... ",DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice 		(DIA_Addon_Vatras_WannaBeRanger,"Es werden bald schreckliche Dinge passieren.",DIA_Vatras_INFLUENCE_FIRST_LIE);
	};
	
	//else-Fall raus - Addon
	//AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_13"); //Ich habe dir jetzt zweimal die Chance gegeben, mir die Wahrheit zu sagen - aber du willst es anscheinend nicht. Ich werde dir meinen Segen nicht geben.
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00"); //Ich bin ein ehemaliger Gefangener der Strafkolonie von Khorinis.
	Vatras_Third = TRUE;
	
	B_Vatras_INFLUENCE_REPEAT();
};
FUNC VOID DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_THIRD_LIE_15_00"); //Ich bin ein Abenteurer aus dem Süden ...
	Vatras_Third = FALSE;
		
	B_Vatras_INFLUENCE_REPEAT();
}; 
// ************************************************************
// 			  			How to JOIN
// ************************************************************
// ------------------------------------------------------------
// Was muß ich tun?
// ------------------------------------------------------------
instance DIA_Addon_Vatras_HowToJoin	(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_HowToJoin_Condition;
	information	= DIA_Addon_Vatras_HowToJoin_Info;

	description	= "Was muß ich tun, um mich dem Ring anzuschließen?";
};
func int DIA_Addon_Vatras_HowToJoin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_WannaBeRanger))
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_HowToJoin_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_00"); //Was muss ich tun, um mich dem Ring anzuschließen?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_01"); //Du musst wissen, dass du große Verantwortung übernimmst, wenn du dem 'Ring' angehören willst.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_02"); //Ich bin nicht gewillt, jedem, der zu uns kommt, der Bitte um Aufnahme zu entsprechen.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_03"); //Wenn du dem Ring angehören willst, musst du beweisen, dass du auch so handelst wie einer von uns.
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_15_04"); //Und das heißt?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_05"); //Bevor wir einen jungen Mann in unseren Dienst stellen, muss er etwas Großes für den Ring vollbracht haben.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_05_06"); //Erst dann kann ich in Erwägung ziehen, dich für die Erhaltung des Gleichgewichts der Kräfte auf dieser Insel einzusetzen.
	
	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "Was wäre denn etwas Angemessenes, dass dich überzeugt?", DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "Ich habe viele Menschen befreit. Die Barriere ist weg.", DIA_Addon_Vatras_HowToJoin_FreedMen );
	Info_AddChoice	(DIA_Addon_Vatras_HowToJoin, "Ich habe den Schläfer besiegt. Ist das gross genug?", DIA_Addon_Vatras_HowToJoin_Sleeper );
};
func void DIA_Addon_Vatras_HowToJoin_Sleeper ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_Sleeper_15_00"); //Ich habe den Schläfer besiegt. Ist das groß genug?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_01"); //Viele Geschichten erreichen meine Ohren in diesen Tagen.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_02"); //Auch die über die Verbannung der Bestie namens Schläfer.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_03"); //Dass das einzig deine Hand herbei geführt haben soll, ist mir nicht geläufig, obwohl deine Augen voller Überzeugung sprechen.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_04"); //Das verunsichert mich, aber ich bin mir nicht sicher, dass mich meine Sinne nicht auch täuschen könnten.
};
func void DIA_Addon_Vatras_HowToJoin_FreedMen ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00"); //Ich habe viele Menschen befreit. Die Barriere ist weg.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01"); //Selbst wenn du WIRKLICH dafür verantwortlich sein solltest ...
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02"); //Das große Ereignis im Minental hat nicht nur die Magier des Wasser und andere aufrechte Bürger wieder in die Freiheit entlassen.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03"); //Die Verbrecher des ganzen Landes laufen frei in Khorinis umher und bedrängen heute die Menschen dieser Stadt.
	AI_Output (self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04"); //Die Banditen haben schon große Landstriche in der Umgebung der Stadt eingenommen. Es ist fast unmöglich geworden, unbeschadet die Stadt zu verlassen.
};
func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00"); //Was wäre denn etwas Angemessenes, das dich überzeugt?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01"); //Ein großes Rätsel beschäftigt Khorinis in diesen Tagen.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02"); //Die Zahl der Vermissten dieser Stadt scheint fast täglich zu steigen.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03"); //Wenn du es schaffen solltest, mir zu erklären, was mit ihnen geschehen ist, dann soll dir dein Platz im 'Ring des Wassers' sicher sein.
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight); 
	B_LogEntry (TOPIC_Addon_RingOfWater,"Vatras wird mich erst in den 'Ring des Wassers' aufnehmen, wenn ich heraus finde, wo die vermissten Leute sind."); 

	if (SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl); 
	};

	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_RUNNING;
	SC_HearedAboutMissingPeople = TRUE;

	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04"); //Allerdings ...
	AI_Output (other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05"); //Ja?
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06"); //... solltest du zuerst deine Nachricht zu den Paladinen bringen.
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07"); //Ich glaube, die Sache ist von äußerster Wichtigkeit!
	AI_Output (self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08"); //Rede mit Lord Hagen.
	
	B_LogEntry (TOPIC_Addon_RingOfWater,"Vatras hat eine wichtige Nachricht für Lord Hagen. Ich soll sie ihm überbringen."); 

	Info_ClearChoices	(DIA_Addon_Vatras_HowToJoin);	
};
// ------------------------------------------------------------
// Hilf mir bei GILDE!
// ------------------------------------------------------------
instance DIA_Addon_Vatras_GuildBypass (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 1;
	condition	= DIA_Addon_Vatras_GuildBypass_Condition;
	information	= DIA_Addon_Vatras_GuildBypass_Info;

	description	= "Aber Lord Hagen wird mich nicht vorlassen!";
};
func int DIA_Addon_Vatras_GuildBypass_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_GuildBypass_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_15_00"); //Aber Lord Hagen wird mich nicht vorlassen!
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_01"); //Doch, das wird er zweifelsohne tun. WENN du einer mächtigen Gemeinschaft angehörst.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_02"); //Der Ring hat weitreichende Beziehungen.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_03"); //Wir werden dir helfen, deine Nachricht so schnell wie möglich zu überbringen.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_05_04"); //Du solltest darüber mit meinem Vertrauten Lares sprechen. Er wird dir helfen.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Um zu Lord Hagen vorgelassen zu werden muss ich mich einer mächtigen Gemeinschaft in Khorinis anschließen."); 
	

	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Das werde ich tun.", DIA_Addon_Vatras_GuildBypass_BACK );
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Welcher Gemeinschaft soll ich mich anschließen?", DIA_Addon_Vatras_GuildBypass_WhichGuild);
};
func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_BACK_15_00"); //Das werde ich tun.
	Vatras_GehZuLares = TRUE;
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
};
func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output (other, self, "DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00"); //Welcher Gemeinschaft soll ich mich anschließen?
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01"); //Es gibt nur drei Gemeinschaften, die mächtig genug sind.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02"); //Die städtische Miliz, das Kloster der Feuermagier oder die Söldnertruppe auf dem Hof des Großbauern.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03"); //Die Wahl liegt bei dir, mein Sohn.
	AI_Output (self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04"); //Sicher kann dir Lares bei dieser schwierigen Entscheidung zur Seite stehen. Rede mit ihm darüber.

	B_LogEntry (TOPIC_Addon_RingOfWater,"Zu den mächtigen Gemeinschaften gehören die FEUERMAGIER, die MILIZ und die SÖLDNER auf dem Hof des Großbauern."); 
	
	Info_ClearChoices (DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice (DIA_Addon_Vatras_GuildBypass, "Das werde ich tun.", DIA_Addon_Vatras_GuildBypass_BACK );
};
// ------------------------------------------------------------
// Ranger NOW 	(MissingPeople ist hier schon Succes!!!)
// ------------------------------------------------------------
instance DIA_Addon_Vatras_NowRanger		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_NowRanger_Condition;
	information	= DIA_Addon_Vatras_NowRanger_Info;
	permanent	= TRUE;

	description	= "Ich bin bereit, mich dem Ring des Wassers anzuschließen!";
};
func int DIA_Addon_Vatras_NowRanger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_HowToJoin))
	&& (SC_IsRanger == FALSE)
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_NowRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_00"); //Ich bin bereit, mich dem Ring des Wassers anzuschließen!
	AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_01"); //Dann hast du Lord Hagen deine Nachricht gebracht?
	
	if (Kapitel >= 2) //Pass-Schlüssel von Hagen
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_02"); //Ja.
		if (MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_NowRanger_15_03"); //Aber er hat mich ins Minental geschickt, um einen Beweis für meine Worte zu bringen!
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_04"); //DU musst entscheiden, was du als Nächstes tun willst.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_05"); //Mir war nur wichtig, dass er die Nachricht erhalten hat. Jetzt liegt es an ihm, zu handeln oder auf deinen Beweis zu warten.
			AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_06"); //Was dich betrifft ...
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_07"); //Gut.
		};
		
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_08"); //Du hast bewiesen, dass du unverzichtbar für uns bist. Du sollst zu unseren Kindern gehören und in unserem Namen in die Welt hinaus gehen, um Adanos' Wille zu vollbringen.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_09"); //Ich übergebe dir deinen Ring des Wassers. Möge er dir dienen, deine Verbündeten zu finden und mit ihnen gemeinsam das Gleichgewicht dieser Welt zu erhalten.
		CreateInvItems (self, ItRi_Ranger_Addon, 1);									
		B_GiveInvItems (self, other, ItRi_Ranger_Addon, 1);		
		if (hero.guild == GIL_KDF)
		{
			AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_10"); //Du bist der erste Magier des Feuers, der zu unseren Kindern gehört. Darüber freue ich mich besonders.
		};
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_11"); //Adanos möge dich schützen. Geh nun hin und triff dich mit deinen Brüdern.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_12"); //Sie werden dich in der Taverne 'Zur Toten Harpie' erwarten und dich in unsere Gemeinschaft aufnehmen.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_13"); //Die Taverne wirst du kennen. Sie liegt auf dem Weg zu Onars Hof.
		AI_Output (self, other, "DIA_Addon_Vatras_NowRanger_05_14"); //Vergiss nicht, deinen Ring zu tragen, damit deine Brüder dich als einen der ihren erkennen.
		
		B_LogEntry (TOPIC_Addon_RingOfWater,"Ich gehöre jetzt zum 'Ring des Wassers' und soll mich mit meinen Brüdern in der Taverne 'Zur Toten Harpie' treffen."); 

		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
		B_GivePlayerXP (XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_NowRanger_15_15"); //Nein. Noch nicht.
		AI_Output	(self, other, "DIA_Addon_Vatras_NowRanger_05_16"); //Dann beeil dich. Geh zu ihm. Ich halte deine Nachricht für sehr wichtig!
	};
};
// ------------------------------------------------------------
// NACH RangerMeeting
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CloseMeeting		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_CloseMeeting_Condition;
	information	= DIA_Addon_Vatras_CloseMeeting_Info;
	description = "Die Brüder des 'Ringes' haben mich zu dir geschickt.";
};
func int DIA_Addon_Vatras_CloseMeeting_Condition ()
{
	if (Lares_TakeFirstMissionFromVatras == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_CloseMeeting_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_CloseMeeting_15_00"); //Die Brüder des 'Ringes' haben mich zu dir geschickt.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_01"); //Gut! Ich habe schon auf dich gewartet!
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_02"); //Ich werde dich zusammen mit den anderen Wassermagiern durch das Portal schicken.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_03"); //Du wirst der Spur des ehemaligen Erzbarons Raven folgen und herausfinden, wozu er die Bürger von Khorinis gefangen genommen hat.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_04"); //Wir hier werden weiterhin versuchen, der Bedrohung durch die Banditen Herr zu werden.
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_05"); //Bring dieses Schreiben zu Saturas. Von jetzt an wirst du deine Aufgaben von ihm erhalten.
	if (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_CloseMeeting_05_08"); //Lares wird dich zu ihm führen, wenn er das Ornament nicht schon überbracht hat.
	};
	CreateInvItems (self, ItWr_Vatras2Saturas_FindRaven, 1);									
	B_GiveInvItems (self, other, ItWr_Vatras2Saturas_FindRaven, 1);	
	AI_Output (self, other, "DIA_Addon_Vatras_CloseMeeting_05_06"); //Möge Adanos dich leiten.
		
	B_LogEntry (TOPIC_Addon_KDW,"Vatras schickt mich mit einem Schreiben zu Saturas. Ich soll nun mit den anderen Wassermagiern durch das Portal gehen und der Spur des ehemaligen Erzbarons Raven folgen."); 

	Log_CreateTopic (TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Sklaven,"Ich soll herausfinden, wozu Raven die Bürger von Khorinis gefangen genommen hat."); 


	RangerMeetingRunning = LOG_SUCCESS; //Joly:Muss hier stehen!Sonst Chaos mit Rangern! -> Meeting
	B_SchlussMitRangerMeeting ();
	B_GivePlayerXP (XP_Ambient);
};


// ************************************************************
// 			  			Missing People
// ************************************************************
// ------------------------------------------------------------
// MissingPeople PERM
// ------------------------------------------------------------
var int MISSINGPEOPLEINFO[20];
// ------------------------------------------------------------
instance DIA_Addon_Vatras_MissingPeople (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_MissingPeople_Condition;
	information	= DIA_Addon_Vatras_MissingPeople_Info;
	permanent	= TRUE;
	description	= "Wegen der vermissten Leute...";
};
func int DIA_Addon_Vatras_MissingPeople_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};
var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;
func void DIA_Addon_Vatras_MissingPeople_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_15_00"); //Wegen der vermissten Leute ...
	AI_Output (self, other, "DIA_Addon_Vatras_MissingPeople_05_01"); //Ja?
	
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice (DIA_Addon_Vatras_MissingPeople, DIALOG_BACK, DIA_Addon_Vatras_MissingPeople_BACK);
	if (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Ich weiß, wo sie sind!", DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Ich will dir erzählen, was ich weiß...", DIA_Addon_Vatras_MissingPeople_Report);
	};
	
	if (DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice (DIA_Addon_Vatras_MissingPeople, "Wo soll ich anfangen nach den Vermissten zu suchen?", DIA_Addon_Vatras_MissingPeople_Wo);
	};
};
func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_MissingPeople);
};
func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output (other, self, "DIA_Addon_Vatras_HintMissingPeople_Wo_15_00"); //Wo soll ich anfangen nach den Vermissten zu suchen?
	AI_Output (self, other, "DIA_Addon_Vatras_HintMissingPeople_Wo_05_01"); //Unten am Hafen sind die meisten Menschen verschwunden. Vielleicht sollte deine Suche dort beginnen.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Am Hafen von Khorinis ist die Zahl der Vermissten am grössten. Ich soll dort meine Suche beginnen."); 
	
	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};
func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output (other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_00"); //Ich will dir erzählen, was ich weiß ...
	
	 if ((MIS_Akil_BringMissPeopleBack != 0)
	 || (MIS_Bengar_BringMissPeopleBack != 0))
	 &&	(MISSINGPEOPLEINFO[1] == FALSE)
	 {
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_01"); //Die Bauern haben ebenfalls Angehörige verloren.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[1] = TRUE;
	 };
	
	if ((Elvrich_GoesBack2Thorben == TRUE)
	|| (Elvrich_SCKnowsPirats == TRUE)
	|| (SC_KnowsDexterAsKidnapper == TRUE))
	&& (MISSINGPEOPLEINFO[2] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_02"); //Ich habe in Erfahrung bringen können, dass die Banditen für das Verschwinden der Menschen hier verantwortlich sind.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[2] = TRUE;
	};

	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[3] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_03"); //Elvrich, der Lehrling des Meisters Thorben, erzählte mir, dass die Banditen die verschleppten Menschen über den Seeweg aus Khorinis entführen.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	
	if (Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[4] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_04"); //Einige Piraten sind mit im Spiel. Ihre Rolle in der Sache ist mir aber noch nicht ganz klar.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[4] = TRUE;
	};	
	
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& (MISSINGPEOPLEINFO[5] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_05"); //Ich habe Elvrich von den Banditen befreit.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	
	if (SC_KnowsLuciaCaughtByBandits == TRUE)
	&& (MISSINGPEOPLEINFO[6] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_06"); //Ein Mädchen namens Lucia ist von den Banditen verschleppt worden.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	
	if ((Npc_HasItems (other,ItWr_LuciasLoveLetter_Addon))
	|| (MIS_LuciasLetter == LOG_SUCCESS))
	&& (MISSINGPEOPLEINFO[7] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_07"); //Das entführte Mädchen Lucia hat sich den Banditen nach ihrer Entführug angeschlossen.
		if (MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_08"); //Alles deutet darauf hin, dass sie das freiwillig tut.
		};
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[7] = TRUE;
	};
		
	if (SC_KnowsDexterAsKidnapper == TRUE)
	&& (MISSINGPEOPLEINFO[8] == FALSE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_09"); //Der Anführer der Banditen heißt Dexter. Er ist verantwortlich für die Entführungen.
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_10"); //Ich kenne Dexter noch aus der Strafkolonie. Damals arbeitete er für den Erzbaron Gomez.
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_11"); //Er wird sich sicher an dich erinnern. Du solltest vorsichtig sein.
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[8] = TRUE;
	};

	if (Vatras_MissingPeopleReports != 0)
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_12"); //Ich denke, du bist auf der richtigen Spur. Weiter so.
		var int XP_Vatras_MissingPeopleReports;
		XP_Vatras_MissingPeopleReports = (XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports );
		B_GivePlayerXP (XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_13"); //Was hast du herausgefunden?
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_14"); //Bisher leider nichts Wesentliches.
	};
};
func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_00"); //Ich weiß, wo die Vermissten sind.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_01"); //Was hast du heraus gefunden?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_02"); //Sie sind von einem Kerl namens Raven in einen fernen Teil der Insel Khorinis verschleppt worden.
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_03"); //Was gibt dir diese Gewissheit?
	AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_04"); //Ich habe seine Befehle gelesen. Er lässt die Banditen der Umgebung für sich arbeiten.
	if (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	{	
		AI_Output	(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_05"); //Hier.
		B_UseFakeScroll ();
	};
	AI_Output	(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_06"); //Gut. Das hast du wirklich gut gemacht. Ich dachte schon, wir müssten uns damit abfinden, es niemals zu erfahren.
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Vatras_WhereAreMissingPeople);
};
// ------------------------------------------------------------
// Gefangene befreit
// ------------------------------------------------------------
instance DIA_Addon_Vatras_Free (C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Vatras_Free_Condition;
	information	 = 	DIA_Addon_Vatras_Free_Info;
	permanent	 =  FALSE;
	description	 = 	"Die Vermissten sind wieder zurück!";
};
func int DIA_Addon_Vatras_Free_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Free_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Free_15_00"); //Die Vermissten sind wieder zurück.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_01"); //Ja, du hast es geschafft. Ihre Reise hat ein gutes Ende genommen.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_02"); //Aber deine Reise ist noch nicht beendet. Deshalb geh mit dem Segen Adanos'.
	AI_Output	(self, other, "DIA_Addon_Vatras_Free_05_03"); //(betet) Adanos, segne diesen Mann. Erleuchte seinen Weg, und schenke ihm die Kraft, allen Gefahren zu widerstehen.
	
	B_RaiseAttribute (other, ATR_MANA_MAX, 3);
	other.attribute[ATR_MANA]	   = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	
	Snd_Play ("Levelup");
	
	// ***Mike** Auskommentiert, weil FALSCHE funktion - bitte Rücksprache, bevor du's wieder änderst
	//var string concatText;
	//concatText = ConcatStrings (NAME_Bonus_ManaMax,IntToString (4));
	//PrintScreen (concatText, -1,-1,FONT_ScreenSmall,2); 
};

// ************************************************************
// 			  				Waffenhändler
// ************************************************************
instance DIA_Addon_Vatras_Waffen (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 2;
	condition	= DIA_Addon_Vatras_Waffen_Condition;
	information	= DIA_Addon_Vatras_Waffen_Info;
	permanent 	= TRUE;
	description = "Wegen dieses Waffenhändlers...";
};
func int DIA_Addon_Vatras_Waffen_Condition ()
{
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_Waffen_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_15_00"); //Wegen dieses Waffenhändlers ...
	
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
	Info_AddChoice (DIA_Addon_Vatras_Waffen, DIALOG_BACK, DIA_Addon_Vatras_Waffen_BACK);
	if (Fernando_ImKnast == TRUE)
	|| (Fernando_HatsZugegeben == TRUE)
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "Ich kenne den Händler, der den Banditen die Waffen liefert!", DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice (DIA_Addon_Vatras_Waffen, "Was wißt ihr schon über den Waffenhändler?", DIA_Addon_Vatras_Waffen_ToMartin);
	};
};
func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices (DIA_Addon_Vatras_Waffen);
};
func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_ToMartin_15_00"); //Was wisst ihr schon über den Waffenhändler?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_01"); //Sprich mit Martin dem Proviantmeister der Paladine darüber. Er kann dir sicher mehr dazu sagen.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_02"); //Er ist mit der Aufgabe betraut worden, den Waffenhändler zu entlarven.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_03"); //Du findest Martin im Hafenviertel. Wenn du eine Ansammlung von Kisten, Proviant und Paladinen siehst, ist Martin nicht weit.
		
	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_00"); //Ich kenne den Händler, der den Banditen die Waffen liefert!
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_01"); //Sein Name ist Fernando.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_02"); //Sehr gut. Hat Martin schon die nötigen Schritte eingeleitet, damit er keine Lieferungen mehr tätigen kann?
	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_Waffen_Success_15_03"); //Ja. Martin wird dafür sorgen, dass er den Kerker so bald nicht mehr verlässt.
		AI_Output	(self, other, "DIA_Addon_Vatras_Waffen_Success_05_04"); //Das hast du gut gemacht, mein Sohn.

		if (Npc_KnowsInfo (other, DIA_ADDON_Vatras_WannaBeRanger))
		&& (SC_IsRanger == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Success_15_05"); //(frech) Heißt das, du wirst mich jetzt in den 'Ring des Wassers' aufnehmen?
			AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_06"); //(schmunzelt) DAS war nicht unsere Abmachung - und das weißt du genau.
		};
		
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_Success_05_07"); //Möge Adanos deinen Weg erleuchten.
		
		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_CaughtFernando_15_09"); //Bisher noch nicht.
		AI_Output	(self, other, "DIA_Addon_Vatras_CaughtFernando_05_10"); //Dann beeil dich und berichte ihm davon. Das muss unverzüglich aufhören.
	};
};

// ************************************************************
// 			  				Waffenhändler
// ************************************************************
instance DIA_Addon_Vatras_WISP (C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_WISP_Condition;
	information	= DIA_Addon_Vatras_WISP_Info;

	description = "Gibt es etwas, das mir bei der Suche helfen kann?";
};
func int DIA_Addon_Vatras_WISP_Condition ()
{
	if (MIS_Vatras_FindTheBanditTrader != 0)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_WISP_Info ()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_WISP_15_00"); //Gibt es etwas, das mir bei der Suche helfen kann?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_01"); //Du bist sehr beharrlich, junger Mann. Aber mir fällt tatsächlich etwas ein, das dir deine Aufgaben erleichtern könnte.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_02"); //Ich werde dir dieses Erzamulett mitgeben. Du kannst es sicher gut gebrauchen.
	CreateInvItems (self, ItAm_Addon_WispDetector, 1);									
	B_GiveInvItems (self, other, ItAm_Addon_WispDetector, 1);
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_03"); //Es ist ein Amulett der suchenden Irrlichter.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_04"); //Es gibt nur sehr wenige dieser Art. Das Irrlicht, das in diesem Amulett inne wohnt, hat ganz besondere Eigenschaften.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_05"); //Es kann dir helfen, Dinge zu finden, die du mit bloßem Auge oft nicht sehen kannst.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_06"); //Um es zu rufen, musst du das Amulett nur anlegen.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_07"); //Wenn es seine Kraft verliert oder du es nicht finden kannst, lege das Amulett einfach nochmal an, und es wird wieder erscheinen.
	
	B_LogEntry (TOPIC_Addon_BanditTrader,"Vatras gab mir ein 'Ammulett des suchenden Irrlichts'. Es soll mir bei der Suche nach dem Waffenhändler helfen."); 
	Log_CreateTopic (TOPIC_WispDetector,LOG_NOTE);
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned); 
	B_LogEntry (TOPIC_WispDetector,LogText_Addon_WispLearned_NF); 

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_08"); //Das Irrlicht kann Waffen aufspüren.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_09"); //Bei deinen Nachforschungen über die Waffenlieferungen an die Banditen könnte es dir sehr nützlich sein.
	};

	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_WISP_05_10"); //Behandle es gut und es wird dich nie im Stich lassen.

	Info_ClearChoices (DIA_Addon_Vatras_WISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "Danke! Ich werde gut darauf achten.", DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "Kann das Irrlicht noch mehr?", DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice (DIA_Addon_Vatras_WISP, "Ein Irrlicht in einem Amulett?", DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;	
};
func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_Thanks_15_00"); //Danke! Ich werde gut darauf achten.
	Info_ClearChoices (DIA_Addon_Vatras_WISP);
};
func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output (other, self, "DIA_Addon_Vatras_Waffen_MoreWISP_15_00"); //Kann das Irrlicht noch mehr?
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_01"); //Mehr als nach Nahkampfwaffen zu suchen meinst du? Nicht, wenn du es ihm nicht beibringst.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_02"); //Soviel ich weiß ist Riordian ein Lehrmeister dieser Wesen. Er ist einer von uns und zurzeit mit Saturas unterwegs.
	AI_Output (self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_03"); //Vielleicht kann er dir mehr dazu sagen.

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Addon_BanditTrader,"Das suchende Irrlicht kann noch mehr als nur nach Nahkmpfwaffen suchen. Riordian, der Wassermagier, kann meinem Irrlicht beibringen, nach mehr Dingen zu suchen."); 
	};
};
func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output (other, self, "DIA_Addon_Vatras_WISPDETECTOR_was_15_00"); //Ein Irrlicht in einem Amulett?
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_01"); //Irrlichter sind bewundernswerte Geschöpfe. Sie bestehen aus reiner magischer Energie.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_02"); //Sie sind an das magische Erz dieser Welt gebunden. Es ist ihr Ursprung. Von ihm beziehen sie ihre Kraft.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_03"); //Es wundert mich nicht, dass du noch nie von ihnen gehört hast. Sie zeigen sich nur demjenigen, der ihr zugehöriges Erz trägt.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_04"); //Die freilebenden Irrlichter sind gewaltsam von ihrer Quelle entrissen worden und greifen jeden an, der sich ihnen nähert.
	AI_Output (self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_05"); //Diesen bedauernswerten Kreaturen ist nicht mehr zu helfen. Du solltest ihnen besser aus dem Weg gehen.
};

// ********************************************************
// 			  			  STONEPLATES
// *********************************************************
// ---------------------------------------------------------
// About Stoneplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_Stoneplate (C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_Stoneplate_Condition;
	information	= DIA_Addon_Vatras_Stoneplate_Info;

	description	= "Ich habe hier so eine Steintafel...";
};

func int DIA_Addon_Vatras_Stoneplate_Condition ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	&& (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_Stoneplate_15_00"); //Ich habe hier eine Steintafel. Kannst du mir mehr darüber sagen?
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_01"); //Das sind Artefakte der alten Kultur, die wir seit einiger Zeit untersuchen.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_02"); //Es gibt verschiedene Arten davon. Einige enthalten Informationen über die Geschichte des alten Volkes.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_03"); //Und genau an diesen bin ich interessiert. Bring mir davon alle, die du finden kannst.
	AI_Output	(self, other, "DIA_Addon_Vatras_Stoneplate_05_04"); //Ich werde dich angemessen entlohnen.

	Log_CreateTopic (TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Stoneplates, LogText_Addon_VatrasTrade); 
	
	Log_CreateTopic (TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, LogText_Addon_VatrasTrade);

};
// ---------------------------------------------------------
// Sell Stonplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_SellStonplate		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr		 	= 5;
	condition	= DIA_Addon_Vatras_SellStonplate_Condition;
	information	= DIA_Addon_Vatras_SellStonplate_Info;
	permanent 	= TRUE;
	description	= "Ich habe noch mehr Steintafeln für dich...";
};
func int DIA_Addon_Vatras_SellStonplate_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_Stoneplate))
	&& (Npc_HasItems (other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Addon_Vatras_SellStonplate_Info ()
{
	var int anzahl; anzahl = Npc_HasItems (other, ItWr_StonePlateCommon_Addon);
	
	if (anzahl == 1)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_SellStonplate_15_00"); //Ich habe noch eine Steintafel für dich ...
	}
	else 
	{
		//Fixme Joly --> Hier SC-output "Hier.." oder ähnliche --Mike
	};
	
	B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, anzahl);
		
	AI_Output	(self, other, "DIA_Addon_Vatras_SellStonplate_05_01"); //Gut!
	
	if (anzahl >= 10)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_02"); //Ich werde deine magische Kraft steigern!
		B_RaiseAttribute	(other, ATR_MANA_MAX, anzahl);
		Npc_ChangeAttribute	(other, ATR_MANA, anzahl);
	}
	else if (anzahl >= 5)
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_04"); //Hier, nimm ein paar Spruchrollen als Belohnung ...
		B_GiveInvItems (self, other, ItSc_InstantFireball, anzahl);
	}
	else // 1-4 Plates --> 2-5 Tränke
	{
		AI_Output (self, other, "DIA_Addon_Vatras_SellStonplate_05_03"); //Hier, nimm ein paar Tränke als Belohnung ...
		B_GiveInvItems (self, other, ItPo_Health_03, anzahl+1);
	};
	
	B_GivePlayerXP (XP_Addon_VatrasStonplate * anzahl);
};

// *********************************************************
// 			  			KLOSTER BYPASS
// *********************************************************
var int Vatras_SentToDaron;
// -----------------------------
instance DIA_Addon_Vatras_GuildHelp		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Vatras_GuildHelp_Condition;
	information	 = 	DIA_Addon_Vatras_GuildHelp_Info;

	description	 = 	"Lares sagt, du kannst mir helfen ins Kloster der Feuermagier zu kommen.";
};

func int DIA_Addon_Vatras_GuildHelp_Condition ()
{
	if (RangerHelp_gildeKDF == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_GuildHelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_00"); //Lares sagt, du kannst mir helfen, ins Kloster der Feuermagier zu kommen.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_01"); //Ist das deine Wahl? Der Weg des Feuers?
	AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_02"); //Ja. Ich will Magier des Feuers werden.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_03"); //Soviel ich weiß, nehmen sie gerne Novizen in ihrem Kloster auf. Wozu solltest du meine Hilfe brauchen?

	if (SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_04"); //Der Novize vor dem Kloster will von mir einen Tribut, damit er mich einlässt. Ein Schaf und eine Menge Gold.
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Vatras_GuildHelp_15_05"); //Lares erzählte etwas von einem Tribut, den sie verlangen, bevor sie jemanden ins Kloster lassen.
	};	
	
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_06"); //Ich selbst werde dir nicht den Einlass ins Kloster gewähren können. Ich bin Magier des Wassers, wie du weißt. Doch ich kenne den Feuermagier Daron sehr gut.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_07"); //Er hält sich die meiste Zeit auf dem Marktplatz auf und sammelt Spenden für seine Kirche.
	Vatras_SentToDaron = TRUE;
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_08"); //Mir ist zugetragen worden, dass er nicht nur in der Stadt ist, um Spenden zu sammeln.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_09"); //Mir hat er von einer Statuette berichtet, die ihm gestohlen wurde.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_10"); //Sie war ihm sehr wichtig. Ich bin mir sicher, er wird dir Einlass ins Kloster gewähren, wenn du sie ihm wiederbeschaffen kannst.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_11"); //Natürlich wird deine Entscheidung, dem Kreis des Feuers beizutreten nicht verhindern, dass du in den Ring aufgenommen werden kannst.
	AI_Output	(self, other, "DIA_Addon_Vatras_GuildHelp_05_12"); //Falls du dich als würdig erweisen solltest.
	MIS_Addon_Vatras_Go2Daron = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RangerHelpKDF,"Daron der Feuermagier am Marktplatz wird mir helfen ins Kloster zu kommen, wenn ich ihm seine gestohlene Statuette wieder beschaffe. "); 
};


// ************************************************************
// ***														***
//							Gothic II 
// ***														***
// ************************************************************

// ============================================================
// MORE 	(Wegen der alten Scheiße...)
// ============================================================
instance DIA_Vatras_MORE		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 = 	998;
	condition	 = 	DIA_Vatras_MORE_Condition;
	information	 = 	DIA_Vatras_MORE_Info;
	permanent    =  TRUE;
	description	 = 	"(Mehr)";
};
func int DIA_Vatras_MORE_Condition ()
{
	if (Vatras_MORE == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_MORE_Info ()
{
	Vatras_MORE = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info INFLUENCE (SEGEN)
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INFLUENCE		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 = 	92;
	condition	 = 	DIA_Vatras_INFLUENCE_Condition;
	information	 = 	DIA_Vatras_INFLUENCE_Info;
	permanent    =  FALSE;
	description	 = 	"Ich bitte um deinen Segen.";
};
func int DIA_Vatras_INFLUENCE_Condition ()
{
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	}; 
};
func void DIA_Vatras_INFLUENCE_Info ()
{
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_00"); //Ich bitte um deinen Segen.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_05_01"); //Für was soll ich dir meinen Segen geben, Fremder?
	AI_Output (other, self, "DIA_Vatras_INFLUENCE_15_02"); //Ich will als Lehrling bei einem der Meister in der Unterstadt anfangen.
	AI_Output (self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_11"); //Gehe mit dem Segen Adanos, mein Sohn!
	Snd_Play ("LevelUp");
	B_GivePlayerXP (XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry (TOPIC_Thorben,"Vatras, der Wassermagier, hat mich gesegnet.");
};

///////////////////////////////////////////////////////////////////////
//	Info WoKdF
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_WoKdF (C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  93;
	condition	 = 	DIA_Vatras_WoKdF_Condition;
	information	 = 	DIA_Vatras_WoKdF_Info;
	permanent    =  FALSE;
	description	 = 	"Wo finde ich einen Geweihten Innos'?";		
};

func int DIA_Vatras_WoKdF_Condition ()
{	
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Vatras_Segen == TRUE)
	&& (Vatras_SentToDaron == FALSE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_WoKdF_Info ()
{
	AI_Output (other, self, "DIA_Vatras_WoKdF_15_00"); //Wo finde ich einen Geweihten Innos'?
	AI_Output (self, other, "DIA_Vatras_WoKdF_05_01"); //Am besten schaust du mal am Marktplatz vorbei. Dort wirst du einen Abgesandten des Klosters finden.
};

///////////////////////////////////////////////////////////////////////
//	Info Spende
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Spende (C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  94;
	condition	 = 	DIA_Vatras_Spende_Condition;
	information	 = 	DIA_Vatras_Spende_Info;
	permanent    =  TRUE;
	description	 = 	"Ich will Adanos etwas spenden!";
};

func int DIA_Vatras_Spende_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_Spende_Info ()
{
	AI_Output (other, self, "DIA_Vatras_Spende_15_00"); //Ich will Adanos etwas spenden!
	AI_Output (self, other, "DIA_Vatras_Spende_05_01"); //Eine Spende an die Kirche Adanos würde einen Teil der Sünden, die du bis jetzt auf dich geladen haben magst, mindern, mein Sohn.
	AI_Output (self, other, "DIA_Vatras_Spende_05_02"); //Wie viel kannst du geben?
	
	Info_ClearChoices   (DIA_Vatras_Spende);
	Info_AddChoice 		(DIA_Vatras_Spende, "Ich habe zur Zeit nichts übrig...", DIA_Vatras_Spende_BACK);
	if (Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "Ich habe 50 Goldstücke.", DIA_Vatras_Spende_50);
	};
	if (Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice 		(DIA_Vatras_Spende, "Ich habe 100 Goldstücke.",	DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output (other, self, "DIA_Vatras_Spende_BACK_15_00"); //Ich habe zurzeit nichts übrig ...
	AI_Output (self, other, "DIA_Vatras_Spende_BACK_05_01"); //Das ist nicht schlimm, du kannst deinen guten Willen auch später noch in die Tat umsetzen, mein Sohn.
	Info_ClearChoices   (DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output (other, self, "DIA_Vatras_Spende_50_15_00"); //Ich habe 50 Goldstücke ...
	AI_Output (self, other, "DIA_Vatras_Spende_50_05_01"); //Ich danke dir im Namen Adanos, mein Sohn. Dein Gold wird unter den Bedürftigen verteilt werden.
	B_GiveInvItems (other, self, Itmi_Gold, 50);
	Info_ClearChoices   (DIA_Vatras_Spende);
};
	
func void DIA_Vatras_Spende_100()
{
	AI_Output (other, self, "DIA_Vatras_Spende_100_15_00"); //Ich habe 100 Goldstücke ...
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_01"); //Ich segne dich im Namen Adanos für diese großzügige Tat!
	Snd_Play ("LevelUp");
	AI_Output (self, other, "DIA_Vatras_Spende_100_05_02"); //Möge der Weg, den du einschlägst, unter dem Segen Adanos stehen!
	B_GiveInvItems (other, self, ITmi_Gold, 100);
	Vatras_Segen = TRUE;
	Info_ClearChoices   (DIA_Vatras_Spende);
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		B_LogEntry (TOPIC_Thorben,"Vatras, der Wassermagier, hat mich gesegnet.");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_CanTeach		(C_INFO)
{
	npc		 	 = 	VLK_439_Vatras;
	nr			 =  95;
	condition	 = 	DIA_Vatras_CanTeach_Condition;
	information	 = 	DIA_Vatras_CanTeach_Info;
	permanent    =  FALSE;
	description	 = 	"Kannst du mir etwas über die Magie beibringen?";
};

func int DIA_Vatras_CanTeach_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Vatras_CanTeach_15_00"); //Kannst du mir etwas über die Magie beibringen?
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_01"); //Nur den Erwählten Innos und den Erwählten Adanos ist es gestattet, Runenmagie zu wirken.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_02"); //Aber auch gewöhnliche Sterbliche können Magie mit Hilfe von Spruchrollen wirken.
	AI_Output (self, other, "DIA_Vatras_CanTeach_05_03"); //Ich kann dir zeigen, wie du deine magischen Kräfte kanalisieren und erweitern kannst.
	
	Vatras_TeachMANA = TRUE;
	Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
	B_LogEntry (Topic_CityTeacher,"Vatras der Wassermagier, kann mir dabei helfen, meine magische Energie zu steigern.");
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Teach		(C_INFO)
{
	npc		  	 = 	VLK_439_Vatras;
	nr			 = 	100;
	condition	 = 	DIA_Vatras_Teach_Condition;
	information	 = 	DIA_Vatras_Teach_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich will meine magischen Kräfte steigern.";
};
func int DIA_Vatras_Teach_Condition ()
{	
	if (Vatras_TeachMANA == TRUE)
	// --------------------
	&& (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_Teach_Info ()
{
	AI_Output (other, self, "DIA_Vatras_Teach_15_00"); //Ich will meine magischen Kräfte steigern.
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
};
func void DIA_Vatras_Teach_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output (self, other, "DIA_Vatras_Teach_05_00"); //Deine magische Kraft ist über mein Lehrverständnis hinausgewachsen.
	};
	Info_ClearChoices (DIA_Vatras_TEACH);
};
func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_HIGH);
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_TEACH_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
	
};
func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_HIGH);
	
	Info_ClearChoices   (DIA_Vatras_Teach);
	
	Info_AddChoice 		(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_Vatras_Teach_1);
	Info_AddChoice		(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_Vatras_Teach_5);
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info GODS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_GODS		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr          = 	98;	//Joly: bracuht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition	 = 	DIA_Vatras_GODS_Condition;
	information	 = 	DIA_Vatras_GODS_Info;
	permanent	 =  TRUE;
	description	 = 	"Erzähl mir über die Götter";
};

func int DIA_Vatras_GODS_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_GODS_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_15_00"); //Erzähl mir über die Götter.
	AI_Output			(self, other, "DIA_Vatras_GODS_05_01"); //Was genau möchtest du wissen?
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK);
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Innos",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Adanos",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Beliar",DIA_Vatras_GODS_BELIAR); 		 
	 		 
};
FUNC VOID DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices (DIA_Vatras_GODS); 
};
FUNC VOID DIA_Vatras_GODS_INNOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_INNOS_15_00"); //Erzähl mir über Innos.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_01"); //Also gut. (predigt) Innos ist der erste und oberste Gott. Er schuf die Sonne und die Welt.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_02"); //Er gebietet über Licht und Feuer, die seine Geschenke an die Menschen sind. Er ist Gesetz und Gerichtsbarkeit.
	AI_Output			(self, other, "DIA_Vatras_GODS_INNOS_05_03"); //Seine Priester sind die Magier des Feuers, die Paladine seine Streiter.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Innos",DIA_Vatras_GODS_INNOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Adanos",DIA_Vatras_GODS_ADANOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Beliar",DIA_Vatras_GODS_BELIAR); 	
	
};
FUNC VOID DIA_Vatras_GODS_ADANOS()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_ADANOS_15_00"); //Erzähl mir über Adanos.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_01"); //Adanos ist der Gott der Mitte. Er ist die Waagschale der Gerechtigkeit, der Hüter des Gleichgewichts zwischen Innos und Beliar.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_02"); //Er gebietet über die Kraft der Veränderung, sein Geschenk ist das Wasser in allen Meeren, Flüssen und Seen.
	AI_Output			(self, other, "DIA_Vatras_GODS_ADANOS_05_03"); //Seine Priester sind die Magier des Wassers, so wie auch ich ein Diener und Priester von Adanos bin.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 	
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Innos",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Adanos",DIA_Vatras_GODS_ADANOS);
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Beliar",DIA_Vatras_GODS_BELIAR); 	

};
FUNC VOID DIA_Vatras_GODS_BELIAR()
{
	AI_Output			(other, self, "DIA_Vatras_GODS_BELIAR_15_00"); //Erzähl mir über Beliar.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_01"); //Beliar ist der finstere Gott des Todes, der Zerstörung und alles Widernatürlichen.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_02"); //Er liegt im ewigen Kampf mit Innos, doch Adanos bewahrt das Gleichgewicht zwischen den beiden.
	AI_Output			(self, other, "DIA_Vatras_GODS_BELIAR_05_03"); //Nur wenige Menschen folgen Beliars Ruf - doch denen, die es tun, verleiht er große Stärke.
	
	Info_ClearChoices (DIA_Vatras_GODS); 
	Info_AddChoice	  (DIA_Vatras_GODS,DIALOG_BACK             ,DIA_Vatras_GODS_BACK); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Innos",DIA_Vatras_GODS_INNOS); 		 
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Adanos",DIA_Vatras_GODS_ADANOS); 
	Info_AddChoice	  (DIA_Vatras_GODS,"Erzähl mir über Beliar",DIA_Vatras_GODS_BELIAR); 			 
	
};
///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HEAL		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr          = 	99;	//Joly: bracuht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition	 = 	DIA_Vatras_HEAL_Condition;
	information	 = 	DIA_Vatras_HEAL_Info;
	permanent	 = 	TRUE;
	description	 = 	"Kannst du mich heilen?";
};

func int DIA_Vatras_HEAL_Condition ()
{	
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_HEAL_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_HEAL_15_00"); //Kannst du mich heilen?
	
	if hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]
	{
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_01"); //(andächtig) Adanos segne diesen Körper. Befreie ihn von seinen Wunden und stärke ihn mit neuem Leben.
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen (PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);   
	}
	else 
	{	
		AI_Output			(self, other, "DIA_Vatras_HEAL_05_02"); //Du bedarfst zurzeit nicht der heilenden Magie.
	};	
};

// ********************************************************************
// 							Isgaroth Mission
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MISSION		(C_INFO)
{
	npc		 	= VLK_439_Vatras;
	nr 			= 1; 
	condition	= DIA_Vatras_MISSION_Condition;
	information	= DIA_Vatras_MISSION_Info;
	
	important	= TRUE;
};
func int DIA_Vatras_MISSION_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Kapitel == 2)
	
	{
		return TRUE;
	};
};
func void DIA_Vatras_MISSION_Info ()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_10"); //Ich habe eine Botschaft für Meister Isgaroth. Er ist der Wächter des Schreins vor dem Kloster.
	AI_Output (self, other, "DIA_Vatras_MISSION_05_01"); //Wenn du diesen Weg für mich gehst, kannst du deine Belohnung selber wählen.
	
	Info_ClearChoices   (DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Jetzt nicht.",DIA_Vatras_MISSION_NO);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Klar.",DIA_Vatras_MISSION_YES);
};
FUNC VOID B_SayVatrasGo()
{
	AI_Output (self, other, "DIA_Vatras_Add_05_13"); //Gut. Dann mache dich nun auf den Weg zu Meister Isgaroth.
};
func VOID DIA_Vatras_MISSION_YES()
{
	AI_Output (other, self, "DIA_Vatras_MISSION_YES_15_00"); //Ich mach's.
	AI_Output (self, other, "DIA_Vatras_Add_05_11"); //Gut, dann nimm die Botschaft und wähle eine dieser Spruchrollen.
	AI_Output (self, other, "DIA_Vatras_Add_05_12"); //Wenn du die Botschaft überbracht hast, werde ich dich angemessen entlohnen.
	
	B_GiveInvItems (self, hero, ItWr_VatrasMessage,1); 
	MIS_Vatras_Message = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Botschaft,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Botschaft,LOG_RUNNING);
	B_LogEntry (TOPIC_Botschaft,"Vatras hat mir eine Botschaft für Meister Isgaroth gegeben. Er wacht am Schrein vor dem Kloster.");
	
	Info_ClearChoices 	(DIA_Vatras_MISSION);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Ich nehme den Lichtzauber",DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice 		(DIA_Vatras_MISSION,"Ich wähle die Heilung",DIA_Vatras_MISSION_HEAL);	
	Info_AddChoice 		(DIA_Vatras_MISSION,"Gib mir den Eispfeil",DIA_Vatras_MISSION_ICE);	
};
FUNC VOID DIA_Vatras_MISSION_NO ()
{	
	//AI_Output	(other, self, "DIA_Vatras_MISSION_NO_15_00"); //Such dir einen anderen Laufburschen, alter Mann!
	AI_Output (other, self, "DIA_ADDON_Vatras_MISSION_NO_15_00"); //Jetzt nicht!
	AI_Output (self, other, "DIA_ADDON_Vatras_MISSION_NO_05_01"); //Kein Problem. Ich werde jemand anderen schicken.
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_HEAL()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_HEAL_15_00"); //Ich wähle die Heilung.
	 B_SayVatrasGo();
	 
	B_GiveInvItems (self, hero,ItSc_LightHeal ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_ICE()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_ICE_15_00"); //Gib mir den Eispfeil.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Icebolt ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
FUNC VOID DIA_Vatras_MISSION_LIGHT()
{
	AI_Output			(other, self, "DIA_Vatras_MISSION_LIGHT_15_00"); //Ich nehme den Lichtzauber.
	B_SayVatrasGo();
	
	B_GiveInvItems (self, hero,ItSc_Light ,1);
	Info_ClearChoices 	(DIA_Vatras_MISSION);
};
///////////////////////////////////////////////////////////////////////
//	Info MESSAGE_SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MESSAGE_SUCCESS		(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr 			= 1; 
	condition	= DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information	= DIA_Vatras_MESSAGE_SUCCESS_Info;
	
	description	= "Ich habe die Botschaft überbracht";
};

func int DIA_Vatras_MESSAGE_SUCCESS_Condition ()
{	
	if (MIS_Vatras_Message == LOG_RUNNING)
	&& (Vatras_Return == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_MESSAGE_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Vatras_MESSAGE_SUCCESS_15_00"); //Ich habe die Botschaft überbracht.
	AI_Output (self, other, "DIA_Vatras_Add_05_14"); //Sei bedankt dafür. Dann wähle nun deinen Lohn.
	
	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);
	
	Info_ClearChoices (DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 Pflanze Kronstöckl",DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"Ring der Gewandtheit",DIA_Vatras_MESSAGE_SUCCESS_Ring);	
	Info_AddChoice 	  (DIA_Vatras_MESSAGE_SUCCESS,"1 Erzbrocken",DIA_Vatras_MESSAGE_SUCCESS_Ore);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems (self, hero,ItPl_Perm_Herb ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems (self, hero,ItRi_Dex_01 ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};
FUNC VOID DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems (self, hero,ItMI_Nugget ,1);
	Info_ClearChoices 	(DIA_Vatras_MESSAGE_SUCCESS);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

////////////////////////// Geht weg //////////////////////////////////
const int kurz = 0;
const int lang = 1;

var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg (var int dauer)
{
	// EXIT IF
	
	if (Vatras_einmalLangWeg == TRUE)
	{
		return;
	};
	
	//FUNC
	
	if (Npc_GetDistToWP (self, "NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500)
	&& (Npc_WasInState (self, ZS_Preach_Vatras))
	{
		B_StopLookAt(self);
		AI_AlignToWP (self);
		
		AI_Output (self, other, "DIA_Vatras_Add_05_06"); //Hört zu, Leute! Ich werde woanders gebraucht.
		if (dauer == kurz)
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_07"); //Es wird nicht lange dauern. Sobald ich zurückkehre, werde ich euch die Geschichte weitererzählen.
		}
		else //lang
		{
			AI_Output (self, other, "DIA_Vatras_Add_05_08"); //Ich weiß nicht, ob ich zurückkommen werde. Wenn ihr wissen wollt, wie die Geschichte ausgeht, lest es in den alten Schriften nach.
			
			Vatras_einmalLangWeg = TRUE;
		};
		AI_Output (self, other, "DIA_Vatras_Add_05_09"); //Möge Adanos mit euch sein!
		
		B_TurnToNpc (self, other);
	};
	
	Vatras_SchickeLeuteWeg = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info AbloesePre
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AbloesePre		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_AbloesePre_Condition;
	information	 = 	DIA_Addon_Vatras_AbloesePre_Info;

	description	 = 	"Ich hab' da ein Problem mit dem Auge Innos.";
};

func int DIA_Addon_Vatras_AbloesePre_Condition ()
{
	if ((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken  == TRUE))
	&& (Kapitel == 3)
	&& (VatrasCanLeaveTown_Kap3 == FALSE)
	&& (RavenIsDead == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Addon_Vatras_AbloesePre_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_00"); //Ich hab' da ein Problem mit dem Auge Innos'. Ich könnte deine Hilfe brauchen.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_01"); //Und erfordert dein Problem, dass ich die Stadt verlassen muss?
	AI_Output	(other, self, "DIA_Addon_Vatras_AbloesePre_15_02"); //Weiß nicht. Möglich.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_03"); //Ich warte schon seit Tagen auf meine Ablösung. Die anderen Wassermagier sollten schon längst wieder in Khorinis sein.
	AI_Output	(self, other, "DIA_Addon_Vatras_AbloesePre_05_04"); //Sorge dafür, dass wenigstens einer von ihnen mich in der Stadt ablöst, dann kann ich dir sicher auch bei deinem Problem helfen.
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	
	Log_CreateTopic (TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_VatrasAbloesung,"Vatras wird mir bei meinem Problem mit dem 'Auge Innos' nicht helfen können, solange kein anderer Wassermagier ihn in der Stadt vertritt."); 
};

///////////////////////////////////////////////////////////////////////
//	Info AddonSolved
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AddonSolved		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Vatras_AddonSolved_Condition;
	information	 = 	DIA_Addon_Vatras_AddonSolved_Info;

	description	 = 	"Deine Ablösung ist da.";
};

func int DIA_Addon_Vatras_AddonSolved_Condition ()
{
	 if (RavenIsDead == TRUE)
	 {
		return TRUE;
	 };
};

func void DIA_Addon_Vatras_AddonSolved_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_00"); //Deine Ablösung ist da.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_01"); //Sind die Dinge jenseits der Berge im Nordosten geregelt?
	AI_Output	(other, self, "DIA_Addon_Vatras_AddonSolved_15_02"); //Ja, das sind sie. Raven ist tot und die Bedrohung ist abgewendet.
	AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_03"); //Das sind wahrlich gute Neuigkeiten. Hoffen wir, dass sich derartige Dinge nicht wieder ereignen.

	if (Npc_KnowsInfo (other, DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_04"); //NUN kann ich dir bei deinem kleinen Problem helfen.
		AI_Output	(self, other, "DIA_Addon_Vatras_AddonSolved_05_05"); //Soweit ich mich erinnere, hatte es mit Auge Innos' zu tun, nicht wahr?
	};
	VatrasCanLeaveTown_Kap3 = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info InnoseyeKaputt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INNOSEYEKAPUTT		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	2;
	condition	 = 	DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information	 = 	DIA_Vatras_INNOSEYEKAPUTT_Info;

	description	 = 	"Das Auge Innos ist zerbrochen.";
};

func int DIA_Vatras_INNOSEYEKAPUTT_Condition ()
{
		if 	(	(Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || 	(MIS_SCKnowsInnosEyeIsBroken  == TRUE)	)
		&& (Kapitel == 3)
		&& (VatrasCanLeaveTown_Kap3 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info ()
{
	if (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_00"); //Pyrokar schickt mich.
	}
	else if (MIS_Xardas_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_01"); //Xardas schickt mich.
	};

	MIS_SCKnowsInnosEyeIsBroken  = TRUE;
	B_GivePlayerXP (XP_Ambient);

	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_02"); //Das Auge Innos' ist zerbrochen.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_03"); //Ich weiß. Ich habe es schon von einigen aufgebrachten Novizen erfahren.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_04"); //Die Suchenden haben den Sonnenkreis der Feuermagier dazu benutzt, um das Auge Innos zu zerstören.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_05"); //Einen gelungenen Schachzug des Gegners würde ich das nennen.

	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Nachrichten verbreiten sich schnell in dieser Stadt.", DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten );

	if (hero.guild == GIL_KDF)
	&& (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Warum hat mich Pyrokar gerade zu dir geschickt?", DIA_Vatras_INNOSEYEKAPUTT_warumdu );
	};
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Was soll nun mit dem Auge geschehen?", DIA_Vatras_INNOSEYEKAPUTT_Auge );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00"); //Was soll nun mit dem Auge geschehen?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01"); //Wir müssen es wieder zusammenfügen. Aber das ist keine leichte Aufgabe, fürchte ich.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02"); //Die Fassung ist in zwei Teile zerbrochen. Dies vermag ein geschickter Schmied wieder zu richten.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03"); //Aber das ist eigentlich nicht die Schwierigkeit dabei. Vielmehr macht mir der eingelassene Edelstein Sorgen.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04"); //Er ist matt und kraftlos. Der Feind scheint genau gewusst zu haben, wie man ihn schwächt.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Wo finde ich einen Schmied, der die Fassung reparieren kann?", DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Wie erhält der Edelstein seine Kraft zurück?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00"); //Wie erhält der Edelstein seine Kraft zurück?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01"); //Ich sehe nur einen Weg. Eine Vereinigung der drei herrschenden Gottheiten sollte den gewünschten Effekt erzielen.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02"); //Ein gut vorbereites Umkehrritual an dem Ort seiner Zerstörung wird dem Edelstein wieder Feuer geben.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03"); //Das Problem dabei ist allerdings, dass du jeweils einen irdischen Vertreter von jedem der drei Götter zu diesem Ort bringen musst.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04"); //Des weiteren bräuchte man eine Menge Sumpfkraut für dieses Ritual. Ich schätze, 3 Krautpflanzen müssten es schon sein.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Wer könnten diese drei irdischen Vertreter der Götter sein?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer );
	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Wo würde ich dieses Sumpfkraut finden?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut );
};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00"); //Wo würde ich dieses Sumpfkraut finden?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01"); //Ich habe da etwas von einer alten Giftmischerin namens Sagitta in den Wäldern gehört. Sie soll angeblich solches Kraut verkaufen.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02"); //Du könntest dein Glück aber auch unten am Hafen versuchen.
	

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00"); //Wer könnten diese drei irdischen Vertreter der Götter sein?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01"); //Für den Gott Adanos werde ich mich zur Verfügung stellen.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02"); //Pyrokar, der oberste Feuermagier, wäre der Richtige, um den Gott Innos zu vertreten.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03"); //Aber für Beliar fällt mir kein geeigneter Bewerber ein. Es müsste jemand sein, der die schwarze Magie beherrscht.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Schwarze Magie? Was ist mit Xardas?", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas );

};
func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00"); //Schwarze Magie? Was ist mit Xardas?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01"); //Das ist es. Das könnte funktionieren.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02"); //Doch frage ich mich, wie du uns alle drei zusammenbringen willst.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03"); //Ich sehe doch jetzt schon Pyrokars Gesicht, wenn er hört, dass er mit Xardas an einem Strang ziehen soll.

	Info_AddChoice	(DIA_Vatras_INNOSEYEKAPUTT, "Ich muß los.", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter );
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00"); //Wo finde ich einen Schmied, der die Fassung des Auges reparieren kann?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01"); //Frage in den umliegenden Gebieten nach einem, der sich auf das Reparieren von Kleinoden versteht.
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00"); //Warum hat mich Pyrokar gerade zu dir geschickt?
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01"); //Ich habe geahnt, dass so etwas früher oder später geschehen würde.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02"); //Pyrokar fühlt sich immer so unverletzbar und erhaben, dass es schon fast an Leichtsinn grenzt.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03"); //Daher waren seine Vorsichtsmaßnahmen, das Auge zu schützen, auch so nachlässig.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04"); //Ich denke einfach, dass er sich unterbewusst auf meine Fähigkeiten verlässt, die mir Adanos Macht verleiht.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05"); //Gar nicht auszudenken, was passieren würde, wenn ich jetzt nicht zur Stelle wäre.

};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00"); //Nachrichten verbreiten sich schnell in dieser Stadt.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01"); //Das ist auch gut so. Der Feind wird genauso wenig schlafen.

};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter ()
{
	AI_Output			(other, self, "DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00"); //Ich muss los.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01"); //Ich werde ebenfalls aufbrechen und am Sonnenkreis die Zeremonie vorbereiten.
	AI_Output			(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02"); //Schicke Xardas und Pyrokar dorthin. Und vergiss nicht, das Sumpfkraut mitzubringen. Ich verlass mich auf dich.
	
	B_LogEntry (TOPIC_INNOSEYE, "Vatras will ein Ritual am Sonnenkreis abhalten um das Auge wieder zu heilen. Ich muss Xardas und Pyrokar überzeugen, daran teilzunehmen. Ausserdem muss ich einen Schmied finden, der mir die zerbrochene Fassung des Amuletts repariert.");

	MIS_RitualInnosEyeRepair = LOG_RUNNING;
	Info_ClearChoices	(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine	(self,"RITUALINNOSEYEREPAIR");

	
	// ------ Zuhörer weg -------
		B_Vatras_Geheweg (kurz);
	// --------------------------
	
	//Joly: Weg mit den Ritualdementoren!!!!!

	DMT_1201.aivar[AIV_EnemyOverride] = TRUE;	//Joly: Damit sie erstmal nicht die Welt entvölkern, ohne Zutun des Spielers!!!!!
	DMT_1202.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1203.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1204.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1205.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1206.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1207.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1208.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1209.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1210.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1211.aivar[AIV_EnemyOverride] = TRUE;

	B_StartOtherRoutine (DMT_1201 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1202 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1203 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1204 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1205 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1206 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1207 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1208 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1209 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1210 ,"AfterRitual");
	B_StartOtherRoutine	(DMT_1211 ,"AfterRitual");
};
///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_RitualInnosEyeRepair		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_RitualInnosEyeRepair_Condition;
	information	 = 	DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wie steht's ums Auge Innos'?";
};

func int DIA_Vatras_RitualInnosEyeRepair_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_RUNNING)
		&& (Kapitel == 3)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_RitualInnosEyeRepair_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_RitualInnosEyeRepair_15_00"); //Wie steht's ums Auge Innos'?
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_01"); //Denke daran: Nur ein Umkehrritual am Sonnenkreis zusammen mit Xardas und Pyrokar wird das Auge wieder heilen.
	AI_Output			(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_02"); //Und vergiss nicht, das Auge mit der reparierten Fassung mitzubringen.
};

///////////////////////////////////////////////////////////////////////
//	Info Beginn
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_BEGINN		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	31;
	condition	 = 	DIA_Vatras_BEGINN_Condition;
	information	 = 	DIA_Vatras_BEGINN_Info;

	description	 = 	"Ich habe alles erledigt, was du mir aufgetragen hast.";
};

func int DIA_Vatras_BEGINN_Condition ()
{
	if (Kapitel == 3)
		&& (Npc_GetDistToWP(self,		"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_GetDistToWP(Xardas,		"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_GetDistToWP(Pyrokar,	"NW_TROLLAREA_RITUAL_02")<2000) 
		&& (Npc_HasItems (other,ItMi_InnosEye_Broken_MIS))
		&& (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Vatras_BEGINN_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_00"); //Ich habe alles erledigt, was du mir aufgetragen hast. Hier hast du das reparierte Auge.
	B_GivePlayerXP (XP_RitualInnosEyeRuns);

	B_GiveInvItems 		(other, self, ItMi_InnosEye_Broken_MIS, 1);
	Npc_RemoveInvItem 	(self, ItMi_InnosEye_Broken_MIS);

	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_01"); //Tatsächlich fehlt nun nichts mehr, um das Umkehrritual zu vollziehen.
	AI_Output			(other, self, "DIA_Vatras_BEGINN_15_02"); //Was ist mit dem Sumpfkraut?
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_03"); //Ach ja. Hast du denn 3 Sumpfkrautpflanzen dabei?
	
	if (B_GiveInvItems (other, self, ItPL_SwampHerb,3))
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_04"); //Ähm. Ja. Hier hast du die 3 Pflanzen.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_05"); //Großartig.
		B_GivePlayerXP (XP_Ambient);
	}
	else
	{
		AI_Output			(other, self, "DIA_Vatras_BEGINN_15_06"); //Nein. Leider nicht.
		AI_Output			(self, other, "DIA_Vatras_BEGINN_05_07"); //Na schön. Dann muss es eben ohne gehen.
	};
	
	AI_Output			(self, other, "DIA_Vatras_BEGINN_05_08"); //Das hast du gut gemacht, doch trete nun beiseite, damit wir mit der Zeremonie beginnen können. Möge sich unser Geist vereinen.
 	
	Info_ClearChoices	(DIA_Vatras_BEGINN);
	Info_AddChoice	(DIA_Vatras_BEGINN, DIALOG_ENDE, DIA_Vatras_BEGINN_los );

};
func void DIA_Vatras_BEGINN_los ()
{
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
 	
 	Npc_ExchangeRoutine	(self,"RITUALINNOSEYE");
	B_StartOtherRoutine   (Xardas,"RITUALINNOSEYE");
	B_StartOtherRoutine   (Pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk (self,60);

	RitualInnosEyeRuns = LOG_RUNNING;
};


///////////////////////////////////////////////////////////////////////
//	Info augeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_AUGEGEHEILT		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_AUGEGEHEILT_Condition;
	information	 = 	DIA_Vatras_AUGEGEHEILT_Info;
	important	 = 	TRUE;
};

func int DIA_Vatras_AUGEGEHEILT_Condition ()
{
	if (Kapitel == 3)
		&& (RitualInnosEyeRuns == LOG_RUNNING)
		&& (Npc_RefuseTalk(self) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Vatras_AUGEGEHEILT_Info ()
{
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_00"); //Es ist vollbracht. Es ist uns gelungen, den Plan des Feindes zu vereiteln und das Auge wieder zu heilen.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_01"); //Lass dir den Umgang mit seiner Macht von Pyrokar erklären.
	AI_Output			(self, other, "DIA_Vatras_AUGEGEHEILT_05_02"); //Ich hoffe, ich werde dich wiedersehen, wenn du deine Aufgabe erledigt hast. Leb wohl.
 	
 	B_LogEntry (TOPIC_INNOSEYE, "Das Auge ist geheilt. Pyrokar wird es mir überreichen und dann auf zur Drachenjagd.");
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;
 
 	RitualInnosEyeRuns = LOG_SUCCESS;
 	MIS_RitualInnosEyeRepair = LOG_SUCCESS;	
 
	B_StartOtherRoutine   (Pyrokar,"RitualInnosEyeRepair");
	B_StartOtherRoutine   (Xardas, "RitualInnosEyeRepair");
	
	B_StartOtherRoutine  (VLK_455_Buerger,"START");
	B_StartOtherRoutine  (VLK_454_Buerger,"START");
	B_StartOtherRoutine  (VLK_428_Buergerin,"START");
	B_StartOtherRoutine  (VLK_450_Buerger,"START");
	B_StartOtherRoutine  (VLK_426_Buergerin,"START");
	B_StartOtherRoutine  (VLK_421_Valentino,"START");
};



///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_PERMKAP3		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	33;
	condition	 = 	DIA_Vatras_PERMKAP3_Condition;
	information	 = 	DIA_Vatras_PERMKAP3_Info;

	description	 = 	"Danke für deine Hilfe, das Auge Innos' zu heilen. ";
};

func int DIA_Vatras_PERMKAP3_Condition ()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
		{
			return TRUE;
		};	
};

func void DIA_Vatras_PERMKAP3_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_PERMKAP3_15_00"); //Danke für deine Hilfe, das Auge Innos' zu heilen.
	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_01"); //Sei nicht so verschwenderisch mit deinem Dank. Deine größte Aufgabe liegt noch vor dir.

	if (MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_02"); //Sprich mit Pyrokar, er wird dir alles Weitere erklären.
	};

	AI_Output			(self, other, "DIA_Vatras_PERMKAP3_05_03"); //Ich hoffe, ich sehe dich heil wieder, mein Sohn.

};

///////////////////////////////////////////////////////////////////////
//	Info HildaKrank
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HILDAKRANK		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	34;
	condition	 = 	DIA_Vatras_HILDAKRANK_Condition;
	information	 = 	DIA_Vatras_HILDAKRANK_Info;

	description	 = 	"Lobarts Frau Hilda ist krank.";
};

func int DIA_Vatras_HILDAKRANK_Condition ()
{
	if (MIS_HealHilda == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Vatras_GREET))
		{
				return TRUE;
		};
};

func void DIA_Vatras_HILDAKRANK_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_HILDAKRANK_15_00"); //Lobarts Frau Hilda ist krank.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_01"); //Was denn? Schon wieder? Die gute Frau sollte ein bisschen mehr Acht auf sich geben.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_02"); //Ein harter Winter und sie weilt nicht mehr bei uns. Na schön, ich werde ihr ein fiebersenkendes Mittel geben.
	AI_Output			(self, other, "DIA_Vatras_HILDAKRANK_05_03"); //Ach, weißt du, da du gerade schon einmal da bist, kannst du es ihr auch vorbeibringen.
	CreateInvItems (self, ItPo_HealHilda_MIS, 1);									
	B_GiveInvItems (self, other, ItPo_HealHilda_MIS, 1);					
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_OBSESSION		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	35;
	condition	 = 	DIA_Vatras_OBSESSION_Condition;
	information	 = 	DIA_Vatras_OBSESSION_Info;

	description	 = 	"Ich trage so ein beklemmendes Gefühl in mir.";
};

func int DIA_Vatras_OBSESSION_Condition ()
{
	if (SC_IsObsessed == TRUE)
	&& (SC_ObsessionTimes < 1)
		{
				return TRUE;
		};
};

func void DIA_Vatras_OBSESSION_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_OBSESSION_15_00"); //Ich trage so ein beklemmendes Gefühl in mir.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_01"); //Du siehst auch nicht gesund aus. Du bist dem schwarzen Blick der Suchenden zu lange ausgesetzt gewesen.
	AI_Output			(self, other, "DIA_Vatras_OBSESSION_05_02"); //Ich bin kann nur dein Fleisch heilen, doch deine Seele kann dir nur das Kloster reinigen. Sprich mit Pyrokar. Er wird dir helfen.
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################


// ************************************************************
// 	  				   Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_Vatras_AllDragonsDead(C_INFO)
{
	npc			= VLK_439_Vatras;
	nr			= 59;
	condition	= DIA_Vatras_AllDragonsDead_Condition;
	information	= DIA_Vatras_AllDragonsDead_Info;
	description = "Die Drachen werden keinen Schaden mehr anrichten.";
};                       
FUNC INT DIA_Vatras_AllDragonsDead_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vatras_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_00"); //Die Drachen werden keinen Schaden mehr anrichten.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_01"); //Ich wusste, dass du heil zurückkehren würdest. Doch die größte Hürde wirst du noch nehmen müssen.
	AI_Output (other,self ,"DIA_Vatras_AllDragonsDead_15_02"); //Ich weiß.
	AI_Output (self ,other,"DIA_Vatras_AllDragonsDead_05_03"); //Dann rüste dich gut und komm zu mir, wenn du Hilfe brauchst. Trage das Auge Innos immer bei dir, hörst du? Adanos segne dich.
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_KnowWhereEnemy_Condition;
	information	 = 	DIA_Vatras_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ich kenne den Standort unseres Feindes.";
};
func int DIA_Vatras_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Vatras_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
func void DIA_Vatras_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_00"); //Ich kenne den Standort unseres Feindes.
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_01"); //Dann lass uns keine Zeit verlieren und ihn aufsuchen, bevor er zu uns kommt.
	AI_Output			(other, self, "DIA_Vatras_KnowWhereEnemy_15_02"); //Du willst mich begleiten?
	AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_03"); //Ich habe lange darüber nachgedacht und bin mir meiner Sache noch nie so sicher gewesen, mein Freund.
		
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                    	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                    	
	B_LogEntry (TOPIC_Crew,"Vatras hat überraschend angeboten mich auf meiner Reise zu begleiten. Ein Mann mit seiner Erfahrung und seinen Fähigkeiten könnte sehr wertvoll für mein Unternehmen sein.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Vatras_KnowWhereEnemy_15_04"); //Ich habe schon zu viel auf meiner Liste. Ich fürchte, ich habe keinen Platz mehr für dich.
		AI_Output			(self, other, "DIA_Vatras_KnowWhereEnemy_05_05"); //Dann schaffe Platz. Du wirst mich brauchen.
	}
	else 
	{
		Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Ich werde mir das noch mal überlegen.",DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Vatras_KnowWhereEnemy,"Es ist mir eine Ehre, dich an meiner Seite zu wissen.",DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_Yes_15_00"); //Es ist mir eine Ehre, dich an meiner Seite zu wissen. Wir werden uns im Hafen treffen.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01"); //Lass dir nicht zuviel Zeit. Der Feind schläft nicht, mein Freund.
	
	B_GivePlayerXP (XP_Crewmember_Success);                                                                    
	                                                                                                           
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	// ------ Zuhörer weg -------
	B_Vatras_GeheWeg (lang);
	
	Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
};

FUNC VOID DIA_Vatras_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Vatras_KnowWhereEnemy_No_15_00"); //Ich werde mir das noch mal überlegen.
	AI_Output (self ,other,"DIA_Vatras_KnowWhereEnemy_No_05_01"); //Wie du willst. Komm zu mir zurück, wenn dein Sinn sich wandelt.

	Vatras_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Vatras_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_LeaveMyShip		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_LeaveMyShip_Condition;
	information	 = 	DIA_Vatras_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Du bleibst besser hier. Die Stadt braucht dich.";
};
func int DIA_Vatras_LeaveMyShip_Condition ()
{	
	if (Vatras_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Vatras_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Vatras_LeaveMyShip_15_00"); //Du bleibst besser hier. Die Stadt braucht dich.
	AI_Output			(self, other, "DIA_Vatras_LeaveMyShip_05_01"); //Vielleicht hast du Recht. Und trotzdem ich werde dich begleiten, wenn du es wünschst. Das weißt du.
	
	Vatras_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"PRAY"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_StillNeedYou		(C_INFO)
{
	npc			 = 	VLK_439_Vatras;
	nr			 = 	55;
	condition	 = 	DIA_Vatras_StillNeedYou_Condition;
	information	 = 	DIA_Vatras_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Begleite mich zur Insel des Feindes.";
};

func int DIA_Vatras_StillNeedYou_Condition ()
{	
	if ((Vatras_IsOnBOard == LOG_OBSOLETE)	
	|| (Vatras_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_Vatras_StillNeedYou_15_00"); //Begleite mich zur Insel des Feindes.
	AI_Output	(self, other, "DIA_Vatras_StillNeedYou_05_01"); //Eine weise Entscheidung. Ich hoffe, es bleibt jetzt dabei.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);

	// ------ Zuhörer weg -------
	B_Vatras_GeheWeg (lang);
	
	AI_StopProcessInfos (self); Vatras_MORE = FALSE;

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PISSOFFFOREVVER
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PISSOFFFOREVVER		(C_INFO)
{
	npc		 = 	VLK_439_Vatras;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_Condition;
	information	 = 	DIA_Addon_Vatras_PISSOFFFOREVVER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_Condition ()
{
	if (VatrasPissedOffForever == TRUE)
	&& (Kapitel >= 5)
		{
			return TRUE;
		};
};

func void DIA_Addon_Vatras_PISSOFFFOREVVER_Info ()
{
	B_VatrasPissedOff ();
	AI_StopProcessInfos (self);  Vatras_MORE = FALSE;
};


