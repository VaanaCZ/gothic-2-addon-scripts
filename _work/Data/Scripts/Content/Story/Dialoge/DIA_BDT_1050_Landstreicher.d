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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //Co se to tady dìje?
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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //Metelil to dál po cestì jak namydlenej blesk.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //Kdo byl ten druhej chlápek?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //Vypadal jako jeden z tìch chytrolínskejch novicù z kláštera.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //Øíkej si, co chceš, ale nìkterý z tìch klukù to nemaj v hlavì v poøádku.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //Staèí se podívat na ty jejich pøiblblý hábity. Nechtìl bych, aby mì v tom nìkdo chytil v noci na ulici. (smích)
		Info_AddChoice	(DIA_Landstreicher_HALLO, "Dávej si pozor na to, co øíkáš. Taky jsem kdysi býval novicem v klášteøe.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //Dávej si pozor na jazyk. Sám jsem taky býval novicem v tom klášteøe.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //(smích) Ty ubohá sviòko. To vysvìtluje pár vìcí.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //Hele klídek. Hleï si svýho. Máš svých starostí dost, tak se nenech rušit.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "Nìkdo by tì mìl nauèit dobrýmu vychování.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //Nìkdo by tì mìl nauèit slušnýmu chování.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //No tak se netvaø tak dotèenì. Fajn, když tak toužíš po boji, máš ho mít.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //Tak mi ukaž, co v tobì je, novici.

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

	description	 = 	"Co tady dìláš?";
};

func int DIA_Landstreicher_WASMACHSTDU_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Landstreicher_WASMACHSTDU_15_00"); //Co tady dìláš?
	
		if (Npc_KnowsInfo(other, DIA_Landstreicher_HALLO))
		{
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //Máš nìjak moc otázek na takovýho náfuku.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //Vzpomeò si na tu skøetí jeskyni, co jsme spolu prolezli, a já ti øeknu to tajemství.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //Jinak se starej sám o sebe.

	AI_StopProcessInfos (self);
};












