
///////////////////////////////////////////////////////////////////////
//DIA_BDT_10XX_Fluechtling
///////////////////////////////////////////////////////////////////////

FUNC VOID B_DIA_BDT_10XX_Fluechtling_Stimme7 ()
{
	AI_Output			(self, other, "DIA_B_DIA_BDT_10XX_Fluechtling_07_00"); //Zapomeŕ na to. Do vęzení už se nevrátím.
};

FUNC VOID B_DIA_BDT_10XX_Fluechtling_Stimme6 ()
{
	AI_Output			(self, other, "DIA_B_DIA_BDT_10XX_Fluechtling_06_00"); //Už se ti nepodaâí nás znovu dostat do basy, jasný?
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
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_07_00"); //Jestli nechceš skončit v base, udęláš líp, když se ode mę budeš držet dál.
	B_GivePlayerXP (XP_AmbientKap3);
	
	if (SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices	(DIA_BDT_1031_Fluechtling_Tip1);
		Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "Nemám v plánu na tebe donášet.", DIA_BDT_1031_Fluechtling_Tip1_frei );
		Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "Pâišel jsem tę zatknout.", DIA_BDT_1031_Fluechtling_Tip1_Knast );
		Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "Kde je Morgahard, tvůj velitel?", DIA_BDT_1031_Fluechtling_Tip1_Morgahard );
	};
};
func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00"); //Kde je Morgahard, tvůj velitel?
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01"); //Rozdęlíme se, takže nás tak rychle nedostanou. Nebudeme vędęt, kde jsou ostatní.
	
	Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "To je zlé. Tak to hádám, že bych męl dostat soudce.", DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen );

};
func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00"); //To je zlé. Tak to hádám, že bych męl dostat soudce.
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01"); //Fajn, fajn. Asi by se nękteâí z nás męli zdejchnout do krčmy. Ale ode mę jste to neslyšeli, jasný?
	AI_StopProcessInfos (self);
};

func void DIA_BDT_1031_Fluechtling_Tip1_Knast ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00"); //Pâišel jsem tę zatknout.
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01"); //Jen pâes mou mrtvolu.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno , 1);
};

func void DIA_BDT_1031_Fluechtling_Tip1_frei ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_frei_15_00"); //Nemám v plánu na tebe donášet.
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_frei_07_01"); //Jestli tę poslal soudce, tak mu vyâië, že se může jít vycpat.
	
	Info_AddChoice	(DIA_BDT_1031_Fluechtling_Tip1, "Tak co si provedl?", DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen );
};
func void DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen ()
{
	AI_Output			(other, self, "DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00"); //Tak co jsi provedl?
	AI_Output			(self, other, "DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01"); //Do toho ti nic není.

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
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_07_00"); //(vydęšenę) Co ode mę chceš?
	B_GivePlayerXP (XP_AmbientKap3);
	
	if (SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices	(DIA_BDT_1033_Fluechtling_Tip2);
		Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "Klídek. Chci si jen promluvit.", DIA_BDT_1033_Fluechtling_Tip2_frei );
		Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "Soudce mę poslal, abych tę pâivedl zpátky.", DIA_BDT_1033_Fluechtling_Tip2_Knast );
		Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "Kde je Morgahard, tvůj velitel?", DIA_BDT_1033_Fluechtling_Tip2_Morgahard );
	};
};
func void DIA_BDT_1033_Fluechtling_Tip2_Morgahard ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00"); //Kde je Morgahard, tvůj velitel?
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01"); //(vydęšenę) Nechci žádné problémy. Zajdi za velkostatkáâem. Chtęl si sám najmout nęjaké žoldáky. A teë mę nech na pokoji.
	AI_StopProcessInfos (self);
};

func void DIA_BDT_1033_Fluechtling_Tip2_Knast ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00"); //Soudce mę poslal, abych tę pâivedl zpátky.
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01"); //(kâičí) NE.
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno , 1);
};

func void DIA_BDT_1033_Fluechtling_Tip2_frei ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_frei_15_00"); //Klídek. Chci si jen promluvit.
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_frei_07_01"); //Ale já s tebou mluvit nechci. Zmizni, chlape.
	
	Info_AddChoice	(DIA_BDT_1033_Fluechtling_Tip2, "Tys fakticky jenom ustrašený srábek, co?", DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen );
};
func void DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen ()
{
	AI_Output			(other, self, "DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00"); //Jseš podęlanej strachy, co?
	AI_Output			(self, other, "DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01"); //Můžeš klidnę mluvit. Kdyby tę chytili, tak ti žádná šibenice nehrozí.

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









