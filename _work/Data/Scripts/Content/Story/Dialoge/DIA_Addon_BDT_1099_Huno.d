//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_EXIT   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 999;
	condition   = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Huno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1099_Addon_Huno;
	nr			= 900;
	condition	= DIA_Addon_Huno_PICKPOCKET_Condition;
	information	= DIA_Addon_Huno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       
FUNC INT DIA_Addon_Huno_PICKPOCKET_Condition()
{
	C_Beklauen (85, 102);
};
 
FUNC VOID DIA_Addon_Huno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
	
func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Abwimmeln
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Abwimmeln (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	
	if (Huno_zuSnaf == TRUE)
	&& (!Npc_KnowsInfo (other, DIA_Addon_Fisk_Meeting))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Abwimmeln_Info()
{	
	if (Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_00"); //Qu'est-ce que vous voulez encore ? Fichez le camp !
	}
	else //schickt dich in die Kneipe
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //Qu'est-ce que vous attendez ! Allez � la taverne !
	};
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
var int Knows_Flucht;
var int Huno_Angepisst;
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Hi   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent   = FALSE;
	description = "Il semblerait que vous soyez pass� ma�tre dans votre art.";
};
FUNC INT DIA_Addon_Huno_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_00");//Il semblerait que vous soyez pass� ma�tre dans votre art.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_01");//J'ai d�j� entendu �a quelque part... M'avez-vous apport� l'acier ?
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_02");//L'acier ? Non, je crois que vous me prenez pour...
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_03");//Hm... vous me paraissez �trangement familier. Est-ce que nous nous sommes d�j� rencontr�s ?
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Bien s�r, dans l'ancien camp.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Je ne m'en rappelle absolument pas.",DIA_Addon_Huno_Hi_NO);
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno propose des outils de forgeron.");
};
FUNC VOID DIA_Addon_Huno_Hi_JA()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_00");//Bien s�r, dans l'ancien camp.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_01");//L'ancien camp... exact... vous �tes ce type curieux... Je vous croyais mort.
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_02");//Oui, c'est ce que beaucoup semblent croire. Qui d'autre a surv�cu ?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_03");//Quelques personnes. Certains ont fui avec Raven, comme moi. Pour nombre d'autres d�tenus, l'ancien camp est devenu un tombeau.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	
	Knows_Flucht = TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_NO()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_NO_15_00");//Je ne saurais pas vous dire comment...
	AI_Output (self, other, "DIA_Addon_Huno_Hi_NO_06_01");//Hm... ma m�moire est une v�ritable �cumoire... bref...
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
};
//----------------------------------------------------------------------
//	Info Blitz
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Blitz   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 2;
	condition   = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent   = FALSE;
	description = "Parlez-moi de votre �vasion.";
};
FUNC INT DIA_Addon_Huno_Blitz_Condition()
{	
	if (Knows_Flucht == TRUE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Blitz_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_00");//Parlez-moi de votre �vasion.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_01");//Le chaos tout entier s'est d�cha�n� le jour de la chute de la Barri�re.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_02");//Certains se sont cach�s, et d'autres se sont enfuis - partout, les d�tenus pillaient et br�laient.
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_03");//Qu'avez-vous fait ?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_04");//J'�tais sur le point de quitter le camp lorsque tout est devenu tr�s lumineux... Une douleur br�lante a soudainement d�vor� ma peau.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_05");//J'avais �t� frapp� par la foudre, bon sang ! J'ai toujours l'impression de l'entendre...
	//AI_Output (self, other, "DIA_Blitz_06_07");//BLITZ
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_06");//Plus tard, quelqu'un m'a dit que Thorus m'avait retrouv� et m'avait emmen� avec lui.
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
var int Huno_ArmorPerm;
//----------------------------------------------------------
INSTANCE DIA_Addon_Huno_Armor   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent   = TRUE;
	description = "Il me faut une meilleure armure.";
};
FUNC INT DIA_Addon_Huno_Armor_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Huno_Hi))
	&& (Huno_ArmorPerm == FALSE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Armor_Info()
{	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
	
	AI_Output (other, self, "DIA_Addon_Huno_Armor_15_00"); //Il me faut une meilleure armure.
	if (Huno_ArmorCheap == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_01"); //Tenez - prenez celle-ci. C'est la faute d'Esteban si elle est aussi ch�re.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_02"); //Ce chien galeux empoche une marge sur chaque morceau d'armure que je vends.
		
		BDT_Armor_H_Value = 2100;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Acheter armure lourde de bandit (Protection : armes 45, fl�ches 45. Co�t : 2100 pi�ces d'or).", DIA_Addon_Huno_Armor_BUY);
	}
	else //CHEAP
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_15_03"); //Fisk m'a dit que vous me feriez un bon prix...
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_04"); //Fisk, vous dites ? Hmm... bien, je lui dois toujours un service.
				
		BDT_Armor_H_Value = 1400;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Acheter armure lourde de bandit (Protection : armes 45, fl�ches 45. Co�t : 1400 pi�ces d'or).", DIA_Addon_Huno_Armor_BUY);
	};
};
func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};
func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //Bon, je vais prendre l'armure.
	
	if B_GiveInvItems (other, self, ItMi_Gold, BDT_Armor_H_Value)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //Bien s�r.
		
		B_GiveInvItems (self, other,ITAR_BDT_H,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //Pas d'or, pas d'armure.
	};
	
	if (BDT_Armor_H_Value < 2100) //nur, wenn billliger!
	{
		Huno_ArmorPerm = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};

//----------------------------------------------------------------------
//	ATTENTAT
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Attentat   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent   = FALSE;
	description = "A propos de la tentative de meurtre d'Esteban...";
};
FUNC INT DIA_Addon_Huno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Attentat_Info()
{	
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_00"); //(mena�ant) Que voulez-vous de moi ?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_01"); //Je recherche le commanditaire de l'attaque...
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_02"); //Et pourquoi vous venez me voir � propos de �a ?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_03"); //Je me disais que vous sauriez peut-�tre quelque chose de cette affaire.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_04"); //Je ne sais RIEN !
};


//----------------------------------------------------------------------
//	Paar Dinge geh�rt
//----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
//-------------------------------------

	func void B_Addon_Huno_Stress()
	{
		AI_Output (self, other, "DIA_Addon_Huno_Stress_06_00"); //(soupire) Maintenant, �coutez ! D�gagez d'ici avant que je ne m'oublie !
		Huno_Angepisst = TRUE;
	};

INSTANCE DIA_Addon_Huno_SomeThings (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent   = TRUE;
	description = "J'ai entendu deux ou trois choses sur vous...";
};
FUNC INT DIA_Addon_Huno_SomeThings_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat))
	&& (Huno_SomeThings_PERM == FALSE)
	&& ( (Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_SomeThings_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_00"); //J'ai entendu certaines choses � votre sujet...
	
	if (Huno_nochmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_01"); //Et ?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_02"); //Encore ? (mena�ant) �'aurait tout int�r�t � �tre important, cette fois...
	};
	
	Huno_Counter = 0;

	if (Finn_TellAll == TRUE) 		
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_03"); //J'ai entendu dire que vous n'�tiez pas � votre poste lorsque l'attaque a eu lieu...
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_04"); //(mena�ant) Et quoi d'autre ?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Paul_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_05"); //Paul m'a dit que vous d�testez Esteban.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_06"); //(mena�ant) Et ? Il a dit �a ? Et apr�s ?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Emilio_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_07"); //Emilio a crach� votre nom ! Vous savez quelque chose � propos de cette attaque !
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_08"); //(calmement) Ainsi, vous avez caus� � ce bon vieux Emilio, hein ?
		
		if (Huno_Counter > 0)
		{
			AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_09"); //Et il n'est pas le seul � vous soup�onner !
			AI_PlayAni(self, "T_SEARCH");
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_10"); //Qu'est-ce que �a veut dire, �a ?
			
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices (DIA_Addon_Huno_SomeThings);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Je veux proposer mes services � l'assassin !", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Si vous �tes le commanditaire de cette attaque, vous le paierez !", DIA_Addon_Huno_SomeThings_Pro);
			
			B_LogEntry (Topic_Addon_Esteban, "Il semblerait que Huno soit � ma merci.");
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_11"); //(mena�ant) Peut-�tre que je devrais aussi aller discuter avec lui. Je suis certain qu'apr�s, il dira tout le contraire !
			B_Addon_Huno_Stress();
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_12"); //Rien de plus...
		B_Addon_Huno_Stress();
		AI_StopProcessInfos (self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //Si vous �tes le commanditaire de cette attaque, vous le paierez !
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //(irrit�) Vous �tes un sacr� cr�tin ! Vous croyez vraiment pouvoir obtenir ainsi les faveurs d'Esteban ?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //D�gagez d'ici !
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};	
	
func void DIA_Addon_Huno_SomeThings_Contra()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //Je veux proposer mes services � l'assassin !
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //Contre Esteban ? Vraiment ? Alors prouvez-le !
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //J'attends depuis trop longtemps une livraison d'acier des pirates.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //Je soup�onne Esteban d'avoir saisi la marchandise pour pouvoir me la revendre plus tard, � un prix plus �lev�.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //Bien s�r, il ne fera pas �a lui-m�me. Quelques bandits du marais sont � sa solde.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //Comment savez-vous �a ?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //Les bandits ivres parlent beaucoup trop...
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //Ce bandit... loquace porte-t-il un nom ?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //Son nom ne vous regarde en rien. Mais le type que vous recherchez s'appelle Juan. Quoi qu'il en soit, �a fait un moment que je ne l'ai pas vu dans le camp.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //Vous allez devoir le rechercher dans le marais.
	
	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;
	
	Log_CreateTopic (Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Huno,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Huno,"Huno attend livraison d'une cargaison d'acier par les pirates. Il pense qu'un type nomm� Juan l'a vol�e pour le compte d'Esteban. Juan se terre apparemment quelque part dans les marais.");
	
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "D'abord, dites-moi qui a commandit� l'attaque !", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Bien, je m'en occuperai pour vous...", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //Bien, je m'en occupe.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //Parfait. Nous verrons si vous �tes digne de confiance.
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Huno_SomeThings_TellMeNow()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //Donnez-moi d'abord le nom du commanditaire de l'attaque !
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //Non. Je n'ai aucune confiance en vous.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //Ecoutez bien. La prochaine fois que je parlerai � quelqu'un, ce sera au commanditaire de l'attaque ou � Esteban.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //A vous de voir � qui j'irai parler.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //(soupire) Bien. Je vais vous mettre en relation avec le commanditaire. Mais �a se d�roulera comme je l'aurai pr�vu, compris ?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //Allez � la taverne et discutez avec le tavernier. Il vous apprendra tout ce que vous devez savoir d'autre.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
	
	B_LogEntry (Topic_Addon_Esteban, "Huno m'a conseill� d'aller parler � Snaf.");
};

//----------------------------------------------------------------------
//	Info Paket
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Paket   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent   = FALSE;
	description = "J'ai retrouv� l'acier.";
};
FUNC INT DIA_Addon_Huno_Paket_Condition()
{	
	if (MIS_Huno_Stahl == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Steel_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Paket_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_00");//J'ai retrouv� l'acier.
	B_GiveInvItems (other, self, ItMi_Addon_Steel_Paket,1);
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_01"); //Et ? Juan �tait l�, lui aussi ?
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_02"); //Il l'�tait.
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_03"); //Je le savais. C'est ce rat d'Esteban qui avait pr�par� le coup.
	
	if (Huno_zuSnaf == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_04"); //Bon, vous me semblez fiable. Pour �tre franc, je n'en attendais pas autant de vous.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_05"); //Tenez, acceptez ceci en r�compense.
		B_GiveInvItems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_Paket_15_06"); //Et notre accord ?
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_07"); //L'homme auquel vous voulez parler vous attend � la taverne. Allez parler au tavernier.
		Huno_zuSnaf = TRUE;
	};
	
	B_LogEntry (Topic_Addon_Esteban, "Huno m'a conseill� d'aller parler � Snaf.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HunoStahl);
};
//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	if (Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	B_Say (other,self,"$TRADE_3");
	B_GiveTradeInv(self);
};






