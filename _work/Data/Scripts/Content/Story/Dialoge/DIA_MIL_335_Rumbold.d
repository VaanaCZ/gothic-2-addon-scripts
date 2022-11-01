// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Rumbold_EXIT   (C_INFO)
{
	npc         = Mil_335_Rumbold;
	nr          = 999;
	condition   = DIA_Rumbold_EXIT_Condition;
	information = DIA_Rumbold_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rumbold_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rumbold_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				PERM VOR Bengar   
// ************************************************************
instance DIA_Rumbold_PrePerm (C_INFO)
{
	npc		 	= Mil_335_Rumbold;
	nr 			= 1;
	condition	= DIA_Rumbold_PrePerm_Condition;
	information	= DIA_Rumbold_PrePerm_Info;
	permanent 	= TRUE;
	description	= "Que faites-vous ici ?";
};

func int DIA_Rumbold_PrePerm_Condition ()
{
	if (!Npc_KnowsInfo (other, DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_PrePerm_Info ()
{
	AI_Output			(other, self, "DIA_Rumbold_PrePerm_15_00"); //Que faites-vous ici ?
	AI_Output			(self, other, "DIA_Rumbold_PrePerm_10_01"); //Cassez-vous, c'est clair ?

	AI_StopProcessInfos (self);
};
 
// ************************************************************
// 			  				Hallo   
// ************************************************************
instance DIA_Rumbold_Hallo		(C_INFO)
{
	npc		 	= Mil_335_Rumbold;
	nr          = 1;
	condition	= DIA_Rumbold_Hallo_Condition;
	information	= DIA_Rumbold_Hallo_Info;
	permanent 	= FALSE;
	important	= TRUE;
};

func int DIA_Rumbold_Hallo_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Rumbold_Hallo_10_00"); //Regardez-moi ce type. Encore un plaisantin. Qu'est-ce que vous fabriquez ici ?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Rumbold_Hallo_10_01"); //Qui diable êtes-vous donc ?
	}
	else
	{
		AI_Output (self, other, "DIA_Rumbold_Hallo_10_02"); //Encore un de ces sales mercenaires !
	};
		
	Info_ClearChoices	(DIA_Rumbold_HALLO);

	Info_AddChoice	(DIA_Rumbold_HALLO, "Je ne suis personne.", DIA_Rumbold_HALLO_schwanzeinziehen );
	Info_AddChoice	(DIA_Rumbold_HALLO, "Je veux que vous disparaissiez d'ici.", DIA_Rumbold_HALLO_verschwindet );
	Info_AddChoice	(DIA_Rumbold_HALLO, "Je suis votre pire cauchemar.", DIA_Rumbold_HALLO_Attack );

};
func void DIA_Rumbold_HALLO_Attack ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_Attack_15_00"); //Je suis votre pire cauchemar !
	AI_Output (self, other, "DIA_Rumbold_HALLO_Attack_10_01"); //Vous êtes un homme mort !

	Info_ClearChoices	(DIA_Rumbold_HALLO);
	Info_AddChoice	(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack );
};

func void DIA_Rumbold_HALLO_verschwindet ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_verschwindet_15_00"); //Je veux que vous disparaissiez d'ici.
	AI_Output (self, other, "DIA_Rumbold_HALLO_verschwindet_10_01"); //Eh bien, eh bien... Ainsi, vous voudriez nous voir disparaître ?
	AI_Output (self, other, "DIA_Rumbold_HALLO_verschwindet_10_02"); //(menaçant) Et que se passera-t-il si nous refusons, hein ?

	Info_ClearChoices	(DIA_Rumbold_HALLO);

	Info_AddChoice	(DIA_Rumbold_HALLO, "Que dois-je payer pour que vous dégagiez d'ici ?", DIA_Rumbold_HALLO_geld);
	Info_AddChoice	(DIA_Rumbold_HALLO, "Dans ce cas, c'est la dernière fois que vous ennuyez les fermiers.", DIA_Rumbold_HALLO_AufsMaul);
};

func void DIA_Rumbold_HALLO_AufsMaul()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_AufsMaul_15_00"); //Dans ce cas, c'est la dernière fois que vous posez des problèmes aux fermiers...
	AI_Output (self, other, "DIA_Rumbold_HALLO_AufsMaul_10_01"); //Vous avez eu les yeux plus gros que le ventre, crétin !
	
	Info_ClearChoices	(DIA_Rumbold_HALLO);
	Info_AddChoice	(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack );
};

func void DIA_Rumbold_HALLO_geld ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_15_00"); //Combien faudrait-il que je vous paye pour que vous partiez ?
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_01"); //Vous voulez payer ce que Bengar nous doit ? Ça change tout...
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_02"); //Laissez-moi réfléchir... si je totalise tout, Bengar nous doit encore 65 pièces d'or.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_03"); //Aboulez la monnaie ou restez tranquillement dans votre coin.
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_10_04"); //Vous êtes le trésorier de Bengar ou quoi ?
	
	Info_ClearChoices (DIA_Rumbold_HALLO);
	Info_AddChoice (DIA_Rumbold_HALLO, "Etes-vous fou ? C'est beaucoup trop.", DIA_Rumbold_HALLO_Geld_TooMuch);
	if (Npc_HasItems (other, itmi_gold) >= 65)
	{
		Info_AddChoice (DIA_Rumbold_HALLO, "Voici votre argent, maintenant dégagez.", DIA_Rumbold_HALLO_geld_ok);
	};
};

func void DIA_Rumbold_HALLO_geld_ok ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_ok_15_00"); //Voilà votre argent. Tirez-vous !
	B_GiveInvItems (other, self, ItMi_Gold, 65);
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_ok_10_01"); //Je me fiche que ce soit vous qui payiez l'ardoise de Bengar. Bonne fin de journée. (pour lui-même) Crétin !
	
	AI_StopProcessInfos (self);

	Rumbold_Bezahlt = TRUE;	

	Npc_ExchangeRoutine	(self,"Start");

	if (Hlp_IsValidNpc (Rick))
	&& (!Npc_IsDead (Rick))	
	{	
		Npc_ExchangeRoutine	(Rick,"Start"); 
		AI_ContinueRoutine (Rick);
	};
	
	if (Hlp_IsValidNpc (Bengar))
	&& (!Npc_IsDead (Bengar))	
	{	
		Npc_ExchangeRoutine	(Bengar,"Start"); 
		AI_ContinueRoutine (Bengar);
	};
};

func void DIA_Rumbold_HALLO_Geld_TooMuch()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_geld_TooMuch_15_00"); //Vous êtes dingue, ou quoi ? C'est beaucoup trop !
	AI_Output (self, other, "DIA_Rumbold_HALLO_geld_TooMuch_10_01"); //Alors, allez vous cacher dans un coin !
	AI_StopProcessInfos (self);
};

func void DIA_Rumbold_HALLO_schwanzeinziehen ()
{
	AI_Output (other, self, "DIA_Rumbold_HALLO_schwanzeinziehen_15_00"); //Je ne suis personne.
	AI_Output (self, other, "DIA_Rumbold_HALLO_schwanzeinziehen_10_01"); //Alors, hors de mon chemin !

	AI_StopProcessInfos (self);
};

func void DIA_Rumbold_HALLO_ENDAttack ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);	

	if (Hlp_IsValidNpc (Rick))
	&& (!C_NpcIsDown (Rick))	
	{	
		B_Attack (Rick, other, AR_KILL, 1);	
	};
};

// ************************************************************
// 			  			Fight Now 
// ************************************************************
instance DIA_Rumbold_FightNow (C_INFO)
{
	npc		 	= Mil_335_Rumbold;
	nr          = 1;
	condition	= DIA_Rumbold_FightNow_Condition;
	information	= DIA_Rumbold_FightNow_Info;
	permanent 	= TRUE;
	description = "Laissez le fermier tranquille !";
};

func int DIA_Rumbold_FightNow_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Rumbold_Hallo))
	&& (Rumbold_Bezahlt == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Rumbold_FightNow_Info ()
{
	AI_Output (other, self, "DIA_Rumbold_FightNow_15_00"); //Laissez le fermier tranquille !
	AI_Output (self, other, "DIA_Rumbold_FightNow_10_01"); //Vous avez des problèmes d'audition, petit ?
	
	Info_ClearChoices	(DIA_Rumbold_FightNow);
	Info_AddChoice	(DIA_Rumbold_FightNow, DIALOG_ENDE, DIA_Rumbold_FightNow_ENDAttack );
};

func void DIA_Rumbold_FightNow_ENDAttack ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);	

	if (Hlp_IsValidNpc (Rick))
	&& (!C_NpcIsDown (Rick))	
	{	
		B_Attack (Rick, other, AR_KILL, 1);	
	};
};

// ************************************************************
// 			  			Immer noch da 
// ************************************************************
instance DIA_Rumbold_StillThere (C_INFO)
{
	npc		 	= Mil_335_Rumbold;
	nr          = 1;
	condition	= DIA_Rumbold_StillThere_Condition;
	information	= DIA_Rumbold_StillThere_Info;
	permanent 	= TRUE;
	description = "Hé ! Vous êtes encore là ?";
};

func int DIA_Rumbold_StillThere_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Rumbold_Hallo))
	&& (Rumbold_Bezahlt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Rumbold_StillThere_Info ()
{
	AI_Output (other, self, "DIA_Rumbold_StillThere_15_00"); //Hé ! Vous êtes toujours là ?
	AI_Output (self, other, "DIA_Rumbold_StillThere_10_01"); //J'en ai marre de vous !
	
	Info_ClearChoices	(DIA_Rumbold_StillThere);
	Info_AddChoice	(DIA_Rumbold_StillThere, DIALOG_ENDE, DIA_Rumbold_StillThere_ENDAttack );
};

func void DIA_Rumbold_StillThere_ENDAttack ()
{
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);	

	if (Hlp_IsValidNpc (Rick))
	&& (!C_NpcIsDown (Rick))	
	{	
		B_Attack (Rick, other, AR_KILL, 1);	
	};
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rumbold_PICKPOCKET (C_INFO)
{
	npc			= Mil_335_Rumbold;
	nr			= 900;
	condition	= DIA_Rumbold_PICKPOCKET_Condition;
	information	= DIA_Rumbold_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Rumbold_PICKPOCKET_Condition()
{
	C_Beklauen (24, 45);
};
 
FUNC VOID DIA_Rumbold_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rumbold_PICKPOCKET);
	Info_AddChoice		(DIA_Rumbold_PICKPOCKET, DIALOG_BACK 		,DIA_Rumbold_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rumbold_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rumbold_PICKPOCKET_DoIt);
};

func void DIA_Rumbold_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rumbold_PICKPOCKET);
};
	
func void DIA_Rumbold_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rumbold_PICKPOCKET);
};










