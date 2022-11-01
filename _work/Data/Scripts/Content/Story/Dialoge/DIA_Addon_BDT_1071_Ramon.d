// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Ramon_EXIT (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 999;
	condition	= DIA_Addon_Ramon_EXIT_Condition;
	information	= DIA_Addon_Ramon_EXIT_Info;
	permanent	= TRUE;
	description	= DIALOG_ENDE;
};        
         
FUNC INT DIA_Addon_Ramon_EXIT_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
	const string BDT_1071_Checkpoint	= "BL_UP_CHECK";	
// -----------------------------------------------------------
	
instance DIA_Addon_Ramon_FirstWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 1;
	condition	= DIA_Addon_Ramon_FirstWarn_Condition;
	information	= DIA_Addon_Ramon_FirstWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_NONE		)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE		)
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE			)
	&&  (Npc_RefuseTalk(self) 							== FALSE 		))
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if Npc_IsDead (Franco)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_00"); //Hé, qu'est-ce qu'il s'est passé, là-bas ?
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_01"); //J'ai réglé son compte à Franco.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_02"); //Et alors ? Dans ce cas, c'est à vous de faire travailler ces fainéants d'esclaves tous les jours !
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_03"); //Hé, je ne suis pas ici pour me faire des ennemis parmi les chasseurs. Je veux entrer dans le camp.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_04"); //Laissez tomber. Vous avez tué Franco, maintenant, c'est vous le chef. Alors faites votre travail.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_05"); //Si je suis le chef, c'est à moi de décider qui est le prochain à rentrer.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_06"); //Et j'ai décidé que le prochain à rentrer, c'est moi.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_07"); //(rires) Ce n'est pas aussi simple. On n'a demandé personne, alors personne ne rentre.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_08"); //Thorus peut ordonner un nouveau chef à la tête des chasseurs. Alors, je pourrai rentrer.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_09"); //(rires) Vous n'êtes pas du genre à abandonner, pas vrai ? Allez, dépêchez-vous d'aller à la mine.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_10"); //Thorus s'assurera que les chasseurs n'aient pas à vivre sans un chef à leur tête.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_11"); //Qu'est-ce que vous attendez ? Et allez vous chercher une pioche !
		
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP (XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		
		
		AI_Teleport (Carlos,"BL_WAIT_FINN");//40 m Glumpsche
		
		B_StartOtherRoutine (Carlos,"START");
		B_StartOtherRoutine (Finn, "START");
	}
	else if (Ramon_News == FALSE)
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_12"); //Hé, qu'est-ce que vous voulez ! J'ai du mal à croire que vous avez l'autorisation d'accéder au camp...
		
		if Npc_KnowsInfo (other, DIA_Addon_Franco_HI)
		{
			AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_13"); //C'est Franco qui m'envoie. Il veut savoir si vous avez besoin d'aide à l'intérieur du camp.
		};
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_14"); //Ouais, on a besoin de quelqu'un. Hier, l'un des mineurs a encore fait le grand saut.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_15"); //Cet idiot a eu l'excellente idée de chercher des crosses à Esteban.
		AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_15_16"); //Qui est Esteban ?
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_17"); //Le chef du camp inférieur. Celui qui décide qui a le droit d'entrer dans la mine.
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_18"); //Alors allez dire à Franco que Thorus a besoin d'une nouvelle recrue. Compris ?
		
		Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
		B_LogEntry (Topic_Addon_Franco,"Thorus a besoin d'une nouvelle recrue à l'intérieur du camp. Franco sera certainement intéressé.");
		
		Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus ? LE Thorus ?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice    (DIA_Addon_Ramon_FirstWarn,"Thorus ? Jamais entendu parler...",DIA_Addon_Ramon_FirstWarn_NO);
		
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_07_19"); //Hé, doucement ! Pas question que vous entriez là-dedans, alors dégagez !
		AI_StopProcessInfos(self);
	};
				
	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_FirstWarnGiven;
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_00"); //Thorus ? LE Thorus ?
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_01"); //Oui, LE Thorus. Celui qui demande de nouvelles recrues.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_02"); //Celui qui décide si et quand un nouveau peut quitter le marais pour venir au camp.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_03"); //Vous n'essayez pas de me dire que vous le connaissez déjà, hein...?
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_YES_15_04"); //Eh bien... si...
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_05"); //Ecoutez-moi bien. TOUT LE MONDE connaît Thorus.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_YES_07_06"); //Quoi qu'il en soit, je ne vous laisserai pas entrer - je ne lui ferai pas passer de message, non plus !
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
FUNC VOID DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output (other, self,"DIA_Addon_Ramon_FirstWarn_NO_15_00"); //Thorus ? Jamais entendu parler de lui...
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_01"); //Oh, bon sang, vous ne le connaissez pas ? Il était le chef des gardes dans l'ancien camp.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_02"); //Il est le seul homme en qui tout le monde ait confiance.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_03"); //Il demande de nouvelles personnes et décide si et quand quelqu'un doit se rendre à l'intérieur du camp.
	AI_Output (self, other,"DIA_Addon_Ramon_FirstWarn_NO_07_04"); //Si vous vivez assez longtemps, vous le rencontrerez certainement.
	
	Info_ClearChoices (DIA_Addon_Ramon_FirstWarn);
};
// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************

INSTANCE DIA_Addon_Ramon_SecondWarn (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 2;
	condition	= DIA_Addon_Ramon_SecondWarn_Condition;
	information	= DIA_Addon_Ramon_SecondWarn_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_FirstWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	)) 
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output (self, other,"DIA_Addon_Ramon_SecondWarn_07_00"); //Un pas de plus, et ce sera votre dernier !

	other.aivar[AIV_LastDistToWP] 		= Npc_GetDistToWP (other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status]	= GP_SecondWarnGiven;	
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************

INSTANCE DIA_Addon_Ramon_Attack (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 3;
	condition	= DIA_Addon_Ramon_Attack_Condition;
	information	= DIA_Addon_Ramon_Attack_Info;
	permanent	= TRUE;
	important	= TRUE;
};                       

FUNC INT DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status]			== GP_SecondWarnGiven					)
	&&  (self.aivar[AIV_PASSGATE]						== FALSE								) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)		== TRUE									)
	&&  (Npc_GetDistToWP(other,BDT_1071_Checkpoint)		<  (other.aivar[AIV_LastDistToWP]-50)	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] 			= 0;
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;						//wird auch in ZS_Attack resettet
	
	AI_Output (self, other,"DIA_Addon_Ramon_Attack_07_00"); //Certaines personnes ne comprendront jamais...
	
	AI_StopProcessInfos	(self);
	B_Attack (self, other, AR_GuardStopsIntruder, 0); 
};
// ************************************************************
// 			News
// ************************************************************
INSTANCE DIA_Addon_Ramon_News (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_News_Condition;
	information	= DIA_Addon_Ramon_News_Info;
	permanent	= FALSE;
	description	= "Je suis le nouveau mineur.";
};                       

FUNC INT DIA_Addon_Ramon_News_Condition()
{	
	if !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_News_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_News_15_00"); //Je suis le nouveau mineur.
	AI_Output (self, other,"DIA_Addon_Ramon_News_07_01"); //Hé, n'essayez pas de me prendre pour un imbécile. Franco seul décide qui de vous peut accéder au camp.
};
// ************************************************************
// 			Lie
// ************************************************************
INSTANCE DIA_Addon_Ramon_Lie (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 10;
	condition	= DIA_Addon_Ramon_Lie_Condition;
	information	= DIA_Addon_Ramon_Lie_Info;
	permanent	= FALSE;
	description	= "Franco m'a envoyé...";
};                       

FUNC INT DIA_Addon_Ramon_Lie_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Lie_15_00"); //Franco m'envoie...
	AI_Output (self, other,"DIA_Addon_Ramon_Lie_07_01"); //Non, je ne crois pas. Alors dégagez maintenant, avant que je ne vous casse les jambes...
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Addon_Ramon_Perm (C_INFO)
{
	npc			= BDT_1071_Addon_Ramon;
	nr			= 99;
	condition	= DIA_Addon_Ramon_Perm_Condition;
	information	= DIA_Addon_Ramon_Perm_Info;
	permanent	= TRUE;
	description	= "Tout est sous contrôle ?";
};                       

FUNC INT DIA_Addon_Ramon_Perm_Condition()
{
	if Npc_KnowsInfo (other,DIA_Addon_Ramon_News)
	&& !Npc_IsDead (Franco)
	{
		return TRUE;
	};
};
func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output (other, self,"DIA_Addon_Ramon_Perm_15_00"); //Tout est sous contrôle ?
	AI_Output (self, other,"DIA_Addon_Ramon_Perm_07_01"); //Tout se passe très bien - à part certaines personnes qui essaient de rentrer alors qu'elles n'ont RIEN à faire ici !
	
	AI_StopProcessInfos (self);
};


