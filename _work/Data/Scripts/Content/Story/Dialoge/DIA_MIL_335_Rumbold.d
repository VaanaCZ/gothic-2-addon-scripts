// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Rumbold_EXIT   (C_INFO)
{
	npc         = Mil_335_Rumbold;
	nr          = 999;
	condition   = DIA_Rumbold_EXIT_Condition;
	information = DIA_Rumbold_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rumbold_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rumbold_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PERM VOR Bengar   
// ************************************************************
instance DIA_Rumbold_PrePerm (C_INFO)
{
	npc		 	= Mil_335_Rumbold;
	nr 			= 1;
	condition	= DIA_Rumbold_PrePerm_Condition;
	information	= DIA_Rumbold_PrePerm_Info;
	permanent 	= TRUE;
	description	= "Was macht ihr hier?";
};

func int DIA_Rumbold_PrePerm_Condition ()
{
	if (!Npc_KnowsInfo (other, DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_PrePerm_Info ()
{
	AI_Output			(other, self, "DIA_Rumbold_PrePerm_15_00"); //Was macht ihr hier?
	AI_Output			(self, other, "DIA_Rumbold_PrePerm_10_01"); //Verschwinde! Hast du verstanden?

	AI_StopProcessInfos (self);
};
 
// ************************************************************
// 			  				Hallo   
// ************************************************************
instance DIA_Rumbold_Hallo		(C_INFO)
{
	npc		 	= Mil_335_Rumbold;
	nr          = 1;
	condition	= DIA_Rumbold_Hallo_Condition;
	information	= DIA_Rumbold_Hallo_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Rumbold_Hallo_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Rumbold_Hallo_10_00"); //Sieh mal einer an. Noch so eine Witzfigur. Was hast du hier zu suchen, he?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Rumbold_Hallo_10_01"); //Wer zur Hölle bist du?
	}
	else
	{
		AI_Output (self, other, "DIA_Rumbold_Hallo_10_02"); //Du bist doch einer von diesen dreckigen Söldnern!
	};
		
	Info_ClearChoices	(DIA_Rumbold_HALLO);

	Info_AddChoice	(DIA_Rumbold_HALLO, "Ich bin niemand.", DIA_Rumbold_HALLO_schwanzeinziehen );
	Info_AddChoice	(DIA_Rumbold_HALLO, "Ich will, daß ihr hier verschwindet.", DIA_Rumbold_HALLO_verschwindet );
	Info_AddChoice	(DIA_Rumbold_HALLO, "Ich bin euer schlimmster Albtraum!", DIA_Rumbold_HALLO_Attack );

};
func void DIA_Rumbold_HALLO_Attack ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_Attack_15_00"); //Ich bin euer schlimmster Albtraum.
	AI_Output (self, other, "DIA_Rumbold_HALLO_Attack_10_01"); //Du bist ein toter Mann!

	Info_ClearChoices	(DIA_Rumbold_HALLO);
	Info_AddChoice	(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack );
};

func void DIA_Rumbold_HALLO_verschwindet ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_verschwindet_15_00"); //Ich will, dass ihr hier verschwindet.
	AI_Output (self, other, "DIA_Rumbold_HALLO_verschwindet_10_01"); //So, so. Du willst also, dass wir verschwinden.
	AI_Output (self, other, "DIA_Rumbold_HALLO_verschwindet_10_02"); //(droht) Was passiert denn, wenn wir nicht gehen, hä?

	Info_ClearChoices	(DIA_Rumbold_HALLO);

	Info_AddChoice	(DIA_Rumbold_HALLO, "Was muss ich dir zahlen, damit du wieder verschwindest?", DIA_Rumbold_HALLO_geld);
	Info_AddChoice	(DIA_Rumbold_HALLO, "Dann habt ihr zum letzten Mal den Bauern belästigt.", DIA_Rumbold_HALLO_AufsMaul);
};

func void DIA_Rumbold_HALLO_AufsMaul()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_AufsMaul_15_00"); //Dann habt ihr zum letzten Mal den Bauern belästigt.
	AI_Output (self, other, "DIA_Rumbold_HALLO_AufsMaul_10_01"); //Du nimmst dein Maul ganz schön voll, Schwachkopf!
	
	Info_ClearChoices	(DIA_Rumbold_HALLO);
	Info_AddChoice	(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack );
};

func void DIA_Rumbold_HALLO_geld ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_15_00"); //Was muss ich dir zahlen, damit du wieder verschwindest?
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_01"); //Du willst für Bengar zahlen? Das ist etwas anderes.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_02"); //Lass mich mal überlegen. Mit allen noch ausstehenden Unkosten schuldet Bengar uns noch 65 Goldmünzen.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_03"); //Entweder du zahlst die Kohle oder du stellst dich ganz leise in die Ecke.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_04"); //Also. Bist du jetzt Bengars Schatzmeister, oder was?
	
	Info_ClearChoices (DIA_Rumbold_HALLO);
	Info_AddChoice (DIA_Rumbold_HALLO, "Bist du verrückt? Das ist viel zu viel!", DIA_Rumbold_HALLO_Geld_TooMuch);
	if (Npc_HasItems (other, itmi_gold) >= 65)
	{
		Info_AddChoice (DIA_Rumbold_HALLO, "Hier hast das Geld und jetzt verschwinde.", DIA_Rumbold_HALLO_geld_ok);
	};
};

func void DIA_Rumbold_HALLO_geld_ok ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_ok_15_00"); //Hier hast du das Geld und jetzt verschwinde.
	B_GiveInvItems (other, self, ItMi_Gold, 65);
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_ok_10_01"); //Mir soll's egal sein, wer für Bengar zahlt. Schönen Tag noch. (zu sich selbst) Schwachkopf!
	
	AI_StopProcessInfos (self);

	Rumbold_Bezahlt = TRUE;	

	Npc_ExchangeRoutine	(self,"Start");

	if (Hlp_IsValidNpc (Rick))
	&& (!Npc_IsDead (Rick))	
	{	
		Npc_ExchangeRoutine	(Rick,"Start"); 
		AI_ContinueRoutine (Rick);
	};
	
	if (Hlp_IsValidNpc (Bengar))
	&& (!Npc_IsDead (Bengar))	
	{	
		Npc_ExchangeRoutine	(Bengar,"Start"); 
		AI_ContinueRoutine (Bengar);
	};
};

func void DIA_Rumbold_HALLO_Geld_TooMuch()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_TooMuch_15_00"); //Bist du verrückt? Das ist viel zu viel!
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_TooMuch_10_01"); //Dann husch leise in deine Ecke!
	AI_StopProcessInfos (self);
};

func void DIA_Rumbold_HALLO_schwanzeinziehen ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_schwanzeinziehen_15_00"); //Ich bin niemand.
	AI_Output (self, other, "DIA_Rumbold_HALLO_schwanzeinziehen_10_01"); //Dann geh mir aus dem Weg!

	AI_StopProcessInfos (self);
};

func void DIA_Rumbold_HALLO_ENDAttack ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);	

	if (Hlp_IsValidNpc (Rick))
	&& (!C_NpcIsDown (Rick))	
	{	
		B_Attack (Rick, other, AR_KILL, 1);	
	};
};

// ************************************************************
// 			  			Fight Now 
// ************************************************************
instance DIA_Rumbold_FightNow (C_INFO)
{
	npc		 	= Mil_335_Rumbold;
	nr          = 1;
	condition	= DIA_Rumbold_FightNow_Condition;
	information	= DIA_Rumbold_FightNow_Info;
	permanent 	= TRUE;
	description = "Lasst den Bauern in Ruhe!";
};

func int DIA_Rumbold_FightNow_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Rumbold_Hallo))
	&& (Rumbold_Bezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Rumbold_FightNow_Info ()
{
	AI_Output (other, self, "DIA_Rumbold_FightNow_15_00"); //Lasst den Bauern in Ruhe!
	AI_Output (self, other, "DIA_Rumbold_FightNow_10_01"); //Du hast wohl was mit den Ohren, Bursche!
	
	Info_ClearChoices	(DIA_Rumbold_FightNow);
	Info_AddChoice	(DIA_Rumbold_FightNow, DIALOG_ENDE, DIA_Rumbold_FightNow_ENDAttack );
};

func void DIA_Rumbold_FightNow_ENDAttack ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);	

	if (Hlp_IsValidNpc (Rick))
	&& (!C_NpcIsDown (Rick))	
	{	
		B_Attack (Rick, other, AR_KILL, 1);	
	};
};

// ************************************************************
// 			  			Immer noch da 
// ************************************************************
instance DIA_Rumbold_StillThere (C_INFO)
{
	npc		 	= Mil_335_Rumbold;
	nr          = 1;
	condition	= DIA_Rumbold_StillThere_Condition;
	information	= DIA_Rumbold_StillThere_Info;
	permanent 	= TRUE;
	description = "Ihr seid ja immer noch da!";
};

func int DIA_Rumbold_StillThere_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Rumbold_Hallo))
	&& (Rumbold_Bezahlt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Rumbold_StillThere_Info ()
{
	AI_Output (other, self, "DIA_Rumbold_StillThere_15_00"); //Ihr seid ja immer noch da!
	AI_Output (self, other, "DIA_Rumbold_StillThere_10_01"); //So langsam reicht's mir aber mit dir!
	
	Info_ClearChoices	(DIA_Rumbold_StillThere);
	Info_AddChoice	(DIA_Rumbold_StillThere, DIALOG_ENDE, DIA_Rumbold_StillThere_ENDAttack );
};

func void DIA_Rumbold_StillThere_ENDAttack ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);	

	if (Hlp_IsValidNpc (Rick))
	&& (!C_NpcIsDown (Rick))	
	{	
		B_Attack (Rick, other, AR_KILL, 1);	
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rumbold_PICKPOCKET (C_INFO)
{
	npc			= Mil_335_Rumbold;
	nr			= 900;
	condition	= DIA_Rumbold_PICKPOCKET_Condition;
	information	= DIA_Rumbold_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Rumbold_PICKPOCKET_Condition()
{
	C_Beklauen (24, 45);
};
 
FUNC VOID DIA_Rumbold_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rumbold_PICKPOCKET);
	Info_AddChoice		(DIA_Rumbold_PICKPOCKET, DIALOG_BACK 		,DIA_Rumbold_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rumbold_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rumbold_PICKPOCKET_DoIt);
};

func void DIA_Rumbold_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rumbold_PICKPOCKET);
};
	
func void DIA_Rumbold_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rumbold_PICKPOCKET);
};










