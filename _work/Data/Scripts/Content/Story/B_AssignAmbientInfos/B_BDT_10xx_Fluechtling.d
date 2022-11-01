
///////////////////////////////////////////////////////////////////////
//DIA_BDT_10XX_Fluechtling
///////////////////////////////////////////////////////////////////////

FUNC VOID B_DIA_BDT_10XX_Fluechtling_Stimme7 ()
{
	AI_Output			(self, other, "DIA_B_DIA_BDT_10XX_Fluechtling_07_00"); //Scordatelo. Non voglio tornarmene in prigione.
};

FUNC VOID B_DIA_BDT_10XX_Fluechtling_Stimme6 ()
{
	AI_Output			(self, other, "DIA_B_DIA_BDT_10XX_Fluechtling_06_00"); //Non sei venuto per riportarci in prigione, vero?
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1031_Fluechtling_EXIT   (C_INFO)
{
	npc         = BDT_1031_Fluechtling;
	nr          = 999;
	condition   = DIA_BDT_1031_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1031_Fluechtling_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1031_Fluechtling_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BDT_1031_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Tip1
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1031_Fluechtling_Tip1		(C_INFO)
{
	npc			 = 	BDT_1031_Fluechtling;
	nr			 = 	2;
	condition	 = 	DIA_BDT_1031_Fluechtling_Tip1_Condition;
	information	 = 	DIA_BDT_1031_Fluechtling_Tip1_Info;
	important	 = 	TRUE;

};
func int DIA_BDT_1031_Fluechtling_Tip1_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1031_Fluechtling_Tip1_Info ()
{
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_07_00"); //Faresti meglio a stare alla larga da me se non vuoi finire in prigione.
	B_GivePlayerXP (XP_AmbientKap3);
	
	if (SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices	(DIA_BDT_1031_Fluechtling_Tip1);
		Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "Non ho intenzione di tradirti.", DIA_BDT_1031_Fluechtling_Tip1_frei );
		Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "Sono qui per arrestarti.", DIA_BDT_1031_Fluechtling_Tip1_Knast );
		Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "Dov’è Morgahard, il tuo capo?", DIA_BDT_1031_Fluechtling_Tip1_Morgahard );
	};
};
func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00"); //Dov’è Morgahard, il tuo capo?
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01"); //Ci siamo divisi, in modo da rendere più difficile la nostra cattura. Non ho idea di dove siano gli altri.
	
	Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "Che peccato. Allora, immagino di dover chiamare il giudice.", DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen );

};
func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00"); //Che peccato. Allora, immagino di dover chiamare il giudice.
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01"); //Va bene, va bene. Credo che alcuni di noi siano fuggiti alla taverna, ma fai finta che io non ti abbia detto nulla, d’accordo?
	AI_StopProcessInfos (self);
};

func void DIA_BDT_1031_Fluechtling_Tip1_Knast ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00"); //Sono venuto per arrestarti.
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01"); //Dovrai passare sul mio cadavere.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno , 1);
};

func void DIA_BDT_1031_Fluechtling_Tip1_frei ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_frei_15_00"); //Non ho intenzione di tradirti.
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_frei_07_01"); //Se ti ha mandato il giudice, allora puoi riferirgli di lasciarci in pace.
	
	Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "Quale crimine hai commesso?", DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen );
};
func void DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00"); //Quale crimine hai commesso?
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01"); //Non sono affari tuoi.

};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1031_Fluechtling_PERM		(C_INFO)
{
	npc			 = 	BDT_1031_Fluechtling;
	nr			 = 	3;
	condition	 = 	DIA_BDT_1031_Fluechtling_PERM_Condition;
	information	 = 	DIA_BDT_1031_Fluechtling_PERM_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
func int DIA_BDT_1031_Fluechtling_PERM_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1031_Fluechtling_PERM_Info ()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7 ();	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1032_Fluechtling_EXIT   (C_INFO)
{
	npc         = BDT_1032_Fluechtling;
	nr          = 999;
	condition   = DIA_BDT_1032_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1032_Fluechtling_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1032_Fluechtling_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BDT_1032_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1032_Fluechtling_PERM		(C_INFO)
{
	npc			 = 	BDT_1032_Fluechtling;
	nr			 = 	2;
	condition	 = 	DIA_BDT_1032_Fluechtling_PERM_Condition;
	information	 = 	DIA_BDT_1032_Fluechtling_PERM_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
func int DIA_BDT_1032_Fluechtling_PERM_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1032_Fluechtling_PERM_Info ()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme6 ();	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1033_Fluechtling_EXIT   (C_INFO)
{
	npc         = BDT_1033_Fluechtling;
	nr          = 999;
	condition   = DIA_BDT_1033_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1033_Fluechtling_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1033_Fluechtling_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BDT_1033_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Tip2
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1033_Fluechtling_Tip2		(C_INFO)
{
	npc			 = 	BDT_1033_Fluechtling;
	nr			 = 	2;
	condition	 = 	DIA_BDT_1033_Fluechtling_Tip2_Condition;
	information	 = 	DIA_BDT_1033_Fluechtling_Tip2_Info;
	important	 = 	TRUE;

};
func int DIA_BDT_1033_Fluechtling_Tip2_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1033_Fluechtling_Tip2_Info ()
{
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_07_00"); //(spaventato) Cosa vuoi da me?
	B_GivePlayerXP (XP_AmbientKap3);
	
	if (SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices	(DIA_BDT_1033_Fluechtling_Tip2);
		Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "Rilassati, voglio solo parlare.", DIA_BDT_1033_Fluechtling_Tip2_frei );
		Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "Il giudice mi ha mandato qui per riportarti indietro.", DIA_BDT_1033_Fluechtling_Tip2_Knast );
		Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "Dov’è Morgahard, il tuo capo?", DIA_BDT_1033_Fluechtling_Tip2_Morgahard );
	};
};
func void DIA_BDT_1033_Fluechtling_Tip2_Morgahard ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00"); //Dov’è Morgahard, il tuo capo?
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01"); //(spaventato) Non voglio guai. Vai dal proprietario terriero. Voleva nascondersi con i mercenari. E ora lasciami in pace.
	AI_StopProcessInfos (self);
};

func void DIA_BDT_1033_Fluechtling_Tip2_Knast ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00"); //Il giudice mi ha mandato qui per riportarti indietro.
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01"); //(grida) NO.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno , 1);
};

func void DIA_BDT_1033_Fluechtling_Tip2_frei ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_frei_15_00"); //Rilassati, voglio solo parlare.
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_frei_07_01"); //Ma io non ho niente da dirti. Vattene, amico.
	
	Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "Sei solo un topolino impaurito, non è vero?", DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen );
};
func void DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00"); //Sei spaventato a morte, non è vero?
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01"); //Puoi parlare. Non verrai condannato alla forca se verrai catturato.

};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1033_Fluechtling_PERM		(C_INFO)
{
	npc			 = 	BDT_1033_Fluechtling;
	nr			 = 	3;
	condition	 = 	DIA_BDT_1033_Fluechtling_PERM_Condition;
	information	 = 	DIA_BDT_1033_Fluechtling_PERM_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
func int DIA_BDT_1033_Fluechtling_PERM_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1033_Fluechtling_PERM_Info ()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7 ();	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1034_Fluechtling_EXIT   (C_INFO)
{
	npc         = BDT_1034_Fluechtling;
	nr          = 999;
	condition   = DIA_BDT_1034_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1034_Fluechtling_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1034_Fluechtling_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BDT_1034_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1034_Fluechtling_PERM		(C_INFO)
{
	npc			 = 	BDT_1034_Fluechtling;
	nr			 = 	2;
	condition	 = 	DIA_BDT_1034_Fluechtling_PERM_Condition;
	information	 = 	DIA_BDT_1034_Fluechtling_PERM_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
func int DIA_BDT_1034_Fluechtling_PERM_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1034_Fluechtling_PERM_Info ()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme6 ();	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BDT_1035_Fluechtling_EXIT   (C_INFO)
{
	npc         = BDT_1035_Fluechtling;
	nr          = 999;
	condition   = DIA_BDT_1035_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1035_Fluechtling_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_BDT_1035_Fluechtling_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_BDT_1035_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1035_Fluechtling_PERM		(C_INFO)
{
	npc			 = 	BDT_1035_Fluechtling;
	nr			 = 	2;
	condition	 = 	DIA_BDT_1035_Fluechtling_PERM_Condition;
	information	 = 	DIA_BDT_1035_Fluechtling_PERM_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};
func int DIA_BDT_1035_Fluechtling_PERM_Condition ()
{	
	if (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};
func void DIA_BDT_1035_Fluechtling_PERM_Info ()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7 ();	
	AI_StopProcessInfos (self);
};









