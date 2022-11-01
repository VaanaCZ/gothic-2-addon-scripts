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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //Co tu się dzieje?
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_15_01"); //Co masz na myśli?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_02"); //Jesteś już drugą osobą, która przebiega tędy, jakby ją goniło stado krwiopijców.
	
	Info_ClearChoices	(DIA_Landstreicher_HALLO);
		
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Muszę ruszać w drogę.", DIA_Landstreicher_HALLO_weg );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "A dokąd pobiegł mój poprzednik?", DIA_Landstreicher_HALLO_wo );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Kim był ten człowiek?", DIA_Landstreicher_HALLO_wer );

};
func void DIA_Landstreicher_HALLO_wo ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wo_15_00"); //A dokąd pobiegł mój poprzednik?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //Na górę.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //Kim był ten człowiek?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //Wyglądał jak jeden z tych nowicjuszy z pobliskiego klasztoru.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //Mów sobie co chcesz, ale ci kolesie na pewno nie mają do końca po kolei w głowach.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //Popatrz tylko na te ich kretyńskie ciuchy. Gdyby ktoś mnie kiedyś zobaczył w czymś takim, chyba bym się spalił ze wstydu.
		Info_AddChoice	(DIA_Landstreicher_HALLO, "Uważaj, co mówisz.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //Uważaj, co mówisz. Sam kiedyś byłem nowicjuszem w klasztorze.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //Biedaku. Tak, to z pewnością tłumaczy kilka spraw.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //Bez obrazy. Ruszaj dalej w swoją drogę. Jesteś zajęty, nie chcę cię zatrzymywać.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "Ktoś powinien cię nauczyć dobrych manier.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //Ktoś powinien cię nauczyć dobrych manier.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //No, nie obrażaj się tak łatwo. Zresztą dobrze, jeśli koniecznie chcesz bójki, to proszę bardzo.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //Pokaż mi na co cię stać, nowicjuszu.

	AI_StopProcessInfos (self); 
	B_Attack (self, other, AR_NONE, 1);
};



func void DIA_Landstreicher_HALLO_weg ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_weg_15_00"); //Muszę ruszać w drogę.
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
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //Zadajesz cholernie dużo pytań.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //Powiedz mi tylko, jak się nazywasz, a zdradzę ci wszystkie swoje sekrety.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //Czemu nie przestaniesz wsadzać nosa w nie swoje sprawy?

	AI_StopProcessInfos (self);
};












