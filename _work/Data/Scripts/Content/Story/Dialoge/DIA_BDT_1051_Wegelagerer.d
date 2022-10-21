//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_1051_Wegelagerer_EXIT   (C_INFO)
{
	npc         = BDT_1051_Wegelagerer;
	nr          = 999;
	condition   = DIA_1051_Wegelagerer_EXIT_Condition;
	information = DIA_1051_Wegelagerer_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
var int BDT_1051_Wegelagerer_Angriff;

FUNC INT DIA_1051_Wegelagerer_EXIT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_1051_Wegelagerer_Question))
		|| (BDT_1051_Wegelagerer_Angriff == TRUE))

		{
				return TRUE;
		};
};
FUNC VOID DIA_1051_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	if (BDT_1051_Wegelagerer_Angriff == TRUE)
	{
			self.aivar[AIV_EnemyOverride] = FALSE; 
			BDT_1052_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE; 
	};
};

///////////////////////////////////////////////////////////////////////
//	Was machst ihr hier?
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_1051_Wegelagerer_Hello   (C_INFO)
{
	npc         = BDT_1051_Wegelagerer;
	nr          = 4;
	condition   = DIA_Wegelagerer_Hello_Condition;
	information = DIA_Wegelagerer_Hello_Info;
	permanent   = FALSE;
	description = "Que faites-vous ici ?";
};

FUNC INT DIA_Wegelagerer_Hello_Condition()
{
	if (BDT_1051_Wegelagerer_Angriff == FALSE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Wegelagerer_Hello_Info()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Hello_15_00"); //Que faites-vous ici ?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Hello_07_01"); //Et vous ?
};

///////////////////////////////////////////////////////////////////////
//	Ich suche einen Novizen.
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_1051_Wegelagerer_Novice   (C_INFO)
{
	npc         = BDT_1051_Wegelagerer;
	nr          = 4;
	condition   = DIA_Wegelagerer_Novice_Condition;
	information = DIA_Wegelagerer_Novice_Info;
	permanent   = FALSE;
	description = "Je recherche un novice.";
};

FUNC INT DIA_Wegelagerer_Novice_Condition()
{
	if (MIS_Novizenchase == LOG_RUNNING)
		&& (MIS_SCKnowsInnosEyeIsBroken  == FALSE)
		&& (BDT_1051_Wegelagerer_Angriff == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Wegelagerer_Novice_Info()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Novice_15_00"); //Je recherche un novice.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Novice_07_01"); //Très intéressant. Nous aussi on cherche quelqu'un.

	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Novice,"Qui cherchez-vous ?",DIA_1051_Wegelagerer_Question_Novice_Who);
	
};

///////////////////////////////////////////////////////////////////////
//	War nur ne Frage.
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_1051_Wegelagerer_Question   (C_INFO)
{
	npc         = BDT_1051_Wegelagerer;
	nr          = 4;
	condition   = DIA_Wegelagerer_Question_Condition;
	information = DIA_Wegelagerer_Question_Info;
	permanent   = FALSE;
	description = "Simple curiosité.";
};

FUNC INT DIA_Wegelagerer_Question_Condition()
{
	if (Npc_KnowsInfo (other,DIA_1051_Wegelagerer_Hello))
		&& (BDT_1051_Wegelagerer_Angriff == FALSE)
	{
		return TRUE;
	};		
};

FUNC VOID DIA_Wegelagerer_Question_Info()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_15_00"); //Je demandais à tout hasard.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_07_01"); //J'ai bien compris. Mais VOUS, qu'est-ce que vous faites ici ?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_07_02"); //Qu'importe, c'est notre route et on n'aime pas qu'on vienne nous déranger ici.
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	if (MIS_Novizenchase == LOG_RUNNING)
		&& (MIS_SCKnowsInnosEyeIsBroken  == FALSE)
	{
		Info_AddChoice (DIA_1051_Wegelagerer_Question,"Je recherche un novice.",DIA_1051_Wegelagerer_Question_Novice);
	};	
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Cela ne vous regarde pas.",DIA_1051_Wegelagerer_Question_MyConcern);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Je jetais seulement un coup d'œil.",DIA_1051_Wegelagerer_Question_LookAround);
};

FUNC VOID DIA_1051_Wegelagerer_Question_Novice ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_Novice_15_00"); //Je recherche un novice.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_Novice_07_01"); //Très intéressant. Nous aussi on cherche quelqu'un.
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Qui cherchez-vous ?",DIA_1051_Wegelagerer_Question_Novice_Who);

};	

FUNC VOID DIA_1051_Wegelagerer_Question_Novice_Who ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_Novice_Who_15_00"); //Et qui est-ce ?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_Novice_Who_07_01"); //Vous !
	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk (self,40);
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);

};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_15_00"); //Cela ne vous concerne pas.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_07_01"); //Que voulez-vous dire ? Vous cherchez les ennuis ?
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Non, laissez tomber. Je ne cherche pas d'ennuis.",DIA_1051_Wegelagerer_Question_MyConcern_No);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Si vous insistez.",DIA_1051_Wegelagerer_Question_MyConcern_Yes);
};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern_No ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_No_15_00"); //Non, laissez tomber. Evitons les problèmes.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_No_07_01"); //Je vois que vous vous faites dessus. Allez filez !
	
	AI_StopProcessInfos (self); //Joly: Ausweg ohne angegriffen zu werden!!!!!!!!!
};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern_Yes ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_15_00"); //Si vous insistez.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_01"); //Oh ! Oh ! Vous avez une grande gueule, vous.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_02"); //Il est temps que je vous la ferme.

	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk (self,40);
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
};

FUNC VOID DIA_1051_Wegelagerer_Question_LookAround ()
{
	AI_Output	(other,self ,"DIA_1051_Wegelagerer_Question_LookAround_15_00"); //Je jetais juste un coup d'œil aux environs.
	AI_Output 	(self ,other,"DIA_1051_Wegelagerer_Question_LookAround_07_01"); //Alors faites donc mais arrêtez de nous embêter.
	
	AI_StopProcessInfos (self); //Joly: Ausweg ohne angegriffen zu werden!!!!!!!!!
};

///////////////////////////////////////////////////////////////////////
//	Info Angriff
///////////////////////////////////////////////////////////////////////
instance DIA_Wegelagerer_ANGRIFF		(C_INFO)
{
	npc		 = 	BDT_1051_Wegelagerer;
	nr		 = 	2;
	condition	 = 	DIA_Wegelagerer_ANGRIFF_Condition;
	information	 = 	DIA_Wegelagerer_ANGRIFF_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Wegelagerer_ANGRIFF_Condition ()
{
		var C_NPC Pal;
		Pal = Hlp_GetNpc (BDT_1052_Wegelagerer);

		if 	(Npc_RefuseTalk(self) == FALSE)
			&& ((BDT_1051_Wegelagerer_Angriff == TRUE)	|| (C_NpcIsDown(Pal)))
				{
					return TRUE;
				};
};

func void DIA_Wegelagerer_ANGRIFF_Info ()
{
	AI_Output			(self, other, "DIA_Wegelagerer_ANGRIFF_07_00"); //C'est ça !

	AI_StopProcessInfos (self);

	Npc_SetRefuseTalk (self,40);

	self.aivar[AIV_EnemyOverride] = FALSE; 
	BDT_1052_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE; 
};



