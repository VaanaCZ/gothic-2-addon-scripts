///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ulthar_EXIT   (C_INFO)
{
	npc         = KDF_502_Ulthar;
	nr          = 999;
	condition   = DIA_Ulthar_EXIT_Condition;
	information = DIA_Ulthar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Ulthar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
	
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_GREET		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_GREET_Condition;
	information	 = 	DIA_Ulthar_GREET_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Ulthar_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&&(!Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_GREET_Info ()
{
	AI_Output (self, other, "DIA_Ulthar_GREET_05_00"); //Schau an, der neue Novize erscheint vor dem hohen Rat. Innos sei mit dir, Sohn.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_01"); //Was genau ist die Aufgabe des Hohen Rates?
	AI_Output (self, other, "DIA_Ulthar_GREET_05_02"); //Unsere Pflicht ist es, den Willen Innos' zu verkünden. So benennen wir die erwählten Novizen, denen die Prüfung der Magie auferlegt wird.
	AI_Output (self, other, "DIA_Ulthar_GREET_05_03"); //Auch wenn wir sehr zurückgezogen leben, richten wir unsere Blicke auf die Geschehnisse der Welt, denn die Kirche Innos' vertritt das oberste weltliche Gesetz.
	AI_Output (other, self, "DIA_Ulthar_GREET_15_04"); //So, die Geschehnisse der Welt interessieren euch also ...
	AI_Output (other, self, "DIA_Ulthar_GREET_15_05"); //Was sagt ihr dann dazu, dass Drachen im Minental sitzen und ihre Armee jeden Tag wächst?
	AI_Output (self, other, "DIA_Ulthar_GREET_05_06"); //Ich verstehe, dass du aufgebracht bist, doch wir müssen deine Worte erst prüfen, bevor wir Schritte einleiten.
	AI_Output (self, other, "DIA_Ulthar_GREET_05_07"); //Wenn wir uns jetzt zu unüberlegten Handlungen hinreißen lassen, erreichen wir gar nichts. Also erfülle deine Aufgaben - und wir beraten, was zu tun ist.
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_MAGETEST		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_MAGETEST_Condition;
	information	 = 	DIA_Ulthar_MAGETEST_Info;
	description	 = 	"Erzähl mir über die Prüfung der Magie.";
};
func int DIA_Ulthar_MAGETEST_Condition ()
{	
	if Npc_KnowsInfo (hero, DIA_Ulthar_GREET)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_MAGETEST_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_MAGETEST_15_00"); //Erzähl mir über die Prüfung der Magie.
	AI_Output (self, other, "DIA_Ulthar_MAGETEST_05_01"); //Es ist die Chance für den erwählten Novizen, in die Gilde der Magier einzutreten. Aber nur einer kann die Prüfung bestehen.
	AI_Output (self, other, "DIA_Ulthar_MAGETEST_05_02"); //Und nur Innos allein wählt die Novizen dafür aus.
};
///////////////////////////////////////////////////////////////////////
//	Info WHEN
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_WHEN		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	3;
	condition	 = 	DIA_Ulthar_WHEN_Condition;
	information	 = 	DIA_Ulthar_WHEN_Info;
	permanent	 =  TRUE;
	description	 = 	"Wann findet die Prüfung statt?";
};
func int DIA_Ulthar_WHEN_Condition ()
{
	if  Npc_KnowsInfo (hero, DIA_Ulthar_MAGETEST)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_WHEN_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_WHEN_15_00"); //Wann findet die Prüfung statt?
	AI_Output (self, other, "DIA_Ulthar_WHEN_05_01"); //Sobald wir den Willen Innos' vernommen haben. Die erwählten Novizen erfahren es von uns und wir stellen sie vor die Prüfung.
	
};
///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_TEST		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  10;
	condition	 = 	DIA_Ulthar_TEST_Condition;
	information	 = 	DIA_Ulthar_TEST_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich stelle mich deiner Prüfung, Meister";
};
func int DIA_Ulthar_TEST_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Pyrokar_FIRE)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_TEST_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_TEST_15_00"); //Ich stelle mich deiner Prüfung, Meister.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_01"); //Es verwundert mich nicht, dass du das alte Gesetz kennst.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_02"); //Aber ich schätze, du hast keine Ahnung, auf was du dich eingelassen hast. Bedenke, dass ein ungeduldiger Geist nicht vor der Prüfung des Feuers bestehen wird.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_03"); //Es ist lange her, dass diese Prüfung abgelegt wurde. Und es gibt nur einen Mann, der sie je überlebt und auch bestanden hat.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_04"); //Damals war er noch ein junger aufstrebender Novize, heute hat er längst seinen Platz im hohen Rat gefunden - ich spreche von Serpentes.
	AI_Output (other, self, "DIA_Ulthar_TEST_15_05"); //Er wird nicht mehr lange der Einzige sein, der die Prüfung bestanden hat.
	AI_Output (self, other, "DIA_Ulthar_TEST_05_06"); //Dann will ich dich nicht länger warten lassen. Höre meine Prüfung an dich:
	AI_Output (self, other, "DIA_Ulthar_TEST_05_07"); //Erschaffe eine Feuerpfeil - Rune. Das ist alles - möge Innos dir beistehen.
	
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic (TOPIC_Rune,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Rune,LOG_RUNNING);
	B_LogEntry (TOPIC_Rune,"Ulthar hat mir seine Prüfung auferlegt. Ich soll eine Feuerpfeil Rune erschaffen.");
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_RUNNING		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  10;
	condition	 = 	DIA_Ulthar_RUNNING_Condition;
	information	 = 	DIA_Ulthar_RUNNING_Info;
	permanent	 = 	TRUE;
	important	 = 	TRUE;
};
func int DIA_Ulthar_RUNNING_Condition ()
{	
	if (MIS_RUNE == LOG_RUNNING)
	&& Npc_IsInState	(self, ZS_Talk) 
	&& (Npc_HasItems    (other, ItRu_FireBolt) == 0)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_RUNNING_Info ()
{
	AI_Output (self, other, "DIA_Ulthar_RUNNING_05_00"); //Du kennst deine Aufgabe. Erledige sie.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SUCCESS		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr			 = 	2;
	condition	 = 	DIA_Ulthar_SUCCESS_Condition;
	information	 = 	DIA_Ulthar_SUCCESS_Info;
	permanent	 =  FALSE;
	description	 = 	"Ich habe die Rune erschaffen!";
};
func int DIA_Ulthar_SUCCESS_Condition ()
{
	if (MIS_RUNE == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItRu_FireBolt) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_SUCCESS_15_00"); //Ich habe die Rune erschaffen!
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_01"); //Gut gemacht, Novize. Du sollst diese, deine erste Rune behalten.
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_02"); //Wenn du den ersten Kreis des Feuers erreicht hast, wirst du ihre Kraft nutzen können.
	AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_03"); //Diese Prüfung hast du zu meiner Zufriedenheit erfüllt.
	
	if (MIS_GOLEM == LOG_RUNNING)
	&& ((Npc_IsDead (Magic_Golem)) == FALSE)
	{
		AI_Output (self, other, "DIA_Ulthar_SUCCESS_05_04"); //Aber die gefährliche Aufgabe, die Serpentes dir gestellt hat, liegt noch vor dir!
	};
	
	MIS_RUNE = LOG_SUCCESS;
	B_GivePlayerXP (XP_RUNE);
	
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

INSTANCE DIA_Ulthar_KAP3_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP3_EXIT_Condition;
	information	= DIA_Ulthar_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PermAbKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_PermAbKap3		(C_INFO)
{
	npc			 = 	KDF_502_Ulthar;
	nr           =  99;
	condition	 = 	DIA_Ulthar_PermAbKap3_Condition;
	information	 = 	DIA_Ulthar_PermAbKap3_Info;
	permanent	 = 	TRUE;
	description  =  "Gibt's was Neues?";
};
func int DIA_Ulthar_PermAbKap3_Condition ()
{	
	if (Kapitel >= 3)
	|| Npc_KnowsInfo (other,DIA_Ulthar_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Ulthar_PermAbKap3_Info ()
{
	AI_Output (other, self, "DIA_Ulthar_PermAbKap3_15_00"); //Gibt's was Neues?

	if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Ulthar_PermAbKap3_05_01"); //Zurzeit nicht. Geh und erledige deine Aufgaben. Du hast noch viel zu tun.
	}
	else
	{
		AI_Output (self, other, "DIA_Ulthar_PermAbKap3_05_02"); //Nein. Nichts, was du nicht schon wüsstest, Bruder.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineVergiftet
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SCHREINEVERGIFTET		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SCHREINEVERGIFTET_Condition;
	information	 = 	DIA_Ulthar_SCHREINEVERGIFTET_Info;
	important	 = 	TRUE;
};

func int DIA_Ulthar_SCHREINEVERGIFTET_Condition ()
{
	if (Pedro_Traitor == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SCHREINEVERGIFTET_Info ()
{
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_00"); //Eine Sache noch. Einige der von Innos geweihten Wegschreine sind vom Feind geschändet worden. Sie haben ihre magische Weihe verloren.
			AI_Output			(other, self, "DIA_Ulthar_SCHREINEVERGIFTET_15_01"); //Verstehe. Und nun?
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_02"); //Es ist an dir, diese Schreine wieder zu reinigen, um die Situation nicht eskalieren zu lassen.
			CreateInvItems (self, ItMi_UltharsHolyWater_Mis, 1);									
			B_GiveInvItems (self, other, ItMi_UltharsHolyWater_Mis, 1);	
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_03"); //Nimm dieses geweihte Wasser und träufle es auf den Sockel des Schreins.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_04"); //Mit den heiligen Worten der Reinigung wird der Schrein seine alte Macht wieder zurückerlangen.

			if ((Npc_HasItems (other,ItWr_Map_Shrine_MIS))==FALSE)
			{
				if ((Npc_HasItems (Gorax,ItWr_Map_Shrine_MIS)))
				&& ((Npc_IsDead(Gorax))== FALSE)
				{
					AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_05"); //Gorax kann dir eine Karte verkaufen, auf der unsere Schreine eingezeichnet sind.
				}
				else
				{
					AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_06"); //Ich habe hier eine Karte für dich. Darauf sind die Schreine, die wir aufgestellt haben, eingezeichnet.
					CreateInvItems (self, ItWr_Map_Shrine_MIS, 1);									
					B_GiveInvItems (self, other, ItWr_Map_Shrine_MIS, 1);					
				};
			};

			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_07"); //Gehe nun hin und verrichte deine Aufgaben.
			MIS_Ulthar_HeileSchreine_PAL = LOG_RUNNING;	
			
			Log_CreateTopic (TOPIC_Ulthar_HeileSchreine_PAL, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Ulthar_HeileSchreine_PAL, LOG_RUNNING);
			B_LogEntry (TOPIC_Ulthar_HeileSchreine_PAL,"Ulthar gab mir den Auftrag, alle vom Feind geschändeten Schreine mit seinem geweihten Wasser zu reinigen."); 
			
			AI_StopProcessInfos (self);
		}
		else
		{
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_08"); //Noch eine Kleinigkeit. Halte dich von den Wegschreinen fern. Uns ist zu Ohren gekommen, dass einige von ihnen geschändet worden sind.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_09"); //Niemand vermag zu sagen, was sie nun bewirken.
			AI_Output			(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_10"); //Es ist nicht deine Aufgabe, dieses Problem zu lösen. Die Paladine werden sich der Sache annehmen.
			AI_StopProcessInfos (self);
		};
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheilt		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SchreineGeheilt_Condition;
	information	 = 	DIA_Ulthar_SchreineGeheilt_Info;

	description  = 	"Ich habe alle Schreine gereinigt.";
};

func int DIA_Ulthar_SchreineGeheilt_Condition ()
{
	if (MIS_Ulthar_HeileSchreine_PAL == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SchreineGeheilt_Info ()
{
	AI_Output			(other, self, "DIA_Ulthar_SchreineGeheilt_15_00"); //Ich habe alle Schreine gereinigt.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheilt_05_01"); //Vortrefflich gemacht, mein Sohn. Ich bin stolz auf dich. Möge Innos über dich wachen.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheilt_05_02"); //Nimm dieses Amulett der Macht an dich, auf dass es dir im Kampf gegen den Feind nutzen möge.
	CreateInvItems (self, ItAm_Dex_Strg_01, 1);									
	B_GiveInvItems (self, other, ItAm_Dex_Strg_01, 1);
	B_GivePlayerXP (XP_Ulthar_SchreineGereinigt);
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Ulthar_KAP4_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP4_EXIT_Condition;
	information	= DIA_Ulthar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheiltNoPAL
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheiltNoPAL		(C_INFO)
{
	npc		 = 	KDF_502_Ulthar;
	nr		 = 	30;
	condition	 = 	DIA_Ulthar_SchreineGeheiltNoPAL_Condition;
	information	 = 	DIA_Ulthar_SchreineGeheiltNoPAL_Info;
	important	 = 	TRUE;

};

func int DIA_Ulthar_SchreineGeheiltNoPAL_Condition ()
{
	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)|| (hero.guild == GIL_KDF))
	&& (Kapitel >= 4)
		{
				return TRUE;
		};
};

func void DIA_Ulthar_SchreineGeheiltNoPAL_Info ()
{
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_00"); //Gute Nachrichten. Die Wegschreine sind wieder gereinigt. Innos' Kraft hat den Paladinen geholfen, dieses Problem endlich aus der Welt zu schaffen.
	AI_Output			(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_01"); //Du darfst also deine Spenden wieder ohne Bedenken und Reue an Innos entrichten.
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Ulthar_KAP5_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP5_EXIT_Condition;
	information	= DIA_Ulthar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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


INSTANCE DIA_Ulthar_KAP6_EXIT(C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 999;
	condition	= DIA_Ulthar_KAP6_EXIT_Condition;
	information	= DIA_Ulthar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Ulthar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Ulthar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ulthar_PICKPOCKET (C_INFO)
{
	npc			= KDF_502_Ulthar;
	nr			= 900;
	condition	= DIA_Ulthar_PICKPOCKET_Condition;
	information	= DIA_Ulthar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Ulthar_PICKPOCKET_Condition()
{
	C_Beklauen (74, 320);
};
 
FUNC VOID DIA_Ulthar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ulthar_PICKPOCKET);
	Info_AddChoice		(DIA_Ulthar_PICKPOCKET, DIALOG_BACK 		,DIA_Ulthar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ulthar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ulthar_PICKPOCKET_DoIt);
};

func void DIA_Ulthar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ulthar_PICKPOCKET);
};
	
func void DIA_Ulthar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ulthar_PICKPOCKET);
};
































 
























