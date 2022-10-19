///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Landstreicher_EXIT   (C_INFO)
{
	npc         = BDT_1050_Landstreicher;
	nr          = 999;
	condition   = DIA_Landstreicher_EXIT_Condition;
	information = DIA_Landstreicher_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Landstreicher_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Landstreicher_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Landstreicher_HALLO		(C_INFO)
{
	npc		 = 	BDT_1050_Landstreicher;
	nr		 = 	5;
	condition	 = 	DIA_Landstreicher_HALLO_Condition;
	information	 = 	DIA_Landstreicher_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Landstreicher_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //Cosa sta succedendo qui?
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_15_01"); //Cosa vuoi dire?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_02"); //Sei la seconda persona che passa di qui correndo come se fosse stata punta da una sanguimosca.
	
	Info_ClearChoices	(DIA_Landstreicher_HALLO);
		
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Devo andare.", DIA_Landstreicher_HALLO_weg );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Dov’è andato l’altro?", DIA_Landstreicher_HALLO_wo );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Chi era l’altro tizio?", DIA_Landstreicher_HALLO_wer );

};
func void DIA_Landstreicher_HALLO_wo ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wo_15_00"); //Dov’è andata l’altra?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //È corsa lassù, come un fulmine.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //Chi era l’altro tizio?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //Somigliava a uno di quei novizi del monastero.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //Puoi dire ciò che vuoi, ma quei tizi hanno qualche rotella fuori posto.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //Basta guardare i buffi vestiti che indossano. Non vorrei mai essere sorpreso per strada di notte con quella roba adosso. (ride)
		Info_AddChoice	(DIA_Landstreicher_HALLO, "Attento a quello che dici.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //Stai attento a come parli. Anch'io un tempo ero un novizio del monastero.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //(ride) Povero stupido. Questo spiega molte cose.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //Non volevo offenderti. Vai per la tua strada. Sei un uomo indaffarato e non voglio trattenerti.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "Qualcuno dovrebbe insegnarti le buone maniere.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //Qualcuno dovrebbe insegnarti le buone maniere.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //Non volevo offenderti, ma se vuoi combattere a tutti i costi, ti accontenterò.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //Fammi vedere quello che sai fare, novizio.

	AI_StopProcessInfos (self); 
	B_Attack (self, other, AR_NONE, 1);
};



func void DIA_Landstreicher_HALLO_weg ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_weg_15_00"); //Devo andare.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_weg_09_01"); //Ehi, non c'è problema.

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info WASMACHSTDU
///////////////////////////////////////////////////////////////////////
instance DIA_Landstreicher_WASMACHSTDU		(C_INFO)
{
	npc		 = 	BDT_1050_Landstreicher;
	nr		 = 	6;
	condition	 = 	DIA_Landstreicher_WASMACHSTDU_Condition;
	information	 = 	DIA_Landstreicher_WASMACHSTDU_Info;
	permanent	 = 	TRUE;

	description	 = 	"Di cosa ti occupi, qui?";
};

func int DIA_Landstreicher_WASMACHSTDU_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Landstreicher_WASMACHSTDU_15_00"); //Di cosa ti occupi, qui?
	
		if (Npc_KnowsInfo(other, DIA_Landstreicher_HALLO))
		{
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //Fai troppe domande per essere un giovane arrogante.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //Dimmi il nome della caverna goblin nella quale ci siamo avventurati insieme, e io ti svelerò i miei segreti.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //Altrimenti pensa agli affari tuoi.

	AI_StopProcessInfos (self);
};












