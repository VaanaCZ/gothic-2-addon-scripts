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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //Co se to tady děje?
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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //Metelil to dál po cestě jak namydlenej blesk.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //Kdo byl ten druhej chlápek?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //Vypadal jako jeden z těch chytrolínskejch noviců z kláštera.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //Říkej si, co chceš, ale některý z těch kluků to nemaj v hlavě v pořádku.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //Stačí se podívat na ty jejich přiblblý hábity. Nechtěl bych, aby mě v tom někdo chytil v noci na ulici. (smích)
		Info_AddChoice	(DIA_Landstreicher_HALLO, "Dávej si pozor na to, co říkáš. Taky jsem kdysi býval novicem v klášteře.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //Dávej si pozor na jazyk. Sám jsem taky býval novicem v tom klášteře.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //(smích) Ty ubohá sviňko. To vysvětluje pár věcí.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //Hele klídek. Hleď si svýho. Máš svých starostí dost, tak se nenech rušit.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "Někdo by tě měl naučit dobrýmu vychování.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //Někdo by tě měl naučit slušnýmu chování.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //No tak se netvař tak dotčeně. Fajn, když tak toužíš po boji, máš ho mít.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //Tak mi ukaž, co v tobě je, novici.

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

	description	 = 	"Co tady děláš?";
};

func int DIA_Landstreicher_WASMACHSTDU_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Landstreicher_WASMACHSTDU_15_00"); //Co tady děláš?
	
		if (Npc_KnowsInfo(other, DIA_Landstreicher_HALLO))
		{
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //Máš nějak moc otázek na takovýho náfuku.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //Vzpomeň si na tu skřetí jeskyni, co jsme spolu prolezli, a já ti řeknu to tajemství.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //Jinak se starej sám o sebe.

	AI_StopProcessInfos (self);
};












