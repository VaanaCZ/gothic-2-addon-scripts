///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_EXIT   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 999;
	condition   = DIA_Nagur_EXIT_Condition;
	information = DIA_Nagur_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Nagur_PICKPOCKET (C_INFO)
{
	npc			= VLK_493_Nagur;
	nr			= 900;
	condition	= DIA_Nagur_PICKPOCKET_Condition;
	information	= DIA_Nagur_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Nagur_PICKPOCKET_Condition()
{
	C_Beklauen (75, 150);
};
 
FUNC VOID DIA_Nagur_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Nagur_PICKPOCKET);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_BACK 		,DIA_Nagur_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Nagur_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Nagur_PICKPOCKET_DoIt);
};

func void DIA_Nagur_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
	
func void DIA_Nagur_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Nagur_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info vor dem Auftrag (Spieler hat noch nicht mit Kardif geredet)
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Hallo   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 2;
	condition   = DIA_Nagur_Hallo_Condition;
	information = DIA_Nagur_Hallo_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk)
	&& (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Hallo_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_00");//Hey, ich habe keine Zeit mit dir zu plaudern. Sprich mit Kardif, wenn du Informationen willst.
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Hallo_08_01");//Mann, lass mich einfach in Ruhe, okay?
		AI_StopProcessInfos (self);
	};
};
///////////////////////////////////////////////////////////////////////
//	Job Angebot
///////////////////////////////////////////////////////////////////////
	var int NagurHack;
	
	func void B_Nagur_Abfertigen()
	{
		var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
		if (Hlp_IsItem (heroArmor, ItAr_MIL_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_MIL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_M) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_PAL_H) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_NOV_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_L) == FALSE)
		&& (Hlp_IsItem (heroArmor, ItAr_KDF_H) == FALSE)
		{
			AI_Output (self ,other,"DIA_Nagur_Add_08_02"); //Und glaub ja, nicht, daß ich dich nicht erkenne, nur weil du andere Klamotten anhast!
		};
		
		AI_Output (self ,other,"DIA_Nagur_Add_08_03"); //(verschwörerisch) Du bist dabei, dich in Angelegenheiten einzumischen, die dich nichts angehen!
		AI_Output (self ,other,"DIA_Nagur_Add_08_04"); //Verschwinde!
		
		MIS_Nagur_Bote = LOG_SUCCESS; //HACK: Attila kommt bei 3* Success oder 1* suckt --> nur noch die anderen beiden Missionen sind Trigger
		NagurHack = TRUE;
		AI_StopProcessInfos (self);
	};

INSTANCE DIA_Nagur_Job   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 3;
	condition   = DIA_Nagur_Job_Condition;
	information = DIA_Nagur_Job_Info;
	permanent   = FALSE;
	description = "Kardif meinte, du hättest einen Job für mich.";
};
FUNC INT DIA_Nagur_Job_Condition()
{	
	if (DIA_Kardif_Diebeswerk_permanent == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Job_Info()
{
	AI_Output (other, self, "DIA_Nagur_Job_15_00");//Kardif meinte, du hättest einen Job für mich.
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_00"); //Hier im Hafen GIBT es keine Jobs für Leute aus den Kloster (lacht)
		B_Nagur_Abfertigen();
	}
	else if (other.guild == GIL_MIL)
	|| 		(other.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Nagur_Add_08_01"); //Hier im Hafen GIBT es keine Jobs für Truppen des Königs.
		B_Nagur_Abfertigen();
	}
	else
	{
		AI_Output (self, other, "DIA_Nagur_Job_08_01");//(musternd) Soso, du suchst also einen speziellen Job. Okay, aber es läuft nach meinen Regeln, verstanden?
		AI_Output (other, self, "DIA_Nagur_Job_15_02");//Was soll das heißen?
		AI_Output (self, other, "DIA_Nagur_Job_08_03");//Das heißt, du tust das, was ich sage und kriegst ein Drittel vom Gewinn.
		AI_Output (self, other, "DIA_Nagur_Job_08_04");//Wenn dir das nicht gefällt, dann gibt's auch keinen Job.
	
		Info_ClearChoices (DIA_Nagur_Job);
		Info_AddChoice  (DIA_Nagur_Job,"Wir arbeiten zusammen, also machen wir auch halbe - halbe.",DIA_Nagur_Job_Halbe);
		Info_AddChoice  (DIA_Nagur_Job,"Alles klar, du bist der Boss.",DIA_Nagur_Job_Klar);
	};
};
FUNC VOID DIA_Nagur_Job_Klar()
{
	AI_Output (other, self, "DIA_Nagur_Job_Klar_15_00");//Alles klar, du bist der Boss.
	AI_Output (self, other, "DIA_Nagur_Job_Klar_08_01");//Gut, dann sag mir Bescheid, wenn du bereit bist, einen Haufen Gold einzustreichen.
	Nagur_Deal = 80;
	Info_ClearChoices (DIA_Nagur_Job);
};
FUNC VOID DIA_Nagur_Job_Halbe()
{
	AI_Output (other, self, "DIA_Nagur_Job_Halbe_15_00");//Wir arbeiten zusammen, also machen wir auch halbe-halbe.
	AI_Output (self, other, "DIA_Nagur_Job_Halbe_08_01");//Okay, ich hab mir gedacht, ich probiere es einfach mal. Natürlich teilen wir unseren Gewinn gerecht.
	Nagur_Deal = 120;
	Info_ClearChoices (DIA_Nagur_Job);
};
///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftrag   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 4;
	condition   = DIA_Nagur_Auftrag_Condition;
	information = DIA_Nagur_Auftrag_Info;
	permanent   = FALSE;
	description = "Okay, was ist dein Plan?";
};

FUNC INT DIA_Nagur_Auftrag_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Job))
	&& (MIS_Nagur_Bote != LOG_SUCCESS) //also hier NICHT B_Nagur_Abfertigen durchlaufen
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_15_00");//Okay, was ist dein Plan?
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_01");//Du kennst doch den Händler Baltram, oder? Falls nicht, wird es Zeit, dass du mal mit ihm redest.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_02");//Dieser Baltram hat einen Boten, der ihn mit Waren von Akils Hof versorgt.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_03");//Das heißt, er hatte einen Boten, denn ich hab ihm die Kehle durchgeschnitten. Und Baltram muss jetzt einen neuen einstellen. Und das wirst du sein.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_04");//Dein Job ist es, dich von Baltram einstellen zu lassen und die Lieferung von Akil abzuholen.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_05");//Die bringst du mir und ich verkaufe sie dann an einen interessierten Kunden. Der lässt ein hübsches Sümmchen dafür springen.
	AI_Output (self, other, "DIA_Nagur_Auftrag_08_06");//Und versuche bloß nicht, den Kram selbst zu verkaufen. Hast du alles verstanden?
	
	Info_ClearChoices (DIA_Nagur_Auftrag);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Alles klar, kann losgehen (ENDE)",DIA_Nagur_Auftrag_Okay);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Wo finde ich Baltram?",DIA_Nagur_Auftrag_Baltram);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Wann soll ich mit Baltram reden?",DIA_Nagur_Auftrag_Wann);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Wo ist Akil's Hof?",DIA_Nagur_Auftrag_Akil);
	Info_AddChoice    (DIA_Nagur_Auftrag,"Wie hoch wird der Gewinn sein?",DIA_Nagur_Auftrag_Gewinn);

};
FUNC VOID DIA_Nagur_Auftrag_Akil()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Akil_15_00");//Wo ist Akils Hof?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_01");//Verlasse die Stadt durch das östliche Tor, das direkt am Marktplatz ist.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_02");//Wenn du dem Weg nach rechts folgst, kommst du bald an ein paar Stufen, die in den Stein gehauen sind.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Akil_08_03");//Geh dort hinauf und du kommst zu Akils Hof.
};
FUNC VOID DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Gewinn_15_00");//Wie hoch wird der Gewinn sein?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Gewinn_08_01");//Kann ich nicht genau sagen. Aber ich schätze mal 400 Goldstücke.
};
FUNC VOID DIA_Nagur_Auftrag_Baltram()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Baltram_15_00");//Wo finde ich Baltram?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Baltram_08_01");//Er hat seinen Stand am Marktplatz.
};
FUNC VOID DIA_Nagur_Auftrag_Wann()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Wann_15_00");//Wann soll ich mit Baltram reden?
	AI_Output (self, other, "DIA_Nagur_Auftrag_Wann_08_01");//Du kannst sofort losgehen. Er sollte inzwischen wissen, dass sein Bote nicht mehr auftauchen wird. (lacht dreckig)
};
FUNC VOID DIA_Nagur_Auftrag_Okay()
{
	AI_Output (other, self, "DIA_Nagur_Auftrag_Okay_15_00");//Alles klar, kann losgehen.
	AI_Output (self, other, "DIA_Nagur_Auftrag_Okay_08_01");//Gut, dann mach dich auf den Weg - aber wenn du versuchst, mich reinzulegen, bist du bald so tot wie der Bote! Vergiss das nicht!
	MIS_Nagur_Bote = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Nagur,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Nagur,LOG_RUNNING);
	B_LogEntry (TOPIC_Nagur,"Ich soll mich von Baltram als neuen Boten einstellen lassen. Dann soll ich die Lieferung von Bauer Akil abholen und zu Nagur bringen.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Success   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 5;
	condition   = DIA_Nagur_Success_Condition;
	information = DIA_Nagur_Success_Info;
	permanent   = FALSE;
	description = "Ich habe die Lieferung dabei.";
};

FUNC INT DIA_Nagur_Success_Condition()
{	
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_BaltramPaket) >=1)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Success_Info()
{
	AI_Output (other, self, "DIA_Nagur_Success_15_00");//Ich habe die Lieferung dabei.
	AI_Output (self, other, "DIA_Nagur_Success_08_01");//Gut gemacht. Ich werde sehen, dass ich sie loswerde. Komm morgen wieder.
	
	B_LogEntry (TOPIC_Nagur,   "Nagur hat die Lieferung bekommen. Morgen will er mir mein Gold für den Job zahlen.");
	
	AI_StopProcessInfos (self);
	
	if B_GiveInvItems (other, self,ItMi_BaltramPaket ,1)
	{
		Npc_RemoveInvItems (self, ItMi_BaltramPaket,1);
	};
	NagurDay = B_GetDayPlus();  
};
///////////////////////////////////////////////////////////////////////
//	Info Deal
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Deal   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 6;
	condition   = DIA_Nagur_Deal_Condition;
	information = DIA_Nagur_Deal_Info;
	permanent   = TRUE;
	description = "Bist du die Ware losgeworden? ";
};
//---------------------------------
var int DIA_Nagur_Deal_permanent; 
//---------------------------------
FUNC INT DIA_Nagur_Deal_Condition()
{	
	if (DIA_Nagur_Deal_permanent == FALSE)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	&& Npc_KnowsInfo (other,DIA_Nagur_Success)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Deal_Info()
{
	AI_Output (other, self, "DIA_Nagur_Deal_15_00");//Bist du die Ware losgeworden?
	
	if (B_GetDayPlus() > NagurDay) 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_01");//Ja, aber für weniger als ich gedacht habe. Ich hab nur 300 Goldstücke bekommen.
		AI_Output (self, other, "DIA_Nagur_Deal_08_02");//Davon geht noch ein Teil an meine Auftraggeber ...
		AI_Output (self, other, "DIA_Nagur_Deal_08_03");//Und Kardif bekommt seinen üblichen Teil - plus das Gold für deine Vermittlung.
		AI_Output (self, other, "DIA_Nagur_Deal_08_04");//Bleiben insgesamt noch 240 Goldstücke. Die teilen wir, wie wir abgemacht haben. Hier ist dein Anteil.
		AI_Output (self, other, "DIA_Nagur_Deal_08_05");//Du hast gute Arbeit geleistet. Das habe ich mal so an meine Auftraggeber weitergegeben.
		AI_Output (self, other, "DIA_Nagur_Deal_08_06");//Was allerdings daraus wird, liegt nicht in meiner Hand.
		
		B_GiveInvItems (self,other,ItMi_Gold,Nagur_Deal);
		MIS_Nagur_Bote = LOG_SUCCESS;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP (XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE;
		Diebesgilde_Okay = (Diebesgilde_Okay + 1);
		AI_StopProcessInfos (self);
	}
	else 
	{
		AI_Output (self, other, "DIA_Nagur_Deal_08_07");//Nein, bisher noch nicht. So was dauert seine Zeit, ich will ja schließlich einen guten Preis rausholen.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Auftraggeber   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Auftraggeber_Condition;
	information = DIA_Nagur_Auftraggeber_Info;
	permanent   = FALSE;
	description = "Wer sind deine Auftraggeber?";
};

FUNC INT DIA_Nagur_Auftraggeber_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Auftraggeber_Info()
{
	AI_Output (other, self, "DIA_Nagur_Auftraggeber_15_00");//Wer sind deine Auftraggeber?
	AI_Output (self, other, "DIA_Nagur_Auftraggeber_08_01");//Du glaubst doch nicht wirklich, dass ich dir das erzähle, oder?
};
///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Fazit   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Fazit_Condition;
	information = DIA_Nagur_Fazit_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Fazit_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Nagur_Auftraggeber)
	&& Npc_IsInState (self,ZS_Talk))
	&& (Knows_SecretSign == FALSE) 
	&& (NagurHack == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Fazit_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Fazit_08_00");//Der Job ist gut gelaufen, aber über meine Auftraggeber spreche ich nicht. Also bleib ruhig.
	AI_StopProcessInfos  (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Nagur im Knast
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Knast   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Knast_Condition;
	information = DIA_Nagur_Knast_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Knast_Condition()
{	
	if Npc_IsInState (self,ZS_Talk)
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000)
	&& (Nagur_ausgeliefert == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Knast_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Knast_08_00");//Du hast mich verraten! Das war ein großer Fehler - jetzt verpiss dich!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
/////////////////////////////////////////
INSTANCE DIA_Nagur_Sign   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Sign_Condition;
	information = DIA_Nagur_Sign_Info;
	permanent   = FALSE;
	description	= "(Diebeszeichen zeigen)";
};

FUNC INT DIA_Nagur_Sign_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&& (Knows_SecretSign == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Sign_Info()
{	
	AI_PlayAni (other,"T_YES");
	AI_Output (self, other, "DIA_Nagur_Sign_08_00");//Du hast es also geschafft. Jetzt kennst du meine Auftraggeber.
	AI_Output (self, other, "DIA_Nagur_Sign_08_01");//Halte dich an das, was Cassia dir sagt - uns ist es egal, wer du sonst bist - du bist einer von uns, und nur das zählt.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Nagur_Perm   (C_INFO)
{
	npc         = VLK_493_Nagur;
	nr          = 7;
	condition   = DIA_Nagur_Perm_Condition;
	information = DIA_Nagur_Perm_Info;
	permanent   = TRUE;
	important   = TRUE;
};

FUNC INT DIA_Nagur_Perm_Condition()
{	
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	&&  Npc_KnowsInfo (other,DIA_Nagur_Sign) 
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Nagur_Perm_Info()
{	
	AI_Output (self, other, "DIA_Nagur_Perm_08_00");//Such dir jemand anders, hier laufen genug Typen rum. Ich habe nichts mehr für dich.
	AI_StopProcessInfos (self);
};
























