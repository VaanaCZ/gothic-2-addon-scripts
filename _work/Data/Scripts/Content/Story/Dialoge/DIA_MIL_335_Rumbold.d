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
	description	= "Co tady dęláš?";
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
	AI_Output			(other, self, "DIA_Rumbold_PrePerm_15_00"); //Co tady dęláš?
	AI_Output			(self, other, "DIA_Rumbold_PrePerm_10_01"); //Ztraă se! Rozumíš?

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
	AI_Output (self, other, "DIA_Rumbold_Hallo_10_00"); //No podívejte na tohohle. Další vtipálek. Co tady dęláš, hm?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Rumbold_Hallo_10_01"); //Kdo sakra jsi?
	}
	else
	{
		AI_Output (self, other, "DIA_Rumbold_Hallo_10_02"); //Jsi jeden z tęch špinavých žoldáků!
	};
		
	Info_ClearChoices	(DIA_Rumbold_HALLO);

	Info_AddChoice	(DIA_Rumbold_HALLO, "Já nejsem nikdo.", DIA_Rumbold_HALLO_schwanzeinziehen );
	Info_AddChoice	(DIA_Rumbold_HALLO, "Chci, abyste odsud zmizeli.", DIA_Rumbold_HALLO_verschwindet );
	Info_AddChoice	(DIA_Rumbold_HALLO, "Jsem tvoje nejhorší noční můra.", DIA_Rumbold_HALLO_Attack );

};
func void DIA_Rumbold_HALLO_Attack ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_Attack_15_00"); //Jsem tvoje nejhorší noční můra.
	AI_Output (self, other, "DIA_Rumbold_HALLO_Attack_10_01"); //Jsi mrtvola!

	Info_ClearChoices	(DIA_Rumbold_HALLO);
	Info_AddChoice	(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack );
};

func void DIA_Rumbold_HALLO_verschwindet ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_verschwindet_15_00"); //Chci, abyste odsud zmizeli.
	AI_Output (self, other, "DIA_Rumbold_HALLO_verschwindet_10_01"); //Hleëme, hleëme. Takže ty chceš, abychom zmizeli.
	AI_Output (self, other, "DIA_Rumbold_HALLO_verschwindet_10_02"); //(výhrůžnę) A co se stane, když zůstaneme?

	Info_ClearChoices	(DIA_Rumbold_HALLO);

	Info_AddChoice	(DIA_Rumbold_HALLO, "Kolik vám musím zaplatit, abyste se ztratili?", DIA_Rumbold_HALLO_geld);
	Info_AddChoice	(DIA_Rumbold_HALLO, "V tom pâípadę to je naposledy, co jste ty farmáâe obtęžovali.", DIA_Rumbold_HALLO_AufsMaul);
};

func void DIA_Rumbold_HALLO_AufsMaul()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_AufsMaul_15_00"); //V tom pâípadę to je naposledy, co jste ty farmáâe obtęžovali.
	AI_Output (self, other, "DIA_Rumbold_HALLO_AufsMaul_10_01"); //Ukousl sis trošku vętší sousto, než dokážeš spolknout, pitomče!
	
	Info_ClearChoices	(DIA_Rumbold_HALLO);
	Info_AddChoice	(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack );
};

func void DIA_Rumbold_HALLO_geld ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_15_00"); //Kolik vám musím zaplatit, abyste se ztratili?
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_01"); //Chceš zaplatit za Bengara? To je nęco jiného.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_02"); //Nech mę pâemýšlet. Se všemi tęmi obrovskými výlohami nám Bengar dluží ještę 65 zlatých.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_03"); //Buë vysolíš prachy na dâevo, nebo se do ničeho nemíchej.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_04"); //Tak. Ty jsi Bengarův pokladní, nebo co?
	
	Info_ClearChoices (DIA_Rumbold_HALLO);
	Info_AddChoice (DIA_Rumbold_HALLO, "Zbláznil ses? To je trošku moc, ne?", DIA_Rumbold_HALLO_Geld_TooMuch);
	if (Npc_HasItems (other, itmi_gold) >= 65)
	{
		Info_AddChoice (DIA_Rumbold_HALLO, "Tady máš prachy a teë odsud zmizni.", DIA_Rumbold_HALLO_geld_ok);
	};
};

func void DIA_Rumbold_HALLO_geld_ok ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_ok_15_00"); //Tady jsou vaše prachy. Teë zmizte.
	B_GiveInvItems (other, self, ItMi_Gold, 65);
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_ok_10_01"); //Mnę je jedno, kdo za Bengara zaplatí. Pâeju hezký den. (k sobę) Pitomče!
	
	AI_StopProcessInfos (self);

	Rumbold_Bezahlt = TRUE;	

	Npc_ExchangeRoutine	(self,"Začít");

	if (Hlp_IsValidNpc (Rick))
	&& (!Npc_IsDead (Rick))	
	{	
		Npc_ExchangeRoutine	(Rick,"Začít"); 
		AI_ContinueRoutine (Rick);
	};
	
	if (Hlp_IsValidNpc (Bengar))
	&& (!Npc_IsDead (Bengar))	
	{	
		Npc_ExchangeRoutine	(Bengar,"Začít"); 
		AI_ContinueRoutine (Bengar);
	};
};

func void DIA_Rumbold_HALLO_Geld_TooMuch()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_TooMuch_15_00"); //Zbláznil ses? To je trošku moc, ne?
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_TooMuch_10_01"); //V tom pâípadę se do ničeho nepleă!
	AI_StopProcessInfos (self);
};

func void DIA_Rumbold_HALLO_schwanzeinziehen ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_schwanzeinziehen_15_00"); //Já nejsem nikdo.
	AI_Output (self, other, "DIA_Rumbold_HALLO_schwanzeinziehen_10_01"); //Tak mi jdi z cesty!

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
	description = "Nechte toho farmáâe být!";
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
	AI_Output (other, self, "DIA_Rumbold_FightNow_15_00"); //Nechte toho farmáâe být!
	AI_Output (self, other, "DIA_Rumbold_FightNow_10_01"); //Máš snad nęco s ušima, chlapče?
	
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
	description = "Hele, jak to, že jsi ještę tady!";
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
	AI_Output (other, self, "DIA_Rumbold_StillThere_15_00"); //Hele, jak to, že jsi ještę tady!
	AI_Output (self, other, "DIA_Rumbold_StillThere_10_01"); //Vyâídím si to s vámi!
	
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










