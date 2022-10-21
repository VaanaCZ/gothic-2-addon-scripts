// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Greg_NW_EXIT(C_INFO)
{
	npc			= PIR_1300_Addon_Greg_NW;
	nr			= 999;
	condition	= DIA_Addon_Greg_NW_EXIT_Condition;
	information	= DIA_Addon_Greg_NW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Greg_NW_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Greg_NW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
	PlayerTalkedToGregNW	= TRUE;
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//1. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info HalloW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Greg_NW_Hallo_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Greg_NW_Hallo_Condition ()
{
	if (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_Hallo_Info ()
{

	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_00"); //Psst. Hey du. Komm mal her.
	AI_Output	(other, self, "DIA_Addon_Greg_NW_Hallo_15_01"); //Was ist?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_02"); //Unterwegs in die Stadt? Schwer beschäftigt noch dazu.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_03"); //(schleimig) Hör mal. Du siehst mir wie ein schlaues Kerlchen aus. Ich schätze, du wirst es noch mal sehr weit bringen.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_04"); //Dir macht doch bestimmt keiner was vor. So was erkenne ich sofort.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Hallo_01_05"); //Sag mal, du willst dir doch bestimmt ein paar Goldstücke verdienen, nicht wahr?

	PlayerTalkedToGregNW	= TRUE;
	SC_MeetsGregTime = 1; //Joly: erste Mal getroffen.

	Info_ClearChoices	(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Ich muss weiter.", DIA_Addon_Greg_NW_Hallo_weg );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Lass das Gefasel. Sag mir, was du willst.", DIA_Addon_Greg_NW_Hallo_schleim );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Du siehst nicht aus wie jemand, der Goldstücke hat.", DIA_Addon_Greg_NW_Hallo_vorsicht );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Versteckst du dich vor jemandem?", DIA_Addon_Greg_NW_Hallo_hide );
	Info_AddChoice	(DIA_Addon_Greg_NW_Hallo, "Warum nicht?", DIA_Addon_Greg_NW_Hallo_ja );

};

func void DIA_Addon_Greg_NW_Hallo_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_weg_15_00"); //Ich muss weiter.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_weg_01_01"); //(verärgert) Du willst mir also nicht helfen. Das werde ich mir merken, Freundchen. Wir sehen uns noch mal wieder.

	AI_StopProcessInfos (self);
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
};

func void DIA_Addon_Greg_NW_Hallo_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_ja_15_00"); //Warum nicht?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_01"); //Du musst es einem unwissenden alten Seemann schon nachsehen, ich bin fremd in dieser Gegend hier und kenne mich noch nicht so gut mit hier herrschenden Regeln aus.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_02"); //So musste ich schmerzlich erfahren, dass man als fremder Reisender in der Hafenstadt nicht willkommen ist.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_03"); //(übertrieben mitleidig) Nun stehe ich hier und bin völlig ratlos, wie ich in die Stadt kommen soll.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_04"); //Ich habe äußerst wichtige Geschäfte zu erledigen und meine Auftraggeber dulden keinen Aufschub, verstehst du?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_05"); //Du wirst mir doch sicher helfen, einen Weg zu finden, an den Stadtwachen vorbei zu kommen, hab' ich recht?
	Info_ClearChoices	(DIA_Addon_Greg_NW_Hallo);
	
	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Der seltsame Kerl mit der Augenklappe will in die Hafenstadt. Ich soll für ihn einen Weg finden, an den Stadtwachen vorbei zu kommen."); 
	
	MIS_Addon_Greg_BringMeToTheCity = LOG_RUNNING;
};

func void DIA_Addon_Greg_NW_Hallo_vorsicht ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_vorsicht_15_00"); //Du siehst nicht aus wie jemand, der Goldstücke hat.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_01"); //(übertrieben bescheiden) Nun, ich bin sicherlich nicht der Umgang, den ein Herr wie du gewohnt ist.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_02"); //Aber meinen kleinen Beitrag zu deinem sicherlich beträchtlichen Vermögen wirst du doch nicht ausschlagen, oder?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_03"); //Nun, was sagst du? Kann ich mit dir rechnen?

};

func void DIA_Addon_Greg_NW_Hallo_schleim ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_schleim_15_00"); //Lass das Gefasel. Sag mir, was du willst.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_01"); //Siehst du? Genau das meine ich.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_02"); //Nur mit schönen Worten allein kann man bei dir nichts werden.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_03"); //Ich habe es gleich gewusst. Ich habe es hier mit einem knallharten Geschäftsmann zu tun.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_04"); //Du bist doch ein Geschäftsmann und hast bestimmt Interesse an einer kleinen Aufbesserung deines Geldbeutels, oder?
};

func void DIA_Addon_Greg_NW_Hallo_hide ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Hallo_hide_15_00"); //Versteckst du dich vor jemandem?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_01"); //Ach was. So ein Unsinn? Ich stehe nur gerne zwischen den Bäumen, damit mir der Wind nicht direkt ins Gesicht weht.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_02"); //Aber was ist jetzt mit dir? Willst du den Job?
};

///////////////////////////////////////////////////////////////////////
//	Info Stadtwachen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Stadtwachen		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Stadtwachen_Condition;
	information	 = 	DIA_Addon_Greg_NW_Stadtwachen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wegen den Stadtwachen...";
};

func int DIA_Addon_Greg_NW_Stadtwachen_Condition ()
{
	if (MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	&& (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};

VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld;
VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein;
VAR int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino;

func void DIA_Addon_Greg_NW_Stadtwachen_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_Stadtwachen_15_00"); //Wegen der Stadtwachen ...
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Stadtwachen_01_01"); //Ja? Schon eine Idee?
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Ich muss darüber erst nochmal nachdenken.", DIA_Addon_Greg_NW_Stadtwachen_nochnicht );

	if (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Wie wär's mit Bestechung?", DIA_Addon_Greg_NW_Stadtwachen_geld );
	};

	if (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein == FALSE)
	&& (Npc_HasItems (other,ItWr_Passierschein))
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Ich hab hier einen Passierschein für die Stadt.", DIA_Addon_Greg_NW_Stadtwachen_Schein );
	};
	
	if (MIS_Addon_Lester_PickForConstantino != 0)
	&& (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Als Kräutersammler würdest du in die Stadt kommen.", DIA_Addon_Greg_NW_Stadtwachen_constantino );
	};

	IF	((Npc_HasItems (other,ItAr_BAU_L)) || (Npc_HasItems (other,ItAr_BAU_M)))
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_Stadtwachen, "Mit dieser Bauernkleidung hier sollten sie dich vorbei lassen.", DIA_Addon_Greg_NW_Stadtwachen_klamotten );
	};
};

func void DIA_Addon_Greg_NW_Stadtwachen_klamotten ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00"); //Mit dieser Bauernkleidung hier sollten sie dich vorbei lassen.

	if (Npc_HasItems (other,ItAr_BAU_L))
	{
		B_GiveInvItems 		(other, self, ItAr_BAU_L,1);
	}
	else //ITAR_BAU_M
	{
		B_GiveInvItems 		(other, self, ITAR_BAU_M,1);
	};

	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01"); //Das ist genau das, was ich jetzt brauche. Mensch, ich wusste, ich kann mich auf dich verlassen.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02"); //(hämisch) Getarnt als einheimischer Bauerntölpel wird mich hier niemand mehr behelligen. Ha ha.

	if (Npc_HasItems (self,ItAr_BAU_L))
	{
		AI_EquipArmor 		(self,ItAr_BAU_L);
	}
	else //ITAR_BAU_M
	{
		AI_EquipArmor 		(self,ITAR_BAU_M);
	};
	
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03"); //Ausgezeichnet. Das hast du wirklich gut gemacht. Hier hast du deine versprochene Belohnung.
	
	CreateInvItems (self, ItMi_Gold, 50);									
	B_GiveInvItems (self, other, ItMi_Gold, 50);	
	B_GivePlayerXP (XP_Greg_NW_GiveBauArmor);				
	
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04"); //(verärgert) Was denn? 50 läppische Goldmünzen? Das ist doch wohl nicht dein Ernst?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05"); //(gönnerhaft) Gold ist nicht alles, mein Freund. Nimm sie erst mal.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06"); //Ich hab' so das Gefühl, dass wir uns bald wieder begegnen werden.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07"); //Und wer weiß? Vielleicht werde ich mich noch mal revanchieren. Mach's gut.
	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Markt");

	B_LogEntry (TOPIC_Addon_Greg_NW,"Ich habe ihm Bauernkleidung gegeben. Damit kam er an den Stadtwachen vorbei."); 

	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};
func void DIA_Addon_Greg_NW_Stadtwachen_nochnicht ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00"); //Ich muss darüber erst noch mal nachdenken.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01"); //(ernst) Na schön. Aber beeil dich damit. Ich hab' keine Zeit zu verlieren.
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Greg_NW_Stadtwachen_Schein ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00"); //Ich hab hier einen Passierschein für die Stadt.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01"); //(zynisch) Ach so. Ich soll jetzt so tun, als ob ich ein Bürger der Stadt wär', oder wie?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02"); //(verärgert) Jetzt kuck mich doch mal an, Junge. Das glaubt mir doch keine Sau.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein = TRUE;
};
func void DIA_Addon_Greg_NW_Stadtwachen_constantino ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00"); //Als Kräutersammler würdest du in die Stadt kommen.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01"); //(verärgert) Was? Sehe ich etwa so aus, als würde ich im Wald Blümchen pflücken?
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};
func void DIA_Addon_Greg_NW_Stadtwachen_geld ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_Stadtwachen_geld_15_00"); //Wie wär's mit Bestechung?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_Stadtwachen_geld_01_01"); //(verschmitzt) Tja, wenn das bei mir funktionieren würde, hätte ich das sicher schon versucht.
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PERM		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_PERM_Condition;
	information	 = 	DIA_Addon_Greg_NW_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Eine Sache noch...";
};
func int DIA_Addon_Greg_NW_PERM_Condition ()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)||(MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	&& (GregLocation == Greg_Farm1)
		{
			return TRUE;
		};
};
func void DIA_Addon_Greg_NW_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_PERM_15_00"); //Eine Sache noch ...
	AI_Output	(self, other, "DIA_Addon_Greg_NW_PERM_01_01"); //(überheblich) Hör zu, Kleiner. Ich hab im Moment wichtige Dinge zu erledigen.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_PERM_01_02"); //(drohend) Wir werden uns später unterhalten. Klar?
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//2. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info MeetGregSecondTime
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_MeetGregSecondTime		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_MeetGregSecondTime_Condition;
	information	 = 	DIA_Addon_Greg_NW_MeetGregSecondTime_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_MeetGregSecondTime_Condition ()
{
	if (GregLocation == Greg_Taverne)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_MeetGregSecondTime_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_00"); //Sieh mal an, wer da reingeschneit kommt.

	if (MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_01"); //Der Bauernjunge.
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_02"); //Der Kerl, der mich so schnöde hat abblitzen lassen. So sieht man sich wieder, was?
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_03"); //(sauer) Ich dachte, du wolltest mir helfen. Und was macht du? Verpisst dich einfach.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_04"); //Hast wohl gedacht, ich würde da ewig versauern, was?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_05"); //Das sieht man's mal wieder. Hilf dir selbst, sonst hilft dir niemand. Aber noch mal lass ich dir das nicht durchgehen.
	};

	AI_Output	(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_06"); //Du kommst mir gerade recht.
	SC_SawGregInTaverne = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_wer		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_wer_Condition;
	information	 = 	DIA_Addon_Greg_NW_wer_Info;

	description	 = 	"Wer bist du überhaupt?";
};

func int DIA_Addon_Greg_NW_wer_Condition ()
{
	if (GregLocation >= Greg_Taverne)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_wer_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_wer_15_00"); //Wer bist du überhaupt?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_wer_01_01"); //Das geht dich einen feuchten Dreck an.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_wer_01_02"); //Wenn ich dir erzählen wollte, wer ich bin, dann hätte ich das schon getan, klar?

	
};

///////////////////////////////////////////////////////////////////////
//	Info was
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_was		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_was_Condition;
	information	 = 	DIA_Addon_Greg_NW_was_Info;

	description	 = 	"Was willst du denn von mir?";
};

func int DIA_Addon_Greg_NW_was_Condition ()
{
	if (GregLocation == Greg_Taverne)
		{
			return TRUE;
		};
};

func VOID B_Greg_Search_Dexter ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_00"); //Ich suche einen Kerl. In der Stadt war er nicht zu finden und die Geigen hier haben auch keine Ahnung.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_01"); //Er ist schlank, dunkelhaarig und trägt meist eine rote Rüstung.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_02"); //Soviel ich weiß, war er damals ein Sträfling in der Kolonie. Ich glaube, seine Name beginnt mit einem 'D'.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Der Mann mit der Augenklappe sucht jemanden, dessen Name mit einem 'D' anfängt."); 

	SC_KnowsGregsSearchsDexter = TRUE;
};

func void DIA_Addon_Greg_NW_was_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_was_15_00"); //Was willst du denn von mir?

	if (MIS_Addon_Greg_BringMeToTheCity != 0)
	{
		AI_Output	(other, self, "DIA_Addon_Greg_NW_was_15_01"); //Hast du immer noch Probleme mit den Stadtwachen?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_was_01_02"); //(droht) Ich GEB' dir gleich Probleme, du Wicht.
	};	

	B_Greg_Search_Dexter ();

	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Du redest von Diego.", DIA_Addon_Greg_NW_was_Diego );

	if (Bdt13_Dexter_verraten == TRUE) 
	|| (Ranger_SCKnowsDexter == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_was, "Heißt er vielleicht Dexter?", DIA_Addon_Greg_NW_was_Dexter );
	};
	
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Ich kenne niemanden, auf den die Beschreibung passt.", DIA_Addon_Greg_NW_was_no );
};

func void DIA_Addon_Greg_NW_was_GregUnsicher ()
{
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_00"); //Kann sein, dass das sein Name ist. Ich bin mir nicht sicher.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_01"); //Ich werd's wohl erst wissen, wenn ich vor ihm stehe.
};

func void DIA_Addon_Greg_NW_was_UnNun ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_UnNun_15_00"); //Sonst noch was?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_01"); //(sauer) Ja, du Großmaul. Ich hab' noch was.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_02"); //Ich brauche Waffen. Ich brauche Proviant. Gold wäre auch nicht schlecht.
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Ich kann dir nicht helfen.", DIA_Addon_Greg_NW_was_NoHelp );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Proviant? Du bist hier in einer Taverne.", DIA_Addon_Greg_NW_was_Orlan );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Waffen? Die Söldner haben Waffen.", DIA_Addon_Greg_NW_was_SLD );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Hier hast du 10 Goldmünzen.", DIA_Addon_Greg_NW_was_HierGold );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Hast du in der Stadt keinen Waffenhändler gefunden?", DIA_Addon_Greg_NW_was_Waffenhaendler );
	Info_AddChoice	(DIA_Addon_Greg_NW_was, "Gold? Wir alle wollen Gold.", DIA_Addon_Greg_NW_was_Gold );
};

func void DIA_Addon_Greg_NW_was_NoHelp ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_NoHelp_15_00"); //Ich kann dir nicht helfen.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_01"); //(verärgert) So. Du WILLST also nicht.
	
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_02"); //Das ist jetzt schon das zweite Mal, dass du mich hängen lässt.
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_03"); //Ich kann dir nur den guten Rat geben: Sorge dafür, dass wir uns nicht nochmal begegnen.
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_04"); //Das werde ich mir merken. Da kannst du dich drauf verlassen.
	};	
	
	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"BENCH",-1);
	Npc_ExchangeRoutine	(self,"Bigcross");
	B_StartotherRoutine	(BAU_974_Bauer,"Start");
};

func void DIA_Addon_Greg_NW_was_Gold ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Gold_15_00"); //Gold? Wir alle wollen Gold.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_01"); //Mag schon sein. Und was machst du damit? Versäufst dein Gold in der Kneipe oder verprasst es im Bordell, so wie ich dich einschätze.
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Gold_15_02"); //Und du hast einen besseren Plan, ja?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_03"); //(sauer) Du würdest dich unter einem Stein verkriechen, wenn du wüsstest, was ich schon alles auf die Beine gestellt habe.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Gold_01_04"); //Also sei nicht so vorlaut, sonst stopf ich dir dein großes Maul.
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Waffenhaendler_15_00"); //Hast du in der Stadt keinen Waffenhändler gefunden?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Waffenhaendler_01_01"); //Das ist nicht dein Ernst, oder? Die haben doch nur Schrott.
};

func void DIA_Addon_Greg_NW_was_HierGold ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_HierGold_15_00"); //Hier hast du 10 Goldmünzen.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_01"); //(lacht) Du armer Schlucker kannst deine Kröten behalten. Ich habe da eine bessere Idee.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_02"); //Nicht weit von hier gibt es eine Höhle! Ich bin früher schon mal hier gewesen und habe an einigen Stellen meinen Kram vergraben.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_03"); //Die Höhle ist mir alleine ein wenig zu gefährlich. Ich will, dass du mir dabei hilfst.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Ich habe dem Mann mit der Augenklappe Gold angeboten, doch er wollte es nicht. Ich soll ihm zu seiner Höhle folgen."); 

	MIS_Addon_Greg_RakeCave = LOG_RUNNING;
	Info_ClearChoices	(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_SLD_15_00"); //Waffen? Die Söldner haben Waffen.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_01"); //Interessant. Ich hörte davon, dass Onar der fette Bauer die Jungs angeheuert hat.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_02"); //(lacht) Gar nicht so übel für so eine Landratte.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_SLD_01_03"); //Keine schlechte Idee. Ich sollte sie vielleicht wirklich mal aufsuchen.
};
func void DIA_Addon_Greg_NW_was_Orlan ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Orlan_15_00"); //Proviant? Du bist hier in einer Taverne.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_Orlan_01_01"); //Der dämliche Wirt rückt doch nichts raus, wenn du ihn nicht dafür bezahlst.
};

func void DIA_Addon_Greg_NW_was_no ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_no_15_00"); //Ich kenne niemanden, auf den die Beschreibung passt.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_was_no_01_01"); //Hätte ich mir fast denken können.
	DIA_Addon_Greg_NW_was_UnNun ();
};

func void DIA_Addon_Greg_NW_was_Diego ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Diego_15_00"); //Du redest von Diego.
	DIA_Addon_Greg_NW_was_GregUnsicher ();
	DIA_Addon_Greg_NW_was_UnNun ();
};

func void DIA_Addon_Greg_NW_was_Dexter ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_was_Dexter_15_00"); //Heißt er vielleicht Dexter?
	DIA_Addon_Greg_NW_was_GregUnsicher ();
	DIA_Addon_Greg_NW_was_UnNun ();
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveLos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCaveLos		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCaveLos_Info;

	description	 = 	"Lass uns deine Höhle aufsuchen.";
};

func int DIA_Addon_Greg_NW_RakeCaveLos_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCaveLos_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RakeCaveLos_15_00"); //Lass uns deine Höhle aufsuchen.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveLos_01_01"); //Komm mit.
	AI_StopProcessInfos (self);
	AI_UseMob			(self,"BENCH",-1);
	Npc_ExchangeRoutine	(self,"RakeCave");
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveThere
///////////////////////////////////////////////////////////////////////
	func void B_Greg_GoNow()
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_03"); //(befiehlt) Worauf wartest du noch? Geh rein und hol das Zeug.
	};
// --------------------------------------------------------------------

instance DIA_Addon_Greg_NW_RakeCaveThere		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCaveThere_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCaveThere_Info;
	important	 = 	TRUE;

};

func int DIA_Addon_Greg_NW_RakeCaveThere_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& ((Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) )
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCaveThere_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_00"); //So, mein Freund. Hier ist die Höhle.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_01"); //Ich gebe dir schon mal eine Hacke.
	B_GiveInvItems (self, other, itmw_2h_Axe_L_01, 1); //Spitzhacke	
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_02"); //Irgendwo da drin habe ich den Kram vergraben. Ich hab' die Stelle mit einem Kreuz markiert.
	B_Greg_GoNow();
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RakeCaveThere_15_04"); //Was ist mit dir?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_05"); //Jemand muss doch auf unseren Rückzug achten. So, und jetzt rein mit dir.

	Log_CreateTopic (TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_Greg_NW,"Der Kerl will, dass ich in der Höhle nach seinem Kram suche. Er hat es vergraben und die Stelle mit einem Kreuz markiert. Dazu gab er mir eine Hacke."); 

	MIS_Addon_Greg_RakeCave_Day = Wld_GetDay(); 
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCavePlundered
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCavePlundered		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RakeCavePlundered_Condition;
	information	 = 	DIA_Addon_Greg_NW_RakeCavePlundered_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_RakeCavePlundered_Condition ()
{
	if ((MIS_Addon_Greg_RakeCave_Day <= (Wld_GetDay()-2)) || (RAKEPLACE[Greg_FirstSecret] == TRUE))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_01_00"); //Wo warst du denn so lange? Hast du schon was gefunden?
	
	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_RakeCavePlundered, "Ja. Ich habe ein Säckchen mit Gold gefunden.", DIA_Addon_Greg_NW_RakeCavePlundered_gold );
	};
	Info_AddChoice	(DIA_Addon_Greg_NW_RakeCavePlundered, "Nein.", DIA_Addon_Greg_NW_RakeCavePlundered_No );
};
func void DIA_Addon_Greg_NW_RakeCavePlundered_No ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00"); //Nein.
	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01"); //Willst du mich etwa verarschen?
		AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02"); //(heuchelt) Da WAR nichts.
	};	
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03"); //Verdammt. Ich hab's ja gewusst. Da waren die Aasgeier wieder schneller als ich.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04"); //Naja. Nichts für ungut, Kleiner. Ich muss weiter. Wir sehen später.
	AI_StopProcessInfos (self);
	GregLocation = Greg_Bigcross;
	Npc_ExchangeRoutine	(self,"Bigcross");
	B_StartotherRoutine	(BAU_974_Bauer,"Start");
};
var int B_Greg_RakePlaceBriefing_OneTime;
func void B_Greg_RakePlaceBriefing ()
{
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_00"); //Also. Auf dem kleinen See mit den zwei Wasserfällen ist eine kleine Insel, da müsste ein Versteck von mir sein.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_01"); //Weiter oben auf dem Weidenplateau habe ich auch 2 Stellen, an denen ich was vergraben habe.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_02"); //Die eine Stelle ist hinter'm Bauernhof da oben und die zweite neben dem Eingang zum Pass bei den Wasserfällen.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_03"); //Es führt eine Treppe hinunter von den Feldern des Bauern dort oben zu denen des Großbauern.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_04"); //In dem Talkessel am Ende der Treppe ist eine weitere Stelle.

	if (B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry (TOPIC_Addon_Greg_NW,"Es gibt noch mehr Stellen an denen er etwas vergraben hat. 1) Auf der kleinen Insel im See mit den zwei Wasserfällen. 2) Oben auf dem Weidenplateau hinterm Bauernhof. 3) Neben dem Eingang zum Pass bei den Wasserfällen. 4) In dem Talkessel unterhalb der Treppe von den Feldern des Bauern vom Weidenplateau zu denen des Großbauern. Ich soll ihm den vergrabenen Kram wieder beschaffen. Er wartet auf mich an der Kreuzung zwischen den Feldern.");
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};                                                                                             
                                                                                               
func void DIA_Addon_Greg_NW_RakeCavePlundered_gold ()                                          
{                                                                                              
	AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00"); //Ja. Ich habe ein Säckchen mit Gold ausgegraben.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01"); //(gierig) Her damit.

	if ((Npc_HasItems (other,ItSe_GoldPocket25))||(Npc_HasItems (other,ItMi_Gold)>= 25))
		{	
			if (B_GiveInvItems (other, self, ItSe_GoldPocket25,1))
				{
					AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02"); //Hier hast du es.
				}
			else if (B_GiveInvItems (other, self, ItMi_Gold,25))
				{
					AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03"); //Es waren 25 Goldstücke darin. Hier hast du sie.
				};
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04"); //Das ist gut. Dann sind sie immer noch da.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05"); //Bist ja doch zu was zu gebrauchen.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06"); //Ok, hör zu. Ich habe noch mehr vergraben. Und du wirst es mir wieder beschaffen.
			B_Greg_RakePlaceBriefing ();
			Greg_SuchWeiter = TRUE;
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07"); //Ich werde bei der großen Kreuzung bei den Feldern des Großbauern auf dich warten. Enttäusch mich nicht. Das würdest du bereuen, klar?
			AI_StopProcessInfos (self);
			GregLocation = Greg_Bigcross;
			Npc_ExchangeRoutine	(self,"Bigcross");
			B_GivePlayerXP (XP_Addon_RakeCavePlundered);
		}
	else
		{
			AI_Output			(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08"); //Ich hab' es nicht mehr.
			AI_Output			(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09"); //Erzähl keinen Unsinn. Ich muss es wohl aus dir rausprügeln, was?
			AI_StopProcessInfos (self);
			MIS_Addon_Greg_RakeCave = LOG_FAILED;//Joly:SC hat Greg angeschissen.
			GregLocation = Greg_Bigcross;
			Npc_ExchangeRoutine	(self,"Bigcross");
			B_Attack (self, other, AR_NONE, 1);
		};
};

///////////////////////////////////////////////////////////////////////
//	PERM vor LakeCave
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_LakeCave	(C_INFO)
{
	npc		 	= PIR_1300_Addon_Greg_NW;
	nr		 	= 100; //alle anderen importants wichtiger
	condition	= DIA_Addon_Greg_NW_LakeCave_Condition;
	information	= DIA_Addon_Greg_NW_LakeCave_Info;
	permanent	= TRUE;
	important 	= TRUE;
};

func int DIA_Addon_Greg_NW_LakeCave_Condition ()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01")<1000) 	
	&& (Greg_SuchWeiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_LakeCave_Info ()
{
	B_Greg_GoNow();
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info WhereTreasures
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhereTreasures		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	10;
	condition	 = 	DIA_Addon_Greg_NW_WhereTreasures_Condition;
	information	 = 	DIA_Addon_Greg_NW_WhereTreasures_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wo genau hast du nochmal deine Sachen vergraben?";
};

func int DIA_Addon_Greg_NW_WhereTreasures_Condition ()
{
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WhereTreasures_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WhereTreasures_15_00"); //Wo genau hast du noch mal deine Sachen vergraben?
	B_Greg_RakePlaceBriefing ();
};

///////////////////////////////////////////////////////////////////////
//	Info PermTaverne
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PermTaverne		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Greg_NW_PermTaverne_Condition;
	information	 = 	DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent	 = 	TRUE;

	description	 = 	"Eine Sache noch...";
};

func int DIA_Addon_Greg_NW_PermTaverne_Condition ()
{
	if 	(
		(GregLocation == Greg_Bigcross)
		&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross) == FALSE)
		&& (((Npc_GetDistToWP(self,"BIGCROSS")<1000) == FALSE)||(MIS_Addon_Greg_RakeCave == LOG_SUCCESS))
		)
	|| 	(
		(GregLocation == Greg_Dexter)
		&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_WasWillstDu))
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_PermTaverne_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_PermTaverne_15_00"); //Eine Sache noch ...

	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_01"); //Du besorgst mir erst mal meine vergrabenen Sachen. Dann können wir weiter reden.
	}
	else if (MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_02"); //Ich bin dir dankbar, dass du mir geholfen hast. Das macht uns aber noch lange nicht zu Freunden, klar?
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_03"); //Wir haben schon genug gequatscht.
	};
};


///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//3. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info Bigcross
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Bigcross		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_Bigcross_Condition;
	information	 = 	DIA_Addon_Greg_NW_Bigcross_Info;

	description	 = 	"Alles klar?";
};

func int DIA_Addon_Greg_NW_Bigcross_Condition ()
{
	if (GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self,"BIGCROSS")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_Bigcross_Info ()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)||(MIS_Addon_Greg_RakeCave == LOG_FAILED))
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_00"); //Sieh an, der Unzuverlässige.
	};

	AI_Output	(other, self, "DIA_Addon_Greg_NW_Bigcross_15_01"); //Alles klar?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_02"); //Wie man's nimmt. Die Söldner sind nicht wirklich eine große Hilfe für mich.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_03"); //Ich hatte erwartet, die hätten ja wenigstens ein bisschen Mumm in den Knochen.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_04"); //Aber wenn du mich fragst, sind das alles nur Aufschneider und Großmäuler.
	
	if (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_05"); //Was ist denn jetzt mit meinen vergrabenen Sachen? Hast du sie schon gefunden?
		if (RAKEPLACE[1]==FALSE)
		|| (RAKEPLACE[2]==FALSE)
		|| (RAKEPLACE[3]==FALSE)
		|| (RAKEPLACE[4]==FALSE)
		|| (RAKEPLACE[5]==FALSE)
		{
			AI_Output	(other, self, "DIA_Addon_Greg_NW_Bigcross_15_06"); //Nein, noch nicht alles.
			AI_Output	(self, other, "DIA_Addon_Greg_NW_Bigcross_01_07"); //Dann mach mal ein bisschen schneller. Das kann doch wohl nicht so schwer sein.
		};
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info WhatWantFromSLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhatWantFromSLD		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information	 = 	DIA_Addon_Greg_NW_WhatWantFromSLD_Info;

	description	 = 	"Was wolltest du denn von den Söldnern?";
};

func int DIA_Addon_Greg_NW_WhatWantFromSLD_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self,"BIGCROSS")<1000) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WhatWantFromSLD_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WhatWantFromSLD_15_00"); //Was wolltest du denn von den Söldnern?
	
	if (SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter ();
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_01"); //Das weißt du doch. Ich suche diesen Kerl in roter Rüstung.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_02"); //Aber die Idioten hier wissen auch nicht, wovon ich rede.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info DexterFound
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_DexterFound		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_DexterFound_Condition;
	information	 = 	DIA_Addon_Greg_NW_DexterFound_Info;

	description	 = 	"Ich vermute, du suchst einen Kerl namens Dexter.";
};

func int DIA_Addon_Greg_NW_DexterFound_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& ((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_DexterFound_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_DexterFound_15_00"); //Ich vermute, du suchst einen Kerl namens Dexter.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_DexterFound_01_01"); //Verdammt. Ich hab keine Ahnung, wie der Kerl heißt.
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "War nur so ein Gedanke.", DIA_Addon_Greg_NW_DexterFound_weg );
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "Wie wär's, wenn wir gemeinsam zu ihm gehen.", DIA_Addon_Greg_NW_DexterFound_together );
	Info_AddChoice	(DIA_Addon_Greg_NW_DexterFound, "Ich weiß, wo du ihn finden kannst.", DIA_Addon_Greg_NW_DexterFound_wo );
};
func void DIA_Addon_Greg_NW_DexterFound_weg ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_weg_15_00"); //War nur so ein Gedanke.
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_wo ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_00"); //Ich weiß, wo du ihn finden kannst.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_01"); //(überrascht) Tatsächlich? ERZÄHL!
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_02"); //Nicht weit von hier.
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_03"); //Er ist offensichtlich der Anführer einer üblen Bande von Banditen.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_04"); //(lacht hämisch) HAH. Ja. Das ist er.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_05"); //Ich wusste, dass er sich hier irgendwo verkrochen hat, die alte Landratte.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_06"); //Ich muss jetzt nur noch in den Kellerlöchern und Rattennestern in der Gegend hier nachsehen.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_07"); //Den Schweinehund finde ich schon, da brauche ich deine Hilfe nicht mehr.
	Info_ClearChoices	(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP (XP_Ambient);
};

func void DIA_Addon_Greg_NW_DexterFound_together ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_DexterFound_together_15_00"); //Wie wär's, wenn wir gemeinsam zu ihm gehen.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_DexterFound_together_01_01"); //Ich hab' mit ihm noch ein Hühnchen zu rupfen. Damit werde ich schon alleine fertig.
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
		
						//4. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_CaughtDexter_Condition;
	information	 = 	DIA_Addon_Greg_NW_CaughtDexter_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_CaughtDexter_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_00"); //(laut) Wo ist das Schwein?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_CaughtDexter_15_01"); //Wer? Der Hauptmann? Der ist hier.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_02"); //(laut) Dann geh mir aus dem Weg.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"DexterHouseRun");
};

///////////////////////////////////////////////////////////////////////
//	Info WodennNu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WodennNu		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WodennNu_Condition;
	information	 = 	DIA_Addon_Greg_NW_WodennNu_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_WodennNu_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE)
	&& (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10")<500) 
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WodennNu_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WodennNu_01_00"); //(sauer) Wo ist er denn jetzt?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WodennNu_15_01"); //Er war hier.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WodennNu_01_02"); //(befiehlt) Na dann geh und such ihn!
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter2		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_CaughtDexter2_Condition;
	information	 = 	DIA_Addon_Greg_NW_CaughtDexter2_Info;
	important	 = 	TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter2_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_CaughtDexter2_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_00"); //So. Dexter ist wohl erledigt, was?
	AI_Output	(other, self, "DIA_Addon_Greg_NW_CaughtDexter2_15_01"); //Sieht so aus, als sei er tot.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_02"); //Das wurde aber auch Zeit. Sieh mal nach, was er bei sich hat.
	Npc_ExchangeRoutine	(self,"DexterHouseWalk");
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info RavensLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RavensLetter		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_RavensLetter_Condition;
	information	 = 	DIA_Addon_Greg_NW_RavensLetter_Info;

	description	 = 	"Dexter hatte nur diesen Brief bei sich.";
};

func int DIA_Addon_Greg_NW_RavensLetter_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_CaughtDexter2))
	&& (Npc_HasItems (other,ItWr_RavensKidnapperMission_Addon))
	&& (Npc_IsDead(Dexter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_RavensLetter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_00"); //Dexter hatte nur diesen Brief bei sich.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_01"); //Zeig mir das Ding mal.
	B_UseFakeScroll ();
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_02"); //Ach, verdammt. Das hilft mir nicht weiter.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_03"); //Wir hätten den Kerl nicht einfach verrecken lassen dürfen.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_04"); //Du weißt nicht zufällig, wie man über die Berge im Nordosten von Khorinis kommt?
	
	if (Nefarius_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (Saturas_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_05"); //Vielleicht durch einen unterirdischen Tunnel. Die Wassermagier studieren gerade ein Portal, das in die Berge im Nordosten führt.
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_06"); //(sauer) Was ist denn das für ein Blödsinn?
		AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_07"); //(spottet) Pah. Wassermagier. Hast du keinen besseren Plan?
	};
	
	AI_Output	(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_08"); //Nein.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_09"); //(seufzt resigniert) Dann bin hier gestrandet.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_10"); //Dexter war meine letzte Hoffnung.
};

///////////////////////////////////////////////////////////////////////
//	Info WasWillstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WasWillstDu		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information	 = 	DIA_Addon_Greg_NW_WasWillstDu_Info;

	description	 = 	"Was wolltest du von Dexter?";
};

func int DIA_Addon_Greg_NW_WasWillstDu_Condition ()
{
	if (GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo (other, DIA_Addon_Greg_NW_RavensLetter))
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_WasWillstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_WasWillstDu_15_00"); //Was wolltest du von Dexter?
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_01"); //Ich komme von jenseits der Berge im Nordosten dieser Insel. Und da will ich wieder hin.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_02"); //Ich hatte gehofft, der Mistkerl wüsste, wie man da hin kommt, ohne mit dem Schiff fahren zu müssen.

	Npc_ExchangeRoutine	(self,"DexterThrone");	

	Info_ClearChoices	(DIA_Addon_Greg_NW_WasWillstDu);
	Info_AddChoice	(DIA_Addon_Greg_NW_WasWillstDu, "Was gibt es da hinter den Bergen?", DIA_Addon_Greg_NW_WasWillstDu_da );
	
	if (Skip_NW.aivar[AIV_TalkedToPlayer]==TRUE)
	{
		Info_AddChoice	(DIA_Addon_Greg_NW_WasWillstDu, "Ich habe einen Pirat namens Skip in der Nähe der Hafenstadt gesehen.", DIA_Addon_Greg_NW_WasWillstDu_Skip );
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_da ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_WasWillstDu_da_15_00"); //Was gibt es da hinter den Bergen?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_01"); //Ich kann dir nur raten, nicht zu versuchen, das Land dort zu betreten.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_02"); //Es ist eine rauhe Gegend. Ein Wicht wie du, der wird da nicht lange überleben.
};

func void DIA_Addon_Greg_NW_WasWillstDu_Skip ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00"); //Ich habe einen Piraten namens Skip in der Nähe der Hafenstadt gesehen.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01"); //Der Idiot. Ich habe 3 Tage dort gewartet. Warum kommt er denn jetzt erst?
	AI_Output			(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02"); //Wenn ich wieder zu Kräften gekommen bin, kann er sein blaues Wunder erleben.
	SC_KnowsConnectionSkipGreg = TRUE;
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundTreasure
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_FoundTreasure		(C_INFO)
{
	npc		 = 	PIR_1300_Addon_Greg_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Greg_NW_FoundTreasure_Condition;
	information	 = 	DIA_Addon_Greg_NW_FoundTreasure_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ich habe deine vergrabenen Sachen gefunden.";
};

func int DIA_Addon_Greg_NW_FoundTreasure_Condition ()
{
	if (RAKEPLACE[1]==TRUE)
	&& (RAKEPLACE[2]==TRUE)
	&& (RAKEPLACE[3]==TRUE)
	&& (RAKEPLACE[4]==TRUE)
	&& (RAKEPLACE[5]==TRUE)
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Greg_NW_FoundTreasure_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Greg_NW_FoundTreasure_15_00"); //Ich habe deine vergrabenen Sachen gefunden.
	AI_Output	(self, other, "DIA_Addon_Greg_NW_FoundTreasure_01_01"); //Dann müsstest du jetzt etwa 100 Goldmünzen, einen goldenen Kelch, eine silberne Schale und ein Amulett bei dir haben, die mir gehören. Her damit.
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_FoundTreasure);	
	Info_AddChoice	(DIA_Addon_Greg_NW_FoundTreasure, "Ich habe es gerade nicht dabei.", DIA_Addon_Greg_NW_FoundTreasure_not );

	if ((Npc_HasItems (other,ItSe_GoldPocket100)) || (Npc_HasItems (other,itmi_gold)>= 100))
	&& (Npc_HasItems (other,ItMi_GoldCup))
	&& (Npc_HasItems (other,ItMi_SilverChalice))
	&& (Npc_HasItems (other,ItAm_Prot_Point_01))
		{
			Info_AddChoice	(DIA_Addon_Greg_NW_FoundTreasure, "Hier hast du die Sachen.", DIA_Addon_Greg_NW_FoundTreasure_ja );
		};
};
func void DIA_Addon_Greg_NW_FoundTreasure_ja ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_00"); //Hier hast du die Sachen.

	if (B_GiveInvItems (other, self, ItSe_GoldPocket100,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_01"); //Ein Säckchen mit 100 Goldmünzen.
	}	
	else if (B_GiveInvItems (other, self, ItMi_gold,100))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_02"); //100 Goldmünzen.
	};

	if (B_GiveInvItems (other, self, ItMi_GoldCup,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_03"); //Einen Goldkelch.
	};
	if (B_GiveInvItems (other, self, ItMi_SilverChalice,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_04"); //Eine silberne Schale.
	};
	if (B_GiveInvItems (other, self, ItAm_Prot_Point_01,1))
	{
		AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_05"); //Und ein Amulett.
	};
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_06"); //Sehr gut. Hast Glück, dass du nicht dumm genug bist, mit den Sachen einfach zu verschwinden.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_07"); //Hier hast du deinen Anteil an der Beute.

	B_GiveInvItems (self, other, ItMi_gold,30);
	
	Info_ClearChoices	(DIA_Addon_Greg_NW_FoundTreasure);	
		
	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not ()
{
	AI_Output			(other, self, "DIA_Addon_Greg_NW_FoundTreasure_not_15_00"); //Ich habe sie gerade nicht dabei.
	AI_Output			(self, other, "DIA_Addon_Greg_NW_FoundTreasure_not_01_01"); //Dann beschaff mir die Sachen, bevor ich böse werde.
	AI_StopProcessInfos (self);
};

