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
	description = "What are you doing here?";
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
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Hello_15_00"); //What are you doing here?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Hello_07_01"); //What's it to you?
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
	description = "I'm looking for a novice.";
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
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Novice_15_00"); //I'm looking for a novice.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Novice_07_01"); //That's very interesting. We're looking for someone, too.

	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Novice,"Who are you looking for?",DIA_1051_Wegelagerer_Question_Novice_Who);
	
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
	description = "Just asking.";
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
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_15_00"); //Just asking.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_07_01"); //Understood. But what are YOU doing here?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_07_02"); //Anyway, this is our road and we don't like it when someone bothers us here.
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	if (MIS_Novizenchase == LOG_RUNNING)
		&& (MIS_SCKnowsInnosEyeIsBroken  == FALSE)
	{
		Info_AddChoice (DIA_1051_Wegelagerer_Question,"I'm looking for a novice.",DIA_1051_Wegelagerer_Question_Novice);
	};	
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"That's none of your business.",DIA_1051_Wegelagerer_Question_MyConcern);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"I'm only having a look around.",DIA_1051_Wegelagerer_Question_LookAround);
};

FUNC VOID DIA_1051_Wegelagerer_Question_Novice ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_Novice_15_00"); //I'm looking for a novice.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_Novice_07_01"); //That's very interesting. We're looking for someone, too.
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Who are you looking for?",DIA_1051_Wegelagerer_Question_Novice_Who);

};	

FUNC VOID DIA_1051_Wegelagerer_Question_Novice_Who ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_Novice_Who_15_00"); //And who would that be?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_Novice_Who_07_01"); //You!
	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk (self,40);
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);

};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_15_00"); //That's none of your business.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_07_01"); //What do you mean? Are you looking for trouble?
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"No, never mind. No trouble.",DIA_1051_Wegelagerer_Question_MyConcern_No);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"If you insist.",DIA_1051_Wegelagerer_Question_MyConcern_Yes);
};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern_No ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_No_15_00"); //No, never mind. No trouble.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_No_07_01"); //I understand, you filled your pants. Now scram.
	
	AI_StopProcessInfos (self); //Joly: Ausweg ohne angegriffen zu werden!!!!!!!!!
};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern_Yes ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_15_00"); //If you insist.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_01"); //Ho ho, you've got a big mouth.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_02"); //It's time I shut it for you.

	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk (self,40);
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
};

FUNC VOID DIA_1051_Wegelagerer_Question_LookAround ()
{
	AI_Output	(other,self ,"DIA_1051_Wegelagerer_Question_LookAround_15_00"); //I'm only having a look around.
	AI_Output 	(self ,other,"DIA_1051_Wegelagerer_Question_LookAround_07_01"); //Do that, but stop bugging us.
	
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
	AI_Output			(self, other, "DIA_Wegelagerer_ANGRIFF_07_00"); //That's it for you.

	AI_StopProcessInfos (self);

	Npc_SetRefuseTalk (self,40);

	self.aivar[AIV_EnemyOverride] = FALSE; 
	BDT_1052_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE; 
};



