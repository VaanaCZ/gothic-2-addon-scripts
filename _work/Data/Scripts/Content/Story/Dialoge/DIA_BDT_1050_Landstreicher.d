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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //Co se to tady dęje?
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_15_01"); //Co myslíš?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_02"); //Už jsi druhej, co tudy pádí, jako by ho pobodaly krvavý mouchy.
	
	Info_ClearChoices	(DIA_Landstreicher_HALLO);
		
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Už musím jít.", DIA_Landstreicher_HALLO_weg );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Kam šel ten druhý?", DIA_Landstreicher_HALLO_wo );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Kdo byl ten druhej chlápek?", DIA_Landstreicher_HALLO_wer );

};
func void DIA_Landstreicher_HALLO_wo ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wo_15_00"); //Kam šel ten druhý?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //Metelil to dál po cestę jak namydlenej blesk.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //Kdo byl ten druhej chlápek?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //Vypadal jako jeden z tęch chytrolínskejch noviců z kláštera.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //Âíkej si, co chceš, ale nękterý z tęch kluků to nemaj v hlavę v poâádku.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //Stačí se podívat na ty jejich pâiblblý hábity. Nechtęl bych, aby mę v tom nękdo chytil v noci na ulici. (smích)
		Info_AddChoice	(DIA_Landstreicher_HALLO, "Dávej si pozor na to, co âíkáš. Taky jsem kdysi býval novicem v klášteâe.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //Dávej si pozor na jazyk. Sám jsem taky býval novicem v tom klášteâe.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //(smích) Ty ubohá sviŕko. To vysvętluje pár vęcí.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //Hele klídek. Hleë si svýho. Máš svých starostí dost, tak se nenech rušit.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "Nękdo by tę męl naučit dobrýmu vychování.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //Nękdo by tę męl naučit slušnýmu chování.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //No tak se netvaâ tak dotčenę. Fajn, když tak toužíš po boji, máš ho mít.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //Tak mi ukaž, co v tobę je, novici.

	AI_StopProcessInfos (self); 
	B_Attack (self, other, AR_NONE, 1);
};



func void DIA_Landstreicher_HALLO_weg ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_weg_15_00"); //Už musím jít.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_weg_09_01"); //Hej. Žádný problém.

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

	description	 = 	"Co tady dęláš?";
};

func int DIA_Landstreicher_WASMACHSTDU_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Landstreicher_WASMACHSTDU_15_00"); //Co tady dęláš?
	
		if (Npc_KnowsInfo(other, DIA_Landstreicher_HALLO))
		{
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //Máš nęjak moc otázek na takovýho náfuku.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //Vzpomeŕ si na tu skâetí jeskyni, co jsme spolu prolezli, a já ti âeknu to tajemství.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //Jinak se starej sám o sebe.

	AI_StopProcessInfos (self);
};












