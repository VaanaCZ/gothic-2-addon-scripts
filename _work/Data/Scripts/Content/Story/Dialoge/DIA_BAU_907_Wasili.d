// ************************************************************
// 							EXIT
// ************************************************************
INSTANCE DIA_Wasili_EXIT   (C_INFO)
{
	npc         = BAU_907_Wasili;
	nr          = 999;
	condition   = DIA_Wasili_EXIT_Condition;
	information = DIA_Wasili_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Wasili_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wasili_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 							Hallo
// ************************************************************
instance DIA_Wasili_HALLO (C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr          = 1;
	condition	= DIA_Wasili_HALLO_Condition;
	information	= DIA_Wasili_HALLO_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Wasili_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};	
};

func void DIA_Wasili_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Wasili_HALLO_01_00"); //Lass dir nicht einfallen, hier was anzufassen. Sonst gibt's ein paar hinter die Ohren, klar?
};


// ************************************************************
// 								Job
// ************************************************************
instance DIA_Wasili_Job (C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr          = 1;
	condition	= DIA_Wasili_Job_Condition;
	information	= DIA_Wasili_Job_Info;
	permanent 	= FALSE;
	description	= "Was ist deine Aufgabe?";
};

func int DIA_Wasili_Job_Condition ()
{
	return TRUE;
};

func void DIA_Wasili_Job_Info ()
{
	AI_Output (other, self, "DIA_Wasili_Job_15_00"); //Was ist deine Aufgabe?
	AI_Output (self, other, "DIA_Wasili_Job_01_01"); //Onar will, dass ich den ganzen Tag auf seinen Krempel aufpasse.
	AI_Output (self, other, "DIA_Wasili_Job_01_02"); //Er macht sich Sorgen, dass was wegkommt. Und das würde ich an seiner Stelle auch.
	AI_Output (self, other, "DIA_Wasili_Job_01_03"); //Die meisten der Söldner, die er angeheuert hat, sind ehemalige Sträflinge aus der Minenkolonie.
	AI_Output (self, other, "DIA_Wasili_Job_01_04"); //Die lassen doch alles mitgehen, was nicht niet- und nagelfest ist, wenn keiner aufpasst.
};


// ************************************************************
// 								Sammler
// ************************************************************
instance DIA_Wasili_Sammler	(C_INFO)
{
	npc			= BAU_907_Wasili;
	nr		 	= 4;
	condition	= DIA_Wasili_Sammler_Condition;
	information	= DIA_Wasili_Sammler_Info;
	permanent 	= FALSE;
	description	= "Eine Menge Krempel gibt es hier.";
};

func int DIA_Wasili_Sammler_Condition ()
{
	return TRUE;
};

func void DIA_Wasili_Sammler_Info ()
{
	AI_Output (other, self, "DIA_Wasili_Sammler_15_00"); //Eine Menge Krempel gibt es hier.
	AI_Output (self, other, "DIA_Wasili_Sammler_01_01"); //Das ist richtig, und das meiste davon ist auch extrem wertvoll. Onar sammelt wertvolle Gegenstände.
	AI_Output (self, other, "DIA_Wasili_Sammler_01_02"); //Ein einfacher Mann wie ich kann sich solchen Luxus kaum leisten. Ich halte mich an andere Dinge.
	AI_Output (other, self, "DIA_Wasili_Sammler_15_03"); //Nämlich?
	AI_Output (self, other, "DIA_Wasili_Sammler_01_04"); //Ich sammle alte Münzen.
	
	MIS_Wasili_BringOldCoin = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info FirstOldCoin
///////////////////////////////////////////////////////////////////////
instance DIA_Wasili_FirstOldCoin		(C_INFO)
{
	npc		 = 	BAU_907_Wasili;
	nr		 = 	5;
	condition	 = 	DIA_Wasili_FirstOldCoin_Condition;
	information	 = 	DIA_Wasili_FirstOldCoin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ich habe hier eine alte Münze.";
};

var int Wasili_BringOldCoin_NoMore;
func int DIA_Wasili_FirstOldCoin_Condition ()
{
	if (MIS_Wasili_BringOldCoin == LOG_RUNNING)
	&& (WasilisOldCoinOffer == 0)
	&& (Npc_HasItems (other,ItMi_OldCoin) >= 1)
	&& (Wasili_BringOldCoin_NoMore == FALSE)
		{
				return TRUE;
		};
};
var int WasilisOldCoinOffer;
var int FirstOldCoin_angebotenXP_OneTime;
var int DIA_Wasili_FirstOldCoin_mehr_OneTime;
func void DIA_Wasili_FirstOldCoin_Info ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_15_00"); //Ich habe hier eine alte Münze.
	if (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_01"); //Mmmh. Zeig mal her.
	};

	B_GiveInvItems (other, self, ItMi_OldCoin,1);

	if (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_02"); //Oh, ja. Die bringt auf dem freien Markt nichts mehr ein.
	};

	if (DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_03"); //Ich zahl dir eine Goldmünze dafür. Genau so viel, wie sie einmal wert war.
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_01_04"); //Du Hund weißt, was ich dafür zu zahlen bereit bin. Eine Goldmünze. Nicht mehr.
	};
	
	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Ne, dann behalte ich sie lieber.", DIA_Wasili_FirstOldCoin_nein );
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Ein bisschen wenig. Wie wär´s mit 2?", DIA_Wasili_FirstOldCoin_mehr );
	Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Abgemacht.", DIA_Wasili_FirstOldCoin_ok );

	IF (FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
	B_GivePlayerXP (XP_BringOldCoin);
	FirstOldCoin_angebotenXP_OneTime = TRUE;
	};
};
func void DIA_Wasili_FirstOldCoin_ok ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_ok_15_00"); //Abgemacht.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_01"); //Gut.

	if (WasilisOldCoinOffer == 2)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_02"); //Hier hast du deine 2 Goldmünzen.
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ok_01_03"); //Wenn du noch mehr davon hast, weißt du ja, wo du MICH findest.
		WasilisOldCoinOffer = 1;	
	};

	CreateInvItems (self, ItMi_Gold, WasilisOldCoinOffer);									
	B_GiveInvItems (self, other, ItMi_Gold,	WasilisOldCoinOffer);

	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_mehr ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_mehr_15_00"); //Ein bisschen wenig. Wie wär's mit 2?

	if (DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_mehr_01_01"); //Nix da. Ich bin doch nicht bescheuert! Verschwinde!
		DIA_Wasili_FirstOldCoin_mehr_OneTime = TRUE;
		B_GiveInvItems (self, other, ItMi_OldCoin,1);
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_mehr_01_02"); //Arrgh. Verdammt. Na gut. 2 Goldmünzen für jede alte Münze, die du mir bringen kannst, das ist mein letztes Wort.
		WasilisOldCoinOffer =	2;
		Info_AddChoice	(DIA_Wasili_FirstOldCoin, "Wenn das so ist, können es auch 3 sein.", DIA_Wasili_FirstOldCoin_ZumTeufel );
	};
};

func void DIA_Wasili_FirstOldCoin_nein ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_nein_15_00"); //Ne, dann behalte ich sie lieber.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_nein_01_01"); //Die hat eh keinen Wert für dich. Du kommst wieder.
	B_GiveInvItems (self, other, ItMi_OldCoin,1);
	WasilisOldCoinOffer = 0;
	Info_ClearChoices	(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_ZumTeufel ()
{
	AI_Output			(other, self, "DIA_Wasili_FirstOldCoin_ZumTeufel_15_00"); //Wenn das so ist, können es auch 3 sein.
	AI_Output			(self, other, "DIA_Wasili_FirstOldCoin_ZumTeufel_01_01"); //Geh zum Teufel, du Dreckskerl.
	AI_StopProcessInfos (self);
	Wasili_BringOldCoin_NoMore = TRUE;
	WasilisOldCoinOffer = 0;
};

///////////////////////////////////////////////////////////////////////
//	Info BringOldCoin
///////////////////////////////////////////////////////////////////////

instance DIA_Wasili_BringOldCoin		(C_INFO)
{
	npc		 = 	BAU_907_Wasili;
	nr		 = 	5;
	condition	 = 	DIA_Wasili_BringOldCoin_Condition;
	information	 = 	DIA_Wasili_BringOldCoin_Info;
	permanent	 = 	TRUE;

	description	 = 	"Interesse an weiteren alten Münzen?";
};

func int DIA_Wasili_BringOldCoin_Condition ()
{
	if (WasilisOldCoinOffer > 0)
	&& (Npc_HasItems (other,ItMi_OldCoin) >= 1)
	&& (Wasili_BringOldCoin_NoMore == FALSE)
		{
				return TRUE;
		};
};

var int OldCoinCounter;

func void DIA_Wasili_BringOldCoin_Info ()
{
	AI_Output			(other, self, "DIA_Wasili_BringOldCoin_15_00"); //Interesse an weiteren alten Münzen?
	AI_Output			(self, other, "DIA_Wasili_BringOldCoin_01_01"); //Sicher. Hast du noch welche?

	var int OldCoinCount;
	var int XP_BringOldCoins;
	var int OldCoinGeld;

	OldCoinCount = Npc_HasItems(other, ItMi_OldCoin);


		if (OldCoinCount == 1)
			{
				AI_Output		(other, self, "DIA_Wasili_BringOldCoin_15_02"); //Eine.
				B_GivePlayerXP (XP_BringOldCoin);
				B_GiveInvItems (other, self, ItMi_OldCoin,1);
				OldCoinCounter = OldCoinCounter + 1;
			}
		else
			{
				AI_Output		(other, self, "DIA_Wasili_BringOldCoin_15_03"); //Ein paar.
	
				B_GiveInvItems (other, self, ItMi_OldCoin,  OldCoinCount);
	
				XP_BringOldCoins = (OldCoinCount * XP_BringOldCoin);
				OldCoinCounter = (OldCoinCounter + OldCoinCount); 
	
				B_GivePlayerXP (XP_BringOldCoins);
			};

	AI_Output			(self, other, "DIA_Wasili_BringOldCoin_01_04"); //Danke. Hier ist dein Geld. Bring mir alle, die du finden kannst.

	OldCoinGeld	= (OldCoinCount * WasilisOldCoinOffer);

	CreateInvItems (self, ItMi_Gold, OldCoinGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, OldCoinGeld);
};


// ************************************************************
// 								PERM
// ************************************************************
instance DIA_Wasili_PERM	(C_INFO)
{
	npc		 	= BAU_907_Wasili;
	nr		 	= 900;
	condition	= DIA_Wasili_PERM_Condition;
	information	= DIA_Wasili_PERM_Info;
	permanent	= TRUE;
	description	= "Hat schon wer versucht, was zu stehlen?";
};

func int DIA_Wasili_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Wasili_Job))
		{
				return TRUE;
		};
};

func void DIA_Wasili_perm_Info ()
{
	AI_Output (other, self, "DIA_Wasili_PERM_15_00"); //Hat schon wer versucht, was zu stehlen?

	if (Kapitel <= 2)
	{
		if (PETZCOUNTER_Farm_Theft > 0)
		{
			AI_Output (self, other, "DIA_Wasili_PERM_01_01"); //Du meinst außer dir?
		};
		AI_Output (self, other, "DIA_Wasili_PERM_01_02"); //Einige! Und ich hab sie alle erwischt!
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Wasili_PERM_01_03"); //Vor ein paar Nächten schlich hier einer der Söldner durchs Haus.
		AI_Output (self, other, "DIA_Wasili_PERM_01_04"); //Er hatte sich einen schwarzen Kapuzenmantel angezogen, damit ich ihn nicht sehe.
		AI_Output (self, other, "DIA_Wasili_PERM_01_05"); //Aber ich habe ihn in die Flucht geschlagen.
	};
	
	if (kapitel == 4)
	{
		AI_Output (self, other, "DIA_Wasili_perm_01_06"); //Nein. In letzter Zeit nicht.
	};
	
	if (kapitel >= 5)
	{
		AI_Output (self, other, "DIA_Wasili_perm_01_07"); //Es herrscht hier allgemeine Aufbruchstimmung bei den Söldnern.
		AI_Output (self, other, "DIA_Wasili_perm_01_08"); //Würde mich nicht wundern, wenn Lee mit seinen Jungs die Insel über Nacht verlassen würde.
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Wasili_PICKPOCKET (C_INFO)
{
	npc			= BAU_907_Wasili;
	nr			= 900;
	condition	= DIA_Wasili_PICKPOCKET_Condition;
	information	= DIA_Wasili_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Wasili_PICKPOCKET_Condition()
{
	C_Beklauen (55, 90);
};
 
FUNC VOID DIA_Wasili_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Wasili_PICKPOCKET);
	Info_AddChoice		(DIA_Wasili_PICKPOCKET, DIALOG_BACK 		,DIA_Wasili_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Wasili_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Wasili_PICKPOCKET_DoIt);
};

func void DIA_Wasili_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Wasili_PICKPOCKET);
};
	
func void DIA_Wasili_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Wasili_PICKPOCKET);
};


