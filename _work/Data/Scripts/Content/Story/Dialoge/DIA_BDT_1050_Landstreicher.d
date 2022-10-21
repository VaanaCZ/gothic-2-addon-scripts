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
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_00"); //Qu'est-ce qui vous arrive ?
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_15_01"); //Que voulez-vous dire ?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_09_02"); //Vous �tes le deuxi�me type � se pointer ici comme si vous aviez �t� piqu� par des mouches sanguines.
	
	Info_ClearChoices	(DIA_Landstreicher_HALLO);
		
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Je dois m'en aller.", DIA_Landstreicher_HALLO_weg );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "O� est all� l'autre ?", DIA_Landstreicher_HALLO_wo );
	Info_AddChoice	(DIA_Landstreicher_HALLO, "Qui �tait l'autre type ?", DIA_Landstreicher_HALLO_wer );

};
func void DIA_Landstreicher_HALLO_wo ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wo_15_00"); //O� est all� l'autre ?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //Il a couru comme un �clair dans cette direction.
};

func void DIA_Landstreicher_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //Qui �tait cet autre type ?
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //Il ressemblait � un de ces novices du monast�re.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //Vous pouvez dire ce que vous voulez, mais je crois que ces types ne sont pas tr�s nets dans leur t�te.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //Il suffit de regarder comment ils s'habillent. Je voudrais pas qu'on me croise la nuit en ville avec �a. (rires)
		Info_AddChoice	(DIA_Landstreicher_HALLO, "Surveillez vos propos.", DIA_Landstreicher_HALLO_wer_vorsicht );
	};
};
func void DIA_Landstreicher_HALLO_wer_vorsicht ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //Faites attention � ce que vous dites. J'ai moi-m�me �t� novice au monast�re.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //(rires) Mon saligaud ! �a explique bien des choses.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //Sans vous offenser ! Passez votre chemin. Vous �tes quelqu'un de tr�s occup�, je ne voudrais pas vous retenir.

	Info_AddChoice		(DIA_Landstreicher_HALLO, "Quelqu'un devrait vous apprendre les bonnes mani�res.", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren );

};
func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //Quelqu'un devrait vous apprendre les bonnes mani�res.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //Faites pas votre effarouch�. Mais si c'est vraiment la bagarre que vous voulez, je suis votre serviteur.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //Allez ! Montrez-moi ce que vous avez dans le ventre, novice.

	AI_StopProcessInfos (self); 
	B_Attack (self, other, AR_NONE, 1);
};



func void DIA_Landstreicher_HALLO_weg ()
{
	AI_Output			(other, self, "DIA_Landstreicher_HALLO_weg_15_00"); //Je dois y aller.
	AI_Output			(self, other, "DIA_Landstreicher_HALLO_weg_09_01"); //Pas de probl�me.

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

	description	 = 	"Que venez-vous faire ici ?";
};

func int DIA_Landstreicher_WASMACHSTDU_Condition ()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Landstreicher_WASMACHSTDU_15_00"); //Que faites-vous ici ?
	
		if (Npc_KnowsInfo(other, DIA_Landstreicher_HALLO))
		{
			AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //Vous posez beaucoup de questions pour un jeune freluquet.
		};

	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //Je ne crois pas qu'on ait �lev� les cochons ensemble alors je ne vais pas vous dire mes secrets.
	AI_Output			(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //Alors maintenant, occupez-vous de vos affaires.

	AI_StopProcessInfos (self);
};












