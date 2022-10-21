//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_Hi   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10023_Wache_Hi_Condition()
{	
	if (Npc_GetDistToNpc (self,other) <= 300)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//Hé, où allez-vous ? Vous voulez emprunter ce passage ?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//Bien sûr, pourquoi pas ?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//Il y a encore d'autres esclaves à l'intérieur. En ce qui me concerne, vous pouvez entrer, mais évitez de les malmener. Il ne faudrait pas qu'ils ne puissent plus travailler.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//Après tout, il ne sont pas là pour se la couler douce. Ils sont là pour extraire de l'or.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//Je vois... et qui a ordonné cela ?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//C'est un ordre direct de Bloodwyn.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//Je croyais que Raven était le commandant, ici...
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//C'est exact - mais il a confié les esclaves à Bloodwyn. Il n'en a plus besoin, maintenant.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"Raven n'a plus besoin des esclaves. Ils appartiennent désormais à Bloodwyn."); 
};
//---------------------------------------------------------------------
//	Info go
//---------------------------------------------------------------------
var int PrisonGuard_Rules;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_go   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent   = TRUE;
	description = "Libérez les esclaves !";
};
FUNC INT DIA_Addon_10023_Wache_go_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_go_Info()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_15_00");//Libérez les esclaves !
	
	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//Ecoutez-moi bien. C'est Bloodwyn qui commande, ici. Les esclaves lui appartiennent, alors lui seul a le droit de les libérer.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//De plus, Thorus a aussi son mot à dire à ce sujet. Et vous ?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"Seuls Bloodwyn et Thorus ont le droit de libérer les esclaves.");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//Qu'est-ce que vous avez à dire, vous ?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"J'ai discuté avec Thorus.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(montrer la tête de Bloodwyn)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"C'est MOI qui décide de qui entre dans la mine.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//Je décide de qui rentre dans la mine.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//Vous faites le boulot que faisait Esteban. Dans ce cas, vous n'avez aucun droit ici. Dégagez, maintenant.
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//Et ça, ça vous suffit ?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//(manque de vomir) Rangez ça ! Je ne veux pas voir ce truc.
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//Dans votre intérêt, il vaudrait mieux que vous libériez les esclaves maintenant.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//Attendez un peu... Bloodwyn n'est pas le seul décisionnaire, ici. Aussi longtemps que Thorus ne m'en aura pas donné l'ordre, personne ne sera libéré.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"J'ai discuté avec Thorus.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//Mais vous venez juste de me dire que les esclaves appartiennent à Bloodwyn...
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//Oui, mais j'ai aussi dit que je ne libérerai personne sans en avoir reçu l'ordre de Thorus.
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//Hm... vous êtes l'un de ces types qui n'osera même pas aller se soulager si on ne lui en donne pas l'ordre, hein ?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//Oui, mais j'ai aussi dit...
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//...laissez tomber, j'ai déjà entendu ça.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//J'ai parlé à Thorus. Il a ordonné la libération des esclaves.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//Bien, si Thorus l'a demandée... Mais je me demande bien pourquoi il a pris une telle décision.
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//Thorus ne vous paie pas pour vous poser des questions.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//Bien, bien. Manifestement, ma présence n'est plus requise ici, donc je vais aller me chercher une écuelle de ragoût.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};
