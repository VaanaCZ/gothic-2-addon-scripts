//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_EXIT   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 999;
	condition   = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent   = TRUE;
	description = "Je dois y aller...";
};
FUNC INT DIA_Addon_Lennar_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_EXIT_Info()
{		
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lennar_PICKPOCKET (C_INFO)
{
	npc			= BDT_1096_Addon_Lennar;
	nr			= 900;
	condition	= DIA_Addon_Lennar_PICKPOCKET_Condition;
	information	= DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	C_Beklauen (65, 100);
};
 
FUNC VOID DIA_Addon_Lennar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
	
func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hi   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 1;
	condition   = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent   = FALSE;
	description	= "Bonjour !";
};
FUNC INT DIA_Addon_Lennar_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_00");//Bonjour !
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_01");//Bonjour ! Mon nom est Lennar. Bienvenue dans le camp des mineurs.
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_02");//Mineurs ? Je croyais que c'était le camp des bandits...
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_03");//C'est exact, mais les bandits viennent creuser ici, eux aussi. (Hausse les épaules) Donc...
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Attentat   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 2;
	condition   = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent   = FALSE;
	description	= "A propos de la tentative de meurtre d'Esteban...";
};
FUNC INT DIA_Addon_Lennar_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Attentat_Info()
{
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_00"); //(naïvement) Oui ?
	AI_Output (other, self, "DIA_Addon_Lennar_ATTENTAT_15_01"); //Avez-vous une idée quant au responsable ?
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_02"); //(enthousiaste) Bien sûr !
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_03"); //(désordonné) Laissez-moi vous dire : c'est Emilio qui a organisé tout ça !
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_04"); //(désordonné) Il courait toujours comme un fou jusqu'à la mine. Il creusait autant qu'il pouvait !
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_05"); //(fielleux) Mais depuis l'attaque, il reste assis sur son banc, sans bouger d'un pouce.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_06"); //(comprenant) C'est évident ! Pour entrer dans la mine, il doit recevoir une pierre rouge d'Esteban.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_07"); //(conspirant) Je suis sûr qu'il n'ose même pas le regarder droit dans les yeux.

	B_LogEntry (Topic_Addon_Esteban, "Lennar soupçonne Emilio, car celui-ci évite maintenant Esteban.");
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Inspektor (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 3;
	condition   = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent   = FALSE;
	description	= "En quoi la mort d'Esteban profiterait-elle à Emilio ?";
};
FUNC INT DIA_Addon_Lennar_Inspektor_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Inspektor_15_00"); //En quoi la mort d'Esteban profiterait-elle à Emilio ?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_01"); //Qu'est-ce que j'en sais ? Peut-être qu'il a un complice dans la mine, qui prendrait la place d'Esteban ?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_02"); //(pour lui-même) Ouais, ça se tient...
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Mine   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 4;
	condition   = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Lennar_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_00");//Vous m'apportez vraiment une pierre rouge !
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_01");//Excellent ! Maintenant, je vais faire de la poussière de toutes ces roches - je sais exactement où aller !
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_02");//Encore une chose - si vous descendez à la mine, faites attention à ne pas frapper trop fort. Sinon, votre pioche se trouvera prise dans l'or !
	
	B_Upgrade_Hero_HackChance(10);
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Gold   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 5;
	condition   = DIA_Addon_Lennar_Gold_Condition;
	information = DIA_Addon_Lennar_Gold_Info;
	permanent   = FALSE;
	description = "Pouvez-vous m'apprendre à extraire de l'or ?";
};
FUNC INT DIA_Addon_Lennar_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lennar_Hi)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_00"); //Pouvez-vous m'apprendre quelque chose sur l'extraction de l'or ?
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_01"); //Certainement, mais si je vous apprends quelque chose, vous pourrez extraire plus d'or !
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_02"); //C'est bien pour cela que je vous demande...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_03"); //Bien sûr. Mais si vous pouvez extraire davantage d'or, il est légitime que vous m'en donniez une part.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_04"); //Eh bien...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_05"); //Vous pourriez même me donner ma part à l'avance. Disons...
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_06"); //Cinquante pièces d'or.
};

//---------------------------------------------------------------------
//	Train
//---------------------------------------------------------------------
var int Lennar_TeachGold;
// --------------------------------------------
INSTANCE DIA_Addon_Lennar_Train   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 6;
	condition   = DIA_Addon_Lennar_Train_Condition;
	information = DIA_Addon_Lennar_Train_Info;
	permanent   = TRUE;
	description = "Apprenez-moi à extraire de l'or ! (50 pièces d'or)";
};
FUNC INT DIA_Addon_Lennar_Train_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Lennar_Gold))
	&& (Lennar_TeachGold == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Train_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Train_15_00"); //Apprenez-moi à extraire de l'or !
	
	if B_GiveInvItems (other, self, itmi_gold, 50)
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_01"); //Bien. Pour progresser, frappez régulièrement la paroi avec votre pioche. N'en faites pas trop - mais ne vous endormez pas non plus.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_02"); //Et ne frappez pas toujours au même endroit - essayez de dégager des pépites de taille convenable.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_03"); //Faites comme je vous dis, et vous deviendrez rapidement un maître mineur.
		
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_04"); //D'abord, je veux voir ma part !
	};
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hacker   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 9;
	condition   = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent   = TRUE;
	Description = "Tout va bien ?"; 
};
FUNC INT DIA_Addon_Lennar_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Lennar_Hacker_15_00"); //Tout va bien ?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Lennar_Hacker_01_01"); //Toujours bien régulièrement - c'est comme ça que vous dégagerez les plus grosses pépites !
};


