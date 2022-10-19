// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_EXIT_Condition;
	information	= DIA_Gritta_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Gritta_PICKPOCKET (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 900;
	condition	= DIA_Gritta_PICKPOCKET_Condition;
	information	= DIA_Gritta_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20_Female;
};                       

FUNC INT DIA_Gritta_PICKPOCKET_Condition()
{
	C_Beklauen (20, 20);
};
 
FUNC VOID DIA_Gritta_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Gritta_PICKPOCKET);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_BACK 		,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Gritta_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
	
func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Gritta_PICKPOCKET);
};
// ************************************************************
// 			  				   Hello 
// ************************************************************
INSTANCE DIA_Gritta_Hello(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 10;
	condition	= DIA_Gritta_Hello_Condition;
	information	= DIA_Gritta_Hello_Info;
	permanent	= FALSE;
	Important   = TRUE;
};                       
FUNC INT DIA_Gritta_Hello_Condition()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Gritta_Hello_16_00"); //Que voulez-vous, �tranger�? Si vous venez mendier, d�sol�e de vous d�cevoir, mais je suis une pauvre veuve sans le sou.
	AI_Output (self ,other,"DIA_Gritta_Hello_16_01"); //Je me nomme Gritta. Depuis le d�c�s de mon mari, je m'occupe de la maison de mon oncle Thorben.
};
//*************************************************************
//			Matteo will sein Geld
//*************************************************************
INSTANCE DIA_Gritta_WantsMoney(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 2;
	condition	= DIA_Gritta_WantsMoney_Condition;
	information	= DIA_Gritta_WantsMoney_Info;
	permanent	= FALSE;
	description = "Matt�o m'envoie. Vous lui devez encore de l'or.";
};                       
FUNC INT DIA_Gritta_WantsMoney_Condition()
{
	if (MIS_Matteo_Gold == LOG_RUNNING)
	{
		return TRUE;
	};	
};
//------------------------------------
var int Gritta_WantPay;
var int Gritta_Threatened;
//------------------------------------
FUNC VOID DIA_Gritta_WantsMoney_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_15_00"); //C'est Matt�o qui m'envoie. Vous lui devez encore de l'argent.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_01"); //Il voudrait que je le paye�? Pour quelle raison�? Les tissus qu'il m'a livr�s �taient de mauvaise qualit� et mal cousus.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_02"); //Et vous avez vu ces couleurs�? Ce ne sont pas celles que j'avais command�es. C'est de l'escroquerie si vous voulez tout savoir�!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_16_03"); //Il n'aurait jamais os� me voler de la sorte du temps o� mon �poux �tait encore en vie. Oh, mon pauvre mari�!

	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"�a suffit ! O� est le pognon ?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continuez...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue01 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue01_16_00"); //C'�tait un homme si bon... s�duisant, travailleur, un vrai gentleman de la vieille �cole. Nous avions tout... le bonheur, l'argent...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_01"); //Parfois, nous �tions m�me invit�s aux r�ceptions de la haute soci�t�. Ah, toutes ces festivit�s, les beaux atours et les belles coiffures...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue01_16_02"); //Sans oublier les mets raffin�s et les conversations civilis�es. C'�tait le bon temps. Nul alors n'aurait os� humilier une pauvre veuve au c�ur bris� en venant lui r�clamer une somme qu'elle ne devrait pas acquitter.
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"�a suffit ! O� est le pognon ?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continuez...",DIA_Gritta_WantsMoney_Continue02);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue02 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue02_16_00"); //Que faire�? Ma maigre pension me permet � peine de subsister et la situation ne va pas en s'arrangeant, bien au contraire. Tout le monde cherche � �conomiser le moindre sou d�sormais.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_01"); //Cela fait des semaines qu'aucun bateau n'est arriv� au port. Savez-vous que mon mari �tait le capitaine d'un navire�? En fait, il en �tait m�me le propri�taire.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue02_16_02"); //Il profitait toujours de ses longs voyages pour me ramener de somptueux cadeaux, des tissus soyeux du continent, des �pices pr�cieuses des colonies du sud...
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"�a suffit ! O� est le pognon ?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continuez...",DIA_Gritta_WantsMoney_Continue03);
};
FUNC VOID DIA_Gritta_WantsMoney_Continue03 ()
{
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_continue03_16_00"); //Des pr�sents que la plupart des gens n'ont m�me jamais vu. Et puis, un jour, j'ai appris que le Gritta avait sombr�. C'est ainsi que mon mari avait baptis� son navire, par amour pour moi.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue03_16_01"); //J'ai pleur� toutes les larmes de mon corps, priant de toutes mes forces pour qu'il ait surv�cu au naufrage. Chaque jour, j'esp�rais recevoir de ses nouvelles, mais en vain.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_02"); //Puis Innos avoir piti� de son �me et qu'il repose en paix. Depuis ce jour, je vis on ne peut plus modestement, et voici que ce monstre sans c�ur de Matt�o veut me prendre tout ce qu'il me reste�!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_Continue04_16_03"); //Je vous en supplie, ayez piti� d'une pauvre femme�! Du vivant de mon �poux, jamais Matt�o n'aurait os� faire cela, non. Oh, mon pauvre mari�!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"�a suffit ! O� est l'or ?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Continuez...",DIA_Gritta_WantsMoney_Continue01);
};
FUNC VOID DIA_Gritta_WantsMoney_WhereMoney ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_WhereMoney_15_00"); //Arr�tez votre cin�ma�! O� est l'or�?
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01"); //(cr�nement) Mais je ne l'ai pas�! Je ne suis qu'une pauvre veuve sans le sou�!
	
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Envoyez la monnaie ou je vous en colle une !",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Je crois bien qu'on va devoir vendre vos affaires...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice (DIA_Gritta_WantsMoney,"Je vais payer pour vous.",DIA_Gritta_WantsMoney_IWillPay);
};
FUNC VOID DIA_Gritta_WantsMoney_EnoughStuff ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //Dans ce cas, nous allons vendre vos robes. Je suis s�r qu'il vous en reste encore une ou deux dans votre placard...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //Comme osez-vous, esp�ce de rustre�? Bon, tr�s bien, prenez-le votre or�!
	B_GiveInvItems (self,other,ItMi_Gold, 100); 
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //(sourire) Ah, vous voyez bien que ce n'�tait pas si difficile...
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //(acerbe) Et maintenant, hors de chez moi, je vous prie.
	
	Gritta_GoldGiven = TRUE;
	
	AI_StopProcessInfos (self); 
};
func VOID DIA_Gritta_WantsMoney_IWillPay ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_00"); //Je vais payer cette somme � votre place.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_01"); //C'est vrai, vous feriez cela pour moi�? Oh, je savais bien que vous n'�tiez pas un monstre cupide comme ce Matt�o�!
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_IWillPay_15_02"); //Oui, oui, n'en parlons plus.
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_IWillPay_16_03"); //Revenez quand vous aurez r�gl� ce probl�me et je vous prouverai ma gratitude.
	Info_ClearChoices (DIA_Gritta_WantsMoney);
	
	Gritta_WantPay = TRUE;
};
FUNC VOID DIA_Gritta_WantsMoney_BeatUp ()
{
	AI_Output (other,self ,"DIA_Gritta_WantsMoney_BeatUp_15_00"); //(mena�ant) Aboulez la monnaie ou vous allez y avoir droit�!
	AI_Output (self ,other,"DIA_Gritta_WantsMoney_BeatUp_16_01"); //(cr�nement) Allez-y, sortez votre arme�! Mais je vous pr�viens, si vous le faites, j'appelle la garde�!
	
	Gritta_Threatened = TRUE;
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WINE
///////////////////////////////////////////////////////////////////////
instance DIA_Gritta_WINE		(C_INFO)
{
	npc			 = 	VLK_418_Gritta;
	nr			 = 	2;
	condition	 = 	DIA_Gritta_WINE_Condition;
	information	 = 	DIA_Gritta_WINE_Info;
	permanent    =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Gritta_WINE_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Gritta_WantPay == TRUE)
	&& (MIS_Matteo_Gold == LOG_SUCCESS)
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		return TRUE;
	};
};
func void DIA_Gritta_WINE_Info ()
{
	AI_Output (self, other, "DIA_Gritta_WINE_16_00"); //Vous avez fait preuve d'une grande noblesse en payant cette somme � ma place. Je tiens � vous montrer ma gratitude.
	AI_Output (self, other, "DIA_Gritta_WINE_16_01"); //Voici une bouteille de vin que mon �poux, paix � son �me, a ramen� des �les du sud.
	AI_Output (self, other, "DIA_Gritta_WINE_16_02"); //Et tout le monde saura qu'il reste au moins un homme honorable dans cette ville.
	AI_Output (other, self, "DIA_Gritta_WINE_15_03"); //Oui, oui, n'en parlons plus.

	B_GivePlayerXP 		(XP_PayForGritta);
	B_GiveInvItems 		(self, other, Itfo_Wine, 1);
	
	AI_StopProcessInfos (self); 
};
// *************************************************************
//							PERM (1u2)
// *************************************************************
instance DIA_Gritta_PERM (C_INFO)
{
	npc			= VLK_418_Gritta;
	nr		 	= 3;
	condition	= DIA_Gritta_PERM_Condition;
	information	= DIA_Gritta_PERM_Info;
	permanent	= TRUE;
	important 	= TRUE;
};
func int DIA_Gritta_PERM_Condition ()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (Npc_KnowsInfo (other, DIA_Gritta_WantsMoney))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Gritta_PERM_Info ()
{
	if (Npc_KnowsInfo (other, DIA_Gritta_WINE))
	&& (Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_00"); //Tant qu'il y aura des hommes comme vous, tout se terminera bien.
	}
	else if (Gritta_WantPay == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_01"); //Revenez quand vous aurez r�gl� la question avec Matt�o.
	}
	else if (Gritta_Threatened == TRUE)
	&&		(Npc_HasItems (self, itmi_gold) >= 100)
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_02"); //Pourquoi me regardez-vous ainsi�? Je sais bien que vous n'oserez pas m'attaquer de toute fa�on�!
	}
	else //Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output (self, other, "DIA_Gritta_PERM_16_03"); //Qu'est-ce que vous voulez encore�? Vous m'avez d�j� pris mon or. Allez-vous en�!
	};
	
	AI_StopProcessInfos (self); 
};


//###########################################
//##
//##	Kapitel 3
//##
//###########################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Gritta_Kap3_EXIT(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 999;
	condition	= DIA_Gritta_Kap3_EXIT_Condition;
	information	= DIA_Gritta_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gritta_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Gritta_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//		Perm3U4U5
// ************************************************************

//------------------------------------
var int GrittaXP_Once;
//-----------------------------

INSTANCE DIA_Gritta_Perm3U4U5(C_INFO)
{
	npc			= VLK_418_Gritta;
	nr			= 31;
	condition	= DIA_Gritta_Perm3U4U5_Condition;
	information	= DIA_Gritta_Perm3U4U5_Info;
	permanent	= TRUE;
	description = "Comment �a va ?";
};                       
FUNC INT DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gritta_Perm3U4U5_Info()
{	
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_00"); //Comment �a se passe ?
	
	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_01"); //Tout part � vau-l'eau ici. Ce n'est plus que crime et violence partout o� l'on regarde. Vous vous rendez compte que m�me un des paladins a �t� assassin�?
			
			Info_ClearChoices (DIA_Gritta_Perm3U4U5);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,DIALOG_BACK,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Ces choses-l� arrivent.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Tout ira bien.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice (DIA_Gritta_Perm3U4U5,"Qu'avez-vous entendu ?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_02"); //Oh, quel bonheur�! Le seigneur Hagen a lib�r� le mercenaire.
			AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_15_03"); //En quoi cela vous affecte-t-il�?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_04"); //R�fl�chissez�! Vous pensez vraiment que les autres mercenaires seraient rest�s les bras ballants tandis qu'un de leurs compagnons se faisait pendre�?
			AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_05"); //Ils auraient essay� de le d�livrer, oui, et tout cela se serait termin� dans un bain de sang. Innos soit lou�!
		};	
	}
	else if (Kapitel == 5)	
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_06"); //Les paladins se pr�parent � s'en aller.
	}
	else 
	{
		AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_16_07"); //Comme toujours, mais je ne suis pas du genre � me plaindre.
	};
};

FUNC VOID DIA_Gritta_Perm3U4U5_BACK ()
{
	Info_ClearChoices (DIA_Gritta_Perm3U4U5);
};

FUNC VOID DIA_Gritta_Perm3U4U5_War ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_War_15_00"); //C'est la guerre. Ce genre de choses arrive, vous savez...
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_01"); //Oui, il y a cette horrible guerre en plus. Tout le monde en souffre et se demande comment subsister un jour de plus.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_War_16_02"); //Il est des jours o� je me demande ce que nous avons bien pu faire pour qu'Innos nous fasse subir un tel ch�timent.
};

FUNC VOID DIA_Gritta_Perm3U4U5_TurnsGood ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //Tout ira bien.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //Merci d'essayer de me remonter le moral.
	
	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP (XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};	
};

FUNC VOID DIA_Gritta_Perm3U4U5_Rumors ()
{
	AI_Output (other,self ,"DIA_Gritta_Perm3U4U5_Rumors_15_00"); //Qu'avez-vous entendu dire�?
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01"); //Seulement ce que tout le monde raconte en ville.
	AI_Output (self ,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02"); //Il para�t que l'assassin a �t� attrap�, mais j'ignore si c'est vrai.
};












