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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //�Qu� pasa aqu�?
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_15_01"); //�Qu� quieres decir?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_02"); //Eres el segundo que pasa corriendo como si las moscas de sangre le hubiesen picado.
	
	Info_ClearChoices	(DIA_Landstreicher_HALLO);
		
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Tengo que marcharme.", DIA_Landstreicher_HALLO_weg );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "�Ad�nde fue el otro?", DIA_Landstreicher_HALLO_wo );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "�Qui�n era el otro?", DIA_Landstreicher_HALLO_wer );

};
func void DIA_Landstreicher_HALLO_wo ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wo_15_00"); //�Ad�nde fue el otro?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //Se fue hacia all� a toda prisa.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //�Qui�n era el otro?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //Parec�a uno de esos novicios sesudos de aquel monasterio.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //Di lo que te parezca, pero esos tipos no est�n bien de la azotea.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //Mira c�mo se visten. No querr�a que me pillasen en la calle de noche con algo as� puesto. (Se r�e).
		Info_AddChoice	(DIA_Landstreicher_HALLO, "Cuidado con lo que dices.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //Cuidado con lo que dices. Yo tambi�n fui novicio en el monasterio.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //(Se r�e) Pobre diablo. Eso explica unas cuantas cosas.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //Sin �nimo de ofender. M�rchate. Eres un hombre ocupado, y no quiero entretenerte.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "Alguien deber�a ense�arte modales.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //Alguien deber�a ense�arte modales.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //No te hagas el ofendido. Muy bien, si quieres pelea, la vas a tener.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //A ver qu� sabes hacer, novicio.

	AI_StopProcessInfos (self); 
	B_Attack (self, other, AR_NONE, 1);
};



func void DIA_Landstreicher_HALLO_weg ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_weg_15_00"); //Tengo que marcharme.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_weg_09_01"); //Oye, no hay problema.

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

	description	 = 	"�Qu� haces aqu�?";
};

func int DIA_Landstreicher_WASMACHSTDU_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Landstreicher_WASMACHSTDU_15_00"); //�Qu� haces aqu�?
	
		if (Npc_KnowsInfo(other, DIA_Landstreicher_HALLO))
		{
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //Para ser un mocoso, haces demasiadas preguntas.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //Si identificas la cueva de trasgos que recorrimos juntos, te contar� mis secretos.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //Si no, no te metas en lo que no te importa.

	AI_StopProcessInfos (self);
};












