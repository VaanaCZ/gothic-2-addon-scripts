///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Parcival_EXIT   (C_INFO)
{
	npc         = PAL_252_Parcival;
	nr          = 999;
	condition   = DIA_Parcival_EXIT_Condition;
	information = DIA_Parcival_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Parcival_EXIT_Condition()
{
	if (Kapitel < 3)
	{
			return TRUE;
	};
};

FUNC VOID DIA_Parcival_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Schürfer
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Schurfer		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  2;
	condition	 = 	DIA_Parcival_Schurfer_Condition;
	information	 = 	DIA_Parcival_Schurfer_Info;
	permanent 	 =  FALSE;
	description	 =	"Was kannst du mir über die Schürfer erzählen?";
};
func int DIA_Parcival_Schurfer_Condition ()	
{	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Schurfer_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Schurfer_15_00"); //Was kannst du mir über die Schürfer erzählen?
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_01"); //Ich habe die drei Gruppen zusammengestellt.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_02"); //Marcos, Fajeth und Silvestro sind die Paladine, die jeweils eine Gruppe anführen.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_03"); //Die Gruppe von Marcos ist in Richtung einer alten Mine aufgebrochen - ein alter Buddler namens Grimes hat sie dorthin geführt.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_04"); //Die anderen beiden Gruppen sind zusammen losgezogen.
	AI_Output (self, other, "DIA_Parcival_Schurfer_13_05"); //Jergan, einer unserer Späher hat berichtet, dass sie ihre Lager in der Nähe eines großen Turms aufgeschlagen haben.
	
	B_LogEntry (TOPIC_ScoutMine,"Die Schürfgruppen werden von jeweils einem Paladin angeführt. Marcos, Fajeth und Sivestro.");
	B_LogEntry (TOPIC_ScoutMine,"Die Gruppe von Marcos ist in Richtung der ehemaligen alten Mine aufgebrochen. Unter der ortskundigen Führung des Buddlers Grimes."); 
	B_LogEntry (TOPIC_ScoutMine,"Die beiden anderen Gruppen sind zusammen losgezogen. Sie haben ihre Lager in der Nähe eines großen Turms errichtet."); 
	
};
///////////////////////////////////////////////////////////////////////
//	Info Schürfer
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Diego		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  9;
	condition	 = 	DIA_Parcival_Diego_Condition;
	information	 = 	DIA_Parcival_Diego_Info;
	permanent 	 =  FALSE;
	description	 =	"Bei welcher Schürfergruppe ist Diego?";
};
func int DIA_Parcival_Diego_Condition ()	
{	
	if (SearchForDiego == LOG_RUNNING)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Diego_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Diego_15_00"); //Bei welcher Schürfergruppe ist Diego?
	AI_Output (self, other, "DIA_Parcival_Diego_13_01"); //Dieser Sträfling - Diego? Er ist bei der Gruppe von Paladin Silvestro.
	
	B_LogEntry (TOPIC_ScoutMine,"Diego ist bei den Schürfern unter dem Kommando von Paladin Silvestro."); 
};
///////////////////////////////////////////////////////////////////////
//	Info Weg
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Weg		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  8;
	condition	 = 	DIA_Parcival_Weg_Condition;
	information	 = 	DIA_Parcival_Weg_Info;
	permanent 	 =  FALSE;
	description	 =	"Kennst du einen Weg zu den Schürfstellen?";
};
func int DIA_Parcival_Weg_Condition ()	
{	
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Parcival_Weg_Info ()
{
	AI_Output (other, self, "DIA_Parcival_Weg_15_00"); //Kennst du einen Weg zu den Schürfstellen?
	AI_Output (self, other, "DIA_Parcival_Weg_13_01"); //Es gibt keinen sicheren Weg in diesem Tal. Aber es erscheint mir sinnvoll, nicht den direkten Weg zu gehen.
	AI_Output (self, other, "DIA_Parcival_Weg_13_02"); //Halte dich von den Orks und den Wäldern fern - und möge Innos dich schützen.
	
	B_LogEntry (TOPIC_ScoutMine,"Es erscheint sinnvoll, nicht den direkten Weg zu den Schürfern zu nehmen. Vor allem Wälder und Orks sollte ich meiden."); 
};

///////////////////////////////////////////////////////////////////////
//	Info DRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_DRAGON		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr			 =  2;
	condition	 = 	DIA_Parcival_DRAGON_Condition;
	information	 = 	DIA_Parcival_DRAGON_Info;
	description	 =	"Wie ist die Lage?";
};
func int DIA_Parcival_DRAGON_Condition ()	
{
	return TRUE;
};
func void DIA_Parcival_DRAGON_Info ()
{
	AI_Output (other, self, "DIA_Parcival_DRAGON_15_00"); //Wie ist die Lage?
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_01"); //Das Lager ist von den Orks umzingelt. Die haben sich hier festgebissen.
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_02"); //Aber weitaus bedenklicher sind die Angriffe der Drachen, die mittlerweile den kompletten Außenring zerstört haben.
	AI_Output (self, other, "DIA_Parcival_DRAGON_13_03"); //Einen weiterer Drachenangriff wird uns schwere Verluste zufügen.
};
///////////////////////////////////////////////////////////////////////
//	Info DRAGONS
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_DRAGONS		(C_INFO)
{
	npc		 	 = 	PAL_252_Parcival;
	nr		 	 = 	2;
	condition	 = 	DIA_Parcival_DRAGONS_Condition;
	information	 = 	DIA_Parcival_DRAGONS_Info;
	description	 = 	"Wie viele Drachen sind es?";
};

func int DIA_Parcival_DRAGONS_Condition ()
{
	if Npc_KnowsInfo (hero,DIA_Parcival_DRAGON)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Parcival_DRAGONS_Info ()
{
	AI_Output (other, self, "DIA_Parcival_DRAGONS_15_00"); //Wie viele Drachen sind es?
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_01"); //Wir wissen nicht, wie viele insgesamt, aber es sind mehr als einer.
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_02"); //Aber das ist noch nicht alles. Das ganze Minental ist voller bösartiger Kreaturen, die die Drachen unterstützen.
	AI_Output (self, other, "DIA_Parcival_DRAGONS_13_03"); //Machen wir uns nichts vor, ohne Verstärkung von außerhalb stehen unsere Chancen schlecht, hier lebendig wieder raus zukommen.
	 
	AI_StopProcessInfos (self); 
};
///////////////////////////////////////////////////////////////////////
//	Info BRAVE
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_BRAVE		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	8;
	condition	 = 	DIA_Parcival_BRAVE_Condition;
	information	 = 	DIA_Parcival_BRAVE_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Parcival_BRAVE_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& Npc_KnowsInfo (hero,DIA_Parcival_DRAGONS)
	&& (Kapitel < 3)
	&& (Parcival_BRAVE_LaberCount <= 6)
	{
		return TRUE;
	};
};

var int Parcival_BRAVE_LaberCount;
func void DIA_Parcival_BRAVE_Info ()
{
	if (Parcival_BRAVE_LaberCount < 6)
	{
		var int randy;
		randy = Hlp_Random (3);
		
		if randy == 0
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_00"); //Noch ist alles ruhig. Aber das kann sich schnell ändern.
		};
		if randy == 1
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_01"); //Wir werden ausharren, solange wir können.
		};
		if randy == 2
		{
			AI_Output			(self, other, "DIA_Parcival_BRAVE_13_02"); //Innos wird uns beistehen. Sein Licht erhellt unsere Herzen!
		};
	
	}
	else 
	{
	AI_Output			(self, other, "DIA_Parcival_BRAVE_13_03"); //Hey! Hast du eigentlich nichts Besseres zu tun, als mich dauernd anzuquatschen? Verschwinde!
	B_GivePlayerXP (XP_Ambient);
	};
	
	Parcival_BRAVE_LaberCount = Parcival_BRAVE_LaberCount + 1;
};


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

INSTANCE DIA_Parcival_KAP3_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP3_EXIT_Condition;
	information	= DIA_Parcival_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info AllesKlar
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_ALLESKLAR		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	nr		 = 	31;
	condition	 = 	DIA_Parcival_ALLESKLAR_Condition;
	information	 = 	DIA_Parcival_ALLESKLAR_Info;
	permanent	 = 	TRUE;

	description	 = 	"Alles klar?";
};

func int DIA_Parcival_ALLESKLAR_Condition ()
{
	if (Kapitel == 3)
		&& 	(DIA_Parcival_ALLESKLAR_NervCounter < 3)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
		{
				return TRUE;
		};
};
var int DIA_Parcival_ALLESKLAR_NervCounter;
func void DIA_Parcival_ALLESKLAR_Info ()
{
	AI_Output			(other, self, "DIA_Parcival_ALLESKLAR_15_00"); //Alles klar?

	if (DIA_Parcival_ALLESKLAR_NervCounter == 0)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_01"); //Bis jetzt noch!
	}	
	else if (DIA_Parcival_ALLESKLAR_NervCounter == 1)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_02"); //Ja, verdammt.
	}	
	else if (Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_03"); //(Lacht) Ah. Jetzt verstehe ich, was du vor hast. Nee, mein Freund. Diesmal nicht.
	}
	else
	{
		AI_Output			(self, other, "DIA_Parcival_ALLESKLAR_13_04"); //Nerv mich nicht.
	};

	DIA_Parcival_ALLESKLAR_NervCounter = DIA_Parcival_ALLESKLAR_NervCounter + 1;
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

INSTANCE DIA_Parcival_KAP4_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP4_EXIT_Condition;
	information	= DIA_Parcival_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Ist irgendwas wichtiges passiert?
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_AnyNews		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_AnyNews_Condition;
	information	 = 	DIA_Parcival_AnyNews_Info;

	description  =	"Ist irgendwas wichtiges passiert?";		
};

func int DIA_Parcival_AnyNews_Condition ()
{	
	if (Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_AnyNews_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_AnyNews_15_00"); //Ist irgendwas Wichtiges passiert?
	if (hero.guild == GIL_DJG)
	{
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_01"); //Du gehörst auch zu diesem Abschaum, der sich selbst DRACHENJÄGER nennt?
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_02"); //Eigentlich hätte ich von dir erwartet, dass du mehr Ehre im Leib hast, als dich diesen Leuten anzuschließen.
	
	}
	else
	{
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_03"); //Ich mache mir Sorgen. Große Sorgen.
		AI_Output 	(other,self ,"DIA_Parcival_AnyNews_15_04"); //Weswegen?
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_05"); //Vor kurzem sind hier diese Männer aufgetaucht. Sie nennen sich selbst Drachenjäger.
		AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_06"); //Für mich sind das alles nur Tagediebe und Verbrecher.
	};
	AI_Output 	(self ,other,"DIA_Parcival_AnyNews_13_07"); //Wenn es nach mir ginge, würde ich sie allesamt aus der Burg jagen. Sollen sich die Orks um sie kümmern.

	Info_ClearChoices (DIA_Parcival_AnyNews);
	Info_AddChoice	(DIA_Parcival_AnyNews,"Im Gegensatz zu Lord Hagen sind sie hier.",DIA_Parcival_AnyNews_LordHagen); 
	Info_AddChoice	(DIA_Parcival_AnyNews,"Du solltest ihnen eine Chance geben.",DIA_Parcival_AnyNews_Chance);
	Info_AddChoice	(DIA_Parcival_AnyNews,"Findest du nicht, dass du übertreibst?",DIA_Parcival_AnyNews_Overact);
	
};

FUNC VOID DIA_Parcival_AnyNews_LordHagen ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_LordHagen_15_00"); //Im Gegensatz zu Lord Hagen sind sie hier.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_LordHagen_13_01"); //(lacht bitter) Ja leider, sie sind alles, was wir haben.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_LordHagen_13_02"); //Innos hat uns wirklich eine sehr schwere Prüfung auferlegt.
	
	Info_ClearChoices (DIA_Parcival_AnyNews);
};

FUNC VOID DIA_Parcival_AnyNews_Chance ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_Chance_15_00"); //Du solltest ihnen eine Chance geben.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_01"); //Die bekommen sie ja. Leider.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_02"); //Garond ist überzeugt davon, dass sie uns eine Hilfe sein können.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Chance_13_03"); //Aber ich werde sie im Auge behalten. Wir haben genug Probleme mit den Orks, wir können wirklich keinen weiteren Ärger gebrauchen.
	
	Info_ClearChoices (DIA_Parcival_AnyNews);  
};

FUNC VOID DIA_Parcival_AnyNews_Overact ()
{
	AI_Output (other,self ,"DIA_Parcival_AnyNews_Overact_15_00"); //Findest du nicht, dass du übertreibst?
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_01"); //Ganz und gar nicht. In unserer Situation brauchen wir Männer, die mit leuchtendem Beispiel vorangehen.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_02"); //Krieger, die das Feuer Innos' in den Herzen unserer Kämpfer wecken.
	AI_Output (self ,other,"DIA_Parcival_AnyNews_Overact_13_03"); //Stattdessen zerstört dieser Abschaum die Moral meiner Krieger.
};
 
///////////////////////////////////////////////////////////////////////
//	Ich muss mit dir über Jan reden
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_Jan		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_Jan_Condition;
	information	 = 	DIA_Parcival_Jan_Info;
	permanent	 = 	FALSE;
	description  =	"Ich muss mit dir über Jan reden";		
};

func int DIA_Parcival_Jan_Condition ()
{	
	if (MIS_JanBecomesSmith == LOG_RUNNING)
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_Jan_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_00"); //Ich muss mit dir über Jan reden
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_01"); //Jan? Wer ist das?
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_02"); //Ein Drachenjäger. Er ist Schmied.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_03"); //Aja, ich erinnere mich. Was ist mit ihm?
	AI_Output	(other,self ,"DIA_Parcival_Jan_15_04"); //Er möchte in der Schmiede arbeiten.
	AI_Output 	(self ,other,"DIA_Parcival_Jan_13_05"); //Kommt nicht in Frage. Er ist keiner von uns, und ich traue ihm nicht.
}; 
 
///////////////////////////////////////////////////////////////////////
//	Kannst du das mit Jan noch mal überdenken?
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_ThinkAgain		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_ThinkAgain_Condition;
	information	 = 	DIA_Parcival_ThinkAgain_Info;
	permanent	 = 	TRUE;
	description  =	"Kannst du das mit Jan nicht noch mal überdenken?";		
};

func int DIA_Parcival_ThinkAgain_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Parcival_Jan)) 
	&& (MIS_JanBecomesSmith == LOG_RUNNING)	
	{
		return TRUE;
	};
};
func void DIA_Parcival_ThinkAgain_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_ThinkAgain_15_00"); //Kannst du das mit Jan nicht noch mal überdenken?
	AI_Output 	(self ,other,"DIA_Parcival_ThinkAgain_13_01"); //Nein, mein Entschluss steht fest.
}; 
 
///////////////////////////////////////////////////////////////////////
//	Garond will, dass Jan die Schmiede übernimmt.
///////////////////////////////////////////////////////////////////////

instance DIA_Parcival_TalkedGarond		(C_INFO)
{
	npc			 = 	PAL_252_Parcival;
	nr			 = 	2;
	condition	 = 	DIA_Parcival_TalkedGarond_Condition;
	information	 = 	DIA_Parcival_TalkedGarond_Info;

	description  =	"Garond will, dass Jan die Schmiede übernimmt.";		
};

func int DIA_Parcival_TalkedGarond_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Parcival_Jan))
	&& (MIS_JanBecomesSmith == LOG_SUCCESS)	 
		&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON))
	{
		return TRUE;
	};
};
func void DIA_Parcival_TalkedGarond_Info ()
{
	AI_Output	(other,self ,"DIA_Parcival_TalkedGarond_15_00"); //Garond will, dass Jan die Schmiede übernimmt.
	AI_Output 	(self ,other,"DIA_Parcival_TalkedGarond_13_01"); //Mmh. Wenn das so ist, dann wird er die Schmiede meinetwegen bekommen.
	AI_Output 	(self ,other,"DIA_Parcival_TalkedGarond_13_02"); //Auch wenn ich glaube, dass es ein Fehler ist, diesem Jan zu vertrauen.
};  

///////////////////////////////////////////////////////////////////////
//	Info PermKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_PERMKAP4		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	nr		 = 	43;
	condition	 = 	DIA_Parcival_PERMKAP4_Condition;
	information	 = 	DIA_Parcival_PERMKAP4_Info;
	permanent	 = 	TRUE;

	description	 = 	"Und sonst?";
};

func int DIA_Parcival_PERMKAP4_Condition ()
{
	if (Kapitel >= 4)
		&& (Npc_KnowsInfo(other, DIA_Parcival_AnyNews))
		{
				return TRUE;
		};
};

func void DIA_Parcival_PERMKAP4_Info ()
{
	AI_Output			(other, self, "DIA_Parcival_PERMKAP4_15_00"); //Und sonst?
	AI_Output			(self, other, "DIA_Parcival_PERMKAP4_13_01"); //Ach, lass mich in Ruhe!

};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Parcival_KAP5_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP5_EXIT_Condition;
	information	= DIA_Parcival_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verraeter
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_VERRAETER		(C_INFO)
{
	npc		 = 	PAL_252_Parcival;
	condition	 = 	DIA_Parcival_VERRAETER_Condition;
	information	 = 	DIA_Parcival_VERRAETER_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Parcival_VERRAETER_Condition ()
{
	if (Npc_RefuseTalk(self) == FALSE)
		&& (MIS_OCGateOpen == TRUE)
		{
			return TRUE;		
		};
};

func void DIA_Parcival_VERRAETER_Info ()
{
	
	AI_Output			(self, other, "DIA_Parcival_VERRAETER_13_00"); //Verräter! Ich weiß genau, dass DU es gewesen bist, der das Tor geöffnet hat.
	AI_Output			(self, other, "DIA_Parcival_VERRAETER_13_01"); //Dafür wirst du bezahlen.
	
	Npc_SetRefuseTalk (self,30);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
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


INSTANCE DIA_Parcival_KAP6_EXIT(C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 999;
	condition	= DIA_Parcival_KAP6_EXIT_Condition;
	information	= DIA_Parcival_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Parcival_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Parcival_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Parcival_PICKPOCKET (C_INFO)
{
	npc			= PAL_252_Parcival;
	nr			= 900;
	condition	= DIA_Parcival_PICKPOCKET_Condition;
	information	= DIA_Parcival_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Parcival_PICKPOCKET_Condition()
{
	C_Beklauen (84, 460);
};
 
FUNC VOID DIA_Parcival_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Parcival_PICKPOCKET);
	Info_AddChoice		(DIA_Parcival_PICKPOCKET, DIALOG_BACK 		,DIA_Parcival_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Parcival_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Parcival_PICKPOCKET_DoIt);
};

func void DIA_Parcival_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Parcival_PICKPOCKET);
};
	
func void DIA_Parcival_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Parcival_PICKPOCKET);
};


















































		
																				
	
	
	
	
	
	
	
	
	
	
	
	














