// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Onar_EXIT   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 999;
	condition   = DIA_Onar_EXIT_Condition;
	information = DIA_Onar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Onar_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				Hallo 
// ************************************************************
INSTANCE DIA_Onar_Hallo (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_Hallo_Condition;
	information = DIA_Onar_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Onar_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_Hallo_Info()
{
	AI_Output (self, other, "DIA_Onar_Hallo_14_00"); //Wer hat dich denn hier reingelassen?!
	AI_Output (self, other, "DIA_Onar_Hallo_14_01"); //Was machst du hier auf meinen Hof?!
};

// ************************************************************
// 			  				PERM 
// ************************************************************
INSTANCE DIA_Onar_PERM (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 1;
	condition   = DIA_Onar_PERM_Condition;
	information = DIA_Onar_PERM_Info;
	permanent   = TRUE;
	description = "Alles klar hier auf dem Hof?";
};
FUNC INT DIA_Onar_PERM_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_PERM_Info()
{
	AI_Output (other, self, "DIA_Onar_PERM_15_00"); //Alles klar hier auf dem Hof?
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_01"); //Ich wüsste nicht, was dich das angeht! Du gehörst nicht zum Hof!
	};
	
	if (other.guild == GIL_SLD)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_02"); //Das will ich hoffen! Dafür bezahle ich dich schließlich!
		AI_Output (self, other, "DIA_Onar_PERM_14_03"); //Geh lieber zu Torlof und frag ihn, ob es was zu tun gibt!
	};
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_04"); //Ja sicher. Geh du nur und jag deine Drachen.
	};
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_05"); //Ihr scheinheiligen Bastarde aus dem Kloster seid hier nicht willkommen!
	};
	
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Onar_PERM_14_06"); //Für die Truppen des Königs gibt es hier keine Gastfreundschaft.
	};
};

// ************************************************************
// 			  				Work 
// ************************************************************
INSTANCE DIA_Onar_Work (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_Work_Condition;
	information = DIA_Onar_Work_Info;
	permanent   = FALSE;
	description = "Ich will für dich arbeiten!";
};
FUNC INT DIA_Onar_Work_Condition()
{
	if (Lee_SendToOnar == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_Work_Info()
{
	AI_Output (other, self, "DIA_Onar_Work_15_00"); //Ich will für dich arbeiten!
	AI_Output (self, other, "DIA_Onar_Work_14_01"); //Ich brauche zurzeit keine Knechte.
	AI_Output (self, other, "DIA_Onar_Work_14_02"); //Und um alles andere kümmern sich meine Leute.
	AI_Output (self, other, "DIA_Onar_Work_14_03"); //Hier im Haus hast du nichts zu suchen, also mach, dass du rauskommst!
};


// ************************************************************
// 			  				WorkAsSld
// ************************************************************
INSTANCE DIA_Onar_WorkAsSld (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 2;
	condition   = DIA_Onar_WorkAsSld_Condition;
	information = DIA_Onar_WorkAsSld_Info;
	permanent   = FALSE;
	description = "Ich will hier als Söldner arbeiten!";
};
FUNC INT DIA_Onar_WorkAsSld_Condition()
{
	if (Lee_SendToOnar == FALSE)
	&& (Onar_WegenSldWerden == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Onar_Work))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WorkAsSld_Info()
{
	AI_Output (other, self, "DIA_Onar_WorkAsSld_15_00"); //Ich will hier als Söldner arbeiten!
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_01"); //Du? Als Söldner? Dass ich nicht lache! Wenn du als Söldner was taugen würdest, hätte Lee mir schon was von dir erzählt.
	AI_Output (self, other, "DIA_Onar_WorkAsSld_14_02"); //Jetzt mach endlich, dass du hier rauskommst.
	Onar_WegenSldWerden = TRUE;
};

// ************************************************************
// 			  				Aufstand
// ************************************************************
INSTANCE DIA_Onar_Aufstand (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 3;
	condition   = DIA_Onar_Aufstand_Condition;
	information = DIA_Onar_Aufstand_Info;
	permanent   = FALSE;
	description = "Ich hab gehört, du lehnst dich gegen die Stadt auf?";
};
FUNC INT DIA_Onar_Aufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Onar_Aufstand_Info()
{
	AI_Output (other, self, "DIA_Onar_Aufstand_15_00"); //Ich hab gehört, du lehnst dich gegen die Stadt auf?
	AI_Output (self, other, "DIA_Onar_Aufstand_14_01"); //Jetzt hör mal gut zu! Ich habe diesen Hof und das Land von meinem Vater geerbt.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_02"); //Und der hat ihn von SEINEM Vater geerbt.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_03"); //Ich werde nicht zulassen, dass dieser gierige Schwachkopf von König sich das alles unter den Nagel reißt, nur um seine nutzlosen Armeen durchzufüttern.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_04"); //Der Krieg mit den Orks dauert jetzt schon ewig. Und wo stehen wir? Am Rande einer Niederlage.
	AI_Output (self, other, "DIA_Onar_Aufstand_14_05"); //Nein - da verteidige ich meinen Hof lieber selbst! Für das Geld, was ich spare, kann ich mir meine eigene Armee leisten.
};

// ************************************************************
// 			  				WegenPepe
// ************************************************************
INSTANCE DIA_Onar_WegenPepe (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 4;
	condition   = DIA_Onar_WegenPepe_Condition;
	information = DIA_Onar_WegenPepe_Info;
	permanent   = FALSE;
	description = "Wegen Bullco hast du jetzt ein paar Schafe weniger.";
};
FUNC INT DIA_Onar_WegenPepe_Condition()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenPepe_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_00"); //Wegen Bullco hast du jetzt ein paar Schafe weniger.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_01"); //Was erzählst du da? Wer ist Bullco?
	AI_Output (other, self, "DIA_Onar_WegenPepe_15_02"); //Einer der Söldner.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_03"); //Was interessiert mich das? Wenn er sich an meinen Schafen vergriffen hat, wird er sich vor Lee verantworten müssen.
	AI_Output (self, other, "DIA_Onar_WegenPepe_14_04"); //Was belästigst du mich überhaupt mit solchen Kleinigkeiten?
	Onar_WegenPepe = TRUE;
};

// ************************************************************
// 			  				WegenSekob
// ************************************************************
INSTANCE DIA_Onar_WegenSekob (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 5;
	condition   = DIA_Onar_WegenSekob_Condition;
	information = DIA_Onar_WegenSekob_Info;
	permanent   = FALSE;
	description = "Ich komme wegen Sekobs Pacht...";
};
FUNC INT DIA_Onar_WegenSekob_Condition()
{
	if (MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Onar_WegenSekob_Info()
{
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_00"); //Ich komme wegen Sekobs Pacht...

	if (other.guild == GIL_SLD) || (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_01"); //Was zum Teufel willst du bei mir? Bring das Geld zu Torlof.
	
	}
	else //GIL_NONE
	{
		AI_Output (self, other, "DIA_Onar_WegenSekob_14_02"); //Was zum Teufel hast DU damit zu schaffen?
		AI_Output (other, self, "DIA_Onar_WegenSekob_15_03"); //Ich will Söldner werden. Die Pacht einzutreiben ist meine Probe.
		Onar_WegenSldWerden = TRUE;
	};
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_04"); //Aber Sekob hat kein Geld. Ich habe ihn sogar zusammengeschlagen.
	AI_Output (other, self, "DIA_Onar_WegenSekob_15_05"); //Er sagt, es wäre wegen der schlechten Ernte ...
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_06"); //(poltert) Du Dummkopf! Denkst du, er trägt das Geld mit sich rum? Er hat es irgendwo versteckt!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_07"); //Weißt du, wie viel es hier regnet? Schlechte Ernte, dass ich nicht lache!
	AI_Output (self, other, "DIA_Onar_WegenSekob_14_08"); //Sieh zu, dass du das Geld aus ihm rausprügelst!
	Onar_WegenSekob = TRUE;
};


// ************************************************************
// 			  			Lee schickt mich 
// ************************************************************
INSTANCE DIA_Onar_LeeSentMe   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 6;
	condition   = DIA_Onar_LeeSentMe_Condition;
	information = DIA_Onar_LeeSentMe_Info;
	permanent   = FALSE;
	description = "Lee schickt mich. Ich will hier als Söldner arbeiten!";
};
FUNC INT DIA_Onar_LeeSentMe_Condition()
{
	if (Lee_SendToOnar == TRUE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_LeeSentMe_Info()
{
	AI_Output (other, self, "DIA_Onar_LeeSentMe_15_00"); //Lee schickt mich. Ich will hier als Söldner arbeiten!
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_01"); //Er hat schon mit mir geredet.
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_02"); //Ich hab schon nicht viel von dir gehalten, als du mich zum ersten Mal gefragt hast
		AI_Output (self, other, "DIA_Onar_LeeSentMe_14_03"); //Aber wenn Lee meint, dass du was taugst, wirst du deine Chance bekommen.
	};
	
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_04"); //Er ist derjenige, der für dich die Verantwortung trägt. Also meinetwegen.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_05"); //Aber mach keine Dummheiten hier! Lass die Bauern und die Mägde in Ruhe und vor allem klau hier nichts, klar?
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_06"); //Alles weitere kannst du mit Lee abklären.
	AI_Output (self, other, "DIA_Onar_LeeSentMe_14_07"); //WIR müssen uns nur noch über deinen Sold unterhalten ...

	Onar_Approved = TRUE;
	B_LogEntry (TOPIC_BecomeSLD,"Onar hat mir sein Einverständnis gegeben. Jetzt steht meiner Aufnahme bei den Söldnern nichts mehr im Weg.");
};



// ************************************************************
// 			  			Sold verhandeln
// ************************************************************
var int Onar_SOLD_Day;
var int Onar_SOLD_XP;
// -------------------

INSTANCE DIA_Onar_HowMuch   (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 7;
	condition   = DIA_Onar_HowMuch_Condition;
	information = DIA_Onar_HowMuch_Info;
	permanent   = FALSE;
	description = "Wie sieht's mit meinem Sold aus?";
};
FUNC INT DIA_Onar_HowMuch_Condition()
{
	if (Onar_Approved == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_HowMuch_Info()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_15_00"); //Wie sieht's mit meinem Sold aus?
	AI_Output (self, other, "DIA_Onar_HowMuch_14_01"); //Nun ja ...
	
	SOLD = 50;
	
	if (Onar_WegenSldWerden == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_02"); //Ich halte nicht besonders viel von dir.
	};
	
	if (Onar_WegenSekob == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_03"); //Besonders schlau bist du nicht. Das hat die Sache mit Sekob gezeigt.
		SOLD = SOLD - 10;
	};
	
	if (ABSOLUTIONLEVEL_Farm > 1)
	|| ( (B_GetGreatestPetzCrime (self) > CRIME_NONE) && (ABSOLUTIONLEVEL_Farm > 0) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_04"); //Du hast hier auf dem Hof schon mehrmals Ärger gemacht.
		SOLD = SOLD - 10;
	};
	
	if (Onar_WegenPepe == TRUE)
	&& ( (Onar_WegenSekob == TRUE) || (Onar_WegenSldWerden == TRUE) )
	{
		AI_Output (self, other, "DIA_Onar_HowMuch_14_05"); //Und du belästigst mich ständig mit irgendwelchem Mist.
		SOLD = SOLD - 10;
	};
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_06"); //Lass mich nachdenken ...
	B_Say_Gold (self, other, SOLD);
	
	
	Onar_SOLD_Day = Wld_GetDay();
	Onar_SOLD_XP = other.exp;
	
	AI_Output (self, other, "DIA_Onar_HowMuch_14_07"); //Was sagst du?
	
	Info_ClearChoices (DIA_Onar_HowMuch);
	Info_AddChoice (DIA_Onar_HowMuch, "Klingt in Ordnung!", DIA_Onar_HowMuch_Ok);
	Info_AddChoice (DIA_Onar_HowMuch, "Das ist etwas wenig...", DIA_Onar_HowMuch_More);
	Info_AddChoice (DIA_Onar_HowMuch, "Pro Tag? ", DIA_Onar_HowMuch_PerDay);
};

func void DIA_Onar_HowMuch_PerDay()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_PerDay_15_00"); //Pro Tag?
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_01"); //Was dachtest du denn? Pro Woche? Der schlaueste bist du wirklich nicht.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_02"); //Sieh zu, dass du deinen Hintern hierhin bewegst, um dir dein Geld abzuholen.
	AI_Output (self, other, "DIA_Onar_HowMuch_PerDay_14_03"); //Ich werd's dir nicht hinterher tragen.
};

func void DIA_Onar_HowMuch_More()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_More_15_00"); //Das ist etwas wenig ...
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_01"); //Du kannst natürlich auch umsonst für mich arbeiten.
	AI_Output (self, other, "DIA_Onar_HowMuch_More_14_02"); //Mehr bekommst du jedenfalls nicht!
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bei Onar kann ich mir täglich meinen Sold abholen.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
func void DIA_Onar_HowMuch_Ok()
{
	AI_Output (other, self, "DIA_Onar_HowMuch_Ok_15_00"); //Klingt in Ordnung!
	AI_Output (self, other, "DIA_Onar_HowMuch_Ok_14_01"); //Das denke ich auch! Jetzt geh zu Lee!
	
	Log_CreateTopic (Topic_Bonus, LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bei Onar kann ich mir täglich meinen Sold abholen.");
	
	Info_ClearChoices (DIA_Onar_HowMuch);
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_CollectGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 8;
	condition   = DIA_Onar_CollectGold_Condition;
	information = DIA_Onar_CollectGold_Info;
	permanent   = TRUE;
	description = "Zahl mir meinen Sold aus!";
};
FUNC INT DIA_Onar_CollectGold_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_CollectGold_Info()
{
	AI_Output (other, self, "DIA_Onar_CollectGold_15_00"); //Zahl mir meinen Sold aus!
	
	if (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_01"); //Ich bezahle Söldner, keine Drachenjäger.
	}
	else if (Torlof_TheOtherMission_TooLate == TRUE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_02"); //Du kümmerst dich nicht um das, was dir aufgetragen wurde!
		AI_Output (self, other, "DIA_Onar_CollectGold_14_03"); //Ich hab Torlof gefragt, wie du dich machst. Und er sagte, du brauchst ewig für deinen Auftrag.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_04"); //Für Faulpelze geb ich kein Geld aus.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_05"); //Du wirst erstmal ein paar Wochen auf deinen Sold verzichten! Dann lernst du vielleicht was daraus.
	}
	else if (B_GetGreatestPetzCrime(self) > CRIME_NONE)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_06"); //Ich hab gehört, du hast Mist gebaut! Geh erst zu Lee und klär die Sache!
	}
	else if (Wld_GetDay() <= Onar_SOLD_Day)
	{
		AI_Output (self, other, "DIA_Onar_CollectGold_14_07"); //Bist du verrückt?
		AI_Output (self, other, "DIA_Onar_CollectGold_14_08"); //Arbeite erstmal einen Tag für mich. Morgen bekommst du dann deinen nächsten Sold.
	}
	else if (Wld_GetDay() - 2 >= Onar_SOLD_Day)
	{
		if (Wld_GetDay() - 2 == Onar_SOLD_Day)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_09"); //Wo warst du gestern?
		}
		else
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_10"); //Wo warst du die letzten Tage?
		};
	
		AI_Output (self, other, "DIA_Onar_CollectGold_14_11"); //Du hast dich nicht bei mir blicken lassen.
		AI_Output (self, other, "DIA_Onar_CollectGold_14_12"); //Du könntest dich wer weiß wo rumgetrieben haben.
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	}
	else //genau 1 Tag später...
	{
		if (other.exp > Onar_SOLD_XP + 200)
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_13"); //(zerknirscht) Na gut. Hier ist dein Sold.
			
			//patch m.F. 
			B_GiveInvItems (self, other, itmi_gold, SOLD);
			B_Say_Gold (self, other, SOLD);
		}
		else //nur gepennt
		{
			AI_Output (self, other, "DIA_Onar_CollectGold_14_14"); //Was? Du hast doch den ganzen Tag nur rumgehangen oder gepennt!
			AI_Output (self, other, "DIA_Onar_CollectGold_14_15"); //Dafür bezahle ich dich nicht!
		};
		
		Onar_SOLD_Day = Wld_GetDay();
		Onar_SOLD_XP = other.exp;
	};
};
	
// ************************************************************
// 			  				Sold abholen
// ************************************************************

INSTANCE DIA_Onar_MariaGold (C_INFO)
{
	npc         = BAU_900_Onar;
	nr          = 9;
	condition   = DIA_Onar_MariaGold_Condition;
	information = DIA_Onar_MariaGold_Info;
	permanent   = FALSE;
	description = "Maria hat gesagt, ich verdiene zu wenig.";
};
FUNC INT DIA_Onar_MariaGold_Condition()
{
	if (Maria_MehrGold == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Onar_MariaGold_Info()
{
	AI_Output (other, self, "DIA_Onar_MariaGold_15_00"); //Maria hat gesagt, ich verdiene zu wenig.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_01"); //Was?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_02"); //Sie meinte, du solltest mich besser bezahlen.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_03"); //(meckert) Die Frau muss sich auch überall einmischen.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_04"); //Hat sie gesagt, wie viel?
	AI_Output (other, self, "DIA_Onar_MariaGold_15_05"); //Nein.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_06"); //Gut, mit dem nächsten Sold wirst du 10 Goldstücke mehr bekommen als bisher.
	AI_Output (self, other, "DIA_Onar_MariaGold_14_07"); //Aber kein Goldstück mehr, klar?
	
	SOLD = SOLD + 10;
};	


// ************************************************************
// 			  				WannaSheep
// ************************************************************
var int Onar_SellSheep;
// --------------------

instance DIA_Onar_WannaSheep	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_WannaSheep_Condition;
	information	 = 	DIA_Onar_WannaSheep_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich will ein Schaf kaufen!";
};
func int DIA_Onar_WannaSheep_Condition ()
{	
	if (Onar_SellSheep == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Onar_WannaSheep_Info ()
{
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_00"); //Ich will ein Schaf kaufen!
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_01"); //Was willst dann hier? Siehst du hier irgendwelche Schafe?!
	AI_Output (other, self, "DIA_Onar_WannaSheep_15_02"); //Ich ...
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_03"); //Wenn du ein Schaf kaufen willst, dann geh auf die Weide. Sie ist rechts neben meinem Haus.
	AI_Output (self, other, "DIA_Onar_WannaSheep_14_04"); //Pepe soll dir eins verkaufen.
	
	if (Npc_IsDead (Pepe))
	{
		AI_Output (other, self, "DIA_Onar_WannaSheep_15_05"); //Pepe ist tot, fürchte ich.
		AI_Output (self, other, "DIA_Onar_WannaSheep_14_06"); //Oh! Na dann ... Lass mir 200 Goldstücke hier und du kannst dir ein Schaf von der Weide holen.
		
		Onar_SellSheep = TRUE;
	};
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
instance DIA_Onar_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_900_Onar;
	nr			 = 	10;
	condition	 = 	DIA_Onar_BuyLiesel_Condition;
	information	 = 	DIA_Onar_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Hier sind 200 Goldstücke. Gib mir ein Schaf.";
};
func int DIA_Onar_BuyLiesel_Condition ()
{	
	if (Onar_SellSheep == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Onar_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Onar_BuyLiesel_15_00"); //Hier sind 200 Goldstücke. Gib mir ein Schaf.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_01"); //Du kannst dir eins von der Weide holen.
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_02"); //Irgendein Schaf wird dir schon folgen. Die meisten hören auf den Namen Liesel.
		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Onar_BuyLiesel_14_03"); //Du hast ja nicht mal so viel Gold. Verschwende nicht meine kostbare Zeit!
	};
};
