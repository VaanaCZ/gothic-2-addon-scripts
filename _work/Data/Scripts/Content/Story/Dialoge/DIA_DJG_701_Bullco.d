
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_BullcoDJG_EXIT   (C_INFO)
{
	npc         = DJG_701_Bullco;
	nr          = 999;
	condition   = DIA_BullcoDJG_EXIT_Condition;
	information = DIA_BullcoDJG_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_BullcoDJG_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_BullcoDJG_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////

instance DIA_BullcoDJG_HALLO		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		= 5;
	condition	 = 	DIA_BullcoDJG_HALLO_Condition;
	information	 = 	DIA_BullcoDJG_HALLO_Info;

	description	 = 	"Quel est le problème ??";
};

func int DIA_BullcoDJG_HALLO_Condition ()
{
	if ((Npc_IsDead(DJG_Sylvio))==FALSE)
		{
				return TRUE;
		};
};

func void DIA_BullcoDJG_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_BullcoDJG_HALLO_15_00"); //Quel est le problème ?
	AI_Output			(self, other, "DIA_BullcoDJG_HALLO_06_01"); //Il fait tellement froid ! Je ne sais pas pourquoi Sylvio voulait tant venir ici !
	AI_Output			(self, other, "DIA_BullcoDJG_HALLO_06_02"); //Il y a plein d'autres endroits dans la région où il y a des choses à faire.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wartemal
///////////////////////////////////////////////////////////////////////
instance DIA_BullcoDJG_WARTEMAL		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		= 6;
	condition	 = 	DIA_BullcoDJG_WARTEMAL_Condition;
	information	 = 	DIA_BullcoDJG_WARTEMAL_Info;

	permanent	 = 	TRUE;

	description	 = 	"Sinon tout va bien ?";
};

func int DIA_BullcoDJG_WARTEMAL_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_BullcoDJG_HALLO))
		|| (Npc_KnowsInfo(other, DIA_Bullco_WASNUN))
		{
				return TRUE;
		};
};

func void DIA_BullcoDJG_WARTEMAL_Info ()
{
	AI_Output			(other, self, "DIA_BullcoDJG_WARTEMAL_15_00"); //Tout va bien sinon ?

	if (Npc_KnowsInfo(other, DIA_Bullco_WASNUN))
		{
		AI_Output			(self, other, "DIA_BullcoDJG_WARTEMAL_06_01"); //Arrêtez de me taper sur les nerfs.
		}
	else
		{
		AI_Output			(self, other, "DIA_BullcoDJG_WARTEMAL_06_02"); //Pas maintenant ! Je gèle ! Je veux juste partir d'ici aussi vite que possible.
		};

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info SylvioDead
///////////////////////////////////////////////////////////////////////
instance DIA_Bullco_SYLVIODEAD		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr   		 = 	7;
	condition	 = 	DIA_Bullco_SYLVIODEAD_Condition;
	information	 = 	DIA_Bullco_SYLVIODEAD_Info;
	important	 = 	TRUE;
};

func int DIA_Bullco_SYLVIODEAD_Condition ()
{
	if (Npc_IsDead(DJG_Sylvio))
		{
				return TRUE;
		};
};

func void DIA_Bullco_SYLVIODEAD_Info ()
{
	AI_Output			(self, other, "DIA_Bullco_SYLVIODEAD_06_00"); //Malédiction. Sylvio est mort.

	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Bullco_WASNUN		(C_INFO)
{
	npc		 = 	DJG_701_Bullco;
	nr		 = 	8;
	condition	 = 	DIA_Bullco_WASNUN_Condition;
	information	 = 	DIA_Bullco_WASNUN_Info;

	description	 = 	"Que comptez-vous faire maintenant ?";
};

func int DIA_Bullco_WASNUN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Bullco_SYLVIODEAD))
		&&(Npc_IsDead(DJG_Sylvio))
		{
				return TRUE;
		};
};

func void DIA_Bullco_WASNUN_Info ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_15_00"); //Que comptez-vous faire maintenant que Sylvio est mort ?
	AI_Output			(self, other, "DIA_Bullco_WASNUN_06_01"); //Aucune idée. Je pense que je vais aller avec les autres chasseurs de dragons, s'ils veulent encore de moi.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Je crois que je vais juste vous arracher la tête.", DIA_Bullco_WASNUN_kopfab );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Savez-vous où sont les autres ?", DIA_Bullco_WASNUN_woandere );

};

func void DIA_Bullco_WASNUN_woandere ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_15_00"); //Savez-vous où sont les autres ?
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_06_01"); //Je crois. Du moins, j'ai vu l'un d'entre eux près de la rivière là-bas.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Menez-moi aux autres chasseurs de dragons.", DIA_Bullco_WASNUN_woandere_zuihnen );
};
func void DIA_Bullco_WASNUN_woandere_zuihnen ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_15_00"); //Conduisez-moi aux autres chasseurs de dragon.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_06_01"); //Eh ! Je ne suis pas votre valet.

	Info_ClearChoices	(DIA_Bullco_WASNUN);

	Info_AddChoice	(DIA_Bullco_WASNUN, "Comme vous voudrez.", DIA_Bullco_WASNUN_woandere_zuihnen_alleine );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Estimez-vous heureux que je vous laisse vivre.", DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen );
	Info_AddChoice	(DIA_Bullco_WASNUN, "Je vous en offre 50 pièces d'or.", DIA_Bullco_WASNUN_woandere_zuihnen_Geld );


};
func void DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00"); //Estimez-vous heureux que je vous laisse vivre.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01"); //Laissez-moi tranquille.
	AI_StopProcessInfos (self);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_Geld ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00"); //Je vous donne 50 pièces d'or si vous le faites.
	
	if (B_GiveInvItems (other, self, ItMi_Gold,50))
		{
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01"); //Très bien. Envoyez la monnaie.
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02"); //Suivez-moi. Je vais vous conduire où j'ai vu pour la dernière fois l'un de ces chasseurs de dragons.
			AI_StopProcessInfos (self);
			Npc_ExchangeRoutine	(self,"DJGVorposten");
		}
		else
		{
			AI_Output			(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03"); //Vous n'avez pas 50 pièces d'or. Allez au diable.
			AI_StopProcessInfos (self);
		};
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_alleine ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00"); //Comme vous voulez, je suis sûr que je les trouverai.
	AI_Output			(self ,other, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01"); //Alors n'allez pas au diable.
	
	AI_StopProcessInfos (self);
};


func void DIA_Bullco_WASNUN_kopfab ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_kopfab_15_00"); //Je pourrais vous arracher la tête.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_kopfab_06_01"); //Fermez-la.

	Info_AddChoice	(DIA_Bullco_WASNUN, "Tirez votre arme. Nous allons en finir tout de suite.", DIA_Bullco_WASNUN_kopfab_angriff );


};
func void DIA_Bullco_WASNUN_kopfab_angriff ()
{
	AI_Output			(other, self, "DIA_Bullco_WASNUN_kopfab_angriff_15_00"); //Tirez votre arme. Nous allons en terminer maintenant.
	AI_Output			(self, other, "DIA_Bullco_WASNUN_kopfab_angriff_06_01"); //Qu'il en soit ainsi.

	AI_StopProcessInfos (self);

	B_Attack (self, other, AR_NONE, 1);	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bullco_PICKPOCKET (C_INFO)
{
	npc			= DJG_701_Bullco;
	nr			= 900;
	condition	= DIA_Bullco_PICKPOCKET_Condition;
	information	= DIA_Bullco_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bullco_PICKPOCKET_Condition()
{
	C_Beklauen (34, 65);
};
 
FUNC VOID DIA_Bullco_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bullco_PICKPOCKET);
	Info_AddChoice		(DIA_Bullco_PICKPOCKET, DIALOG_BACK 		,DIA_Bullco_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bullco_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bullco_PICKPOCKET_DoIt);
};

func void DIA_Bullco_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bullco_PICKPOCKET);
};
	
func void DIA_Bullco_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bullco_PICKPOCKET);
};






