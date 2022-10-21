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
	description	= "Co tady d�l�?";
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
	AI_Output			(other, self, "DIA_Rumbold_PrePerm_15_00"); //Co tady d�l�?
	AI_Output			(self, other, "DIA_Rumbold_PrePerm_10_01"); //Ztra� se! Rozum�?

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
	AI_Output (self, other, "DIA_Rumbold_Hallo_10_00"); //No pod�vejte na tohohle. Dal�� vtip�lek. Co tady d�l�, hm?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Rumbold_Hallo_10_01"); //Kdo sakra jsi?
	}
	else
	{
		AI_Output (self, other, "DIA_Rumbold_Hallo_10_02"); //Jsi jeden z t�ch �pinav�ch �old�k�!
	};
		
	Info_ClearChoices	(DIA_Rumbold_HALLO);

	Info_AddChoice	(DIA_Rumbold_HALLO, "J� nejsem nikdo.", DIA_Rumbold_HALLO_schwanzeinziehen );
	Info_AddChoice	(DIA_Rumbold_HALLO, "Chci, abyste odsud zmizeli.", DIA_Rumbold_HALLO_verschwindet );
	Info_AddChoice	(DIA_Rumbold_HALLO, "Jsem tvoje nejhor�� no�n� m�ra.", DIA_Rumbold_HALLO_Attack );

};
func void DIA_Rumbold_HALLO_Attack ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_Attack_15_00"); //Jsem tvoje nejhor�� no�n� m�ra.
	AI_Output (self, other, "DIA_Rumbold_HALLO_Attack_10_01"); //Jsi mrtvola!

	Info_ClearChoices	(DIA_Rumbold_HALLO);
	Info_AddChoice	(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack );
};

func void DIA_Rumbold_HALLO_verschwindet ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_verschwindet_15_00"); //Chci, abyste odsud zmizeli.
	AI_Output (self, other, "DIA_Rumbold_HALLO_verschwindet_10_01"); //Hle�me, hle�me. Tak�e ty chce�, abychom zmizeli.
	AI_Output (self, other, "DIA_Rumbold_HALLO_verschwindet_10_02"); //(v�hr��n�) A co se stane, kdy� z�staneme?

	Info_ClearChoices	(DIA_Rumbold_HALLO);

	Info_AddChoice	(DIA_Rumbold_HALLO, "Kolik v�m mus�m zaplatit, abyste se ztratili?", DIA_Rumbold_HALLO_geld);
	Info_AddChoice	(DIA_Rumbold_HALLO, "V tom p��pad� to je naposledy, co jste ty farm��e obt�ovali.", DIA_Rumbold_HALLO_AufsMaul);
};

func void DIA_Rumbold_HALLO_AufsMaul()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_AufsMaul_15_00"); //V tom p��pad� to je naposledy, co jste ty farm��e obt�ovali.
	AI_Output (self, other, "DIA_Rumbold_HALLO_AufsMaul_10_01"); //Ukousl sis tro�ku v�t�� sousto, ne� dok�e� spolknout, pitom�e!
	
	Info_ClearChoices	(DIA_Rumbold_HALLO);
	Info_AddChoice	(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack );
};

func void DIA_Rumbold_HALLO_geld ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_15_00"); //Kolik v�m mus�m zaplatit, abyste se ztratili?
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_01"); //Chce� zaplatit za Bengara? To je n�co jin�ho.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_02"); //Nech m� p�em��let. Se v�emi t�mi obrovsk�mi v�lohami n�m Bengar dlu�� je�t� 65 zlat�ch.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_03"); //Bu� vysol� prachy na d�evo, nebo se do ni�eho nem�chej.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_04"); //Tak. Ty jsi Bengar�v pokladn�, nebo co?
	
	Info_ClearChoices (DIA_Rumbold_HALLO);
	Info_AddChoice (DIA_Rumbold_HALLO, "Zbl�znil ses? To je tro�ku moc, ne?", DIA_Rumbold_HALLO_Geld_TooMuch);
	if (Npc_HasItems (other, itmi_gold) >= 65)
	{
		Info_AddChoice (DIA_Rumbold_HALLO, "Tady m� prachy a te� odsud zmizni.", DIA_Rumbold_HALLO_geld_ok);
	};
};

func void DIA_Rumbold_HALLO_geld_ok ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_ok_15_00"); //Tady jsou va�e prachy. Te� zmizte.
	B_GiveInvItems (other, self, ItMi_Gold, 65);
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_ok_10_01"); //Mn� je jedno, kdo za Bengara zaplat�. P�eju hezk� den. (k sob�) Pitom�e!
	
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
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_TooMuch_15_00"); //Zbl�znil ses? To je tro�ku moc, ne?
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_TooMuch_10_01"); //V tom p��pad� se do ni�eho neple�!
	AI_StopProcessInfos (self);
};

func void DIA_Rumbold_HALLO_schwanzeinziehen ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_schwanzeinziehen_15_00"); //J� nejsem nikdo.
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
	description = "Nechte toho farm��e b�t!";
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
	AI_Output (other, self, "DIA_Rumbold_FightNow_15_00"); //Nechte toho farm��e b�t!
	AI_Output (self, other, "DIA_Rumbold_FightNow_10_01"); //M� snad n�co s u�ima, chlap�e?
	
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
	description = "Hele, jak to, �e jsi je�t� tady!";
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
	AI_Output (other, self, "DIA_Rumbold_StillThere_15_00"); //Hele, jak to, �e jsi je�t� tady!
	AI_Output (self, other, "DIA_Rumbold_StillThere_10_01"); //Vy��d�m si to s v�mi!
	
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










