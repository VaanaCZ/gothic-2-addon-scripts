///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jack_DI_EXIT   (C_INFO)
{
	npc         = VLK_444_Jack_DI;
	nr          = 999;
	condition   = DIA_Jack_DI_EXIT_Condition;
	information = DIA_Jack_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jack_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jack_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_DI_GREET		(C_INFO)
{
	npc			 = 	VLK_444_Jack_DI;
	nr			 = 	4;
	condition	 = 	DIA_Jack_DI_GREET_Condition;
	information	 = 	DIA_Jack_DI_GREET_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Jack_DI_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};
var int DIA_Jack_DI_GREET_OneTime;
func void DIA_Jack_DI_GREET_Info ()
{
	if (ORkSturmDI == FALSE)
	{
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_00"); //J'espère que vous savez ce que vous faites, moussaillon.
		AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_01"); //Ce ne sera plus long maintenant.
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_02"); //Gardez votre tête sur les épaules et revenez en un seul morceau.
		AI_StopProcessInfos (self);
	}
	else
	{
		if (DIA_Jack_DI_GREET_OneTime == FALSE)
		{
			AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_03"); //Qu'est-ce que vous faites ici ?
			B_GivePlayerXP (XP_Ambient);
			DIA_Jack_DI_GREET_OneTime = TRUE;
		};

		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_04"); //Si jamais on se retrouve une nouvelle fois dans le pétrin, le bateau repart avec ou sans vous, c'est bien compris ?
		AI_Output			(other ,self, "DIA_Jack_DI_GREET_15_05"); //Ne dites pas n'importe quoi. Je m'occupe de tout.
		AI_Output			(self ,other, "DIA_Jack_DI_GREET_14_06"); //Dans ce cas, faites vite.
		AI_StopProcessInfos (self);
		Npc_ExchangeRoutine	(self,"Start");	
	};
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	VLK_444_Jack_DI;
	nr			 = 	4;
	condition	 = 	DIA_Jack_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Jack_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"J'ai réussi. J'ai éliminé l'ennemi.";

};

func int DIA_Jack_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};
func void DIA_Jack_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Jack_DI_UndeadDragonDead_15_00"); //C'est fait. J'ai éliminé l'ennemi.
	AI_Output			(self ,other, "DIA_Jack_DI_UndeadDragonDead_14_01"); //J'espérais que tout finirait bien, mais je dois reconnaître que, depuis quelques heures, je commençais à avoir de sérieux doutes.
	AI_Output			(self ,other, "DIA_Jack_DI_UndeadDragonDead_14_02"); //Est-ce qu'on peut finalement repartir maintenant ?

	Info_ClearChoices	(DIA_Jack_DI_UndeadDragonDead);
	Info_AddChoice	(DIA_Jack_DI_UndeadDragonDead, "Une petite minute.", DIA_Jack_DI_UndeadDragonDead_moment );
	Info_AddChoice	(DIA_Jack_DI_UndeadDragonDead, "Oui, finissons-en.", DIA_Jack_DI_UndeadDragonDead_over );
	
};
func void DIA_Jack_DI_UndeadDragonDead_moment ()
{
	AI_Output			(other, self, "DIA_Jack_DI_UndeadDragonDead_moment_15_00"); //Ce ne sera plus long. Il me reste juste une chose à faire.
	AI_Output			(self, other, "DIA_Jack_DI_UndeadDragonDead_moment_14_01"); //Dépêchez-vous, voulez-vous ? Je ne voudrais pas attraper le scorbut...
	AI_StopProcessInfos (self);
};

func void DIA_Jack_DI_UndeadDragonDead_over ()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};




