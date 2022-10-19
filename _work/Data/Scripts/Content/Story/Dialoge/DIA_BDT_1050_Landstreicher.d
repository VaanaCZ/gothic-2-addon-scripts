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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //Co tu siê dzieje?
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_15_01"); //Co masz na myœli?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_02"); //Jesteœ ju¿ drug¹ osob¹, która przebiega têdy, jakby j¹ goni³o stado krwiopijców.
	
	Info_ClearChoices	(DIA_Landstreicher_HALLO);
		
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Muszê ruszaæ w drogê.", DIA_Landstreicher_HALLO_weg );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "A dok¹d pobieg³ mój poprzednik?", DIA_Landstreicher_HALLO_wo );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Kim by³ ten cz³owiek?", DIA_Landstreicher_HALLO_wer );

};
func void DIA_Landstreicher_HALLO_wo ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wo_15_00"); //A dok¹d pobieg³ mój poprzednik?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //Na górê.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //Kim by³ ten cz³owiek?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //Wygl¹da³ jak jeden z tych nowicjuszy z pobliskiego klasztoru.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //Mów sobie co chcesz, ale ci kolesie na pewno nie maj¹ do koñca po kolei w g³owach.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //Popatrz tylko na te ich kretyñskie ciuchy. Gdyby ktoœ mnie kiedyœ zobaczy³ w czymœ takim, chyba bym siê spali³ ze wstydu.
		Info_AddChoice	(DIA_Landstreicher_HALLO, "Uwa¿aj, co mówisz.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //Uwa¿aj, co mówisz. Sam kiedyœ by³em nowicjuszem w klasztorze.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //Biedaku. Tak, to z pewnoœci¹ t³umaczy kilka spraw.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //Bez obrazy. Ruszaj dalej w swoj¹ drogê. Jesteœ zajêty, nie chcê ciê zatrzymywaæ.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "Ktoœ powinien ciê nauczyæ dobrych manier.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //Ktoœ powinien ciê nauczyæ dobrych manier.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //No, nie obra¿aj siê tak ³atwo. Zreszt¹ dobrze, jeœli koniecznie chcesz bójki, to proszê bardzo.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //Poka¿ mi na co ciê staæ, nowicjuszu.

	AI_StopProcessInfos (self); 
	B_Attack (self, other, AR_NONE, 1);
};



func void DIA_Landstreicher_HALLO_weg ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_weg_15_00"); //Muszê ruszaæ w drogê.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_weg_09_01"); //Jasne. Nie ma sprawy.

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

	description	 = 	"Czego tu szukasz?";
};

func int DIA_Landstreicher_WASMACHSTDU_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Landstreicher_WASMACHSTDU_15_00"); //Czego tu szukasz?
	
		if (Npc_KnowsInfo(other, DIA_Landstreicher_HALLO))
		{
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //Zadajesz cholernie du¿o pytañ.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //Powiedz mi tylko, jak siê nazywasz, a zdradzê ci wszystkie swoje sekrety.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //Czemu nie przestaniesz wsadzaæ nosa w nie swoje sprawy?

	AI_StopProcessInfos (self);
};












