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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //Co se to tady d�je?
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_15_01"); //Co mysl�?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_02"); //U� jsi druhej, co tudy p�d�, jako by ho pobodaly krvav� mouchy.
	
	Info_ClearChoices	(DIA_Landstreicher_HALLO);
		
	Info_AddChoice	(DIA_Landstreicher_HALLO, "U� mus�m j�t.", DIA_Landstreicher_HALLO_weg );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Kam �el ten druh�?", DIA_Landstreicher_HALLO_wo );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Kdo byl ten druhej chl�pek?", DIA_Landstreicher_HALLO_wer );

};
func void DIA_Landstreicher_HALLO_wo ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wo_15_00"); //Kam �el ten druh�?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //Metelil to d�l po cest� jak namydlenej blesk.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //Kdo byl ten druhej chl�pek?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //Vypadal jako jeden z t�ch chytrol�nskejch novic� z kl�tera.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //��kej si, co chce�, ale n�kter� z t�ch kluk� to nemaj v hlav� v po��dku.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //Sta�� se pod�vat na ty jejich p�iblbl� h�bity. Necht�l bych, aby m� v tom n�kdo chytil v noci na ulici. (sm�ch)
		Info_AddChoice	(DIA_Landstreicher_HALLO, "D�vej si pozor na to, co ��k�. Taky jsem kdysi b�val novicem v kl�te�e.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //D�vej si pozor na jazyk. S�m jsem taky b�val novicem v tom kl�te�e.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //(sm�ch) Ty uboh� svi�ko. To vysv�tluje p�r v�c�.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //Hele kl�dek. Hle� si sv�ho. M� sv�ch starost� dost, tak se nenech ru�it.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "N�kdo by t� m�l nau�it dobr�mu vychov�n�.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //N�kdo by t� m�l nau�it slu�n�mu chov�n�.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //No tak se netva� tak dot�en�. Fajn, kdy� tak tou�� po boji, m� ho m�t.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //Tak mi uka�, co v tob� je, novici.

	AI_StopProcessInfos (self); 
	B_Attack (self, other, AR_NONE, 1);
};



func void DIA_Landstreicher_HALLO_weg ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_weg_15_00"); //U� mus�m j�t.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_weg_09_01"); //Hej. ��dn� probl�m.

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

	description	 = 	"Co tady d�l�?";
};

func int DIA_Landstreicher_WASMACHSTDU_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Landstreicher_WASMACHSTDU_15_00"); //Co tady d�l�?
	
		if (Npc_KnowsInfo(other, DIA_Landstreicher_HALLO))
		{
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //M� n�jak moc ot�zek na takov�ho n�fuku.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //Vzpome� si na tu sk�et� jeskyni, co jsme spolu prolezli, a j� ti �eknu to tajemstv�.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //Jinak se starej s�m o sebe.

	AI_StopProcessInfos (self);
};












