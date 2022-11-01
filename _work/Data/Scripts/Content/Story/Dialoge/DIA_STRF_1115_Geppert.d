///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Geppert_EXIT   (C_INFO)
{
	npc         = STRF_1115_Geppert;
	nr          = 999;
	condition   = DIA_Geppert_EXIT_Condition;
	information = DIA_Geppert_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Geppert_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Geppert_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Geppert_HALLO		(C_INFO)
{
	npc		 = 	STRF_1115_Geppert;
	nr		 = 	4;
	condition	 = 	DIA_Geppert_HALLO_Condition;
	information	 = 	DIA_Geppert_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Geppert_HALLO_Condition ()
{
	return TRUE;
};
var int Kervo_GotStuff;
func void DIA_Geppert_HALLO_Info ()
{
	if ((Npc_IsDead(Kervo))==FALSE)
	&& (Kervo_GotStuff == FALSE)
	{
		if (hero.guild == GIL_KDF)
		{
			CreateInvItems (Kervo, ItMi_RuneBlank, 1);									
		}
		else
		{
			CreateInvItems (Kervo, ItMi_Nugget, 1);									
		};
		Kervo_GotStuff = TRUE;
	};	
	
	AI_Output			(self, other, "DIA_Geppert_HALLO_10_00"); //Halte ! Qui va là ?
	AI_Output			(self, other, "DIA_Geppert_HALLO_10_01"); //Vous n'êtes pas là pour me renvoyer à la mine, si ?
	AI_Output			(self, other, "DIA_Geppert_HALLO_10_02"); //Parce que si c'est le cas, désolé de vous décevoir, mais je n'y retournerai pas.
	

	Info_ClearChoices	(DIA_Geppert_HALLO);
	Info_AddChoice	(DIA_Geppert_HALLO, "Que faites-vous ici ?", DIA_Geppert_HALLO_Wasmachtihr );
	Info_AddChoice	(DIA_Geppert_HALLO, "Vous êtes un détenu en fuite, n'est-ce pas ?", DIA_Geppert_HALLO_Flucht );
};

func void DIA_Geppert_HALLO_Flucht ()
{
	AI_Output			(other, self, "DIA_Geppert_HALLO_Flucht_15_00"); //Vous êtes un prisonnier évadé, n'est-ce pas ?
	AI_Output			(self, other, "DIA_Geppert_HALLO_Flucht_10_01"); //Quelle déduction ! Pour quelle raison aurais-je rampé dans ce trou puant sinon ?
	Info_ClearChoices	(DIA_Geppert_HALLO);
};

func void DIA_Geppert_HALLO_Wasmachtihr ()
{
	AI_Output			(other, self, "DIA_Geppert_HALLO_Wasmachtihr_15_00"); //Que faites-vous ici ?
	
	if 	((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
			{
				AI_Output			(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_01"); //Vous posez vraiment des questions débiles, vous. Je me cache des soldats tels que vous.
				AI_Output			(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_02"); //Arrêtez de tourner autour du pot. Tuez-moi ou tirez-vous !
			}
			else
			{
				AI_Output			(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_03"); //Ça, c'est une question stupide ou je ne m'y connais pas ! Je me cache, évidemment. Ces pourris de la milice ont des espions partout.
			};

	AI_Output			(self, other, "DIA_Geppert_HALLO_Wasmachtihr_10_04"); //Il est hors de question que je retourne à la mine !
	Info_ClearChoices	(DIA_Geppert_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info Braten
///////////////////////////////////////////////////////////////////////
instance DIA_Geppert_BRATEN		(C_INFO)
{
	npc		 = 	STRF_1115_Geppert;
	nr		 = 	5;
	condition	 = 	DIA_Geppert_BRATEN_Condition;
	information	 = 	DIA_Geppert_BRATEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Ce rôti sent bon.";
};

func int DIA_Geppert_BRATEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Geppert_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Geppert_BRATEN_Info ()
{
	AI_Output			(other, self, "DIA_Geppert_BRATEN_15_00"); //Ce rôti sent bon.
	AI_Output			(self, other, "DIA_Geppert_BRATEN_10_01"); //Pas touche !
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Geppert_PICKPOCKET (C_INFO)
{
	npc			= STRF_1115_Geppert;
	nr			= 900;
	condition	= DIA_Geppert_PICKPOCKET_Condition;
	information	= DIA_Geppert_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Geppert_PICKPOCKET_Condition()
{
	C_Beklauen (56, 5);
};
 
FUNC VOID DIA_Geppert_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Geppert_PICKPOCKET);
	Info_AddChoice		(DIA_Geppert_PICKPOCKET, DIALOG_BACK 		,DIA_Geppert_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Geppert_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Geppert_PICKPOCKET_DoIt);
};

func void DIA_Geppert_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Geppert_PICKPOCKET);
};
	
func void DIA_Geppert_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Geppert_PICKPOCKET);
};


