///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Sancho_EXIT   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 999;
	condition   = DIA_Addon_Sancho_EXIT_Condition;
	information = DIA_Addon_Sancho_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Sancho_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Sancho_PICKPOCKET (C_INFO)
{
	npc			= BDT_1073_Addon_Sancho;
	nr			= 900;
	condition	= DIA_Addon_Sancho_PICKPOCKET_Condition;
	information	= DIA_Addon_Sancho_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Sancho_PICKPOCKET_Condition()
{
	C_Beklauen (50, 40);
};
 
FUNC VOID DIA_Addon_Sancho_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Sancho_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Sancho_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Sancho_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Sancho_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Sancho_PICKPOCKET_DoIt);
};

func void DIA_Addon_Sancho_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Sancho_PICKPOCKET);
};
	
func void DIA_Addon_Sancho_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Sancho_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info HI
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_HI   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 2;
	condition   = DIA_Addon_Sancho_HI_Condition;
	information = DIA_Addon_Sancho_HI_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Sancho_HI_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_HI_Info()
{	
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_00"); //Bon sang, encore un nouveau. (rires) Vous �tes l� pour l'or, vous aussi ?
	AI_Output (other,self,"DIA_Addon_Sancho_HI_15_01"); //L'or ?
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_02"); //(rires) Arr�tez de me faire marcher !
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_03"); //Tous les nouveaux gardes qui arrivent ici veulent rentrer dans la mine.
	AI_Output (self,other,"DIA_Addon_Sancho_HI_06_04"); //Mais n'allez pas croire que c'est aussi simple que cela !

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	
	SC_KnowsRavensGoldmine = TRUE;
};

//---------------------------------------------------------------------
//	Lager
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Lager   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 2;
	condition   = DIA_Addon_Sancho_Lager_Condition;
	information = DIA_Addon_Sancho_Lager_Info;
	permanent   = FALSE;
	description = "Comment puis-je entrer dans le camp ?";
};
FUNC INT DIA_Addon_Sancho_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Sancho_Lager_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Lager_15_00"); //Comment puis-je entrer dans le camp ?
	AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_01"); //Il suffit de suivre les marches !
	if (!Npc_IsDead(Franco))
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_02"); //Mais si vous voulez acc�der � la mine, il faudra passer par Franco.
		AI_Output (self,other,"DIA_Addon_Sancho_Lager_06_03"); //Il attend de tous les nouveaux qu'ils triment ici quelque temps avant de se rendre dans la mine !
	};
	
	Log_CreateTopic (Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Franco,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Franco,"Tous les nouveaux doivent aller travailler dans le marais avant d'�tre autoris�s � acc�der � la mine.");
};

//---------------------------------------------------------------------
//	Mine
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Mine   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 3;
	condition   = DIA_Addon_Sancho_Mine_Condition;
	information = DIA_Addon_Sancho_Mine_Info;
	permanent   = FALSE;
	description = "Parlez-moi de la mine...";
};
FUNC INT DIA_Addon_Sancho_Mine_Condition()
{	
	if (!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Mine_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Mine_15_00"); //Dites-m'en davantage sur la mine...
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_01"); //Je vais vous donner un bon conseil : si vous voulez y rentrer, arrangez-vous pour �tre en bons termes avec Franco. C'est lui le chef, ici.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_02"); //C'est lui qui d�cide qui sera le prochain � rentrer.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_03"); //Mais il ne vous laissera pas rentrer s'il voit que vous vous la coulez douce, ici.
	AI_Output (self,other,"DIA_Addon_Sancho_Mine_06_04"); //Alors allez le voir et dites-lui de vous donner du travail !
	
	B_LogEntry (Topic_Addon_Franco,"FRANCO seul d�cide qui peut entrer dans le camp. C'est �galement lui qui attribue les t�ches � chacun.");
};

//---------------------------------------------------------------------
// Wo Franco
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Franco (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 4;
	condition   = DIA_Addon_Sancho_Franco_Condition;
	information = DIA_Addon_Sancho_Franco_Info;
	permanent   = FALSE;
	description = "O� puis-je trouver ce Franco ?";
};
FUNC INT DIA_Addon_Sancho_Franco_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Sancho_Mine))
	&& (!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Franco_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Franco_15_00"); //O� puis-je trouver ce Franco ?
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_01"); //G�n�ralement, il passe son temps dans la cour devant le camp.
	AI_Output (self,other,"DIA_Addon_Sancho_Franco_06_02"); //Mettez-vous en bons termes avec lui si vous ne voulez pas vous retrouver avec un boulot de merde comme moi !
	
	B_LogEntry (Topic_Addon_Franco,"Franco tra�ne souvent dans la cour devant le camp.");
};

//---------------------------------------------------------------------
//	Spitzel
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Spitzel (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 5;
	condition   = DIA_Addon_Sancho_Spitzel_Condition;
	information = DIA_Addon_Sancho_Spitzel_Info;
	permanent   = FALSE;
	description = "Vous �tes vraiment oblig� de passer tout votre temps l�-bas ?";
};
FUNC INT DIA_Addon_Sancho_Spitzel_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Sancho_Franco))
	|| (Npc_IsDead(Franco))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Sancho_Spitzel_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Spitzel_15_00");//Vous �tes vraiment oblig� de passer tout votre temps ici, sans rien faire ?
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_01");//Je suis cens� faire connaissance avec tous les nouveaux gars, histoire m'assurer qu'aucun d'eux n'est un espion.
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_02");//Mais bon, quel int�r�t ?! Je veux dire, on est au fin fond du monde, ici - au milieu d'un marais !
	AI_Output (self,other,"DIA_Addon_Sancho_Spitzel_06_03");//Personne ne peut nous trouver, personne ne nous trouvera - et qui pourrait bien vouloir prendre la peine de nous envoyer un espion ?!
};

//---------------------------------------------------------------------
//	Info Perm
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Sancho_Perm   (C_INFO)
{
	npc         = BDT_1073_Addon_Sancho;
	nr          = 99;
	condition   = DIA_Addon_Sancho_Perm_Condition;
	information = DIA_Addon_Sancho_Perm_Info;
	permanent   = TRUE;
	description = "Quoi de neuf ?";
};
FUNC INT DIA_Addon_Sancho_Perm_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Sancho_Spitzel)
	{	
		return TRUE;
	};
};
var int Comment_Franco;
var int Comment_Esteban;
FUNC VOID DIA_Addon_Sancho_Perm_Info()
{	
	AI_Output (other,self,"DIA_Addon_Sancho_Perm_15_00");//Alors, du nouveau ?
	
	if Npc_IsDead (Franco)
	&& (Comment_Franco == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_01");//J'ai entendu dire que vous aviez tu� Franco. Beau travail...
		
		if !Npc_IsDead (Carlos)
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_02");//...mais maintenant, on a ce maudit Carlos sur le dos. Lui, il ne faut pas lui en raconter...
		}
		else
		{
			AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_03");//Et vous avez r�gl� son compte � Carlos, aussi ? Mon gars, vous �tes un sacr� foutu tueur, pas vrai ? Laissez-moi tranquille, maintenant.
		};
		
		Comment_Franco = TRUE;
	}
	else if Npc_IsDead (Esteban)
	&& (Comment_Esteban == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_04");//J'ai entendu dire que vous aviez tu� Esteban. Dites, vous �tes en train de pr�parer quelque chose, pas vrai ?
		
		Comment_Esteban = TRUE;
	}
	else
	{
		AI_Output (self,other,"DIA_Addon_Sancho_Perm_06_05");//Non, rien de nouveau pour l'instant.
	};
	
};





