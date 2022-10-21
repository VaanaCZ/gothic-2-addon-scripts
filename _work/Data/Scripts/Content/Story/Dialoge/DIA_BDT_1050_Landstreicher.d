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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //Was soll das werden?
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_15_01"); //Was meinst du?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_02"); //Du bist jetzt schon der Zweite, der hier vorbeihastet, als hätten ihn die Blutfliegen gestochen.
	
	Info_ClearChoices	(DIA_Landstreicher_HALLO);
		
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Ich muß weiter.", DIA_Landstreicher_HALLO_weg );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Wo ist der andere hin?", DIA_Landstreicher_HALLO_wo );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Wer war der andere?", DIA_Landstreicher_HALLO_wer );

};
func void DIA_Landstreicher_HALLO_wo ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wo_15_00"); //Wo ist der andere hin?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //Er ist wie der Blitz den Weg da oben raufgerannt.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //Wer war der andere?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //Er sah aus wie einer dieser durchgeistigten Novizen aus dem Kloster da hinten.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //Du kannst mir erzählen, was du willst, aber irgendwie sind die Burschen nicht ganz richtig in der Birne.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //Guck dir doch alleine mal ihre albernen Klamotten an. Damit würde ich mich nicht einmal bei Nacht auf die Straße trauen. (lacht)
		Info_AddChoice	(DIA_Landstreicher_HALLO, "Sei vorsichtig, was du sagst.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //Sei vorsichtig, was du sagst. Ich war auch einmal Novize im Kloster.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //(lacht) Du armes Schwein. Jetzt wird mir allerdings einiges klar.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //Nichts für ungut. Geh ruhig weiter. Reisende Leute soll man nicht aufhalten.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "Dir sollte jemand Manieren beibringen.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //Dir sollte jemand Manieren beibringen.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //Jetzt sei doch nicht gleich beleidigt. Aber gut, wenn du dich unbedingt prügeln willst.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //Dann zeig mal, was du draufhast, Novize.

	AI_StopProcessInfos (self); 
	B_Attack (self, other, AR_NONE, 1);
};



func void DIA_Landstreicher_HALLO_weg ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_weg_15_00"); //Ich muss weiter.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_weg_09_01"); //Hey. Kein Problem.

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

	description	 = 	"Was suchst du hier?";
};

func int DIA_Landstreicher_WASMACHSTDU_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Landstreicher_WASMACHSTDU_15_00"); //Was suchst du hier?
	
		if (Npc_KnowsInfo(other, DIA_Landstreicher_HALLO))
		{
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //Für so einen Schnösel stellst du verdammt viele Fragen.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //Sag mir, durch welche Goblinhöhle wir beide zusammen gekrochen sind und ich erzähl dir meine Geheimnisse.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //Andernfalls kümmere dich um deine Angelegenheiten.

	AI_StopProcessInfos (self);
};












