///////////////////////////////////////////////////////////////////////
//	Info Kap1 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap1_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap1_EXIT_Condition;
	information = DIA_Serpentes_Kap1_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap1_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info NOTALK
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOTALK		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOTALK_Condition;
	information	 = 	DIA_Serpentes_NOTALK_Info;
	permanent	 = 	FALSE;
	important	 =  TRUE;
};
func int DIA_Serpentes_NOTALK_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOTALK_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_NOTALK_10_00"); //(zurechtweisend) Was wagst du es, mich anzusprechen, Novize? Geh zurück an deine Arbeit.
	
	Info_ClearChoices (DIA_Serpentes_NOTALK);
	Info_AddChoice 	  (DIA_Serpentes_NOTALK,"Ich wollte gerade gehen (ENDE)",DIA_Serpentes_NOTALK_EXIT);
	Info_AddChoice 	  (DIA_Serpentes_NOTALK,"Ich hätte noch eine Frage... ",DIA_Serpentes_NOTALK_QUESTION);
};
FUNC VOID DIA_Serpentes_NOTALK_QUESTION()
{
	AI_Output (other, self, "DIA_Serpentes_NOTALK_QUESTION_15_00"); //Ich hätte noch eine Frage ...
	AI_Output (self, other, "DIA_Serpentes_NOTALK_QUESTION_10_01"); //(aufgebracht) Du scheinst nicht verstehen zu wollen. Ich entscheide, wann ich mit dir rede. Was glaubst du, wer du bist?
	AI_Output (self, other, "DIA_Serpentes_NOTALK_QUESTION_10_02"); //Und jetzt geh zurück an deine Arbeit!
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Serpentes_NOTALK_EXIT()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOAWAY		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_GOAWAY_Condition;
	information	 = 	DIA_Serpentes_GOAWAY_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Serpentes_GOAWAY_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Serpentes_NOTALK)
	&& Npc_IsInState (self, ZS_Talk)
	&& !(Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_GOAWAY_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_GOAWAY_10_00"); //Deine Anwesenheit zeugt nicht nur von deinem Mangel an Respekt, sondern auch von deiner Dummheit, Novize!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info YOURSTORY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_YOURSTORY		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr			 = 	24;
	condition	 = 	DIA_Serpentes_YOURSTORY_Condition;
	information	 = 	DIA_Serpentes_YOURSTORY_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich hörte, du hast die Prüfung des Feuers bestanden.";
};
func int DIA_Serpentes_YOURSTORY_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Ulthar_TEST)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo (hero, DIA_Pyrokar_MAGICAN)== FALSE)
	&& (MIS_GOLEM != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_YOURSTORY_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_YOURSTORY_15_00"); //Ich hörte, du hast die Prüfung des Feuers bestanden.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_01"); //(selbstgefällig) In aller Demut kann ich dies bestätigen. Jeder andere der es versucht hat, ist dabei gestorben.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_02"); //(herablassend) Du solltest nicht versuchen, diese Prüfung abzulegen. Dein Geist ist schwach. Diene lieber dem Kloster und vielleicht wirst du in ein paar Jahren erwählt.
	AI_Output (other, self, "DIA_Serpentes_YOURSTORY_15_03"); //Ich werde die Prüfung bestehen.
	AI_Output (self, other, "DIA_Serpentes_YOURSTORY_10_04"); //Wenn es Innos Wille ist, wirst du das. Aber wenn nicht - dann wirst du versagen.
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_TEST		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_TEST_Condition;
	information	 = 	DIA_Serpentes_TEST_Info;
	permanent	 = 	FALSE;
	description	 = 	"Ich stelle mich deiner Prüfung, Meister";
};
func int DIA_Serpentes_TEST_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_TEST_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_TEST_15_00"); //Ich stelle mich deiner Prüfung, Meister.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_01"); //So, du willst es also wissen. Nur ein mutiger Novize fordert die Prüfung. Aber Mut ist nicht alles, was du brauchst.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_02"); //Bist du auch schlau genug, die Prüfung zu bestehen? Bist du stark genug, gegen die Gefahren anzutreten, die auf dich warten?
	AI_Output (self, other, "DIA_Serpentes_TEST_10_03"); //Falls nicht, wirst du dafür mit deinem Leben bezahlen.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_04"); //Also höre nun deine Prüfung: Suche am Platz der Steine den, der nicht geboren, finde ihn, der einst gerufen.
	AI_Output (self, other, "DIA_Serpentes_TEST_10_05"); //Bezwinge den, der nicht bezwungen werden kann - messe dich mit dem lebenden Fels, kämpfe mit dem niemals sterbenden Stein - und zerstöre ihn.
	
	//----- Der Magische Golem ----
	Wld_InsertNpc 	(MagicGolem, 			"FP_MAGICGOLEM");
	Magic_Golem		= Hlp_GetNpc (MagicGolem);	//Damits auch initialisiert ist!!


	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Golem,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Golem,LOG_RUNNING);
	B_LogEntry (TOPIC_Golem,"Serpentes hat mich seine Prüfung auferlegt. Ich soll den lebenden Fels finden, 'der einst gerufen' und soll ihn bezwingen. ");
};
///////////////////////////////////////////////////////////////////////
//	Info NOIDEA
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOIDEA		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOIDEA_Condition;
	information	 = 	DIA_Serpentes_NOIDEA_Info;
	permanent	 = 	FALSE;
	description	 = 	"Was für ein Wesen meinst du?";
};
func int DIA_Serpentes_NOIDEA_Condition ()
{	
	if (MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOIDEA_Info ()
{
	AI_Output (other, self, "DIA_Serpentes_NOIDEA_15_00"); //Lebender Fels ... ? Was für ein Wesen meinst du?
	AI_Output (self, other, "DIA_Serpentes_NOIDEA_10_01"); //Ich habe dir alles gesagt. (spöttisch) Oder findest du diese Prüfung etwa zu schwer?
	AI_Output (self, other, "DIA_Serpentes_NOIDEA_10_02"); //Jetzt wirst du erfahren, was es bedeutet, die Prüfung des Feuers abzulegen - Ich werde dir keine weiteren Fragen beantworten.
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info NOHELP
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOHELP		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr           =  10;
	condition	 = 	DIA_Serpentes_NOHELP_Condition;
	information	 = 	DIA_Serpentes_NOHELP_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};
func int DIA_Serpentes_NOHELP_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Serpentes_NOIDEA)
	&& ((Npc_IsDead (Magic_Golem)) == FALSE)
	&& (MIS_GOLEM == LOG_RUNNING)
	&& Npc_IsInState	(self, ZS_Talk) 
	&& (other.guild == GIL_NOV)
	&& ((Npc_KnowsInfo (other, DIA_Ulthar_TEST) == FALSE)
	|| Npc_KnowsInfo (other,DIA_Serpentes_YOURSTORY))
	{
		return TRUE;
	};
};
func void DIA_Serpentes_NOHELP_Info ()
{
	AI_Output (self, other, "DIA_Serpentes_NOHELP_10_00"); //(verächtlich) Geh und stelle dich deiner Aufgabe, Novize!
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_501_Serpentes;
	nr			 = 	3;
	condition	 = 	DIA_Serpentes_SUCCESS_Condition;
	information	 = 	DIA_Serpentes_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich habe den Golem besiegt";
};
func int DIA_Serpentes_SUCCESS_Condition ()
{	
	if (Npc_IsDead (MagicGolem))
	&& (MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Serpentes_SUCCESS_Info ()
{
	var C_NPC garwig;
	garwig = Hlp_GetNpc (NOV_608_Garwig);
	
	AI_Output (other, self, "DIA_Serpentes_SUCCESS_15_00"); //Ich habe den Golem besiegt.
	AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_01"); //Was? Du hast es tatsächlich geschafft? Aber ohne den Hammer von Innos hättest du den Golem nie vernichten können.
	
	if (Npc_IsDead (garwig))
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_02"); //(triumphierend) Aber genau das hat dich verraten! Du warst es, der Garwig umgebracht hat!
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_03"); //EMPFANGE DIE STRAFE FÜR DEN MORD AN EINEM DIENER INNOS'!!!
		
		AI_StopProcessInfos (self);
		B_Attack  (self, other, AR_HumanMurderedHuman, 0);
	}
	else 
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_04"); //(zerknirscht) Dennoch muss ich dir zugestehen, dass du die Aufgabe erfüllt hast, vor die ich dich gestellt habe.
	};
	if (Npc_HasItems (other, Holy_Hammer_Mis) >= 1)
	{
		AI_Output (self, other, "DIA_Serpentes_SUCCESS_10_05"); //Und den Hammer nehme ich mal besser an mich.
		
		Npc_RemoveInvItems (other, Holy_Hammer_MIS,1); 
		Wld_InsertItem (Holy_Hammer_MIS,"FP_HAMMER");
	};
	
	MIS_GOLEM = LOG_SUCCESS;
	B_GivePlayerXP (XP_GOLEM);
	
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_PERM   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 99;
	condition   = DIA_Serpentes_PERM_Condition;
	information = DIA_Serpentes_PERM_Info;
	permanent   = TRUE;

	description = "Hast du mir noch etwas zu sagen?";
};
FUNC INT DIA_Serpentes_PERM_Condition()
{	
	if (Kapitel >= 3)
	|| Npc_KnowsInfo (other,DIA_Serpentes_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Serpentes_PERM_Info()
{
	AI_Output (other, self, "DIA_Serpentes_PERM_15_00"); //Hast du mir noch etwas zu sagen?

		if (hero.guild == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Serpentes_PERM_10_01"); //Nein. Im Moment nicht, Bruder.
		}
		else
		{
			AI_Output (self, other, "DIA_Serpentes_PERM_10_02"); //Entferne dich. Du weißt, was du zu tun hast.
		};
	AI_StopProcessInfos (self);
};

//##################################################################
//##
//##	Kapitel 2
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap2_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap2_EXIT_Condition;
	information = DIA_Serpentes_Kap2_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap2_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


//##################################################################
//##
//##	Kapitel 3
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap3 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap3_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap3_EXIT_Condition;
	information = DIA_Serpentes_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteile
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteile		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	30;
	condition	 = 	DIA_Serpentes_MinenAnteile_Condition;
	information	 = 	DIA_Serpentes_MinenAnteile_Info;
	important	 = 	TRUE;
};

func int DIA_Serpentes_MinenAnteile_Condition ()
{
	if (Pedro_Traitor == TRUE)
	&& ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (Kapitel >= 3)
		{
				return TRUE;
		};
};

func void DIA_Serpentes_MinenAnteile_Info ()
{
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_00"); //Nicht so schnell. Ich habe noch eine Aufgabe für dich.

	if (hero.guild == GIL_KDF)
	{
		AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_15_01"); //(seufzt) Und das wäre?
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_02"); //Jetzt, da du der Gemeinschaft des Feuers angehörst, wirst du auch den Pflichten einer solchen nachkommen müssen.
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_03"); //Die Kirche hat sich nicht nur um die Belange der Magie zu kümmern, sie ist auch die letzte Instanz in der Rechtsprechung, wie du weißt.
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_04"); //Der jüngste Fall, der uns vorgetragen wurde, ist ein bodenloser Schlund und muss aus der Welt geschaffen werden.
		
		Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Ich habe schon genug zu tun. Sucht dir jemand anderen.", DIA_Serpentes_MinenAnteile_nein );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Worum geht´s?", DIA_Serpentes_MinenAnteile_was );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Ist das nicht die Angelegenheit der Miliz?", DIA_Serpentes_MinenAnteile_miliz );
	}
	else
	{
		AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_10_05"); //Ein käuflicher Söldner deines Schlages könnte uns in dieser Angelegenheit von Nutzen sein.
		
		Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Ich habe schon genug zu tun. Sucht dir jemand anderen.", DIA_Serpentes_MinenAnteile_nein );
		Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Wen soll ich töten?", DIA_Serpentes_MinenAnteile_KillSLD );
	};
};
func void DIA_Serpentes_MinenAnteile_miliz ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_miliz_15_00"); //Ist das nicht die Angelegenheit der Miliz?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_miliz_10_01"); //Die Miliz ist allein für die Stadt verantwortlich. Diese Angelegenheit hat weitreichendere Konsequenzen.

};

func void DIA_Serpentes_MinenAnteile_nein ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_nein_15_00"); //Ich habe schon genug zu tun. Such dir jemand anderen.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_nein_10_01"); //(erbost) Das ist ja ungeheuerlich. So wirst du nie die höheren Kreise der Magie erreichen, wenn du nicht gewillt bist, der Gemeinschaft einen Dienst zu erweisen.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_nein_10_02"); //Ich erteile dir hiermit einen Verweis. Ich hoffe, das wird sich nicht wiederholen, sonst wird das noch böse enden mit dir.
	AI_StopProcessInfos (self);
};

func void DIA_Serpentes_MinenAnteile_was ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_15_00"); //Worum geht's?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_01"); //Es gibt jemanden in der Stadt, der gefälschte Anteile für die Erzminen der ehemaligen Sträflingskolonie verkauft.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_02"); //Diese Papiere sind völlig wertlos und haben auch keine Relevanz, doch schüren sie unter den Leuten ein gewisses Streitpotential, das wir uns jetzt nicht leisten können.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_03"); //Der Betrüger soll an alle namhaften Händler in der Stadt und auf dem Land herangetreten sein und bei einigen scheint er seine gefälschten Minenanteile sogar verkauft zu haben.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_04"); //Finde diesen Übeltäter und bringe ihn vor dieses Podium. In solchen schweren Zeiten dürfen wir keine Betrüger und Plünderer dulden.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_10_05"); //Wir werden an ihm ein Exempel statuieren müssen, um den restlichen Pöbel abzuschrecken.
	
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Ich werde versuchen, die Sache zu klären.", DIA_Serpentes_MinenAnteile_was_ja );

};
func void DIA_Serpentes_MinenAnteile_was_ja ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_00"); //Ich werde versuchen, die Sache zu klären.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_01"); //Vielleicht noch eine Anmerkung. Wenn du die Händler des Landes aufsuchst, dann lass sie nicht merken, dass du nach den Minenanteilen suchst.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_02"); //Ich denke, sie werden sie weiter verkaufen wollen und würden sie dir sicherlich nicht mehr anbieten, wenn sie merken, dass du im Auftrag der Kirche mit ihnen handelst, verstehst du?
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_03"); //Ja.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_04"); //Dann mach dich an die Arbeit. Ich wüsche dir viel Erfolg, Bruder.
	Info_ClearChoices	(DIA_Serpentes_MinenAnteile);
	
	MIS_Serpentes_MinenAnteil_KDF = LOG_RUNNING;	

	 if ((Npc_IsDead(Salandril))== FALSE)
	 {
		 CreateInvItems (Salandril, 	ItWr_MinenAnteil_Mis, 2); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	 };
	 if ((Npc_IsDead(VLK_416_Matteo))== FALSE)
	 {
		 CreateInvItems (VLK_416_Matteo, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_413_Bosper))== FALSE)
	 {
		 CreateInvItems (VLK_413_Bosper, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_409_Zuris))== FALSE)
	 {
		 CreateInvItems (VLK_409_Zuris, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(BAU_911_Elena))== FALSE)
	 {
		 CreateInvItems (BAU_911_Elena, 	ItWr_MinenAnteil_Mis, 2); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	 };
	 if ((Npc_IsDead(BAU_970_Orlan))== FALSE)
	 {
		 CreateInvItems (BAU_970_Orlan, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_407_Hakon))== FALSE)
	 {
		 CreateInvItems (VLK_407_Hakon, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(BAU_936_Rosi))== FALSE)
	 {
		 CreateInvItems (BAU_936_Rosi, 	ItWr_MinenAnteil_Mis, 1); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	 };
	 if ((Npc_IsDead(VLK_468_Canthar))== FALSE)
	 {
		 CreateInvItems (VLK_468_Canthar, 	ItWr_MinenAnteil_Mis, 3); 
		 SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 3;
	 };
	SalandrilVerteilteMinenAnteil =	SalandrilMinenAnteil_MAINCounter;

	Log_CreateTopic (TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry (TOPIC_MinenAnteile,"Irgendjemand verkauft illegale Erzineneanteile und bereichert sich daran. Ich muß herausfinden, wer sie an die Händler dieser Gegend verkauft hat. Serpentes will diese falschen Papiere alle haben."); 
};

func void DIA_Serpentes_MinenAnteile_KillSLD ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_Kill_15_00"); //Wen soll ich töten?
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_01"); //Um Innos willen. Natürlich niemanden. Die Sache verlangt schon ein wenig mehr Feingefühl, du grober Klotz.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_02"); //Salandril, der Alchemist des oberen Viertels der Stadt, hat sich eines schweren Verbrechens schuldig gemacht und muss dafür bestraft werden.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_03"); //Doch er weigert sich, ins Kloster zu kommen, um sich verurteilen zu lassen. Bringe ihn hierher.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_04"); //Wie du das anstellst, ist uns gleich. Du sollst natürlich auch dafür belohnt werden.
	
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Ist das nicht die Angelegenheit der Miliz?", DIA_Serpentes_MinenAnteile_miliz );
	Info_AddChoice	(DIA_Serpentes_MinenAnteile, "Kein Problem. Ich kümmere mich darum.", DIA_Serpentes_MinenAnteile_was_jaSLD );
};

var int MIS_Serpentes_BringSalandril_SLD;
func void DIA_Serpentes_MinenAnteile_was_jaSLD ()
{
	AI_Output			(other, self, "DIA_Serpentes_MinenAnteile_was_jaSLD_15_00"); //Kein Problem. Ich kümmere mich darum.
	AI_Output			(self, other, "DIA_Serpentes_MinenAnteile_was_jaSLD_10_01"); //Gut. Wir erwarten von dir in ein paar Tagen zu hören.
	MIS_Serpentes_BringSalandril_SLD = LOG_RUNNING;
	Info_ClearChoices	(DIA_Serpentes_MinenAnteile);

	Log_CreateTopic (TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry (TOPIC_MinenAnteile,"Ich soll Salandril, einen Alchemisten im oberen Viertel von Khorinis, ins Kloster bringen, damit er dort verurteilt werden kann. Was er angestellt hat, kann mir im Grunde auch egal sein. Hauptsache ich werde für diesen Auftrag bezahlt."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteileBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteileBringen		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	2;
	condition	 = 	DIA_Serpentes_MinenAnteileBringen_Condition;
	information	 = 	DIA_Serpentes_MinenAnteileBringen_Info;
	permanent	 = 	TRUE;

	description	 = 	"Wegen der gefälschten Erzminenanteile...";
};

func int DIA_Serpentes_MinenAnteileBringen_Condition ()
{
	if (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_MinenAnteil_Mis))
	&& (hero.guild == GIL_KDF) 
		{
				return TRUE;
		};
};

var int SerpentesMinenAnteilCounter;
func void DIA_Serpentes_MinenAnteileBringen_Info ()
{
		var int SerpentesMinenAnteilCount;
		var int XP_BringSerpentesMinenAnteils;
		var int SerpentesMinenAnteilOffer;
		var int SerpentesMinenAnteilGeld;
	
		SerpentesMinenAnteilCount = Npc_HasItems(other, ItWr_MinenAnteil_Mis);
		SerpentesMinenAnteilOffer = 200; 

		 if (SerpentesMinenAnteilCount == 1)
			{
				AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_00"); //Ich habe einen Minenanteil ausmachen können.
				B_GivePlayerXP (XP_BringSerpentesMinenAnteil);
				B_GiveInvItems (other, self, ItWr_MinenAnteil_Mis,1);
				SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + 1;
			}
			else
			{
				AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_01"); //Ich habe einige Minenanteile ausmachen können.
	
				B_GiveInvItems (other, self, ItWr_MinenAnteil_Mis,  SerpentesMinenAnteilCount);
	
				XP_BringSerpentesMinenAnteils = (SerpentesMinenAnteilCount * XP_BringSerpentesMinenAnteil);
				SerpentesMinenAnteilCounter = (SerpentesMinenAnteilCounter + SerpentesMinenAnteilCount); 
	
				B_GivePlayerXP (XP_BringSerpentesMinenAnteils);
			};

		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter - SerpentesMinenAnteilCount;
		
		var string MinenAnteilText;
		var string MinenAnteilLeft;
		MinenAnteilLeft = IntToString (SalandrilMinenAnteil_MAINCounter);
		MinenAnteilText = ConcatStrings(MinenAnteilLeft, PRINT_NumberLeft);
		AI_PrintScreen	(MinenAnteilText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);

		if (SerpentesMinenAnteilCounter < SalandrilVerteilteMinenAnteil)
		{
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_02"); //Sehr gut. Du musst sie alle aus dem Verkehr ziehen. Das ist Gift für das Volk. Bring sie mir alle her.
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_03"); //Hier. Ich gebe dir die Mittel dazu.
		}
		else if (SerpentesMinenAnteilCounter == SalandrilVerteilteMinenAnteil) //Joly:kein Exploid
		{
			AI_Output		(other, self, "DIA_Serpentes_MinenAnteileBringen_15_04"); //Ich schätze, das waren alle.
			AI_Output		(self, other, "DIA_Serpentes_MinenAnteileBringen_10_05"); //Gut gemacht. Du hast dir eine Belohnung verdient.
			AI_Output		(self, other, "DIA_Serpentes_MinenAnteileBringen_10_06"); //Nimm dieses Schutzamulett. Es wird dir weiterhelfen auf den Wegen, die du noch beschreiten wirst.
			CreateInvItems (self, ItAm_Prot_Mage_01, 1); 
			B_GiveInvItems (self, other, ItAm_Prot_Mage_01, 1);
		}
		else	//Joly: zur Sicherheit!
		{
			AI_Output			(self, other, "DIA_Serpentes_MinenAnteileBringen_10_07"); //Das ist jetzt doch aber wirklich das letzte, oder?
		};
		
		SerpentesMinenAnteilGeld	= (SerpentesMinenAnteilCount * SerpentesMinenAnteilOffer);
		
		CreateInvItems (self, ItMi_Gold, SerpentesMinenAnteilGeld); 
		B_GiveInvItems (self, other, ItMi_Gold, SerpentesMinenAnteilGeld);
};

///////////////////////////////////////////////////////////////////////
//	Info GotSalandril
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOTSalandril		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	32;
	condition	 = 	DIA_Serpentes_GOTSalandril_Condition;
	information	 = 	DIA_Serpentes_GOTSalandril_Info;

	description	 = 	"Ich weiß, wer die Minenanteile in Umlauf gebracht hat.";
};

func int DIA_Serpentes_GOTSalandril_Condition ()
{
	if (SC_KnowsProspektorSalandril == TRUE)
	&& (hero.guild == GIL_KDF) 
		{
				return TRUE;
		};
};

func void DIA_Serpentes_GOTSalandril_Info ()
{
	AI_Output			(other, self, "DIA_Serpentes_GOTSalandril_15_00"); //Ich weiß, wer die Minenanteile in Umlauf gebracht hat. Es war Salandril, der Alchemist im oberen Viertel der Stadt.
	AI_Output			(self, other, "DIA_Serpentes_GOTSalandril_10_01"); //Dann bringe ihn hierher. Wir haben mit ihm zu reden.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilHere
///////////////////////////////////////////////////////////////////////

instance DIA_Serpentes_SalandrilHERE		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	33;
	condition	 = 	DIA_Serpentes_SalandrilHERE_Condition;
	information	 = 	DIA_Serpentes_SalandrilHERE_Info;

	description	 = 	"Salandril ist hier im Kloster.";
};

func int DIA_Serpentes_SalandrilHERE_Condition ()
{
	if (Npc_GetDistToWP(Salandril,"ALTAR")<10000) 
		{
			if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
				{
					return TRUE;
				}
			else if (Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
			&& (hero.guild == GIL_KDF) 
				{
					return TRUE;
				}
			else
				{
					return FALSE;
				};
		};
};

func void DIA_Serpentes_SalandrilHERE_Info ()
{
	AI_Output		(other, self, "DIA_Serpentes_SalandrilHERE_15_00"); //Salandril ist hier im Kloster.
	AI_Output		(self, other, "DIA_Serpentes_SalandrilHERE_10_01"); //Gut gemacht. Wir werden uns später mit ihm befassen.

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output		(self, other, "DIA_Serpentes_SalandrilHERE_10_02"); //Hier hast du deine Belohnung. Und jetzt kein Wort mehr darüber, verstanden?
		CreateInvItems (self, ItMi_Gold, 400);									
		B_GiveInvItems (self, other, ItMi_Gold, 400);					
	};
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP 	(XP_SalandrilInKloster);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilDEAD
///////////////////////////////////////////////////////////////////////

instance DIA_Serpentes_SalandrilDEAD		(C_INFO)
{
	npc		 = 	KDF_501_Serpentes;
	nr		 = 	33;
	condition	 = 	DIA_Serpentes_SalandrilDEAD_Condition;
	information	 = 	DIA_Serpentes_SalandrilDEAD_Info;

	description	 = 	"Salandril ist tot.";
};

func int DIA_Serpentes_SalandrilDEAD_Condition ()
{
	if  (
			(Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
			||  (
					((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
					&& (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING)
				)
		)
		&& (Npc_IsDead(Salandril))
		{
				return TRUE;
		};
};

func void DIA_Serpentes_SalandrilDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Serpentes_SalandrilDEAD_15_00"); //Salandril ist tot.
	AI_Output			(self, other, "DIA_Serpentes_SalandrilDEAD_10_01"); //Nun, dann ist seine Tat nicht ungesühnt geblieben. Innos sei seiner armen Seele gnädig.
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP 	(XP_Ambient);
};
	
//##################################################################
//##
//##	Kapitel 4
//##
//##################################################################

///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT 
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Serpentes_Kap4_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap4_EXIT_Condition;
	information = DIA_Serpentes_Kap4_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap4_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//##################################################################
//##
//##	Kapitel 5
//##
//##################################################################


///////////////////////////////////////////////////////////////////////
//	Info Kap5 EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Serpentes_Kap5_EXIT   (C_INFO)
{
	npc         = KDF_501_Serpentes;
	nr          = 999;
	condition   = DIA_Serpentes_Kap5_EXIT_Condition;
	information = DIA_Serpentes_Kap5_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Serpentes_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Serpentes_Kap5_EXIT_Info()
{
	AI_StopProcessInfos (self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Serpentes_PICKPOCKET (C_INFO)
{
	npc			= KDF_501_Serpentes;
	nr			= 900;
	condition	= DIA_Serpentes_PICKPOCKET_Condition;
	information	= DIA_Serpentes_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Serpentes_PICKPOCKET_Condition()
{
	C_Beklauen (86, 380);
};
 
FUNC VOID DIA_Serpentes_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Serpentes_PICKPOCKET);
	Info_AddChoice		(DIA_Serpentes_PICKPOCKET, DIALOG_BACK 		,DIA_Serpentes_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Serpentes_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Serpentes_PICKPOCKET_DoIt);
};

func void DIA_Serpentes_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Serpentes_PICKPOCKET);
};
	
func void DIA_Serpentes_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Serpentes_PICKPOCKET);
};





















