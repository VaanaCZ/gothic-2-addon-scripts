


// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_MiltenNW_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_EXIT_Condition;
	information	= DIA_MiltenNW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MiltenNW_EXIT_Condition()
{
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_MiltenNW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_MiltenNW_KAP3_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP3_EXIT_Condition;
	information	= DIA_MiltenNW_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*************************************************************
//Hallo!
//*************************************************************

INSTANCE DIA_MiltenNW_KAP3_Hello(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 31;
	condition	= DIA_MiltenNW_KAP3_Hello_Condition;
	information	= DIA_MiltenNW_KAP3_Hello_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_MiltenNW_KAP3_Hello_Condition()
{
	if hero.guild == GIL_PAL
	|| hero.guild == GIL_DJG
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_Hello_Info()
{	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_00"); //(ungläubig) Ich kann das kaum glauben. Bist du jetzt wirklich ein Paladin?
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_01"); //Offensichtlich.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_02"); //(euphorisch) Wenn jemand wie du bei den Paladinen mitmacht, dann können sich die Schergen Beliars warm anziehen.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_03"); //Wenn du mit dem Schläfer fertig geworden bist, sind die paar Orks ja wohl kein Problem.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_04"); //Es geht nicht nur um die Orks.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_05"); //Ich weiß, aber es ist trotzdem gut, dass du auf unserer Seite stehst.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_06"); //Schon gut.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_07"); //Was machst du hier im Kloster? Lass mich raten. Du willst dich in der Kunst der Magie unterweisen lassen.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_08"); //Mal sehen.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_09"); //Wusste ich's doch, sprich am besten mit Marduk, er ist für euch Paladine zuständig. Du findest ihn vor der Kapelle.
	};
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_10"); //Wie ich sehe, sind die Gerüchte wahr.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_11"); //Welche Gerüchte?
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_12"); //Dass du bei diesen Drachenjägern mitmachst.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_13"); //Na ja, du warst ja noch nie ein Mann der Kirche. Dennoch kämpfst du für unsere Sache und das ist alles, was zählt.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_14"); //Ist das alles?
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_15"); //Ich freu mich natürlich, und so wie du rumläufst, hat bestimmt jeder Ork Angst vor dir.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_16"); //Es geht nicht nur um die Orks.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_17"); //Ich weiß, aber nichtsdestotrotz sind sie ein großes Problem. Du bist wichtig.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_18"); //Du hast den Schläfer besiegt. Wir alle werden deine Hilfe vielleicht noch einmal brauchen.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_19"); //Schon gut.
	};		
};	

// ************************************************************
// 	  				   Was machst du hier am Kloster
// ************************************************************

INSTANCE DIA_MiltenNW_Monastery(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 35;
	condition	= DIA_MiltenNW_Monastery_Condition;
	information	= DIA_MiltenNW_Monastery_Info;
	permanent	= FALSE;
	description = "Wie bist du so schnell zum Kloster gekommen?";
};                       
FUNC INT DIA_MiltenNW_Monastery_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_Monastery_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_Monastery_15_00"); //Wie bist du so schnell zum Kloster gekommen?
	AI_Output (self ,other,"DIA_MiltenNW_Monastery_03_01"); //Was soll die Frage? Ich habe mich durch den Pass geschlichen und dann auf direktem Wege zum Kloster begeben.
	AI_Output (self ,other,"DIA_MiltenNW_Monastery_03_02"); //Zugegeben, es war nicht immer leicht, den ganzen Monstern auszuweichen, die sich diesseits des Tales breit gemacht haben, aber letztlich hatte ich weniger Probleme als erwartet.
};

// ************************************************************
// 	  				   Weisst du wo die Anderen sind?
// ************************************************************

INSTANCE DIA_MiltenNW_FourFriends(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 35;
	condition	= DIA_MiltenNW_FourFriends_Condition;
	information	= DIA_MiltenNW_FourFriends_Info;
	permanent	= FALSE;
	description = "Weißt du, wo die anderen sind?";
};                       
FUNC INT DIA_MiltenNW_FourFriends_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_FourFriends_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_FourFriends_15_00"); //Weißt du, wo die anderen sind?
	if (Npc_IsDead (PC_FIGHTER_NW_vor_DJG) == FALSE)
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_01"); //Gorn hat seinen Kerkeraufenthalt bei Garond ganz gut verkraftet.
		
		if (MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output (other,self ,"DIA_MiltenNW_FourFriends_15_02"); //Wie ist er rausgekommen?
			AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_03"); //Ich musste Garond anlügen, damit er alle Anklagen fallen lässt.
			AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_04"); //Aber das bleibt unter uns, verstanden?
		};
		
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_05"); //Jedenfalls wollte er zu Lee und gucken, was auf dem Hof so passiert.
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_06"); //Nach dem Kerkeressen wird er sich wohl gerade den Wanst voll schlagen und die Vorräte der Söldner vor eine echte Bewährungsprobe stellen.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_07"); //Gorn hat's nicht geschafft.
	};
	if (Npc_IsDead (PC_THIEF_NW) == FALSE)
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_08"); //Diego hat was von einer Abrechnung gemurmelt. Keine Ahnung, was er damit meinte.
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_09"); //Ich vermute aber, dass er in der Stadt ist, du kennst ihn ja, immer da, wo was zu holen ist.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_10"); //Diego hat's erwischt, nun ist er doch noch in der Barriere geblieben.
	};
};
//*************************************************************
//Ich muss ins Kloster //HauptStory!!!
//*************************************************************

INSTANCE DIA_MiltenNW_KAP3_Entry(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 32;
	condition	= DIA_MiltenNW_KAP3_Entry_Condition;
	information	= DIA_MiltenNW_KAP3_Entry_Info;
	permanent	= TRUE;
	description = "Ich muss dringend ins Kloster!";
};                       
FUNC INT DIA_MiltenNW_KAP3_Entry_Condition()
{
	if (Kapitel == 3)	
	&& (hero.guild != GIL_KDF)
	&& (MiltenNW_GivesMonasteryKey == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP3_Entry_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_15_00"); //Ich muss dringend ins Kloster!
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_MiltenNW_KAP3_Entry_03_01"); //Ja, klar. Hier ist der Schlüssel.
		
		CreateInvItems (self,ItKe_Innos_Mis,1);
		B_GiveInvItems (self,other,ItKe_Innos_Mis,1); 
	
		MiltenNW_GivesMonasteryKey = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_03_02"); //Ich kann dich nicht ins Kloster lassen. Ich bekomme Ärger mit dem hohen Rat.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_03_03"); //Ohne Erlaubnis meiner Vorgesetzten darf ich niemanden ins Kloster lassen.
	
		Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice (DIA_MiltenNW_KAP3_Entry,DIALOG_Back,DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice (DIA_MiltenNW_KAP3_Entry,"Es ist wichtig!",DIA_MiltenNW_KAP3_Entry_Important);
	
		if (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS) >=1)
		{	
			Info_AddChoice (DIA_MiltenNW_KAP3_Entry,"Ich habe einen Brief von Lord Hagen.",DIA_MiltenNW_KAP3_Entry_Permit); 
		};
	};	
};	
	
FUNC VOID DIA_MiltenNW_KAP3_Entry_BACK ()
{
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};	

FUNC VOID DIA_MiltenNW_KAP3_Entry_Important ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_Important_15_00"); //Es ist wichtig!
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01"); //Es geht nicht. Pyrokar reißt mir den Kopf ab.
	
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};

FUNC VOID DIA_MiltenNW_KAP3_Entry_Permit ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_Permit_15_00"); //Ich habe einen Brief von Lord Hagen.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01"); //Zeig mal her.
	
	B_GiveInvItems (other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	B_UseFakeScroll ();	
	
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02"); //(zögerlich) In Ordnung. Hier hast du den Schlüssel vom Kloster. Pyrokar ist in der Kirche.
	
	CreateInvItems (self,ItKe_Innos_Mis,1);
	B_GiveInvItems (self,other,ItKe_Innos_Mis,1); 
	B_GiveInvItems (self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	
	MiltenNW_GivesMonasteryKey = TRUE;
	
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};

//***************************************************************
//	Hast du hier jemanden herauskommen gesehen?
//***************************************************************

INSTANCE DIA_MiltenNW_KAP3_NovizenChase(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 31;
	condition	= DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information	= DIA_MiltenNW_KAP3_NovizenChase_Info;
	permanent	= FALSE;
	description = "Weißt du, wo Pedro ist?";
};                       
FUNC INT DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	IF 	(Kapitel == 3) 
	&&	(MIS_NOVIZENCHASE == LOG_RUNNING) 
	&& 	(MIS_SCKnowsInnosEyeIsBroken == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_NovizenChase_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_NovizenChase_15_00"); //Weißt du, wo Pedro ist?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01"); //Glaubst du, ich würde hier rumstehen, wenn ich wüsste, wo der Abtrünnige sich aufhält.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02"); //Er muss für seine Taten bezahlen. Ich hoffe, es gelingt uns, das Auge zurück zu holen.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03"); //Du musst uns helfen. Finde ihn und bring uns das Auge Innos' zurück.
	//Joly: AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_04"); //Ich werde sehen, was ich tun kann.
};	

//***************************************************************
//	Weißt du etwas über die vermummten Gestalten?
//***************************************************************

INSTANCE DIA_MiltenNW_KAP3_Perm(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 39;
	condition	= DIA_MiltenNW_KAP3_Perm_Condition;
	information	= DIA_MiltenNW_KAP3_Perm_Info;
	permanent	= FALSE;
	description = "Weißt du etwas über die vermummten Gestalten?";
};                       
FUNC INT DIA_MiltenNW_KAP3_Perm_Condition()
{
	IF 	(Kapitel == 3)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_Perm_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Perm_15_00"); //Weißt du etwas über die vermummten Gestalten?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Perm_03_01"); //Nein, aber ich habe ein ungutes Gefühl bei diesen Typen.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Perm_03_02"); //Sieh dich vor, wenn du ihnen begegnest.
};	
	

//########################
//##					##
//##	Kapitel 4		##
//##					##
//########################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_MiltenNW_KAP4_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP4_EXIT_Condition;
	information	= DIA_MiltenNW_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   Perm KAP4
// ************************************************************

INSTANCE DIA_MiltenNW_KAP4_PERM(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 49;
	condition	= DIA_MiltenNW_KAP4_PERM_Condition;
	information	= DIA_MiltenNW_KAP4_PERM_Info;
	permanent	= TRUE;
	description = "Gibt es Neuigkeiten?";
};                       
FUNC INT DIA_MiltenNW_KAP4_PERM_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP4_PERM_15_00"); //Gibt es Neuigkeiten?
	AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_01"); //Da sollte ich wohl eher dich fragen. Hier machen wir uns weiterhin große Sorgen.
	AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_02"); //Der Hohe Rat versucht, den nächsten Schritt des Feindes herauszufinden.
	AI_Output (other,self ,"DIA_MiltenNW_KAP4_PERM_15_03"); //Sonst noch was?
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_04"); //Seit kurzem hört man vermehrt von Orküberfällen auch außerhalb des Minentals.
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_05"); //Das Ganze gefällt mir nicht, ich glaube, uns bleibt nicht mehr viel Zeit.
	}
	else if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_06"); //Ein Bauer berichtete von geschuppten Wesen in der Nähe seines Hofes.
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_07"); //Ich weiß nicht, was ich davon halten soll, aber ich glaube, der Feind hat irgend etwas vor.
	}
	else if (MIS_FindTheObesessed == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_08"); //Es tauchen immer mehr Berichte von Besessenen auf. Der Feind ist stark geworden, viel stärker als ich erwartet habe.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_09"); //Nein, die Lage ist weiterhin ernst. Alles was uns bleibt, ist Innos zu vertrauen.
	};
};

//########################
//##					##
//##	Kapitel 5		##
//##					##
//########################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_MiltenNW_KAP5_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP5_EXIT_Condition;
	information	= DIA_MiltenNW_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_MiltenNW_AllDragonsDead(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 900;
	condition	= DIA_MiltenNW_AllDragonsDead_Condition;
	information	= DIA_MiltenNW_AllDragonsDead_Info;
	permanent	= FALSE;
	description = "Ich habe alle Drachen getötet.";
};                       
FUNC INT DIA_MiltenNW_AllDragonsDead_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_AllDragonsDead_15_00"); //Ich habe alle Drachen getötet.
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_01"); //Ehrlich? Das ist ja mehr als ein Hoffnungsschimmer am Horizont. Jetzt müssen wir dem Bösen nur noch den Kopf abschlagen.
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_02"); //Wenn du das geschafft hast, dann werden wir den Krieg gewinnen.
	AI_Output (other,self ,"DIA_MiltenNW_AllDragonsDead_15_03"); //Ich?
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_04"); //Natürlich du. Wer denn sonst?
	
	if (MiltenNW_IsOnBoard	 == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_05"); //Wir sollten bald aufbrechen, ansonsten könnte es zu spät sein.
	};
};

///////////////////////////////////////////////////////////////////////
//	In Bibliothek gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_SCWasInLib		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	3;
	condition	 = 	DIA_MiltenNW_SCWasInLib_Condition;
	information	 = 	DIA_MiltenNW_SCWasInLib_Info;
	important	 = 	TRUE;

};
func int DIA_MiltenNW_SCWasInLib_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_SCWasInLib_Info ()
{
	AI_Output			(self, other, "DIA_MiltenNW_SCWasInLib_03_00"); //Hey, ich hab' gehört, du warst ziemlich lange im Keller des Klosters. Was hast du herausgefunden?
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_KnowWhereEnemy_Condition;
	information	 = 	DIA_MiltenNW_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ich weiß jetzt, wo sich der Feind versteckt hält.";
};

func int DIA_MiltenNW_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (MiltenNW_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
var int SCToldMiltenHeKnowWhereEnemy;
func void DIA_MiltenNW_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_KnowWhereEnemy_15_00"); //Ich weiß jetzt, wo sich der Feind versteckt hält. Es ist eine kleine Insel, nicht weit von hier.
	AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_01"); //Das ist unsere große Chance. Wir müssen sofort aufbrechen und das Böse endgültig vernichten.
	SCToldMiltenHeKnowWhereEnemy = TRUE;
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);  
  	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
  	if ((Npc_IsDead(DiegoNW))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_02"); //Hast du schon mit Diego darüber gesprochen? Ich denke, er wird dich begleiten wollen.
 		B_LogEntry (TOPIC_Crew,"Diego könnte eine grosse Hilfe sein. Ihn hat es nie lange an einem Ort gehalten.");
 	};

  	if ((Npc_IsDead(GornNW_nach_DJG))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_03"); //Was ist mit Gorn? Rede mal mit ihm. Ich habe gehört, dass er wieder aus dem Minental zurückgekehrt ist.
 		B_LogEntry (TOPIC_Crew,"Gorn wär sicherlich eine gute Verstärkung. Ein guter Kämpfer kann nicht falsch sein. Vielleicht kann er mich ja unterrichten.");
 	};
	
	if ((Npc_IsDead(Lester))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_04"); //Und vergiss Lester nicht. Wenn du ihn nicht aus seinem Tal heraus holst, wird er da noch vergammeln.
 		B_LogEntry (TOPIC_Crew,"Wenn ich Lester nicht mitnehme, wird er wohl nie aus seinem Tal kommen.");
 	};
	
	AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_05"); //Meine Rolle dabei kenne ich auch schon. Ich kann dein Mana steigern und im Runenbau behilflich sein wenn wir gegen den Feind antreten. Wann geht's los?
	
	B_LogEntry (TOPIC_Crew,"Falls Milten mich begleitet, kann er mir beibringen Runen zu erschaffen und mein Mana zu steigern.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_MiltenNW_KnowWhereEnemy_15_06"); //Nicht so schnell, ich hab schon genug Leute beisammen.
		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_07"); //Du weißt, ich wäre mit dir gegangen. Wenn du es dir anders überlegen solltest, werde ich hier auf dich warten.
		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_08"); //Viel Glück und möge Innos seine schützende Hand über dich halten.
	}
	else 
	{
		Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice (DIA_MiltenNW_KnowWhereEnemy,"Ich kann dich im Moment nicht gebrauchen.",DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_MiltenNW_KnowWhereEnemy,"Willkommen an Bord",DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_MiltenNW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00"); //Willkommen an Bord!
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01"); //Wir treffen uns am besten am Hafen. Warte dort auf mich.
	AI_Output (self ,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02"); //Gut, wenn du soweit bist, werde ich dort sein.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard	 = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Crewmember_Success);
	
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
};

FUNC VOID DIA_MiltenNW_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_No_15_00"); //Ich kann dich im Moment nicht gebrauchen.
	AI_Output (self ,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01"); //Du weißt, dass ich dich bis zum Schluss begleitet hätte. Falls du es dir noch einmal überlegst, werde ich hier auf dich warten.

	MiltenNW_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	WhereCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_WhereCaptain		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	3;
	condition	 = 	DIA_MiltenNW_WhereCaptain_Condition;
	information	 = 	DIA_MiltenNW_WhereCaptain_Info;
	
	description	 = 	"Wo soll ich nach einem Kapitän suchen?";

};
func int DIA_MiltenNW_WhereCaptain_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (SCToldMiltenHeKnowWhereEnemy == TRUE)
	&& (SCGotCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_WhereCaptain_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_WhereCaptain_15_00"); //Wo soll ich nach einem Kapitän suchen?
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_01"); //Frag doch mal Jorgen. Der ist doch Seemann. Er müsste eigentlich noch im Kloster sein.
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_02"); //Wenn er dir allerdings nicht weiter helfen kann, wirst du auf den Bauerhöfen oder in der Stadt nach jemanden suchen müssen, der ein Schiff steuern kann.
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_03"); //Sprich am besten mal mit Lee oder geh zum Hafen von Khorinis. Was Besseres fällt mir im Moment nicht ein.
 
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                                                            
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                                                          
	B_LogEntry (TOPIC_Captain,"Jorgen könnte vieleicht als Kapitän bei mir anheuern. Er sollte sich eigentlich noch im Kloster aufhalten. Anosnsten sollte es noch Kanidaten auf den Höfen oder in der Stadt geben. Vielleicht sollte ich mit Lee sprechen oder mich mal im Hafen umhören.");
	
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_LeaveMyShip_Condition;
	information	 = 	DIA_MiltenNW_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ich kann dich doch nicht mitnehmen.";
};
func int DIA_MiltenNW_LeaveMyShip_Condition ()
{	
	if (MiltenNW_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_LeaveMyShip_15_00"); //Ich kann dich doch nicht mitnehmen.
	AI_Output			(self, other, "DIA_MiltenNW_LeaveMyShip_03_01"); //Du weißt am Besten, wen du gebrauchen kannst. Falls du es dir anders überlegst, werde ich im Kloster auf dich warten.
	
	MiltenNW_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_StillNeedYou_Condition;
	information	 = 	DIA_MiltenNW_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Ich brauche dich.";
};
func int DIA_MiltenNW_StillNeedYou_Condition ()
{	
	if ((MiltenNW_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man natürlich nur eine variable abfragen
	|| (MiltenNW_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_StillNeedYou_15_00"); //Ich brauche dich.

	AI_Output	(self, other, "DIA_MiltenNW_StillNeedYou_03_01"); //Deine Entscheidung ehrt mich. Los, wir haben keine Zeit zu verlieren.
	AI_Output	(self, other, "DIA_MiltenNW_StillNeedYou_03_02"); //Ich geh schon mal zum Hafen. Wir treffen uns dort.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	
		AI_StopProcessInfos (self);
};



// ************************************************************
// 		Teach
// ************************************************************
INSTANCE DIA_MiltenNW_Teach(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 90;
	condition	= DIA_MiltenNW_Teach_Condition;
	information	= DIA_MiltenNW_Teach_Info;
	permanent	= TRUE;
	description = "Ich will neue Zauber lernen.";
};                       

FUNC INT DIA_MiltenNW_Teach_Condition()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenNW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_Teach_15_00");//Ich will neue Zauber lernen.
	
	if  (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices (DIA_MiltenNW_Teach);
		Info_AddChoice (DIA_MiltenNW_Teach,DIALOG_BACK,DIA_MiltenNW_Teach_BACK);
		
		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_MiltenNW_Teach_Windfist);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_MiltenNW_Teach_Feuerball);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_MiltenNW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_Teach_03_01");//Du hast noch nicht den zweiten Kreis der Magie erreicht. Ich kann dir nichts beibringen.
	};
};	
FUNC VOID DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices (DIA_MiltenNW_Teach);
};
FUNC VOID DIA_MiltenNW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_MiltenNW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_MiltenNW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_Mana		(C_INFO)
{
	npc		  	 = 	PC_Mage_NW;
	nr			 = 	100;
	condition	 = 	DIA_MiltenNW_Mana_Condition;
	information	 = 	DIA_MiltenNW_Mana_Info;
	permanent	 = 	TRUE;
	description	 = 	"Ich will meine magischen Kräfte steigern.";
};
func int DIA_MiltenNW_Mana_Condition ()
{	
	if (other.guild == GIL_KDF)	
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_Mana_Info ()
{
	AI_Output (other, self, "DIA_MiltenNW_Mana_15_00"); //Ich will meine magischen Kräfte steigern.
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
};
func void DIA_MiltenNW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenNW_Mana_03_00"); //Deine magische Kraft ist groß. Zu groß, als dass ich dir jetzt noch helfen könnte, sie zu steigern.
	};
	Info_ClearChoices (DIA_MiltenNW_Mana);
};
func void DIA_MiltenNW_Mana_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
	
};
func void DIA_MiltenNW_Mana_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mage_NW_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 900;
	condition	= DIA_Mage_NW_PICKPOCKET_Condition;
	information	= DIA_Mage_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Mage_NW_PICKPOCKET_Condition()
{
	C_Beklauen (56, 75);
};
 
FUNC VOID DIA_Mage_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mage_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Mage_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Mage_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mage_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mage_NW_PICKPOCKET_DoIt);
};

func void DIA_Mage_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mage_NW_PICKPOCKET);
};
	
func void DIA_Mage_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mage_NW_PICKPOCKET);
};


