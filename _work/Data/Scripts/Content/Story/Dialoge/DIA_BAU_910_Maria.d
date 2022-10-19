// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Maria_EXIT   (C_INFO)
{
	npc         = BAU_910_Maria;
	nr          = 999;
	condition   = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Maria_Hallo		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 1;
	condition	= DIA_Maria_Hallo_Condition;
	information	= DIA_Maria_Hallo_Info;
	permanent  	= FALSE;
	description = "Wer bist du?";
};

func int DIA_Maria_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Maria_Hallo_15_00"); //Wer bist du?
	AI_Output (self, other, "DIA_Maria_Hallo_17_01"); //Ich bin Maria, die Frau von Onar.
	AI_Output (self, other, "DIA_Maria_Hallo_17_02"); //Was willst du hier?
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Umsehen		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 2;
	condition	= DIA_Maria_Umsehen_Condition;
	information	= DIA_Maria_Umsehen_Info;
	permanent  	= FALSE;
	description = "Ich wollte mich hier mal umsehen...";
};

func int DIA_Maria_Umsehen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info ()
{
	AI_Output (other, self, "DIA_Maria_Umsehen_15_00"); //Ich wollte mich hier mal umsehen...
	AI_Output (self, other, "DIA_Maria_Umsehen_17_01"); //Seit die ganzen Kerle auf dem Hof sind, hat man hier im Haus keine Ruhe mehr.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_02"); //Dauernd kommt einer reingestiefelt.
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Soeldner	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 3;
	condition	= DIA_Maria_Soeldner_Condition;
	information	= DIA_Maria_Soeldner_Info;
	permanent  	= FALSE;
	description = "Stören dich die Söldner?";
};

func int DIA_Maria_Soeldner_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info ()
{
	AI_Output (other, self, "DIA_Maria_Soeldner_15_00"); //Stören dich die Söldner?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_01"); //Na ja, ich will ja nichts gesagt haben, seit ihr hier seid, ist es sehr viel sicherer geworden.
		}
	else
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_02"); //Na ja, seit die Söldner hier sind, ist der Hof viel sicherer geworden.
		};

	AI_Output (self, other, "DIA_Maria_Soeldner_17_03"); //Damals, als wir noch auf uns allein gestellt waren, kamen regelmäßig die Milizen aus der Stadt und haben uns ausgeplündert.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_04"); //Einen Großteil der Ernte haben sie weggeschleppt. Und auch einige Schafe haben sie mitgenommen. Getan haben sie dafür nichts.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_05"); //Ein paar von den Mistkerlen haben uns sogar bestohlen.
	if (hero.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_06"); //Nimm mir das jetzt nicht übel, Soldat. Ich weiß, ihr seid nicht alle so.
		};	
};

// ************************************************************
// 							Mission
// ************************************************************
instance DIA_Maria_Mission	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 4;
	condition	= DIA_Maria_Mission_Condition;
	information	= DIA_Maria_Mission_Info;
	permanent  	= FALSE;
	description = "Was wurde dir gestohlen?";
};

func int DIA_Maria_Mission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Soeldner))
	&& (MIS_Maria_BringPlate != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info ()
{
	AI_Output (other, self, "DIA_Maria_Mission_15_00"); //Was wurde dir gestohlen?
	AI_Output (self, other, "DIA_Maria_Mission_17_01"); //Vor allem Gold und Silber. Sie haben sogar mein Hochzeitsgeschenk gestohlen. Einen goldenen Teller.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Maria_Mission_17_02"); //Ich wette, irgendein dreckiger Stadtgardist hat ihn in seiner Truhe liegen, und da verstaubt er jetzt.
	};
	MIS_Maria_BringPlate = LOG_RUNNING;
};

// ************************************************************
// 							BringPlate
// ************************************************************
instance DIA_Maria_BringPlate	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 5;
	condition	= DIA_Maria_BringPlate_Condition;
	information	= DIA_Maria_BringPlate_Info;
	permanent  	= FALSE;
	description = "Ich habe hier einen goldenen Teller. Ist es deiner?";
};

func int DIA_Maria_BringPlate_Condition ()
{
	if (Npc_HasItems (other, ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info ()
{
	B_GiveInvItems (other, self, ItMi_MariasGoldPlate, 1);
	AI_Output (other, self, "DIA_Maria_BringPlate_15_00"); //Ich habe hier einen goldenen Teller. Ist es deiner?
	AI_Output (self, other, "DIA_Maria_BringPlate_17_01"); //Ja! Das ist er. Tausend Dank!
	
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP (XP_Maria_Teller);
};


// ************************************************************
// 							BringPlate
// ************************************************************
var int Maria_Belohnung;
// ---------------------

instance DIA_Maria_Belohnung	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 6;
	condition	= DIA_Maria_Belohnung_Condition;
	information	= DIA_Maria_Belohnung_Info;
	permanent  	= TRUE;
	description = "Wie sieht's mit meiner Belohnung aus?";
};

func int DIA_Maria_Belohnung_Condition ()
{
	if (MIS_Maria_BringPlate == LOG_SUCCESS)
	&& (Maria_Belohnung == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_15_00"); //Wie sieht's mit meiner Belohnung aus?
	
	
	if (other.guild == GIL_SLD)
	|| (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_01"); //Du arbeitest doch für meinen Mann als Söldner, richtig?
		AI_Output (other, self, "DIA_Maria_Belohnung_15_02"); //Richtig.
		AI_Output (self, other, "DIA_Maria_Belohnung_17_03"); //Wie viel zahlt mein Mann dir?
		B_Say_Gold (other, self, SOLD);
		AI_Output (self, other, "DIA_Maria_Belohnung_17_04"); //Das ist zu wenig. Geh zu ihm und sag ihm, er soll dir mehr zahlen.
		AI_Output (other, self, "DIA_Maria_Belohnung_15_05"); //Und du denkst, das wird er tun?
		AI_Output (self, other, "DIA_Maria_Belohnung_17_06"); //Er weiß, was passiert, wenn er es nicht tut. Glaub mir.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_07"); //Willst du hier auf dem Hof als Söldner anheuern?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, "Nein - eigentlich nicht.", DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, "Ja.", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output (self, other, "DIA_Maria_Belohnung_17_08"); //Hier, nimm. Du hast es verdient.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_Gold_15_00"); //Nein - eigentlich nicht.
	B_GiveInvItems (self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output (self, other, "DIA_Maria_Belohnung_Gold_17_01"); //Dann nimm das Gold hier als Belohnung. Du hast es verdient.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //Ja.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //Gut, wenn du hier arbeitest, werde ich dafür sorgen, dass du ordentlich bezahlt wirst.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //Komm wieder, wenn du mit meinem Mann über deinen Lohn gesprochen hast.
	Info_ClearChoices (DIA_Maria_Belohnung);
};
		
// ************************************************************
// 							AboutOnar
// ************************************************************
instance DIA_Maria_AboutOnar	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 7;
	condition	= DIA_Maria_AboutOnar_Condition;
	information	= DIA_Maria_AboutOnar_Info;
	permanent  	= FALSE;
	description = "Erzähl mir über Onar.";
};

func int DIA_Maria_AboutOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info ()
{
	AI_Output (other, self, "DIA_Maria_AboutOnar_15_00"); //Erzähl mir über Onar.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_01"); //Er ist ein guter Mann. Etwas brummig und sehr ungeduldig, aber jeder hat seine Fehler.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_02"); //Ich habe meinem Mann gesagt, warum lässt du dich von den Soldaten aus der Stadt so unterbuttern?
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_03"); //Tu was, hab ich gesagt.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_04"); //Daraufhin hat er die Söldner angeheuert. Jetzt komme ich mir hier vor wie im Krieg.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_05"); //Aber schließlich ist ja auch Krieg, nicht?
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Maria_PERM	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 8;
	condition	= DIA_Maria_PERM_Condition;
	information	= DIA_Maria_PERM_Info;
	permanent  	= FALSE;
	description = "Ist hier in letzter Zeit was aufregendes passiert?";
};

func int DIA_Maria_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info ()
{
	AI_Output (other, self, "DIA_Maria_PERM_15_00"); //Ist hier in letzter Zeit was Aufregendes passiert?
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_01"); //Die Paladine sind hier in der Nähe vorbeigezogen.
		AI_Output (self, other, "DIA_Maria_PERM_17_02"); //Wir dachten erst, sie wollen den Hof angreifen, aber sie sind ins Minental gewandert.
	}
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_03"); //Wasili hat vor ein paar Nächten einen Dieb verjagt. Sonst war alles ruhig.
	};
	
	if (Kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_04"); //Seit ein Teil der Söldner weg ist, ist es hier ruhiger geworden.
	};
};
			

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maria_PICKPOCKET (C_INFO)
{
	npc			= BAU_910_Maria;
	nr			= 900;
	condition	= DIA_Maria_PICKPOCKET_Condition;
	information	= DIA_Maria_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Maria_PICKPOCKET_Condition()
{
	C_Beklauen (60, 110);
};
 
FUNC VOID DIA_Maria_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maria_PICKPOCKET);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_BACK 		,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};
	
func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};


			
			
			
			



	















