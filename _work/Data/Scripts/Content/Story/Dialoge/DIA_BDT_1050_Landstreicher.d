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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //Co tu si� dzieje?
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_15_01"); //Co masz na my�li?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_02"); //Jeste� ju� drug� osob�, kt�ra przebiega t�dy, jakby j� goni�o stado krwiopijc�w.
	
	Info_ClearChoices	(DIA_Landstreicher_HALLO);
		
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Musz� rusza� w drog�.", DIA_Landstreicher_HALLO_weg );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "A dok�d pobieg� m�j poprzednik?", DIA_Landstreicher_HALLO_wo );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Kim by� ten cz�owiek?", DIA_Landstreicher_HALLO_wer );

};
func void DIA_Landstreicher_HALLO_wo ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wo_15_00"); //A dok�d pobieg� m�j poprzednik?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //Na g�r�.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //Kim by� ten cz�owiek?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //Wygl�da� jak jeden z tych nowicjuszy z pobliskiego klasztoru.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //M�w sobie co chcesz, ale ci kolesie na pewno nie maj� do ko�ca po kolei w g�owach.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //Popatrz tylko na te ich krety�skie ciuchy. Gdyby kto� mnie kiedy� zobaczy� w czym� takim, chyba bym si� spali� ze wstydu.
		Info_AddChoice	(DIA_Landstreicher_HALLO, "Uwa�aj, co m�wisz.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //Uwa�aj, co m�wisz. Sam kiedy� by�em nowicjuszem w klasztorze.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //Biedaku. Tak, to z pewno�ci� t�umaczy kilka spraw.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //Bez obrazy. Ruszaj dalej w swoj� drog�. Jeste� zaj�ty, nie chc� ci� zatrzymywa�.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "Kto� powinien ci� nauczy� dobrych manier.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //Kto� powinien ci� nauczy� dobrych manier.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //No, nie obra�aj si� tak �atwo. Zreszt� dobrze, je�li koniecznie chcesz b�jki, to prosz� bardzo.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //Poka� mi na co ci� sta�, nowicjuszu.

	AI_StopProcessInfos (self); 
	B_Attack (self, other, AR_NONE, 1);
};



func void DIA_Landstreicher_HALLO_weg ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_weg_15_00"); //Musz� rusza� w drog�.
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
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //Zadajesz cholernie du�o pyta�.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //Powiedz mi tylko, jak si� nazywasz, a zdradz� ci wszystkie swoje sekrety.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //Czemu nie przestaniesz wsadza� nosa w nie swoje sprawy?

	AI_StopProcessInfos (self);
};












