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
	description = "Co tady dęláš?";
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
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Hello_15_00"); //Co tady dęláš?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Hello_07_01"); //Co je ti do toho?
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
	description = "Hledám jednoho novice.";
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
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Novice_15_00"); //Hledám jednoho novice.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Novice_07_01"); //To je zajímavé. Taky nękoho hledáme.

	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Novice,"Koho hledáš?",DIA_1051_Wegelagerer_Question_Novice_Who);
	
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
	description = "Jenom se ptám.";
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
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_15_00"); //Jenom se ptám.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_07_01"); //Jasný. Ale co tady dęláš?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_07_02"); //Mimochodem, tohle je naše cesta a nemáme rádi, když nás tu nękdo obtęžuje.
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	if (MIS_Novizenchase == LOG_RUNNING)
		&& (MIS_SCKnowsInnosEyeIsBroken  == FALSE)
	{
		Info_AddChoice (DIA_1051_Wegelagerer_Question,"Hledám jednoho novice.",DIA_1051_Wegelagerer_Question_Novice);
	};	
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Do toho ti nic není.",DIA_1051_Wegelagerer_Question_MyConcern);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Jen se tu kolem trochu rozhlížím.",DIA_1051_Wegelagerer_Question_LookAround);
};

FUNC VOID DIA_1051_Wegelagerer_Question_Novice ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_Novice_15_00"); //Hledám jednoho novice.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_Novice_07_01"); //To je zajímavé. Taky nękoho hledáme.
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Koho hledáš?",DIA_1051_Wegelagerer_Question_Novice_Who);

};	

FUNC VOID DIA_1051_Wegelagerer_Question_Novice_Who ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_Novice_Who_15_00"); //A kdo to jako má být?
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_Novice_Who_07_01"); //Ty!
	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk (self,40);
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);

};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_15_00"); //Do toho ti nic není.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_07_01"); //Co tím myslíš? Toužíš po problémech?
	
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Ne, nic takového. Žádný problémy.",DIA_1051_Wegelagerer_Question_MyConcern_No);
	Info_AddChoice (DIA_1051_Wegelagerer_Question,"Když na tom trváš.",DIA_1051_Wegelagerer_Question_MyConcern_Yes);
};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern_No ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_No_15_00"); //Ne, nic takového. Žádný problémy.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_No_07_01"); //Rozumím, nadęlal sis do kalhot. Teë se zdejchni.
	
	AI_StopProcessInfos (self); //Joly: Ausweg ohne angegriffen zu werden!!!!!!!!!
};

FUNC VOID DIA_1051_Wegelagerer_Question_MyConcern_Yes ()
{
	AI_Output (other,self ,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_15_00"); //Když na tom trváš.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_01"); //Hele, hele, máš nęjak nevymáchanou hubu.
	AI_Output (self ,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_02"); //Už je načase, abych ti ji zavâel.

	BDT_1051_Wegelagerer_Angriff = TRUE;
	Npc_SetRefuseTalk (self,40);
	Info_ClearChoices (DIA_1051_Wegelagerer_Question);
};

FUNC VOID DIA_1051_Wegelagerer_Question_LookAround ()
{
	AI_Output	(other,self ,"DIA_1051_Wegelagerer_Question_LookAround_15_00"); //Jen se tu kolem trochu rozhlížím.
	AI_Output 	(self ,other,"DIA_1051_Wegelagerer_Question_LookAround_07_01"); //Klidnę si v tom pokračuj, ale pâestaŕ nás otravovat.
	
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
	AI_Output			(self, other, "DIA_Wegelagerer_ANGRIFF_07_00"); //To je pro tebe.

	AI_StopProcessInfos (self);

	Npc_SetRefuseTalk (self,40);

	self.aivar[AIV_EnemyOverride] = FALSE; 
	BDT_1052_Wegelagerer.aivar[AIV_EnemyOverride] = FALSE; 
};



