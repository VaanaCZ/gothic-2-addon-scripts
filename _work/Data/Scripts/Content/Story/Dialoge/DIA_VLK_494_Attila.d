///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Attila_EXIT   (C_INFO)
{
	npc         = VLK_494_Attila;
	nr          = 999;
	condition   = DIA_Attila_EXIT_Condition;
	information = DIA_Attila_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Attila_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Attila_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Attila_PICKPOCKET (C_INFO)
{
	npc			= VLK_494_Attila;
	nr			= 900;
	condition	= DIA_Attila_PICKPOCKET_Condition;
	information	= DIA_Attila_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Attila_PICKPOCKET_Condition()
{
	C_Beklauen (55, 100);
};
 
FUNC VOID DIA_Attila_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Attila_PICKPOCKET);
	Info_AddChoice		(DIA_Attila_PICKPOCKET, DIALOG_BACK 		,DIA_Attila_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Attila_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Attila_PICKPOCKET_DoIt);
};

func void DIA_Attila_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Attila_PICKPOCKET);
};
	
func void DIA_Attila_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Attila_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo -> wenn Spieler Mist gebaut hat
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Hallo		(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr 			 =  1;
	condition	 = 	DIA_Attila_Hallo_Condition;
	information	 = 	DIA_Attila_Hallo_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Attila_Hallo_Condition ()
{	
	if (MIS_ThiefGuild_sucked == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Attila_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Attila_Hallo_09_00"); //(posément) Ah, enfin. Je vous attendais, étranger.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Qu'attendez-vous de moi ?",DIA_Attila_Hallo_Was);
	Info_AddChoice		(DIA_Attila_Hallo,"Qui êtes-vous ?",DIA_Attila_Hallo_Wer);
	
	B_GivePlayerXP (XP_Attila_MetHim);
};
FUNC VOID DIA_Attila_Hallo_Wer()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Wer_15_00"); //Qui êtes-vous ?
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_01"); //Je me nomme Attila. Mais est-ce vraiment important ? Un nom ne signifie rien.
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_02"); //Vous devriez le savoir plus que tout autre, étranger. (éclate de rire)
	
	Knows_Attila_Wer = TRUE;
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	if (Knows_Attila_Was == FALSE)
	{
		Info_AddChoice		(DIA_Attila_Hallo,"Qu'attendez-vous de moi ?",DIA_Attila_Hallo_Was);
	};
	Info_AddChoice		(DIA_Attila_Hallo,"Que signifie cette farce ?",DIA_Attila_Hallo_Theater);
}; 
FUNC VOID DIA_Attila_Hallo_Was()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Was_15_00"); //Qu'est-ce que vous me voulez ?
	AI_Output (self, other, "DIA_Attila_Hallo_Was_09_01"); //Je suis venu vous expliquer quelques petites choses. Et une fois cela fait, je vous tuerai.
	Knows_Attila_Was = TRUE;
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	if (Knows_Attila_Wer == FALSE)
	{
		Info_AddChoice		(DIA_Attila_Hallo,"Qui êtes-vous ?",DIA_Attila_Hallo_Wer);
	};
		Info_AddChoice		(DIA_Attila_Hallo,"Qui vous a payé pour faire ça ?",DIA_Attila_Hallo_Auftrag);
		Info_AddChoice		(DIA_Attila_Hallo,"Que signifie cette farce ?",DIA_Attila_Hallo_Theater);
};
FUNC VOID DIA_Attila_Hallo_Theater()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Theater_15_00"); //Qu'est-ce que c'est que cette plaisanterie ?
	AI_Output (self, other, "DIA_Attila_Hallo_Theater_09_01"); //Nul ne devrait mourir ignorant. Considérez qu'il s'agit là d'une mesure de respect à l'égard des condamnés.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Je m'en vais maintenant (FIN)",DIA_Attila_Hallo_Ende);
	Info_AddChoice		(DIA_Attila_Hallo,"Qui vous a payé pour faire ça ?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice		(DIA_Attila_Hallo,"Pourquoi voulez-vous me tuer ?",DIA_Attila_Hallo_Warum);
	
};
FUNC VOID DIA_Attila_Hallo_Ende()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Ende_15_00"); //Bon, je m'en vais.
	AI_Output (self, other, "DIA_Attila_Hallo_Ende_09_01"); //J'ai bien peur de ne pas pouvoir l'accepter. Autant vous faire à l'évidence, l'heure est venue pour vous de mourir.
	AI_DrawWeapon (self);
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Qui vous a payé pour faire ça ?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice		(DIA_Attila_Hallo,"Pourquoi voulez-vous me tuer ?",DIA_Attila_Hallo_Warum);
};
FUNC VOID DIA_Attila_Hallo_Auftrag()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Auftrag_15_00"); //Qui vous a payé pour venir me tuer ?
	AI_Output (self, other, "DIA_Attila_Hallo_Auftrag_09_01"); //Tout comme moi, mes employeurs œuvrent loin de la vue du grand public.
	AI_Output (self, other, "DIA_Attila_Hallo_Auftrag_09_02"); //Et, par contrat, je ne dois ni les nommer, ni mentionner où ils résident.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Pourquoi voulez-vous me tuer ?",DIA_Attila_Hallo_Warum);
};
FUNC VOID DIA_Attila_Hallo_Warum()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Warum_15_00"); //Pourquoi voulez-vous ma mort ?
	
	if (Betrayal_Halvor == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_01"); //Vous avez dénoncé Halvor, qui se trouve en prison par votre faute. Et cela ne faisait pas partir du plan.
	}; 
	if (Rengaru_InKnast == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_02"); //Vous avez vendu Rengaru. Ce n'est qu'un petit voleur minable, mais vous n'auriez pas dû faire ça.
	};
	if (Nagur_Ausgeliefert == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_03"); //Nagur est derrière les barreaux à cause de vous. Pour certains, c'est là une erreur impardonnable...
	};
	
	AI_Output (self, other, "DIA_Attila_Hallo_Warum_09_04"); //Mes employeurs ont très mal pris la chose. Et comme ils ne voudraient pas que vous persévériez dans l'erreur, ils ont décidé de faire appel à moi.
	
	Info_ClearChoices 	(DIA_Attila_Hallo);
	Info_AddChoice		(DIA_Attila_Hallo,"Je peux vous donner de l'or...",DIA_Attila_Hallo_Gold);
	Info_AddChoice		(DIA_Attila_Hallo,"Laissez-moi au moins tirer mon arme.",DIA_Attila_Hallo_Attacke);
	
};
FUNC VOID DIA_Attila_Hallo_Gold()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Gold_15_00"); //Je peux vous donner de l'argent... beaucoup d'argent...
	AI_Output (self, other, "DIA_Attila_Hallo_Gold_09_01"); //Cela serait futile. Là n'est pas la raison de ma présence. Vous ne pouvez payer qu'un seul prix : celui du sang. Et tout de suite !
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
	
};
FUNC VOID DIA_Attila_Hallo_Attacke()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Attacke_15_00"); //Laissez-moi au moins sortir mon arme.
	if (Npc_HasEquippedWeapon (other) == TRUE)
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Attacke_09_01"); //Bien. Dans ce cas, préparez-vous à livrer votre dernière bataille.
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 1);	
	}
	else
	{
		AI_Output (self, other, "DIA_Attila_Hallo_Attacke_09_02"); //Vous n'en avez même pas à la ceinture. Il ne vous reste plus beaucoup de temps, étranger. Vous avez rendez-vous avec la mort.
		AI_StopProcessInfos (self);
		B_Attack (self, other, AR_NONE, 2);	
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Willkommen Schlüssel für die Diebesgilde 
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Willkommen  	(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr			 =  1;
	condition	 = 	DIA_Attila_Willkommen_Condition;
	information	 = 	DIA_Attila_Willkommen_Info;
	permanent	 =	FALSE;					
	important    = 	TRUE;
};

func int DIA_Attila_Willkommen_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk)
	&& (MIS_ThiefGuild_sucked == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Attila_Willkommen_Info ()
{
	AI_Output (self, other, "DIA_Attila_Willkommen_09_00"); //Ah, enfin ! Je vous attendais, étranger...
	B_GivePlayerXP (XP_Attila_Friend);
	AI_Output (other, self, "DIA_Attila_Willkommen_15_01"); //Qui êtes-vous et que me voulez-vous ?
	AI_Output (self, other, "DIA_Attila_Willkommen_09_02"); //Ce n'est pas important. Ce qui compte, c'est ce que vous avez fait. Vous êtes resté loyal, même si vous n'en avez probablement pas conscience.
	AI_Output (self, other, "DIA_Attila_Willkommen_09_03"); //Conscients de votre loyauté, certains bienfaiteurs ont décidé de vous récompenser en vous offrant une chance. Saisissez-la.
	AI_Output (other, self, "DIA_Attila_Willkommen_15_04"); //Hé ! Si vous me disiez ce que vous faites là ?
	AI_Output (self, other, "DIA_Attila_Willkommen_09_05"); //J'ai un cadeau à vous remettre. Le reste ne dépend que de vous, étranger. (rit doucement)
	
	B_GiveInvItems (self,other,ItKe_ThiefGuildKey_MIS,1);
	Attila_Key = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "AFTER");
};
///////////////////////////////////////////////////////////////////////
//	Info Nach Schluessel Übergabe
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_NachSchluessel		(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr			 =  1;
	condition	 = 	DIA_Attila_NachSchluessel_Condition;
	information	 = 	DIA_Attila_NachSchluessel_Info;
	permanent	 =	TRUE;					
	important    = 	TRUE;
};

func int DIA_Attila_NachSchluessel_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Attila_Wer))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Attila_NachSchluessel_Info ()
{
	AI_Output (self, other, "DIA_Attila_NachSchluessel_09_00"); //Ma tâche est accomplie... pour le moment...
	AI_Output (self, other, "DIA_Attila_NachSchluessel_09_01"); //Mais, qui sait, peut-être nos routes se croiseront-elles de nouveau, un autre jour...
	AI_StopProcessInfos (self);	 
};
///////////////////////////////////////////////////////////////////////
//	Info Nach Schluessel Übergabe Wer bist du?
///////////////////////////////////////////////////////////////////////
instance DIA_Attila_Wer		(C_INFO)
{
	npc			 = 	VLK_494_Attila;
	nr			 =  1;
	condition	 = 	DIA_Attila_Wer_Condition;
	information	 = 	DIA_Attila_Wer_Info;
	permanent	 =	FALSE;					
	description	 =  "Qui êtes-vous ?";
};

func int DIA_Attila_Wer_Condition ()
{
	if Npc_KnowsInfo(other, DIA_Attila_Willkommen)
	{
		return TRUE;
	};
};

func void DIA_Attila_Wer_Info ()
{
	AI_Output (other, self, "DIA_Attila_Hallo_Wer_15_00"); //Qui êtes-vous ?
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_01"); //Je me nomme Attila. Mais est-ce vraiment important ? Un nom ne signifie rien.
	AI_Output (self, other, "DIA_Attila_Hallo_Wer_09_02"); //Vous devriez le savoir plus que tout autre, étranger. (éclate de rire)
	
	AI_StopProcessInfos (self);
};






