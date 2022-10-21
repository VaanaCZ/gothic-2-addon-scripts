// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Matt_EXIT(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 999;
	condition	= DIA_Addon_Matt_EXIT_Condition;
	information	= DIA_Addon_Matt_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Matt_EXIT_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Matt_PICKPOCKET (C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 900;
	condition	= DIA_Addon_Matt_PICKPOCKET_Condition;
	information	= DIA_Addon_Matt_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Matt_PICKPOCKET_Condition()
{
	C_Beklauen (55, 91);
};
 
FUNC VOID DIA_Addon_Matt_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Matt_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Matt_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Matt_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Matt_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Matt_PICKPOCKET_DoIt);
};

func void DIA_Addon_Matt_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Matt_PICKPOCKET);
};
	
func void DIA_Addon_Matt_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Matt_PICKPOCKET);
};
// ************************************************************
// 			  Hello 
// ************************************************************
INSTANCE DIA_Addon_Matt_Hello(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 1;
	condition	= DIA_Addon_Matt_Hello_Condition;
	information	= DIA_Addon_Matt_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Addon_Matt_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Matt_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Addon_Matt_Hello_10_01"); //Vous êtes nouveau ici, hein ? Parfait. On a besoin de tout le monde.
};

// ************************************************************
// 			 				PERM 
// ************************************************************
INSTANCE DIA_Addon_Matt_PERM (C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 2;
	condition	= DIA_Addon_Matt_PERM_Condition;
	information	= DIA_Addon_Matt_PERM_Info;
	permanent	= TRUE;
	Description  = "Qu'y a-t-il?";
};                       
FUNC INT DIA_Addon_Matt_PERM_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_PERM_Info()
{	
	AI_Output (other, self, "DIA_Addon_Matt_Alright_15_01"); //Comment ça se passe ?
	
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output (self ,other,"DIA_Addon_Matt_Alright_10_02"); //Une potion de soins ! Il y a un mot qui vous échappe ?
		}
		else
		{
			AI_Output (self ,other,"DIA_Addon_Matt_Alright_10_01"); //Tout est en ordre - (cynique) Cap'taine !
		};
	}
	else if (GregIsBack == TRUE)
	&& (!Npc_IsDead(Greg))
	{
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_01"); //Très drôle. Nous n'avons plus de bateau.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_02"); //Je vais attendre de voir ce que va faire Greg.
	}
	else
	{
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_03"); //Pour le moment, le camp est calme. Je vais me reposer un peu.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_04"); //Et à votre place, j'en ferais autant.
		AI_Output (self ,other,"DIA_Addon_Matt_Job_10_05"); //Depuis que les bandits sont là, la situation peut évoluer plus vite qu'on le voudrait.
	};
};

// ************************************************************
// 			 				Banditen
// ************************************************************
INSTANCE DIA_Addon_Matt_Bandits(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 3;
	condition	= DIA_Addon_Matt_Bandits_Condition;
	information	= DIA_Addon_Matt_Bandits_Info;

	description = "Que savez-vous au sujet des bandits ?";
};                       
FUNC INT DIA_Addon_Matt_Bandits_Condition()
{
	return TRUE;
};
func VOID DIA_Addon_Matt_Bandits_Info()
{	
	AI_Output (other, self,"DIA_Addon_Matt_Bandits_15_03"); //Que savez-vous des bandits ?
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_01"); //A part le fait qu'ils représentent un grave danger et qu'ils sont bien plus nombreux que nous ?
	AI_Output (other,self ,"DIA_Addon_Matt_Bandits_15_02"); //Oui.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_02"); //Ils roulent sur l'or.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_03"); //Enfin, ils roulaient sur l'or. Ils n'ont pas payé le dernier chargement.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_04"); //Mais ça m'étonnerait que ce soit parce qu'ils sont à court d'argent.
	AI_Output (self ,other,"DIA_Addon_Matt_Bandits_10_05"); //Je crois plutôt qu'ils ont eu la folie des grandeurs.
};

// ************************************************************
// 			 				Francis 
// ************************************************************
INSTANCE DIA_Addon_Matt_Francis(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 4;
	condition	= DIA_Addon_Matt_Francis_Condition;
	information	= DIA_Addon_Matt_Francis_Info;

	description = "Que savez-vous sur Francis ?";
};                       
FUNC INT DIA_Addon_Matt_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if (Npc_KnowsInfo (other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			return TRUE;
		};
	};	
};
func VOID DIA_Addon_Matt_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Brandon_Matt_15_00"); //Que savez-vous sur Francis ?
	AI_Output (self ,other,"DIA_Addon_Matt_Francis_10_01"); //A par le fait qu'il soit fainéant et incompétent ?
	AI_Output (other,self ,"DIA_Addon_Brandon_Matt_15_02"); //Oui.
	AI_Output (self ,other,"DIA_Addon_Matt_Francis_10_03"); //Laissez-moi réfléchir . Hum… Non. Rien de plus à dire sur lui.
};



// ************************************************************
// *** 														***
// 						Mitkommen (Greg)
// *** 														***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_Matt_Anheuern(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 11;
	condition	= DIA_Addon_Matt_Anheuern_Condition;
	information	= DIA_Addon_Matt_Anheuern_Info;
	permanent	= FALSE;
	description = "Venez avec moi.";
};                       
FUNC INT DIA_Addon_Matt_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Matt_Anheuern_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_00"); //Venez avec moi.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_01"); //Je ne peux pas partir maintenant, j'essaie de me reposer.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_15_02"); //Ordre de Greg.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_03"); //(vite) Ah, je vois. Ça change tout, évidemment. Euh, bien sûr que je viens.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_10_04"); //On va où ?
	
	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	Info_AddChoice (DIA_Addon_Matt_Anheuern,"Taisez-vous et suivez-moi.",DIA_Addon_Matt_Anheuern_ShutUp);
	Info_AddChoice (DIA_Addon_Matt_Anheuern,"On doit aller nettoyer le canyon.",DIA_Addon_Matt_Anheuern_ClearCanyon);
};
func VOID DIA_Addon_Matt_Anheuern_ShutUp()
{
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ShutUp_15_00"); //Taisez-vous et suivez-moi.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ShutUp_10_01"); //(revêche) À vos ordres - (sarcastique) Cap'taine !
	
	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};
func VOID DIA_Addon_Matt_Anheuern_ClearCanyon()
{
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_00"); //On doit aller nettoyer le canyon.
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_01"); //Vous êtes malade ? C'est truffé de bestioles, là-bas. Et ces Lames, il vaut mieux ne pas s'y frotter.
	AI_Output (other,self ,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_02"); //Je sais. Vous venez, oui ?
	AI_Output (self ,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_03"); //(soupire) Vous devriez emporter quelques potions de soins. On va en avoir besoin.

	Info_ClearChoices (DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Matt_ComeOn(C_INFO)
{
	npc			= 	PIR_1365_Addon_Matt;
	nr		 	= 	12;
	condition	= 	DIA_Addon_Matt_ComeOn_Condition;
	information	= 	DIA_Addon_Matt_ComeOn_Info;
	permanent	= 	TRUE;
	description	= 	"Venez avec moi.";
};
func int DIA_Addon_Matt_ComeOn_Condition ()
{
	if (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Matt_Anheuern))
	{
		return TRUE;
	};
};
func void DIA_Addon_Matt_ComeOn_Info ()
{
	AI_Output (other, self, "DIA_Addon_Matt_ComeOn_15_00"); //Venez avec moi.
	
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self, other, "$RUNAWAY");
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_ComeOn_10_01"); //A vos ordres - (cynique) Cap'taine !
		AI_StopProcessInfos (self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine	(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_GoHome(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 13;
	condition	= DIA_Addon_Matt_GoHome_Condition;
	information	= DIA_Addon_Matt_GoHome_Info;
	permanent	= TRUE;
	description = "Je n'ai plus besoin de vous.";
};                       
FUNC INT DIA_Addon_Matt_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Matt_GoHome_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Matt_DontNeedYou_15_00"); //Je n'ai plus besoin de vous.
	AI_Output (self, other, "DIA_Addon_Matt_GoHome_10_01"); //(marmonnant pour lui-même) Il me faut une bonne rasade de tafia !
		
	AI_StopProcessInfos (self); 
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"START"); //START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_TooFar(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 14;
	condition	= DIA_Addon_Matt_TooFar_Condition;
	information	= DIA_Addon_Matt_TooFar_Info;
	permanent	= TRUE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Matt_TooFar_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Matt_TooFar_Info()
{	
	AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_01"); //A partir d'ici, vous pouvez continuer seul - (cynique) Cap'taine.
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_03"); //Les gars et moi, nous rentrons au camp !
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Matt_TooFar_10_02"); //Je rentre au camp !
	};
	
	B_Addon_PiratesGoHome();
	
	AI_StopProcessInfos (self); 
};

// ------------------------------------------------------------
// 			 Ich könnte 'nen Heiltrank gebrauchen!
// ------------------------------------------------------------
INSTANCE DIA_Addon_Matt_Healing(C_INFO)
{
	npc			= PIR_1365_Addon_Matt;
	nr			= 15;
	condition	= DIA_Addon_Matt_Healing_Condition;
	information	= DIA_Addon_Matt_Healing_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Addon_Matt_Healing_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] - 100))
	{
		return TRUE;
	};
};
func VOID DIA_Addon_Matt_Healing_Info()
{	
	AI_Output (self, other, "DIA_Addon_Matt_Healing_10_01"); //(cynique) Salut Cap'taine ! Une potion de soins ne serait pas de refus !
};






