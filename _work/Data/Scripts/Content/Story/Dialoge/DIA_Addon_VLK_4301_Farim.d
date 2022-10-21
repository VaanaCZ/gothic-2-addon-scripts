///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Farim_EXIT   (C_INFO)
{
	npc         = VLK_4301_Addon_Farim;
	nr          = 999;
	condition   = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Farim_PICKPOCKET (C_INFO)
{
	npc			= VLK_4301_Addon_Farim;
	nr			= 900;
	condition	= DIA_Addon_Farim_PICKPOCKET_Condition;
	information	= DIA_Addon_Farim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Farim_PICKPOCKET_Condition()
{
	C_Beklauen (20, 11);
};
 
FUNC VOID DIA_Addon_Farim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Farim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
	
func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Farim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Hallo		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Hallo_Condition;
	information	 = 	DIA_Addon_Farim_Hallo_Info;

	description	 = 	"Du bist Fischer?";
};

func int DIA_Addon_Farim_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Hallo_15_00"); //Du bist Fischer?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_01"); //(zynisch) Wie hast du das bloß erraten?
	AI_Output	(self, other, "DIA_Addon_Farim_Hallo_11_02"); //Kannst du mich nicht einfach in Ruhe lassen?
	if (hero.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_02"); //Nimm's mir nicht übel, aber in letzter Zeit bin ich nicht sehr gut auf die Miliz zu sprechen.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_Add_11_03"); //Nimm's mir nicht übel, aber in letzter Zeit bin ich nicht so gut drauf. Ärger mit der Miliz...
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MilizProbs
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MilizProbs		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MilizProbs_Condition;
	information	 = 	DIA_Addon_Farim_MilizProbs_Info;

	description	 = 	"Ärger mit der Miliz?";
};

func int DIA_Addon_Farim_MilizProbs_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MilizProbs_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MilizProbs_15_00"); //Ärger mit der Miliz?
	if (((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_01"); //Die Mistkerle kommen ständig her und nehmen sich einfach, was sie wollen.
	};
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_02"); //Letzte Woche haben sie meinen gesamten Fang mitgenommen. 'Ist für die gute Sache', haben sie gesagt.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_03"); //Ich weiß ja, dass jeder sehen muss, wo er bleibt, seit die Bauern ihren Handel eingestellt haben.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_04"); //Da kommt es schon mal vor, dass der eine oder andere Kohldampf schieben muss. Kein Wunder, dass sie mir den Fisch vor der Nase wegSCHNAPPEN.
	AI_Output	(self, other, "DIA_Addon_Farim_MilizProbs_11_05"); //Aber wenn das so weiter geht, hab ich nicht mal genug, um mich selbst zu ernähren.
	
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Gib mir all deine Fische.", DIA_Addon_Farim_MilizProbs_klauen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Vielleicht kann ich dir helfen.", DIA_Addon_Farim_MilizProbs_helfen );
	Info_AddChoice	(DIA_Addon_Farim_MilizProbs, "Hast du mit den Paladinen schon mal darüber gesprochen?", DIA_Addon_Farim_MilizProbs_paladine );
};
func void DIA_Addon_Farim_MilizProbs_paladine ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_paladine_15_00"); //Hast du mit den Paladinen schon mal darüber gesprochen?
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_paladine_11_01"); //(lacht) Machst du Witze? Was interessiert das die Kerle, wenn ein armer Schlucker wie ich Probleme mit der Miliz hat?
};
var int Farim_PissedOff;
func void DIA_Addon_Farim_MilizProbs_klauen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_klauen_15_00"); //Gib mir all deine Fische.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_01"); //(böse) Hab ich's doch gewusst. Noch so ein Mistkerl.
	
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_02"); //Da bist du leider zu spät gekommen. Deine Freunde haben schon gestern alles mitgenommen.
	};
	
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_klauen_11_04"); //Tja. Ich glaube, es ist besser, wenn du jetzt gehst.
	Farim_PissedOff = TRUE;
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
};
func void DIA_Addon_Farim_MilizProbs_helfen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_00"); //Vielleicht kann ich dir helfen.
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_02"); //Ich weiß nicht. Du müsstest schon jemanden von der Miliz kennen, der 'nen guten Draht zu den Paladinen hat ...
	AI_Output			(self, other, "DIA_Addon_Farim_MilizProbs_helfen_11_03"); //Die Paladine werden mir den Fisch wohl kaum abkaufen.
	AI_Output			(other, self, "DIA_Addon_Farim_MilizProbs_helfen_15_04"); //Ich werde sehen, was ich tun kann.
	Info_ClearChoices	(DIA_Addon_Farim_MilizProbs);
	
	Log_CreateTopic (TOPIC_Addon_FarimsFish, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_FarimsFish,"Farim der Fischer hat ein Problem mit der Miliz. Sie nehmen ihm mehr Fische ab, als er zum Leben braucht. Ich soll jemanden bei der Miliz finden, der Einfluss auf die Paladine hat, der ihm helfen kann."); 
		
	MIS_Addon_Farim_PaladinFisch = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MartinHelps
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_MartinHelps		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_MartinHelps_Condition;
	information	 = 	DIA_Addon_Farim_MartinHelps_Info;

	description	 = 	"Ich hab die Lösung deiner Milizprobleme.";
};

func int DIA_Addon_Farim_MartinHelps_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Martin_KnowsFarim == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_MartinHelps_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_00"); //Ich hab die Lösung deiner Milizprobleme.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_01"); //Und wie sieht die aus?

	if (hero.guild == GIL_MIL)||(hero.guild == GIL_PAL)
	{
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_02"); //Ich bin einfach zu selten hier, um ständig auf deine Fische aufzupassen.
		AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_03"); //Aber ich habe da jemanden, der das kann.
	};
	
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_04"); //Martin, der Proviantmeister der Paladine, will sich deine Geschichte von der Miliz und deinen Fischen anhören.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_05"); //Und du meinst, er kann dafür sorgen, dass mich die anderen der Miliz in Ruhe lassen?
	AI_Output	(other, self, "DIA_Addon_Farim_MartinHelps_15_06"); //Hat er zumindest gesagt.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_07"); //Gut. Ich danke dir. Ich kann dir nicht viel geben. Aber warte ...
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_08"); //Ich habe diesen seltsamen blauen Stein auf einer der Inseln vor Khorinis gefunden.
	AI_Output	(self, other, "DIA_Addon_Farim_MartinHelps_11_09"); //Ich glaube zwar nicht, dass er viel wert ist, aber jemand wie du kann ihn sicher gebrauchen.
		
	B_GiveInvItems (self, other, ItMi_Aquamarine, 1);		
	
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Farim_PaladinFisch);
};

///////////////////////////////////////////////////////////////////////
//	Info Landstreicher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Landstreicher		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_Landstreicher_Condition;
	information	 = 	DIA_Addon_Farim_Landstreicher_Info;

	description	 = 	"Kannst du was über die vermissten Leute erzählen?";
};

func int DIA_Addon_Farim_Landstreicher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Landstreicher_Info ()
{
	AI_Output (other, self, "DIA_Addon_Farim_Landstreicher_15_01"); //Kannst du was über die vermissten Leute erzählen?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_02"); //Mein Freund William hat sich mit einer Menge schräger Vögel eingelassen. Und was hatte er am Ende davon?
	AI_Output (self, other, "DIA_Addon_Farim_Landstreicher_11_03"); //Eines Tages kam er einfach nicht mehr zur Arbeit und ward seitdem nicht mehr gesehen.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_William		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Farim_William_Condition;
	information	 = 	DIA_Addon_Farim_William_Info;

	description	 = 	"Dein Kumpel William ist verschwunden?";
};

func int DIA_Addon_Farim_William_Condition ()
{
	if (SCKnowsFarimAsWilliamsFriend == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_William_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_William_15_00"); //Dein Kumpel William ist verschwunden?
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_01"); //So ist es. Er ist zwar Fischer, aber schon ein wenig größenwahnsinnig, das muss ich DAZU sagen.
	AI_Output	(self, other, "DIA_Addon_Farim_William_11_02"); //Er hätte sich eben nicht mit diesen Typen einlassen sollen.

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	Log_AddEntry (TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing); 
	
	Info_ClearChoices	(DIA_Addon_Farim_William);	
	Info_AddChoice	(DIA_Addon_Farim_William, "Von welchen Typen redest du da?", DIA_Addon_Farim_William_typen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Er wird schon wieder auftauchen.", DIA_Addon_Farim_William_auftauchen );
	Info_AddChoice	(DIA_Addon_Farim_William, "Was hat er denn so getrieben?", DIA_Addon_Farim_William_WasGemacht );
	Info_AddChoice	(DIA_Addon_Farim_William, "Wann hast du ihn das letzte Mal gesehen?", DIA_Addon_Farim_William_WannWeg );
};
func void DIA_Addon_Farim_William_WasGemacht ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WasGemacht_15_00"); //Was hat er denn so getrieben?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_01"); //William hat krumme Geschäfte gemacht mit diesen Halsabschneidern.
	AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_02"); //Ich glaube, es ging dabei um Schmuggelware, die er an die Mistkerle verkauft hat.
	//AI_Output			(self, other, "DIA_Addon_Farim_William_WasGemacht_11_03"); //Aber seit die Handelschiffe nicht mehr hier in Khorinis anlegen, weiß ich nicht, was er stattdessen für sie gemacht hat.
};
func void DIA_Addon_Farim_William_typen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_typen_15_00"); //Von welchen Typen redest du da?
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_01"); //Ich weiß nicht, wer sie sind oder was sie hier in Khorinis wollen.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_02"); //Ich kenne nur die Stelle, an der sie sich mit William getroffen haben.
	AI_Output			(self, other, "DIA_Addon_Farim_William_typen_11_03"); //Ich hab William dort nur zufällig gesehen, als ich in der Bucht beim Fischen war.
	
	Info_AddChoice	(DIA_Addon_Farim_William, "Wo genau ist denn diese Stelle, wo sie sich getroffen haben?", DIA_Addon_Farim_William_Wo );
};
func void DIA_Addon_Farim_William_Wo ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Wo_15_00"); //Wo genau ist denn diese Stelle, wo sie sich getroffen haben?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_01"); //Auf der gegenüber liegenden Seite vom Hafen von hier aus in Richtung Norden ist eine Bucht.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_02"); //Man kann sie nur mit dem Boot erreichen oder man schwimmt dorthin.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Wo_11_03"); //Dort gibt es einen Strand und ein kleines Fischerlager. Da habe ich sie gesehen.
	self.flags = 0;	//Joly: hat seine Pflicht getan

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Der Fischer Farim beklagt den Verlust seines Kumpels William. Farim sagt, dass sich William öfter mit irgendwelchen Halsabschneidern in einer Bucht nördlich des Hafens getroffen hat."); 

	Info_AddChoice	(DIA_Addon_Farim_William, "Ich denke, ich habe genug gehört.", DIA_Addon_Farim_William_Tschau );
};
func void DIA_Addon_Farim_William_WannWeg ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_WannWeg_15_00"); //Wann hast du ihn das letzte Mal gesehen?
	AI_Output			(self, other, "DIA_Addon_Farim_William_WannWeg_11_01"); //Das ist gerade ein paar Tage her.

	Info_AddChoice	(DIA_Addon_Farim_William, "Ist er nicht vielleicht einfach nur zum Fischen rausgefahren.", DIA_Addon_Farim_William_Fischen );
};
func void DIA_Addon_Farim_William_Fischen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Fischen_15_00"); //Ist er nicht vielleicht einfach nur zum Fischen rausgefahren?
	AI_Output			(self, other, "DIA_Addon_Farim_William_Fischen_11_01"); //Das kann nicht sein. Sein Boot liegt immer noch im Hafen.
};
func void DIA_Addon_Farim_William_auftauchen ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_auftauchen_15_00"); //Er wird schon wieder auftauchen.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_01"); //Das glaube ich nicht. Dazu ist er schon zu lange weg.
	AI_Output			(self, other, "DIA_Addon_Farim_William_auftauchen_11_02"); //Ich fürchte, dass ich seine Leiche irgendwann aus der See fischen werde.
};
func void DIA_Addon_Farim_William_Tschau ()
{
	AI_Output			(other, self, "DIA_Addon_Farim_William_Tschau_15_00"); //Ich denke, ich habe genug gehört.
	AI_Output			(self, other, "DIA_Addon_Farim_William_Tschau_11_01"); //Mach dir keine Mühe. Ich glaube nicht, dass du ihn findest.
	Info_ClearChoices	(DIA_Addon_Farim_William);	
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_Perm		(C_INFO)
{
	npc		 = 	VLK_4301_Addon_Farim;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Farim_Perm_Condition;
	information	 = 	DIA_Addon_Farim_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Und, wie beissen die Fische?";
};

func int DIA_Addon_Farim_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_Hallo))
		{
			return TRUE;
		};
};

func void DIA_Addon_Farim_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Farim_Perm_15_00"); //Und, wie beißen die Fische?

	if (Farim_PissedOff == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_01"); //Tu doch nicht so, als ob dich das interessiert.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Farim_Perm_11_02"); //War schon mal besser. Zum Leben zu wenig, zum Sterben zuviel.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info William
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Farim_WilliamReport (C_INFO)
{
	npc		 	= VLK_4301_Addon_Farim;
	nr		 	= 1;
	condition	= DIA_Addon_Farim_WilliamReport_Condition;
	information	= DIA_Addon_Farim_WilliamReport_Info;

	important 	= TRUE;
};

func int DIA_Addon_Farim_WilliamReport_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Farim_William))
	{
		if (Npc_HasItems (other, ITWr_Addon_William_01) > 0)
		|| (Saturas_AboutWilliam == TRUE)
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Farim_WilliamReport_Info ()
{
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_01"); //Da bist du ja wieder!
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_02"); //Hast du was von meinem Kumpel William gehört?
	AI_Output (other, self, "DIA_Addon_Farim_Add_15_02"); //Er ist tot.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_03"); //(seufzt) Tja, das hatte ich mir fast gedacht.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_04"); //Danke, das du nochmal hierhergekommen bist, um es mir zu erzählen.
	AI_Output (self, other, "DIA_Addon_Farim_Add_11_05"); //Ich werd mal in die Kneipe gehen und seinen Anteil am letzten Fang versaufen - er hätte es so gewollt...
};






