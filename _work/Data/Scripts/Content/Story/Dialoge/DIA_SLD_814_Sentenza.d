// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Sentenza_EXIT(C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 999;
	condition	= DIA_Sentenza_EXIT_Condition;
	information	= DIA_Sentenza_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sentenza_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sentenza_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Hallo (Durchsuchen)
// ************************************************************
var int Sentenza_Wants50;
var int Sentenza_SearchDay;
// -------------------------------

instance DIA_Sentenza_Hello (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 1;
	condition	= DIA_Sentenza_Hello_Condition;
	information	= DIA_Sentenza_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Sentenza_Hello_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Sentenza_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Sentenza_Hello_09_00");	//H�! O� croyez-vous aller comme �a�?
	
	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	
	Info_ClearChoices	(DIA_Sentenza_Hello);
	Info_AddChoice		(DIA_Sentenza_Hello, "En quoi cela peut-il vous concerner ?" 			,DIA_Sentenza_Hello_NotYourBusiness);
	Info_AddChoice		(DIA_Sentenza_Hello, "Je voulais juste jeter un coup d'�il, c'est tout."	,DIA_Sentenza_Hello_JustLooking);
};

func void DIA_Sentenza_Hello_JustLooking()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_JustLooking_15_00"); //Je jette juste un coup d'�il aux alentours...
	AI_Output (self ,other,"DIA_Sentenza_Hello_JustLooking_09_01"); //(�clate de rire) Les types comme vous peuvent s'attendre � avoir de s�rieux ennuis par ici�! Vous �tes juste un touriste, c'est �a�?
	AI_Output (self ,other,"DIA_Sentenza_Hello_JustLooking_09_02"); //Ha�! C'est la cour qui vous int�resse, sans quoi vous ne seriez jamais venu jusqu'ici. Pas vrai�?
	AI_Output (self ,other,"DIA_Sentenza_Hello_JustLooking_09_03"); //Alors, pas la peine de me baratiner. Laissez-moi vous fouiller et vous pourrez passer.
	
	Info_ClearChoices	(DIA_Sentenza_Hello);
	Info_AddChoice		(DIA_Sentenza_Hello, "Bas les pattes !"				,DIA_Sentenza_Hello_HandsOff);
	Info_AddChoice		(DIA_Sentenza_Hello, "Faites donc. Fouillez-moi !" 			,DIA_Sentenza_Hello_SearchMe);
};

func void DIA_Sentenza_Hello_NotYourBusiness()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_NotYourBusiness_15_00"); //En quoi est-ce que �a vous regarde�?
	AI_Output (self ,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01"); //(soupire) Je vois qu'il va me falloir vous l'expliquer en d�tail.
	
	AI_StopProcessInfos (self);
	
	B_Attack(self, other, AR_NONE, 1);
};

	func void B_Sentenza_SearchMe()
	{
		var int playerGold; playerGold = Npc_HasItems(other, ItMi_Gold);
		
		AI_Output (other, self,"DIA_Sentenza_Hello_SearchMe_15_00"); //Comme vous voudrez. Fouillez-moi.
		AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_01"); //Bien, voyons voir ce que nous avons l�...
		
		if (playerGold >= 50)
		{
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_02"); //Ah, de l'or�! En avoir autant sur soi peut �tre dangereux...
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_03"); //Beaucoup de mercenaires sont de vrais coupe-jarrets, pas des gars honn�tes comme moi...
			B_GiveInvItems (other, self, ItMi_Gold, 50);
			Sentenza_GoldTaken = TRUE;
		}
		else if (playerGold > 0)
		{
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_04"); //Vous n'avez pas grand-chose.
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_05"); //Je reviendrai vous voir plus tard.
		}
		else
		{
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_06"); //Vous �tes venu jusqu'ici sans argent�?
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_07"); //Vous ne me donnez pas l'impression de mourir de faim. Vous avez d� cacher le bl� quelque part, hein�?
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_08"); //Vous n'�tes pas b�te. Je suis s�r que nous nous reverrons. D'ici l� faites bien attention � vous.
			AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_09"); //Vous �tes sans doute le seul � savoir o� vous avez cach� votre or.
		};
		
		Sentenza_Wants50 = TRUE;

		AI_Output (self ,other,"DIA_Sentenza_Hello_SearchMe_09_10"); //Je ne vous demande que 50 pi�ces d'or. C'est le montant du p�age et vous n'avez � payer qu'une seule et unique fois. C'est honn�te, non�?
	};

func void DIA_Sentenza_Hello_SearchMe()
{
	B_Sentenza_SearchMe();
	AI_StopProcessInfos (self);
};

func void DIA_Sentenza_Hello_HandsOff()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_HandsOff_15_00"); //Bas les pattes�!
	AI_Output (self ,other,"DIA_Sentenza_Hello_HandsOff_09_01"); //(mena�ant) Ou�?
	
	Info_ClearChoices	(DIA_Sentenza_Hello);
	Info_AddChoice		(DIA_Sentenza_Hello, "Ou rien. Fouillez- moi !"						,DIA_Sentenza_Hello_SearchMe);
	Info_AddChoice		(DIA_Sentenza_Hello, "Ou vous serez incapable de fouiller qui que ce soit avant longtemps !"	,DIA_Sentenza_Hello_OrElse);
};

func void DIA_Sentenza_Hello_OrElse()
{
	AI_Output (other, self,"DIA_Sentenza_Hello_OrElse_15_00"); //Ou vous ne serez plus en �tat de fouiller qui que ce soit pendant un bon moment.
	AI_Output (self ,other,"DIA_Sentenza_Hello_OrElse_09_01"); //Nous allons bien voir...
	
	AI_StopProcessInfos (self);
	B_Attack(self, other, AR_NONE, 1);
};


// ************************************************************
// 			  		Zweiter Versuch (Gold)
// ************************************************************

INSTANCE DIA_Sentenza_Vzwei (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 2;
	condition	= DIA_Sentenza_Vzwei_Condition;
	information	= DIA_Sentenza_Vzwei_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Sentenza_Vzwei_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Sentenza_GoldTaken == FALSE)
	&& (Sentenza_SearchDay < Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sentenza_Vzwei_Info()
{	
	AI_Output (self ,other,"DIA_Sentenza_Vzwei_09_00");	//Ah, vous revoil�! Voyons ce que vous avez sur vous cette fois-ci.

	self.aivar[AIV_LastFightComment] = TRUE;
	Sentenza_SearchDay = B_GetDayPlus();
	
	Info_ClearChoices	(DIA_Sentenza_Vzwei);
	Info_AddChoice		(DIA_Sentenza_Vzwei, "Otez vos sales pattes de ma personne !"		,DIA_Sentenza_Vzwei_HandsOff);
	
	
	
	Info_AddChoice		(DIA_Sentenza_Vzwei, "Faites donc. Fouillez-moi !" 	,DIA_Sentenza_Vzwei_SearchMe);
};

func void DIA_Sentenza_Vzwei_SearchMe()
{
	B_Sentenza_SearchMe();
	
	AI_StopProcessInfos(self);
};

func void DIA_Sentenza_Vzwei_HandsOff()
{
	AI_Output (other, self,"DIA_Sentenza_Vzwei_HandsOff_15_00"); //Ne me touchez pas�!
	AI_Output (self ,other,"DIA_Sentenza_Vzwei_HandsOff_09_01"); //(mena�ant) Ah... apparemment, je vois que vous avez un peu plus sur vous cette fois...
	
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  			WannaJoin
// ************************************************************

INSTANCE DIA_Sentenza_WannaJoin (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 3;
	condition	= DIA_Sentenza_WannaJoin_Condition;
	information	= DIA_Sentenza_WannaJoin_Info;
	permanent	= FALSE;
	description	= "Je suis ici pour me joindre � vous !";
};                       

FUNC INT DIA_Sentenza_WannaJoin_Condition()
{
	if (hero.guild == GIL_NONE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Sentenza_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_WannaJoin_15_00"); //Je suis ici pour me joindre � vous.
	AI_Output (self, other, "DIA_Sentenza_WannaJoin_09_01"); //Tant mieux pour vous.
	AI_Output (self, other, "DIA_Sentenza_WannaJoin_09_02"); //(d�sinvolte) Vous savez que les mercenaires ont coutume de voter pour d�terminer si chaque nouveau postulant a le droit de les rejoindre�?
};

// ************************************************************
// 			  				Vote
// ************************************************************

INSTANCE DIA_Sentenza_Vote (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 4;
	condition	= DIA_Sentenza_Vote_Condition;
	information	= DIA_Sentenza_Vote_Info;
	permanent	= TRUE;
	description	= "Voterez-vous pour moi ?";
};                       

FUNC INT DIA_Sentenza_Vote_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Sentenza_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sentenza_Vote_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_Vote_15_00"); //Vous allez voter pour moi�?
	
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_01"); //Pourquoi�? Parce que vous m'avez battu�? (�clate de rire) Non.
	}
	else if (Npc_HasItems (self, itmi_gold) >= 50)
	&& 		( (Sentenza_GoldTaken == TRUE) ||	(Sentenza_GoldGiven == TRUE) )
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_02"); //Pourquoi pas�? 50 pi�ces d'or, ce n'est pas cher pay� pour avoir ma voix, si�?
		
		Sentenza_Stimme = TRUE;
		B_LogEntry (TOPIC_SLDRespekt,"Sentenza ne s'oppose pas � ce que je rejoigne les rangs des mercenaires.");
	}
	else if (Sentenza_Stimme == TRUE)
	&& 		(Npc_HasItems (self, itmi_gold) < 50)
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_03"); //Alors que vous m'avez encore une fois pris mon or�? Je ne crois pas, mon petit.
	}
	else
	{
		AI_Output (self, other, "DIA_Sentenza_Vote_09_04"); //�a ne marche pas comme �a, gamin. Si vous voulez que je vote pour vous, il va falloir me payer.
		AI_Output (other, self, "DIA_Sentenza_Vote_15_05"); //Combien ?
		AI_Output (self, other, "DIA_Sentenza_Vote_09_06"); //50 pi�ces d'or. C'est le prix du p�age de toute fa�on.
		Sentenza_Wants50 = TRUE;
	};
};

// ************************************************************
// 			  				Pay50
// ************************************************************
var int Sentenza_GoldGiven;
// ------------------------

INSTANCE DIA_Sentenza_Pay50 (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 5;
	condition	= DIA_Sentenza_Pay50_Condition;
	information	= DIA_Sentenza_Pay50_Info;
	permanent	= TRUE;
	description	= "Voici vos 50 pi�ces d'or.";
};                       

FUNC INT DIA_Sentenza_Pay50_Condition()
{
	if (Sentenza_Wants50 == TRUE)
	&& (Npc_HasItems (self, itmi_gold) < 50)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Sentenza_Pay50_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_Pay50_15_00"); //Voil� vos 50 pi�ces d'or.
	if (B_GiveInvItems (other, self, ItMi_Gold, 50))
	{
		AI_Output (self, other, "DIA_Sentenza_Pay50_09_01"); //Merci, �a m'ira.
		Sentenza_GoldGiven = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Sentenza_Pay50_09_02"); //Ne vous fichez pas de moi. 50 pi�ces d'or et pas une de moins, pig�?
	};
};

// ************************************************************
// 			  				Gold zur�ckholen
// ************************************************************
var int Sentenza_Einmal;
// ---------------------

INSTANCE DIA_Sentenza_GoldBack (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 6;
	condition	= DIA_Sentenza_GoldBack_Condition;
	information	= DIA_Sentenza_GoldBack_Info;
	permanent	= TRUE;
	description = "Rendez-moi mon or !";
};                       

FUNC INT DIA_Sentenza_GoldBack_Condition()
{
	if (Npc_HasItems (self, itmi_gold) >= 50)
	{
		if (Sentenza_GoldGiven == FALSE)
		|| (other.guild == GIL_SLD)
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Sentenza_GoldBack_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_GoldBack_15_00"); //Rendez-moi mon or�!
	if (other.guild == GIL_SLD)
	&& (Torlof_SentenzaCounted == TRUE)
	&& (Sentenza_Einmal == FALSE)
	{
		AI_Output (self, other, "DIA_Sentenza_GoldBack_09_01"); //Maintenant que je vous ai donn� ma voix�?
		AI_Output (self, other, "DIA_Sentenza_GoldBack_09_02"); //Esp�ce de sale pourri�!
		
		Sentenza_Einmal = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	}
	else
	{
		AI_Output (self, other, "DIA_Sentenza_GoldBack_09_03"); //D�tendez-vous, je ne fais que garder un �il dessus pendant quelque temps.
	};
};

// ************************************************************
// 			  				AufsMaul
// ************************************************************

INSTANCE DIA_Sentenza_AufsMaul (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 7;
	condition	= DIA_Sentenza_AufsMaul_Condition;
	information	= DIA_Sentenza_AufsMaul_Info;
	permanent	= FALSE; //FALSE!!!!!!!!!
	description = "Dites-moi c'est votre visage ou une paire de fesses ?";
};                       

FUNC INT DIA_Sentenza_AufsMaul_Condition()
{
	if (Npc_HasItems (self, itmi_gold) >= 50)
	|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Sentenza_AufsMaul_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_AufsMaul_15_00"); //Dites, c'est votre visage ou une paire de fesses�?
	AI_Output (self, other, "DIA_Sentenza_AufsMaul_09_01"); //(part d'un rire empreint de col�re) D'accord. Si c'est ce que vous voulez...
	
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  				AufsMaulAgain
// ************************************************************

INSTANCE DIA_Sentenza_AufsMaulAgain (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 8;
	condition	= DIA_Sentenza_AufsMaulAgain_Condition;
	information	= DIA_Sentenza_AufsMaulAgain_Info;
	permanent	= TRUE;
	description = "Et c'est reparti, �a va encore saigner !";
};                       

FUNC INT DIA_Sentenza_AufsMaulAgain_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Sentenza_AufsMaul))
	{
		if (Npc_HasItems (self, itmi_gold) >= 50)
		|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
		{
			return TRUE;
		};
	};
};
 
FUNC VOID DIA_Sentenza_AufsMaulAgain_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_AufsMaulAgain_15_00"); //Vous allez encore prendre une bonne racl�e�!
	AI_Output (self, other, "DIA_Sentenza_AufsMaulAgain_09_01"); //Si vous le dites...
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};


// ************************************************************
// 			  				PERM
// ************************************************************

INSTANCE DIA_Sentenza_PERM (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 1;
	condition	= DIA_Sentenza_PERM_Condition;
	information	= DIA_Sentenza_PERM_Info;
	permanent	= TRUE;
	description = "Et comment vont les affaires ?";
};                       

FUNC INT DIA_Sentenza_PERM_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Sentenza_PERM_Info()
{	
	AI_Output (other, self, "DIA_Sentenza_PERM_15_00"); //Comment �a va�?
	
	AI_Output (self, other, "DIA_Sentenza_PERM_09_01"); //Il y a peu de passage, mais tout le monde a acquitt� le p�age.
	if (Npc_HasItems (self, itmi_gold) < 50)
	{
		AI_Output (self, other, "DIA_Sentenza_PERM_09_02"); //Sauf vous. (sourit)
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sentenza_PICKPOCKET (C_INFO)
{
	npc			= Sld_814_Sentenza;
	nr			= 900;
	condition	= DIA_Sentenza_PICKPOCKET_Condition;
	information	= DIA_Sentenza_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Sentenza_PICKPOCKET_Condition()
{
	C_Beklauen (56, 65);
};
 
FUNC VOID DIA_Sentenza_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sentenza_PICKPOCKET);
	Info_AddChoice		(DIA_Sentenza_PICKPOCKET, DIALOG_BACK 		,DIA_Sentenza_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sentenza_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sentenza_PICKPOCKET_DoIt);
};

func void DIA_Sentenza_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sentenza_PICKPOCKET);
};
	
func void DIA_Sentenza_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sentenza_PICKPOCKET);
};


	






