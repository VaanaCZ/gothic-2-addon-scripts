///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Till_EXIT   (C_INFO)
{
	npc         = BAU_931_Till;
	nr          = 999;
	condition   = DIA_Till_EXIT_Condition;
	information = DIA_Till_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Till_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Till_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Till_HALLO		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	3;
	condition	 = 	DIA_Till_HALLO_Condition;
	information	 = 	DIA_Till_HALLO_Info;

	description	 = 	"Na, Kleiner?";
};

func int DIA_Till_HALLO_Condition ()
{
	if (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_15_00"); //Na, Kleiner?
	AI_Output			(self, other, "DIA_Till_HALLO_03_01"); //Das Gesinde hat mich nicht so schnˆde anzusprechen, wie oft muss ich das noch sagen?
	B_StartOtherRoutine (Till,"Start"); 

	Info_ClearChoices	(DIA_Till_HALLO);

	if (Kapitel < 5)
	{
		Info_AddChoice	(DIA_Till_HALLO, "Ich bin kein Feldarbeiter?", DIA_Till_HALLO_keinervoneuch );
	
		if (Npc_IsDead(Sekob)== FALSE)
		{
			Info_AddChoice	(DIA_Till_HALLO, "Hast du hier das Sagen?", DIA_Till_HALLO_selber );
		};
	};
};

func void DIA_Till_HALLO_selber ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_selber_15_00"); //Hast du hier das Sagen?
	AI_Output			(self, other, "DIA_Till_HALLO_selber_03_01"); //(eingesch¸chtert) ƒh. Nein, ich bin nur Sekobs Sohn. Aber wenn mein alter Herr einmal nicht mehr ist, dann gehˆrt das ganze Land, was du hier siehst, mir.
	AI_Output			(other, self, "DIA_Till_HALLO_selber_15_02"); //Toll!

	Info_ClearChoices	(DIA_Till_HALLO);
};

func void DIA_Till_HALLO_keinervoneuch ()
{
	AI_Output			(other, self, "DIA_Till_HALLO_keinervoneuch_15_00"); //Ich bin kein Feldarbeiter.
	AI_Output			(self, other, "DIA_Till_HALLO_keinervoneuch_03_01"); //Und was willst du dann hier? Wir haben nichts. Deswegen kannst du auch gleich wieder gehen.

	Info_ClearChoices	(DIA_Till_HALLO);
};


///////////////////////////////////////////////////////////////////////
//	Info feldarbeiter
///////////////////////////////////////////////////////////////////////
instance DIA_Till_FELDARBEITER		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	4;
	condition	 = 	DIA_Till_FELDARBEITER_Condition;
	information	 = 	DIA_Till_FELDARBEITER_Info;

	description	 = 	"Gehst du mit den Feldarbeitern immer so um?";
};

func int DIA_Till_FELDARBEITER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_FELDARBEITER_Info ()
{
	AI_Output			(other, self, "DIA_Till_FELDARBEITER_15_00"); //Gehst du mit den Feldarbeitern immer so um?
	AI_Output			(self, other, "DIA_Till_FELDARBEITER_03_01"); //Klar, die brauchen das. Wer hier nicht spurt, kriegt Pr¸gel, so l‰uft das.

};


///////////////////////////////////////////////////////////////////////
//	Info Sekob
///////////////////////////////////////////////////////////////////////
instance DIA_Till_SEKOB		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	9;
	condition	 = 	DIA_Till_SEKOB_Condition;
	information	 = 	DIA_Till_SEKOB_Info;

	description	 = 	"Ich muss deinen Vater sprechen.";
};

func int DIA_Till_SEKOB_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_FELDARBEITER))
		&&((Npc_KnowsInfo(other, DIA_Sekob_HALLO))== FALSE)
		&& (Kapitel < 3)
		&& (Npc_IsDead(Sekob)== FALSE)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_SEKOB_Info ()
{
	AI_Output			(other, self, "DIA_Till_SEKOB_15_00"); //Ich muss deinen Vater sprechen.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_01"); //Der hat keine Zeit. Aber ich bin sein Stellvertreter. Womit kann ich dir helfen?
	AI_Output			(other, self, "DIA_Till_SEKOB_15_02"); //Indem du mich deinem Vater vorstellst.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_03"); //Bist wohl ein ganz harter Bursche und guter K‰mpfer, was?
	AI_Output			(other, self, "DIA_Till_SEKOB_15_04"); //Der Beste.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_05"); //Ich glaube, dann sollte ich ihn mal besser holen.
	AI_Output			(other, self, "DIA_Till_SEKOB_15_06"); //Lass mal, Junge. Ich werde ihn schon finden.
	AI_Output			(self, other, "DIA_Till_SEKOB_03_07"); //Wie du meinst.
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Till_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	10;
	condition	 = 	DIA_Till_WASMACHSTDU_Condition;
	information	 = 	DIA_Till_WASMACHSTDU_Info;

	description	 = 	"Was machst du denn so?";
};

func int DIA_Till_WASMACHSTDU_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	&& (hero.guild != GIL_MIL)
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Till_WASMACHSTDU_15_00"); //Was machst du denn so, wenn du nicht gerade den Hof regierst?
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_01"); //Aufpassen.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_02"); //Die dreckigen Milizen der Stadt kommen immer h‰ufiger auf unser Land und stehlen alles, was sie in die H‰nde bekommen.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_03"); //Erst letzte Woche waren die Dreckskerle noch hier und haben einige unserer Schafe einfach mitgenommen.
	AI_Output			(self, other, "DIA_Till_WASMACHSTDU_03_04"); //Wenn ich mal einen von ihnen in die Finger kriege, dann mach ich mit ihm kurzen Prozess.
	AI_Output			(other, self, "DIA_Till_WASMACHSTDU_15_05"); //Ja klar!

};

///////////////////////////////////////////////////////////////////////
//	Info warumnichtsld
///////////////////////////////////////////////////////////////////////
instance DIA_Till_WARUMNICHTSLD		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	11;
	condition	 = 	DIA_Till_WARUMNICHTSLD_Condition;
	information	 = 	DIA_Till_WARUMNICHTSLD_Info;

	description	 = 	"Warum helfen euch nicht die Sˆldner gegen die Milizen?";
};

func int DIA_Till_WARUMNICHTSLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_WASMACHSTDU))
	&& (hero.guild != GIL_MIL)
	&& (Kapitel < 5)
		{
				return TRUE;
		};
};

func void DIA_Till_WARUMNICHTSLD_Info ()
{
	AI_Output			(other, self, "DIA_Till_WARUMNICHTSLD_15_00"); //Warum helfen euch nicht die Sˆldner gegen die Milizen?
	AI_Output			(self, other, "DIA_Till_WARUMNICHTSLD_03_01"); //Bevor die erstmal in Wallung kommen, habe ich sie doch schon l‰ngst in die Flucht geschlagen.
};

///////////////////////////////////////////////////////////////////////
//	Info Bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKO		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	5;
	condition	 = 	DIA_Till_BRONKO_Condition;
	information	 = 	DIA_Till_BRONKO_Info;

	description	 = 	"(nach Bronko fragen)";
};

func int DIA_Till_BRONKO_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_FELDARBEITER))
		&& (Npc_KnowsInfo(other, DIA_Bronko_HALLO))
		&& (Kapitel < 5)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_BRONKO_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKO_15_00"); //Da ist so ein Typ, der kassiert von jedem Passanten Wegzoll und erz‰hlt, ER w‰re der Bauer.
	AI_Output			(self, other, "DIA_Till_BRONKO_03_01"); //(verlegen) ƒh. Ja. Ich weiﬂ. Das ist Bronko. Der macht einfach, was er will.
	AI_Output			(self, other, "DIA_Till_BRONKO_03_02"); //Nicht, dass ich ihm nicht schon tausend mal eingebl‰ut h‰tte, dass er endlich wieder an die Arbeit gehen soll.
	AI_Output			(other, self, "DIA_Till_BRONKO_15_03"); //Aber?
	AI_Output			(self, other, "DIA_Till_BRONKO_03_04"); //Er tut es halt einfach nicht.
	
	if (Npc_IsDead(Sekob)== FALSE)
	{
		AI_Output			(self, other, "DIA_Till_BRONKO_03_05"); //Mein Vater ist schon sauer auf mich, weil ich es immer noch nicht geschafft habe, ihn wieder zur Arbeit zu bewegen.
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Bronkozurarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKOZURARBEIT		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	6;
	condition	 = 	DIA_Till_BRONKOZURARBEIT_Condition;
	information	 = 	DIA_Till_BRONKOZURARBEIT_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vielleicht kann ich dir helfen.";
};

var int DIA_Till_BRONKOZURARBEIT_noPerm;

func int DIA_Till_BRONKOZURARBEIT_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Till_BRONKO))
		&& (DIA_Till_BRONKOZURARBEIT_noPerm == FALSE)
		&& (Kapitel < 5)
		)
			{
					return TRUE;
			};
};

func void DIA_Till_BRONKOZURARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_15_00"); //Vielleicht kann ich dir helfen.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_03_01"); //Meinst du wirklich? Also pass auf, wenn du Bronko wieder dazu bringst, zu arbeiten, werde ich dir, sagen wir mal, 10 Goldm¸nzen bezahlen. Was sagst du?

	Till_Angebot = 10;

	Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);

	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Kein Problem. Ich will aber mehr Geld.", DIA_Till_BRONKOZURARBEIT_mehr );
	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Na gut! Ich werde sehen was ich tun kann.", DIA_Till_BRONKOZURARBEIT_ok );
	Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Ich denke dr¸ber nach.", DIA_Till_BRONKOZURARBEIT_nochnicht );

};

func void DIA_Till_BRONKOZURARBEIT_nochnicht ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_nochnicht_15_00"); //Ich denke dar¸ber nach.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_nochnicht_03_01"); //Wie du willst.

	Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
	AI_StopProcessInfos (self);
};

func void DIA_Till_BRONKOZURARBEIT_ok ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_ok_15_00"); //Na gut! Ich werde sehen, was ich tun kann.
	AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_ok_03_01"); //Beeil dich aber ein bisschen.
	
	DIA_Till_BRONKOZURARBEIT_noPerm = TRUE;
	MIS_Sekob_Bronko_eingeschuechtert = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Bronkoeingeschuechtert, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Bronkoeingeschuechtert, LOG_RUNNING);
	B_LogEntry (TOPIC_Bronkoeingeschuechtert,"Till kann Bronko nicht zur Arbeit bewegen. Till will, dass ich es versuche."); 

	AI_StopProcessInfos (self);
};

func void DIA_Till_BRONKOZURARBEIT_mehr ()
{
	if (Till_IchMachsNurEinmal == TRUE)
		{
			AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_mehr_15_00"); //Ich will mehr.
		}
	else
		{
			AI_Output			(other, self, "DIA_Till_BRONKOZURARBEIT_mehr_15_01"); //Kein Problem. Ich will aber mehr Geld.
			Till_IchMachsNurEinmal = TRUE;
		};

	 if (Till_Angebot == 10)
	 	{
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_02"); //Na schˆn. Dann eben 20 Goldm¸nzen.
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Ich will mehr.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Na gut! Ich werde sehen was ich tun kann.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 20;
		}
	 else if (Till_Angebot == 20)
		{
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_03"); //30?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Ich will mehr.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Na gut! Ich werde sehen was ich tun kann.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 30;
		}
	 else if (Till_Angebot == 30)
		{	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_04"); //Vielleicht ... 50?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Ich will mehr.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Na gut! Ich werde sehen was ich tun kann.", DIA_Till_BRONKOZURARBEIT_ok );
			Till_Angebot = 50;
		}
	 else if (Till_Angebot == 50)
		{	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_05"); //Na gut. 70?
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Ich will mehr.", DIA_Till_BRONKOZURARBEIT_mehr );
			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Na gut! Ich werde sehen was ich tun kann.", DIA_Till_BRONKOZURARBEIT_ok );
		Till_Angebot = 70;
		}
	 else if (Till_Angebot == 70)
		{	
	
			AI_Output			(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_06"); //Ok, ok! Ich gebe dir 100 Goldm¸nzen. Mehr habe ich aber nicht.
			Info_ClearChoices	(DIA_Till_BRONKOZURARBEIT);

			Info_AddChoice	(DIA_Till_BRONKOZURARBEIT, "Na gut! Ich werde sehen was ich tun kann.", DIA_Till_BRONKOZURARBEIT_ok );

			Till_Angebot = 100;
		};
};

///////////////////////////////////////////////////////////////////////
//	Info bronkowiederanArbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKOWIEDERANARBEIT		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	7;
	condition	 = 	DIA_Till_BRONKOWIEDERANARBEIT_Condition;
	information	 = 	DIA_Till_BRONKOWIEDERANARBEIT_Info;

	description	 = 	"Bronko arbeitet wieder.";
};

func int DIA_Till_BRONKOWIEDERANARBEIT_Condition ()
{
	if 	(
		(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
		&& (DIA_Till_BRONKOZURARBEIT_noPerm == TRUE)
		&& (Kapitel < 5)
		)
		{
				return TRUE;
		};
};

func void DIA_Till_BRONKOWIEDERANARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Till_BRONKOWIEDERANARBEIT_15_00"); //Bronko arbeitet wieder.
	AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_01"); //Tats‰chlich? Das ist ja prima.
	AI_Output			(other, self, "DIA_Till_BRONKOWIEDERANARBEIT_15_02"); //Ja. Und ich will jetzt meine Kohle.
	
	IntToFloat	(Till_Angebot);
	
	if (Till_Angebot <= 50)
		{
			AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_03"); //(zˆgernd) Mmh. Na gut. Gesch‰ft ist Gesch‰ft, was?

			CreateInvItems (self, ItMi_Gold, Till_Angebot);									
			B_GiveInvItems (self, other, ItMi_Gold, Till_Angebot);
		}
	else
		{
			AI_Output			(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_04"); //So viel Geld habe ich leider nicht. Aber ich bin sehr dankbar, dass du mir geholfen hast.

			Till_HatSeinGeldBehalten = TRUE;
		};

	B_GivePlayerXP (XP_BronkoGehtAnDieArbeit);

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Till_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_931_Till;
	nr		 = 	99;
	condition	 = 	DIA_Till_PERMKAP1_Condition;
	information	 = 	DIA_Till_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"(Till ‰rgern)";
};

func int DIA_Till_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Till_HALLO))
	|| (Kapitel >= 5)
		{
				return TRUE;
		};
};

func void DIA_Till_PERMKAP1_Info ()
{
	if (Kapitel == 5)
		{
			if (MIS_bringRosiBackToSekob != LOG_SUCCESS)
			&& (Rosi_FleeFromSekob_Kap5 == TRUE)
			{
				AI_Output			(other, self, "DIA_Till_PERMKAP1_15_00"); //Weit weg von Zuhause, was? Papa kann dir hier nicht mehr helfen.
				AI_Output			(self, other, "DIA_Till_PERMKAP1_03_01"); //Deine groﬂe Klappe stopfe ich dir noch irgendwann.
			};
			
			AI_Output			(other, self, "DIA_Till_PERMKAP1_15_02"); //Du Pfeife kannst froh sein, wenn ich dich leben lasse.
			AI_Output			(self, other, "DIA_Till_PERMKAP1_03_03"); //Dann lass mich doch einfach in Ruhe.
			AI_StopProcessInfos (self);	
		}
		else
		{		
			if 	(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
				{
					AI_Output			(other, self, "DIA_Till_PERMKAP1_15_04"); //Vielleicht solltest du mehr essen, damit du groﬂ und stark wirst.
					AI_Output			(self, other, "DIA_Till_PERMKAP1_03_05"); //Eines Tages werde ich's dir schon noch zeigen.
					AI_StopProcessInfos (self);
				}
			else
				{
					if (Till_HatSeinGeldBehalten == TRUE)
						{
							AI_Output			(other, self, "DIA_Till_PERMKAP1_15_06"); //Du mieser kleiner ...
							AI_Output			(self, other, "DIA_Till_PERMKAP1_03_07"); //Geh doch einfach weg.
							AI_StopProcessInfos (self);
						}			
					else
						{
							AI_Output			(other, self, "DIA_Till_PERMKAP1_15_08"); //Hat dir jemand heute schon die Nase geputzt?
							AI_Output			(self, other, "DIA_Till_PERMKAP1_03_09"); //Lass mich in Ruhe, du Idiot.
						};
				};
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Till_PICKPOCKET (C_INFO)
{
	npc			= BAU_931_Till;
	nr			= 900;
	condition	= DIA_Till_PICKPOCKET_Condition;
	information	= DIA_Till_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Till_PICKPOCKET_Condition()
{
	C_Beklauen (36, 40);
};
 
FUNC VOID DIA_Till_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Till_PICKPOCKET);
	Info_AddChoice		(DIA_Till_PICKPOCKET, DIALOG_BACK 		,DIA_Till_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Till_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Till_PICKPOCKET_DoIt);
};

func void DIA_Till_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Till_PICKPOCKET);
};
	
func void DIA_Till_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Till_PICKPOCKET);
};


