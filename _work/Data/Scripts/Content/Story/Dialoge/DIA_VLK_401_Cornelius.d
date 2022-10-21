//*********************************************************************
//	Info EXIT 
//********************************************************************
INSTANCE DIA_Cornelius_Exit   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 999;
	condition   = DIA_Cornelius_Exit_Condition;
	information = DIA_Cornelius_Exit_Info;
	permanent   = TRUE;
	description	= DIALOG_ENDE;
};

FUNC INT DIA_Cornelius_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cornelius_Exit_Info()
{
	AI_StopProcessInfos (self);
};

//############################
//##						##			
//##		Kapitel 3		##
//##						##
//############################

//*********************************************************************
//	SeeMurder 
//********************************************************************
INSTANCE DIA_Cornelius_SeeMurder   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_SeeMurder_Condition;
	information = DIA_Cornelius_SeeMurder_Info;
	permanent   = FALSE;
	description	= "Vous avez vu l'assassin de Lothar, n'est-ce pas ?";
};

FUNC INT DIA_Cornelius_SeeMurder_Condition()
{
	if (RecueBennet_KnowsCornelius == TRUE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_SeeMurder_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_SeeMurder_15_00"); //Vous avez assist� au meurtre de Lothar, n'est-ce pas�?
	AI_Output (self ,other,"DIA_Cornelius_SeeMurder_13_01"); //(nerveux) Rien ne m'oblige � r�pondre aux questions tant que l'enqu�te se poursuit.
	AI_Output (self ,other,"DIA_Cornelius_SeeMurder_13_02"); //Le seigneur Hagen a d�j� recueilli ma d�claration.
};

//*********************************************************************
//	Was hast du gesehen? 
//********************************************************************
INSTANCE DIA_Cornelius_WhatYouSee   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 5;
	condition   = DIA_Cornelius_WhatYouSee_Condition;
	information = DIA_Cornelius_WhatYouSee_Info;
	permanent   = FALSE;
	description	= "Qu'avez-vous vu ?";
};

FUNC INT DIA_Cornelius_WhatYouSee_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_SeeMurder)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_WhatYouSee_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_WhatYouSee_15_00"); //Qu'avez-vous vu au juste�?
	AI_Output (self ,other,"DIA_Cornelius_WhatYouSee_13_01"); //(tr�s agit�) Je n'ai vraiment pas le temps�!
	AI_Output (self ,other,"DIA_Cornelius_WhatYouSee_13_02"); //(tr�s agit�) Partez, nous fermons.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Corn�lius refuse de me parler."); 
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Jetzt reicht es! Was hast du gesehen?
//********************************************************************
INSTANCE DIA_Cornelius_Enough   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 6;
	condition   = DIA_Cornelius_Enough_Condition;
	information = DIA_Cornelius_Enough_Info;
	permanent   = FALSE;
	description	= "Assez ! Qu'avez-vous vu ?";
};

FUNC INT DIA_Cornelius_Enough_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_WhatYouSee)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_Enough_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_Enough_15_00"); //Assez plaisant�! Qu'avez-vous vu�?
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_01"); //(nerveux) Je... j'ai vu le mercenaire attaquer le paladin dans le dos.
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_02"); //(nerveux) Et puis, il a de nouveau lev� son �p�e pour frapper sa victime en pleine poitrine.
	AI_Output (other,self ,"DIA_Cornelius_Enough_15_03"); //Vous en �tes certain�?
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_04"); //(inquiet) Evidemment�! J'ai vu cela de mes propres yeux�!
	AI_Output (self ,other,"DIA_Cornelius_Enough_13_05"); //(inquiet) Mais je n'ai vraiment pas le temps, maintenant. J'ai toute une pile de papiers �...

	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Ich glaube dir nicht.
//********************************************************************
INSTANCE DIA_Cornelius_DontBelieveYou   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_DontBelieveYou_Condition;
	information = DIA_Cornelius_DontBelieveYou_Info;
	permanent   = TRUE;
	description	= "Je ne vous crois pas.";
};

FUNC INT DIA_Cornelius_DontBelieveYou_Condition()
{
	if Npc_KnowsInfo (other,DIA_Cornelius_Enough)
	&& Cornelius_TellTruth != TRUE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_15_00"); //Je ne vous crois pas.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_13_01"); //(faussement confiant) Et que comptez-vous faire � ce sujet�?

	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
	//hier fehlt noch Taschendiebstahl
	Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Pourquoi le demandez-vous ?",DIA_Cornelius_DontBelieveYou_WhatYouWant);
	Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Vous tenez � la vie, n'est-ce pas ?",DIA_Cornelius_DontBelieveYou_WantSurvive);
	
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Ils pourraient vous faire parler au monast�re.",DIA_Cornelius_DontBelieveYou_Monastery);
	};
	if (hero.guild == GIL_SLD)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Je pourrai dire aux mercenaires o� vous vivez.",DIA_Cornelius_DontBelieveYou_KnowYourHome);
	};
	if (hero.guild == GIL_MIL)
	{
		Info_AddChoice (DIA_Cornelius_DontBelieveYou,"Le parjure va vous valoir la prison� Et pour longtemps !",DIA_Cornelius_DontBelieveYou_Perjury);
	};
};

FUNC VOID DIA_Cornelius_DontBelieveYou_WhatYouWant ()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00"); //Qu'est-ce que vous voulez�?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01"); //(arrogant) Vous n'avez pas assez d'or pour m'acheter.
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02"); //Combien ?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03"); //2�000 pi�ces d'or et je reviendrai peut-�tre sur ma position.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Pour 2 000 pi�ces d'or, Corn�lius veut bien me parler.");
	
	Cornelius_PayForProof = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_WantSurvive ()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00"); //Vous accordez beaucoup de prix � votre vie, n'est-ce pas�?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01"); //(inquiet) Si vous m'agressez, on vous pendra.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02"); //J'ai des amis influents. Vous n'avez pas int�r�t � lever la main sur moi.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03"); //Et maintenant, allez-vous en ou j'appelle la garde�!
	
	
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Monastery()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Monastery_15_00"); //Au monast�re, je suis s�r qu'on pourrait vous obliger � parler...
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01"); //(blanc comme un linge) Que voulez-vous dire�?
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Monastery_15_02"); //Disons que nous avons les moyens de faire remonter la v�rit� � la surface. Des moyens parfois... douloureux.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03"); //S'il vous pla�t, non�! Je vous dirai tout ce que vous voulez savoir.
	
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_KnowYourHome()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00"); //Je pourrais dire aux mercenaires o� vous vivez.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01"); //(blanc comme un linge) Qu'est-ce que �a signifie�?
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02"); //Je parie qu'ils meurent d'envie de faire votre connaissance. Et je peux vous dire que la situation ne leur pla�t pas, mais alors, pas du tout.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03"); //Vous ne pouvez pas faire �a�! Ils me tueraient�!
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04"); //C'est tr�s possible en effet.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05"); //Ne faites pas �a, je vous dirai tout ce que vous voulez savoir�!
	
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices (DIA_Cornelius_DontBelieveYou);
};

FUNC VOID DIA_Cornelius_DontBelieveYou_Perjury()
{
	AI_Output (other,self ,"DIA_Cornelius_DontBelieveYou_Perjury_15_00"); //Si vous vous �tes rendu coupable de parjure, vous irez croupir en prison pendant longtemps.
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01"); //Vous essayez de me menacer, moi, le secr�taire du gouverneur�? Non mais, vous vous �tes bien regard�, mis�rable petit garde�?
	AI_Output (self ,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02"); //Partez tout de suite ou je ferai en sorte que vous soyez radi�.
	
	Cornelius_ThreatenByMilSC = TRUE;
	
	AI_StopProcessInfos (self);
};

//*********************************************************************
//	Hier ist das Geld
//********************************************************************
INSTANCE DIA_Cornelius_PayCornelius   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_PayCornelius_Condition;
	information = DIA_Cornelius_PayCornelius_Info;
	permanent   = TRUE;
	description	= "Voici votre or.";
};

FUNC INT DIA_Cornelius_PayCornelius_Condition()
{
	if Cornelius_PayForProof == TRUE
	&& (Npc_HasItems (other,ItMi_Gold) >= 2000)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_PayCornelius_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_PayCornelius_15_00"); //Voici votre or.
	
	B_GiveInvItems (other,self ,ItMi_Gold,2000);
	
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_01"); //J'imagine qu'il ne vaut mieux pas vous demander comment vous vous l'�tes procur�.
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_02"); //Et, � vrai dire, je m'en moque.
	AI_Output (self ,other,"DIA_Cornelius_PayCornelius_13_03"); //D'accord, march� conclu.
	
	Cornelius_TellTruth = TRUE;
};


//*********************************************************************
//	Was ist wirklich passiert?
//********************************************************************
INSTANCE DIA_Cornelius_RealStory   (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 4;
	condition   = DIA_Cornelius_RealStory_Condition;
	information = DIA_Cornelius_RealStory_Info;
	permanent   = TRUE;
	description	= "Alors que s'est-il r�ellement pass� ?";
};

FUNC INT DIA_Cornelius_RealStory_Condition()
{
	if Cornelius_TellTruth == TRUE
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_RealStory_Info()
{
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_00"); //Alors, que s'est-il vraiment pass�?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_01"); //En fait, je n'ai rien vu. On m'a pay� pour accuser ce mercenaire.
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_02"); //Dans les moments comme �a, c'est chacun pour soi, et j'avais besoin de cet argent.
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_03"); //Qui vous a pay�?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_04"); //Je n'en dirai pas davantage. Il me tuera s'il apprend que j'ai parl�.
	AI_Output (other,self ,"DIA_Cornelius_RealStory_15_05"); //Vous seriez dispos� � r�p�ter �a au seigneur Hagen�?
	AI_Output (self ,other,"DIA_Cornelius_RealStory_13_06"); //Je ne suis pas fou�! Il faut que je quitte la ville d�sormais.
	
	if (Npc_HasItems (self,ItWr_CorneliusTagebuch_Mis) >=1)
	{
		AI_Output (self ,other,"DIA_Cornelius_RealStory_13_07"); //Je vais vous donner mon journal intime. Cela devrait suffire comme preuve.
		B_GiveInvItems (self,other,ItWr_CorneliusTagebuch_Mis,1);
	};
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Corn�lius a menti. On l'a pay� pour faire arr�ter Bennet. Mais il refuse de me dire qui l'a soudoy�. Il est terroris�.");
	
	CorneliusFlee = TRUE;
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"FLEE");
};


//*********************************************************************
//	Auf der Flucht
//********************************************************************
INSTANCE DIA_Cornelius_Fleeing (C_INFO)
{
	npc         = VLK_401_Cornelius;
	nr          = 1;
	condition   = DIA_Cornelius_Fleeing_Condition;
	information = DIA_Cornelius_Fleeing_Info;
	permanent   = TRUE;
	important 	= TRUE;
};

FUNC INT DIA_Cornelius_Fleeing_Condition()
{
	if (CorneliusFlee == TRUE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Cornelius_Fleeing_Info()
{
	B_Say (self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Cornelius_PICKPOCKET (C_INFO)
{
	npc			= VLK_401_Cornelius;
	nr			= 900;
	condition	= DIA_Cornelius_PICKPOCKET_Condition;
	information	= DIA_Cornelius_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Il serait risqu� de voler son livre)";
};                       

FUNC INT DIA_Cornelius_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_CorneliusTagebuch_Mis) >= 1)
	&&  (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff))
	
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cornelius_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Cornelius_PICKPOCKET);
	Info_AddChoice		(DIA_Cornelius_PICKPOCKET, DIALOG_BACK 		,DIA_Cornelius_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Cornelius_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Cornelius_PICKPOCKET_DoIt);
};

func void DIA_Cornelius_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems (self, other, ItWr_CorneliusTagebuch_Mis, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Cornelius_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Cornelius_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cornelius_PICKPOCKET);
};
