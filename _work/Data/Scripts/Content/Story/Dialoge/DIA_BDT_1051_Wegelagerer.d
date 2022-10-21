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
	description = "Cosa stai facendo, qui?";
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
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Hello_15_00"); //Cosa stai facendo, qui?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Hello_07_01"); //Cosa vuoi?
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
	description = "Sto cercando un novizio.";
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
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Novice_15_00"); //Sto cercando un novizio.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Novice_07_01"); //Davvero interessante. Anche noi stiamo cercando qualcuno.

	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Novice,"Chi stai cercando?",DIA_1051_Wegelagerer_Question_Novice_Who);
	
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
	description = "Semplice curiosità.";
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
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_15_00"); //Semplice curiosità.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_07_01"); //Ho capito. Ma che ci fai TU qui?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_07_02"); //Ad ogni modo, questa è la nostra strada, e non ci piace quando qualcuno viene qui a infastidirci.
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	if (MIS_Novizenchase == LOG_RUNNING)
		&& (MIS_SCKnowsInnosEyeIsBroken  == FALSE)
	{
		Info_AddChoice (DIA_1051_Wegelagerer_Question,"Sto cercando un novizio.",DIA_1051_Wegelagerer_Question_Novice);
	};	
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Non sono affari tuoi.",DIA_1051_Wegelagerer_Question_MyConcern);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Sto solo dando un’occhiata in giro.",DIA_1051_Wegelagerer_Question_LookAround);
};

FUNC VOID DIA_1051_Wegelagerer_Question_Novice ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_Novice_15_00"); //Sto cercando un novizio.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_Novice_07_01"); //Davvero interessante. Anche noi stiamo cercando qualcuno.
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Chi stai cercando?",DIA_1051_Wegelagerer_Question_Novice_Who);

};	

FUNC VOID DIA_1051_Wegelagerer_Question_Novice_Who ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_Novice_Who_15_00"); //E chi sarebbe?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_Novice_Who_07_01"); //Tu!
	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk (self,40);
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);

};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_15_00"); //Non sono affari tuoi.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_07_01"); //Cosa vuoi dire? Sei in cerca di guai?
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"No, lascia stare. Non disturbarti.",DIA_1051_Wegelagerer_Question_MyConcern_No);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Se insisti.",DIA_1051_Wegelagerer_Question_MyConcern_Yes);
};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern_No ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_No_15_00"); //No, lascia stare. Non disturbarti.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_No_07_01"); //Capisco, te la sei fatta sotto dalla paura. E ora sparisci.
	
	AI_StopProcessInfos (self); //Joly: Ausweg ohne angegriffen zu werden!!!!!!!!!
};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern_Yes ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_15_00"); //Se insisti.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_01"); //Oh-oh, hai una bella boccaccia.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_02"); //È giunta l'ora di tappartela per sempre.

	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk (self,40);
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
};

FUNC VOID DIA_1051_Wegelagerer_Question_LookAround ()
{
	AI_Output	(other,self ,"DIA_1051_Wegelagerer_Question_LookAround_15_00"); //Sto solo dando un’occhiata in giro.
	AI_Output 	(self ,other,"DIA_1051_Wegelagerer_Question_LookAround_07_01"); //Allora vai per la tua strada e non darci noie.
	
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
	AI_Output			(self, other, "DIA_Wegelagerer_ANGRIFF_07_00"); //Questo è per te.

	AI_StopProcessInfos (self);

	Npc_SetRefuseTalk (self,40);

	self.aivar[AIV_EnemyOverride] = FALSE; 
	BDT_1052_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE; 
};



