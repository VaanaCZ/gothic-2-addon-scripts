//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_EXIT   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 999;
	condition   = DIA_Addon_Senyan_EXIT_Condition;
	information = DIA_Addon_Senyan_EXIT_Info;
	permanent   = TRUE;
	description = "Bis dann...";
};
FUNC INT DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Senyan_EXIT_Info()
{
	if (Senyan_Erpressung == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Senyan_EXIT_12_00");//Du wei�t, was du zu tun hast ...
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Senyan_PICKPOCKET (C_INFO)
{
	npc			= BDT_1084_Addon_Senyan;
	nr			= 900;
	condition	= DIA_Addon_Senyan_PICKPOCKET_Condition;
	information	= DIA_Addon_Senyan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Senyan_PICKPOCKET_Condition()
{
	C_Beklauen (45, 88);
};
 
FUNC VOID DIA_Addon_Senyan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Senyan_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Senyan_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Senyan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Senyan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Senyan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Senyan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Senyan_PICKPOCKET);
};
	
func void DIA_Addon_Senyan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Senyan_PICKPOCKET);
};
//----------------------------------------------------------------------
FUNC VOID B_Senyan_Attack()
{
	AI_Output (self, other, "DIA_Addon_Senyan_Attack_12_00");//(verachtend) Wozu brauche ich dich dann noch, du Penner?
	AI_Output (self, other, "DIA_Addon_Senyan_Attack_12_01");//(ruft) Hey Leute, seht mal, wen wir hier haben!
	
	Senyan_Called = TRUE;	
	Senyan_Erpressung = LOG_OBSOLETE;
	B_CheckLog();
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
}; 
//----------------------------------------------------------------------
FUNC VOID B_Senyan_Erpressung()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Erpressung_15_00");//Wie viel willst du?
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_01");//(spielt gekr�nkt) Oh nein, bitte. Ich will doch kein Gold von dir erpressen. Das w�rde mir im Traum nicht einfallen.
	AI_Output (other, self, "DIA_Addon_Senyan_Erpressung_15_02");//Was willst du dann?
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_03");//Vor kurzem hat jemand versucht, Esteban aus dem Weg zu r�umen. Er ist jedoch an seinen Leibwachen gescheitert.
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_04");//Geh zu Esteban und sprich mit ihm. Danach unterhalten wir uns noch einmal.
	
	AI_StopProcessInfos (self);
	Log_CreateTopic (Topic_Addon_Senyan,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Senyan,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Senyan,"Senyan hat mich erkannt. Er wei� wer ich bin. Das will er f�r seine eigenen Pl�ne nutzen. Er hat irgendwas vor und will das ich zun�chst mal mit Esteban spreche.");
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_Hi   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 1;
	condition   = DIA_Addon_Senyan_Hi_Condition;
	information = DIA_Addon_Senyan_Hi_Info;
	permanent   = FALSE;
	Important 	= TRUE;
};
FUNC INT DIA_Addon_Senyan_Hi_Condition()
{	
	return TRUE;
};
//--------------------
var int Senyan_Msg;
var int Senyan_Bad;
var int Senyan_Good;
//--------------------
FUNC VOID DIA_Addon_Senyan_Hi_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_00");//Ah! Wen haben wir denn da?
	B_UseFakeScroll();
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_01");//Sieh an, sieh an. Das bist ja du. Ich habe eine gute und schlechte Nachricht f�r dich.
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"Ich will erst die gute Nachricht h�ren.",DIA_Addon_BDT_1084_Senyan_Hi_good);
	Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"Sag mir zuerst die schlechte Nachricht.",DIA_Addon_BDT_1084_Senyan_Hi_bad);
};
FUNC VOID DIA_Addon_BDT_1084_Senyan_Hi_good()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");//Ich will erst die gute Nachricht h�ren.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");//Und was ist die gute Nachricht?
	};
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");//Nun, ich wei� zwar nicht warum, aber du hast dir ein paar m�chtige Feinde gemacht.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");//Du kannst von Gl�ck reden, dass ICH dich erkannt habe und kein anderer.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");//Denn ich bin verst�ndnisvoll und umg�nglich.
	
	
	Senyan_Good = TRUE;
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	
	if (Senyan_Bad == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else 
	{
		Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"Und was ist die schlechte Nachricht?",DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};
FUNC VOID DIA_Addon_BDT_1084_Senyan_Hi_bad()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");//Sag mir zuerst die schlechte Nachricht.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");//Und was ist die schlechte Nachricht?
	};
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");//Raven sucht dich. Seine Gardisten suchen dich. Eigentlich suchen dich alle Banditen ...
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");//Und wenn sie dich entdecken, werden sie dich t�ten.
	AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");//Das haben schon viele versucht.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");//Dann ist deine Kamfkunst so gro� wie deine Gerissenheit. Mit einer unserer R�stungen in's Lager zu kommen, das ist wie ...
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");//... das Schaf, das zu den W�lfen kommt. Dein Leben h�ngt an einem d�nnen Faden, Sohn der Gefahr.
	
	Senyan_Bad = TRUE;
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	
	if (Senyan_Good == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else 
	{
		Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"Und was ist die gute Nachricht?",DIA_Addon_BDT_1084_Senyan_Hi_good);
	};
};
//---------------------------------------------------------------------
//	Info unterwegs
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_unterwegs   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 99;
	condition   = DIA_Addon_Senyan_unterwegs_Condition;
	information = DIA_Addon_Senyan_unterwegs_Info;
	permanent   = TRUE;
	description	= "Wegen Esteban ...";
};
FUNC INT DIA_Addon_Senyan_unterwegs_Condition()
{	
	if (MIS_Judas != LOG_RUNNING)
	&& Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_unterwegs_Info()
{
	AI_Output (other, self, "DIA_Addon_Senyan_unterwegs_15_00");//Wegen Esteban ...
	AI_Output (self, other, "DIA_Addon_Senyan_unterwegs_12_01");//Hast du schon mit ihm gesprochen?
	AI_Output (other, self, "DIA_Addon_Senyan_unterwegs_15_02");//Bisher noch nicht.
	AI_Output (self, other, "DIA_Addon_Senyan_unterwegs_12_03");//Nun, das solltest du aber bald tun.
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_Attentat   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 2;
	condition   = DIA_Addon_Senyan_Attentat_Condition;
	information = DIA_Addon_Senyan_Attentat_Info;
	permanent   = FALSE;
	description	= "Ich habe mit Esteban gesprochen.";
};
FUNC INT DIA_Addon_Senyan_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&& Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_00");//Ich habe mit Esteban gesprochen.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_01");//Und er hat dir von dem Attentat erz�hlt?
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_02");//Er hat mich beauftragt, denjenigen zu finden, der den Attent�ter geschickt hat. Wei�t du was dar�ber?
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_03");//Nicht mehr als du. Ich bin ebenfalls auf der Suche nach diesem Auftraggeber. Und jetzt kommen wir zum interessanten Teil.
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_04");//Lass h�ren.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_05");//Ich will, dass du deinen Job gut machst. Ich will, dass du diesen Verr�ter findest.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_06");//(kalt) Und wenn du ihn gefunden hast - will ich, dass du ihn f�r mich t�test.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_07");//Die Belohnung kassiere dann ICH.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_08");//Ich habe deinen Steckbrief - vergiss das nicht. Mach deine Arbeit und mach sie gut. Du kannst dir denken, was sonst passiert.

	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
	Info_AddChoice (DIA_Addon_Senyan_Attentat,"Mir bleibt wohl nichts anderes �brig...",DIA_Addon_Senyan_Attentat_JA);
	Info_AddChoice (DIA_Addon_Senyan_Attentat,"Vergi� es!",DIA_Addon_Senyan_Attentat_NO);
};
FUNC VOID DIA_Addon_Senyan_Attentat_NO()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_NO_15_00");//Vergiss es!

	B_Senyan_Attack();
	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
};
FUNC VOID DIA_Addon_Senyan_Attentat_JA()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_JA_15_00");//Mir bleibt wohl nichts anderes �brig ...
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_JA_12_01");//Ich wusste, dass wir uns verstehen w�rden.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_JA_12_02");//(barsch) Wenn du rausgefunden hast, wer der Kerl ist -  erledigen wir diese Zecke zusammmen. Und jetzt verschwinde!
	
	Senyan_Erpressung = LOG_RUNNING;
	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
	
	B_LogEntry (Topic_Addon_Senyan,"Senyan will, das ich den Auftraggeber finde und umbringe. Er will dann die Belohnung kassieren.");
};

//----------------------------------------------------------------------
//	Anders �berlegt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_ChangePlan   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 3;
	condition   = DIA_Addon_Senyan_ChangePlan_Condition;
	information = DIA_Addon_Senyan_ChangePlan_Info;
	permanent   = FALSE;
	description = "Ich hab's mir anders �berlegt. Wir arbeiten ab jetzt nicht mehr zusammen!";
};
FUNC INT DIA_Addon_Senyan_ChangePlan_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (Snaf_Tip_Senyan == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_ChangePlan_Info()
{	
	AI_Output (other, self, "DIA_Addon_Senyan_ChangePlan_15_00"); //Ich hab's mir anders �berlegt. Wir arbeiten jetzt nicht mehr zusammen!
	B_Senyan_Attack(); 
			
	AI_StopProcessInfos (self);
};		

//----------------------------------------------------------------------
//	Erpressung Found Fisk
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_Found   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 3;
	condition   = DIA_Addon_Senyan_Found_Condition;
	information = DIA_Addon_Senyan_Found_Info;
	permanent   = FALSE;
	description = "Ich habe den Verr�ter gefunden. Es ist Fisk.";
};
FUNC INT DIA_Addon_Senyan_Found_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_Found_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Found_15_00");//Ich habe den Verr�ter gefunden. Es ist Fisk.
	B_Senyan_Attack(); 
};		
//----------------------------------------------------------------------
//	Erpressung derbe
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_derbe   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 1;
	condition   = DIA_Addon_Senyan_derbe_Condition;
	information = DIA_Addon_Senyan_derbe_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Senyan_derbe_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS)
	&& (Npc_IsDead (Fisk)
	|| Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_derbe_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_derbe_12_00");//(w�tend) Du hast unsere Abmachung nicht eingehalten.
	
	B_Senyan_Attack();		
};


	


