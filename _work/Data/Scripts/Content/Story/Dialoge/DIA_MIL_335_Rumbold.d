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
	description	= "Co tu porabiasz?";
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
	AI_Output			(other, self, "DIA_Rumbold_PrePerm_15_00"); //Co tu robicie?
	AI_Output			(self, other, "DIA_Rumbold_PrePerm_10_01"); //Wyno� si�! Rozumiesz?

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
	AI_Output (self, other, "DIA_Rumbold_Hallo_10_00"); //Sp�jrz na tego. Co za pokraka. Hej, co ci� tu sprowadza?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Rumbold_Hallo_10_01"); //Kim u diab�a jeste�?
	}
	else
	{
		AI_Output (self, other, "DIA_Rumbold_Hallo_10_02"); //Nale�ysz do tych zawszonych najemnik�w!
	};
		
	Info_ClearChoices	(DIA_Rumbold_HALLO);

	Info_AddChoice	(DIA_Rumbold_HALLO, "Jestem nikim.", DIA_Rumbold_HALLO_schwanzeinziehen );
	Info_AddChoice	(DIA_Rumbold_HALLO, "Znikajcie st�d, ale ju�.", DIA_Rumbold_HALLO_verschwindet );
	Info_AddChoice	(DIA_Rumbold_HALLO, "Jestem twoim najgorszym koszmarem.", DIA_Rumbold_HALLO_Attack );

};
func void DIA_Rumbold_HALLO_Attack ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_Attack_15_00"); //Jestem twoim najgorszym koszmarem.
	AI_Output (self, other, "DIA_Rumbold_HALLO_Attack_10_01"); //Raczej trupem!

	Info_ClearChoices	(DIA_Rumbold_HALLO);
	Info_AddChoice	(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack );
};

func void DIA_Rumbold_HALLO_verschwindet ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_verschwindet_15_00"); //Znikajcie st�d, ale ju�.
	AI_Output (self, other, "DIA_Rumbold_HALLO_verschwindet_10_01"); //No, no. Chcesz, by�my znikn�li.
	AI_Output (self, other, "DIA_Rumbold_HALLO_verschwindet_10_02"); //A co je�li nic z tego, h�?

	Info_ClearChoices	(DIA_Rumbold_HALLO);

	Info_AddChoice	(DIA_Rumbold_HALLO, "Ile mam zap�aci�, �eby�cie si� st�d wynie�li?", DIA_Rumbold_HALLO_geld);
	Info_AddChoice	(DIA_Rumbold_HALLO, "Je�li tak, to ju� ostatni raz utrudniacie farmerom �ycie.", DIA_Rumbold_HALLO_AufsMaul);
};

func void DIA_Rumbold_HALLO_AufsMaul()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_AufsMaul_15_00"); //Je�li tak, to ju� ostatni raz utrudniacie farmerom �ycie.
	AI_Output (self, other, "DIA_Rumbold_HALLO_AufsMaul_10_01"); //Porywasz si� z motyk� na s�o�ce, pacanie!
	
	Info_ClearChoices	(DIA_Rumbold_HALLO);
	Info_AddChoice	(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack );
};

func void DIA_Rumbold_HALLO_geld ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_15_00"); //Ile mam zap�aci�, �eby�cie si� st�d wynie�li?
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_01"); //Chcesz sp�aci� Bengara? A, to zupe�nie inna sprawa.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_02"); //Niech no pomy�l�. Bengar nigdy nie oszcz�dza�, jest winien jeszcze 65 sztuk z�ota.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_03"); //Dawaj kas�, albo spadaj.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_04"); //Jeste� skarbnikiem Bengara, czy co?
	
	Info_ClearChoices (DIA_Rumbold_HALLO);
	Info_AddChoice (DIA_Rumbold_HALLO, "Oszala�e�? To o wiele za du�o.", DIA_Rumbold_HALLO_Geld_TooMuch);
	if (Npc_HasItems (other, itmi_gold) >= 65)
	{
		Info_AddChoice (DIA_Rumbold_HALLO, "Oto twoja forsa, a teraz spadaj.", DIA_Rumbold_HALLO_geld_ok);
	};
};

func void DIA_Rumbold_HALLO_geld_ok ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_ok_15_00"); //Oto wasze pieni�dze, a teraz wyno�cie si�.
	B_GiveInvItems (other, self, ItMi_Gold, 65);
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_ok_10_01"); //Nie interesuje mnie, kto p�aci za Bengara. �ycz� mi�ego dnia. Dure�!
	
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
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_TooMuch_15_00"); //Oszala�e�? To o wiele za du�o.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_TooMuch_10_01"); //W takim razie... spadaj!
	AI_StopProcessInfos (self);
};

func void DIA_Rumbold_HALLO_schwanzeinziehen ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_schwanzeinziehen_15_00"); //Jestem nikim.
	AI_Output (self, other, "DIA_Rumbold_HALLO_schwanzeinziehen_10_01"); //W takim razie... zejd� mi z oczu!

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
	description = "Zostawcie farmera w spokoju!";
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
	AI_Output (other, self, "DIA_Rumbold_FightNow_15_00"); //Zostawcie farmera w spokoju!
	AI_Output (self, other, "DIA_Rumbold_FightNow_10_01"); //Kole�, masz jakie� problemy ze s�uchem?
	
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
	description = "Hej, ci�gle tutaj?";
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
	AI_Output (other, self, "DIA_Rumbold_StillThere_15_00"); //Hej, ci�gle tutaj?
	AI_Output (self, other, "DIA_Rumbold_StillThere_10_01"); //Mam ci� ju� do��!
	
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










