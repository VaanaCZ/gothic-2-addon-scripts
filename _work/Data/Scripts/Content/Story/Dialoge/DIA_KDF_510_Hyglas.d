///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap1_EXIT_Condition;
	information = DIA_Hyglas_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Feuer
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Feuer		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_Feuer_Condition;
	information	 = 	DIA_Hyglas_Feuer_Info;
	permanent	 = 	FALSE;
	description	 =  "Ich fordere die Prüfung des Feuers. ";
};
func int DIA_Hyglas_Feuer_Condition ()
{	
	if (other.guild == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == TRUE)
	&& (Npc_KnowsInfo (other,DIA_Pyrokar_FIRE) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_Feuer_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_Feuer_15_00"); //Ich fordere die Prüfung des Feuers.
	AI_Output (self, other, "DIA_Hyglas_Feuer_14_01"); //Die Prüfung des Feuers stammt aus alten Tagen und ist schon lange nicht mehr abgehalten worden.
	AI_Output (self, other, "DIA_Hyglas_Feuer_14_02"); //Was du da forderst, ist viel zu gefährlich. Also denke besser nicht weiter darüber nach.
};    
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Hallo		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_Hallo_Condition;
	information	 = 	DIA_Hyglas_Hallo_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Hyglas_Hallo_Condition ()
{	
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Hyglas_Hallo_14_00"); //Ich bin Meister Hyglas, Hüter des Feuers und Bewahrer des Wissens.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Hyglas_Hallo_14_01"); //Es ist dir also von Meister Parlan gestattet worden, die Schriften zu studieren.
		AI_Output (self, other, "DIA_Hyglas_Hallo_14_02"); //Dann ist es jetzt an dir, genau das zu tun. Lerne, auf dass du Erleuchtung in der Schrift findest.
	};
};    
///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_JOB		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	2;
	condition	 = 	DIA_Hyglas_JOB_Condition;
	information	 = 	DIA_Hyglas_JOB_Info;
	permanent	 = 	FALSE;
	description	 = 	"Was studierst du, Meister?";
};
func int DIA_Hyglas_JOB_Condition ()
{	
	return TRUE;
};
func void DIA_Hyglas_JOB_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_JOB_15_00"); //Was studierst du, Meister?
	AI_Output (self, other, "DIA_Hyglas_JOB_14_01"); //Meine Forschungen beziehen sich auf das Feuer - die Macht Innos'.
	AI_Output (self, other, "DIA_Hyglas_JOB_14_02"); //Es ist sein Geschenk und zugleich eine mächtige Waffe - und ich erschaffe Runen, in denen diese Kraft ruht.
	
	if (other.guild == GIL_NOV)
	{
		AI_Output (other, self, "DIA_Hyglas_JOB_15_03"); //Aufschlussreich. Kannst du mir das beibringen?
		AI_Output (self, other, "DIA_Hyglas_JOB_14_04"); //Die Magie wird von Innos verliehen. Nur seinen Dienern, den Feuermagiern, ist es möglich, zu lernen, diese Macht zu beherrschen.
	};
};    
///////////////////////////////////////////////////////////////////////
//	Info CONTEST
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_CONTEST		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr           =  9;
	condition	 = 	DIA_Hyglas_CONTEST_Condition;
	information	 = 	DIA_Hyglas_CONTEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich habe die Prüfung des Feuers gefordert.";
};
func int DIA_Hyglas_CONTEST_Condition ()
{
	if (MIS_RUNE == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_CONTEST_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_CONTEST_15_00"); //Ich habe die Prüfung des Feuers gefordert. Ulthar hat mir die Aufgabe gestellt, eine Feuerpfeil-Rune zu erschaffen.
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_01"); //Und jetzt willst du, dass ich dir die Formel beibringe?
	AI_Output (other, self, "DIA_Hyglas_CONTEST_15_02"); //Ich weiß nicht, wie ich es sonst schaffen soll.
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_03"); //Hm ...
	AI_Output (self, other, "DIA_Hyglas_CONTEST_14_04"); //Gut, ich bringe dir die Formel bei. Aber erst, wenn du alle Rohstoffe dafür besorgt hast.
	
	B_LogEntry (TOPIC_Rune,"Hyglas ist bereit mir die Formel für die Feuerpfeil Rune beizubringen, wenn ich alle Rohstoffe zusammen habe.");
};	
///////////////////////////////////////////////////////////////////////
//	Info FIREBOLT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_FIREBOLT		(C_INFO)
{
	npc		 	 = 	KDF_510_Hyglas;
	nr           =  9;
	condition	 = 	DIA_Hyglas_FIREBOLT_Condition;
	information	 = 	DIA_Hyglas_FIREBOLT_Info;
	permanent	 =  FALSE;
	description	 = 	"Welche Rohstoffe brauche ich für eine Feuerpfeil-Rune?";
};
func int DIA_Hyglas_FIREBOLT_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_CONTEST)
	&& (MIS_RUNE == LOG_RUNNING)
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_FIREBOLT_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_FIREBOLT_15_00"); //Welche Rohstoffe brauche ich für eine Feuerpfeil-Rune?
	AI_Output (self, other, "DIA_Hyglas_FIREBOLT_14_01"); //Lies es nach - es steht in den Büchern.
};
///////////////////////////////////////////////////////////////////////
//	Info TALENT_FIREBOLT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_TALENT_FIREBOLT		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =	990;
	condition	 = 	DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information	 = 	DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent 	 =  TRUE; 
	description	 = 	"Lehre mich, die Rune FEUERPFEIL zu erschaffen.";

};
func int DIA_Hyglas_TALENT_FIREBOLT_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_CONTEST)
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	&& (Npc_HasItems (other,ItMi_RuneBlank) >= 1)
	&& (Npc_HasItems (other,ItSc_Firebolt) >= 1)
	&& (Npc_HasItems (other,ItMi_Sulfur) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_TALENT_FIREBOLT_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_TALENT_FIREBOLT_15_00"); //Lehre mich, die Rune FEUERPFEIL zu erschaffen.
	
	if (B_TeachPlayerTalentRunes (self, other, SPL_Firebolt))	
	{
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_01"); //Um eine Feuerpfeil-Rune zu erschaffen, musst du am Runentisch den Schwefel mit dem Runenstein verbinden.
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_02"); //Die Kraft der Spruchrolle des Feuerpfeils wird in die Rune einfließen und du besitzt ein Werkzeug Innos'.
		AI_Output (self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_03"); //Wenn du also alle Rohstoffe besitzt, gehe zum Runentisch und du kannst die Rune erschaffen.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info BLANK_RUNE
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_BLANK_RUNE		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =	9;	
	condition	 = 	DIA_Hyglas_BLANK_RUNE_Condition;
	information	 = 	DIA_Hyglas_BLANK_RUNE_Info;
	permanent	 =  FALSE;
	description	 = 	"Woher bekomme ich einen Runenstein? ";
};
func int DIA_Hyglas_BLANK_RUNE_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Hyglas_FIREBOLT)
	&& (MIS_RUNE == LOG_RUNNING)
	&& (npc_hasItems (other, ItMI_RuneBlank) < 1) 
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_BLANK_RUNE_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_BLANK_RUNE_15_00"); //Woher bekomme ich einen Runenstein?
	AI_Output (self, other, "DIA_Hyglas_BLANK_RUNE_14_01"); //Hey, du hast die Prüfung des Feuers gefordert - nicht ich. Es ist Teil deiner Prüfung, das herauszufinden.
};
///////////////////////////////////////////////////////////////////////
//	Info GOTRUNE
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_GOTRUNE		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 =  2;
	condition	 = 	DIA_Hyglas_GOTRUNE_Condition;
	information	 = 	DIA_Hyglas_GOTRUNE_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich habe die Rune erschaffen.";
};
func int DIA_Hyglas_GOTRUNE_Condition ()
{
	if (Npc_KnowsInfo (hero,DIA_Ulthar_SUCCESS)== FALSE ) 
	&& (Npc_HasItems (hero, ItRu_Firebolt) >= 1)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_GOTRUNE_Info ()
{
	AI_Output (other, self, "DIA_Hyglas_GOTRUNE_15_00"); //Ich habe die Rune erschaffen.
	AI_Output (self, other, "DIA_Hyglas_GOTRUNE_14_01"); //Schön, schön. Diese Prüfung hast du wohl bestanden. Das war ja auch nicht besonders schwierig.
	AI_Output (self, other, "DIA_Hyglas_GOTRUNE_14_02"); //Dann geh jetzt zu Ulthar und zeige ihm dein Werk.
	
	B_LogEntry (TOPIC_Rune,"Ich habe eine Feuerpfeil - Rune hergestellt."); 
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_TEACH		(C_INFO)
{
	npc			 = 	KDF_510_Hyglas;
	nr			 = 	15;
	condition	 = 	DIA_Hyglas_TEACH_Condition;
	information	 = 	DIA_Hyglas_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Unterrichte mich";
};
func int DIA_Hyglas_TEACH_Condition ()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};
func void DIA_Hyglas_TEACH_Info ()
{

	var int abletolearn;
	
	abletolearn = 0;
	AI_Output (other, self, "DIA_Hyglas_TEACH_15_00"); //Unterrichte mich.
	
	
	Info_ClearChoices (DIA_Hyglas_TEACH);
	Info_AddChoice 	  (DIA_Hyglas_TEACH, DIALOG_BACK,DIA_Hyglas_TEACH_BACK);	
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2) 
	&& (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_Hyglas_TEACH_InstantFireball);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3) 
	&& (PLAYER_TALENT_RUNES [SPL_Firestorm] == FALSE)
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Firestorm, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firestorm)) ,DIA_Hyglas_TEACH_Firestorm);
		abletolearn = (abletolearn +1);
	};
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4) 
	&& (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_ChargeFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeFireball)) ,DIA_Hyglas_TEACH_ChargeFireball);
		abletolearn = (abletolearn +1);
	};
	
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 5) 
	&& (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE) 
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Pyrokinesis, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Pyrokinesis)) ,DIA_Hyglas_TEACH_Pyrokinesis);
		abletolearn = (abletolearn +1);
	};
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6) 
	&& (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice	(DIA_Hyglas_TEACH, B_BuildLearnString (NAME_SPL_Firerain, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Firerain)) ,DIA_Hyglas_TEACH_Firerain);
		abletolearn = (abletolearn +1);
	};
	if (abletolearn < 1)
	{
		B_Say (self, other, "$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices (DIA_Hyglas_TEACH);
	};
};
FUNC VOID DIA_Hyglas_TEACH_BACK ()
{
	Info_ClearChoices (DIA_Hyglas_TEACH);
};
FUNC VOID DIA_Hyglas_TEACH_InstantFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_Hyglas_TEACH_ChargeFireball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeFireball);	
};
FUNC VOID DIA_Hyglas_TEACH_Pyrokinesis()
{	
	B_TeachPlayerTalentRunes (self, other, SPL_Pyrokinesis);	
};
FUNC VOID DIA_Hyglas_TEACH_Firestorm()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firestorm);	
};
FUNC VOID DIA_Hyglas_TEACH_Firerain()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Firerain);	
};

//#######################################
//##
//##	Kapitel 2
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap2_EXIT_Condition;
	information = DIA_Hyglas_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//#######################################
//##
//##	Kapitel 3
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap3_EXIT_Condition;
	information = DIA_Hyglas_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info BringBook
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_BringBook   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 38;
	condition   = DIA_Hyglas_BringBook_Condition;
	information = DIA_Hyglas_BringBook_Info;
	permanent   = FALSE;
	description = "Gibt es Neuigkeiten?";
};
FUNC INT DIA_Hyglas_BringBook_Condition()
{
	if (Kapitel >= 3)
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_BringBook_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_00"); //Gibt es Neuigkeiten?
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_01"); //Hm, ja. Also, dir sind ja sicherlich diese Gestalten in den schwarzen Roben aufgefallen.
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_02"); //Ich bin ihnen begegnet.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_03"); //Da kommen wir auch schon zum Kern des Ganzen. Zurzeit haben wir eine äußerst seltene Konstellation der Gestirne.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_04"); //Um genauer zu sein, steht das Sternbild des Ochsen in direkter Korrelation zum Sternbild des Kriegers. Ich nehme an, du weißt, was das bedeutet.
	AI_Output (other,self ,"DIA_Hyglas_BringBook_15_05"); //Hm. Nun, um ehrlich zu sein ...
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_06"); //Ja ja, schon verstanden. Also, ich kann jetzt nicht alle Hintergründe offen legen, aber es bedeutet definitiv eine große Veränderung. Und ich mag keine Veränderungen.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_14_07"); //Deshalb möchte ich, dass du mir ein Buch aus der Stadt besorgst. Es heißt 'Die göttliche Kraft der Gestirne'. Es kann sein, dass du ein bisschen suchen musst, aber du wirst es schon finden.
	
	Info_ClearChoices (DIA_Hyglas_BringBook);
	Info_AddChoice (DIA_Hyglas_BringBook,"Besorg dir dein Buch selbst.",DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice (DIA_Hyglas_BringBook,"Was bekomm ich dafür?",DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice (DIA_Hyglas_BringBook,"Ich werde gucken, ob ich es finde.",DIA_Hyglas_BringBook_Yes);
};

FUNC VOID DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetItYourself_15_00"); //Besorg dir dein Buch selbst.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetItYourself_14_01"); //Du wagst es, in so einem Ton mit mir zu sprechen? Dein Verhalten zeigt nicht den mir gebührenden Respekt.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetItYourself_14_02"); //Geh mir aus den Augen und denk über dein Verhalten nach.
	
	MIS_HyglasBringBook = LOG_OBSOLETE;
	
	Info_ClearChoices (DIA_Hyglas_BringBook); 
};

FUNC VOID DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetForIt_15_00"); //Was bekomme ich dafür?
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetForIt_14_01"); //Was meinst du?
	AI_Output (other,self ,"DIA_Hyglas_BringBook_GetForIt_15_02"); //Ich will wissen, was ich bekomme, wenn ich dir das Buch bringe.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_GetForIt_14_03"); //Gar nichts. Was willst du denn bekommen? Wenn du Zeit hast, für mich in Stadt zu gehen, ist es sogar deine Pflicht, mir zu helfen.
	
	Info_ClearChoices (DIA_Hyglas_BringBook); 
};

FUNC VOID DIA_Hyglas_BringBook_Yes()
{
	AI_Output (other,self ,"DIA_Hyglas_BringBook_Yes_15_00"); //Ich werde sehen, ob ich es finde.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_Yes_14_01"); //Das ist gut und es verschafft mir die nötige Zeit, noch anderen Spuren nachzugehen.
	AI_Output (self ,other,"DIA_Hyglas_BringBook_Yes_14_02"); //Aber lass dir nicht zu viel Zeit, ich fürchte, Zeit ist das, was wir am wenigsten haben.
	
	MIS_HyglasBringBook = LOG_RUNNING;
	
	Info_ClearChoices (DIA_Hyglas_BringBook);
	
	Log_CreateTopic (TOPIC_HyglasBringBook,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HyglasBringBook,LOG_RUNNING);
	B_LogEntry (TOPIC_HyglasBringBook,"Ich soll Hyglas das Buch 'Göttliche Kraft der Gestirne' besorgen. Ich soll bei den Händlern in der Stadt suchen.");
};

//*********************************************************************
//	Ich hab dein Buch
//*********************************************************************

INSTANCE DIA_Hyglas_HaveBook   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 38;
	condition   = DIA_Hyglas_HaveBook_Condition;
	information = DIA_Hyglas_HaveBook_Info;
	permanent   = FALSE;
	description = "Ich habe das Buch für dich.";
};
FUNC INT DIA_Hyglas_HaveBook_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Hyglas_BringBook))
	&& (Npc_HasItems (other,ItWr_Astronomy_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_HaveBook_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_HaveBook_15_00"); //Ich habe das Buch für dich.
	
	IF Mis_HyglasBringBook == LOG_RUNNING
	{
		AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_01"); //Sehr gut, gib her.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_02"); //Hast du es dir also doch noch mal überlegt. Sehr gut. Wo hast du denn das Buch?
	};		
		
	B_GiveInvItems (other,self,ItWr_Astronomy_Mis,1);
	
	Mis_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP (XP_HyglasBringBook);
	
	
	AI_Output (self ,other,"DIA_Hyglas_HaveBook_14_03"); //Du darfst dich jetzt entfernen. Ich werde mich zum Studium zurückziehen.
	
};

//#######################################
//##
//##	Kapitel 4
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap4_EXIT_Condition;
	information = DIA_Hyglas_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm4
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap4_PERM   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 49;
	condition   = DIA_Hyglas_Kap4_PERM_Condition;
	information = DIA_Hyglas_Kap4_PERM_Info;
	permanent   = TRUE;
	description = "Schon was rausgefunden?";
};
FUNC INT DIA_Hyglas_Kap4_PERM_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Hyglas_BringBook))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output (other,self ,"DIA_Hyglas_Kap4_PERM_15_00"); //Schon was rausgefunden?
	
	if (Mis_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_01"); //Also, ich bin mir ja nicht sicher, aber die derzeitige Konstellation der Gestirne birgt eine Menge Gefahren.
		AI_Output (other,self ,"DIA_Hyglas_Kap4_PERM_15_02"); //Welche?
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_03"); //Nun, das Gefüge zwischen den Welten scheint sehr schwach zu sein. Es bedarf nur einen Bruchteil der sonst erforderlichen Kraft, um ein Loch in dieses Gefüge zu reißen.
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_04"); //Dämonen könnten ungehindert durch diese Portale in unsere Welt gelangen.
		
		Hyglas_SendsToKarras = TRUE;
	}
	else if (Mis_HyglasBringBook == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_05"); //Nein, ich warte immer noch auf das Buch.
	}
	else
	{
		AI_Output (self ,other,"DIA_Hyglas_Kap4_PERM_14_06"); //Ich habe dir doch gesagt, dass ich noch Nachforschungen anstelle, aber ohne das nötige Material dauert das halt länger.
	};
	
};

//#######################################
//##
//##	Kapitel 5
//##
//#######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Hyglas_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_510_Hyglas;
	nr          = 999;
	condition   = DIA_Hyglas_Kap5_EXIT_Condition;
	information = DIA_Hyglas_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Hyglas_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hyglas_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hyglas_PICKPOCKET (C_INFO)
{
	npc			= KDF_510_Hyglas;
	nr			= 900;
	condition	= DIA_Hyglas_PICKPOCKET_Condition;
	information	= DIA_Hyglas_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Hyglas_PICKPOCKET_Condition()
{
	C_Beklauen (73, 200);
};
 
FUNC VOID DIA_Hyglas_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hyglas_PICKPOCKET);
	Info_AddChoice		(DIA_Hyglas_PICKPOCKET, DIALOG_BACK 		,DIA_Hyglas_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hyglas_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hyglas_PICKPOCKET_DoIt);
};

func void DIA_Hyglas_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hyglas_PICKPOCKET);
};
	
func void DIA_Hyglas_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hyglas_PICKPOCKET);
};

























