


// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_MiltenNW_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_EXIT_Condition;
	information	= DIA_MiltenNW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MiltenNW_EXIT_Condition()
{
	if (Kapitel < 3)	
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_MiltenNW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_MiltenNW_KAP3_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP3_EXIT_Condition;
	information	= DIA_MiltenNW_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*************************************************************
//Hallo!
//*************************************************************

INSTANCE DIA_MiltenNW_KAP3_Hello(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 31;
	condition	= DIA_MiltenNW_KAP3_Hello_Condition;
	information	= DIA_MiltenNW_KAP3_Hello_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_MiltenNW_KAP3_Hello_Condition()
{
	if hero.guild == GIL_PAL
	|| hero.guild == GIL_DJG
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_Hello_Info()
{	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_00"); //(Incrédule) Je n'arrive pas à le croire. Vous êtes vraiment un paladin maintenant ?
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_01"); //On dirait bien.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_02"); //(Euphorique) Avec un gars comme vous chez les paladins, les brutes de Béliar n'ont qu'à bien se tenir.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_03"); //Si vous avez vaincu le Dormeur, une poignée d'orques ne devrait pas vous effrayer.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_04"); //Il n'y a pas que les orques.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_05"); //Je sais, mais c'est quand même bon de vous avoir avec nous.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_06"); //Bon.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_07"); //Que faites-vous dans le monastère ? Laissez-moi deviner. Vous voulez apprendre les arts magiques ?
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_08"); //Peut-être.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_09"); //Je le savais : vous devriez parler à Marduk, c'est le responsable pour vous les paladins. Vous le trouverez devant la chapelle.
	};
	if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_10"); //Je vois que les rumeurs sont fondées.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_11"); //Quelles rumeurs ?
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_12"); //Vous avez rejoint les chasseurs de dragons.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_13"); //Qu'importe, vous n'aviez rien d'un homme d'église. Vous combattez pour notre cause, c'est ce qui compte.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_14"); //C'est tout ?
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_15"); //Cela me réjouit bien sûr, et avec votre aspect, tous les orques vont vous craindre.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_16"); //Il ne s'agit pas seulement des orques.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_17"); //Je sais, mais ils sont un problème. Vous êtes important.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Hello_03_18"); //Vous avez vaincu le Dormeur. Nous aurons peut-être tous besoin de votre aide un jour.
		AI_Output (other,self ,"DIA_MiltenNW_KAP3_Hello_15_19"); //Bon.
	};		
};	

// ************************************************************
// 	  				   Was machst du hier am Kloster
// ************************************************************

INSTANCE DIA_MiltenNW_Monastery(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 35;
	condition	= DIA_MiltenNW_Monastery_Condition;
	information	= DIA_MiltenNW_Monastery_Info;
	permanent	= FALSE;
	description = "Comment êtes-vous arrivé au monastère si rapidement ?";
};                       
FUNC INT DIA_MiltenNW_Monastery_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_Monastery_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_Monastery_15_00"); //Comment êtes-vous arrivé si vite au monastère ?
	AI_Output (self ,other,"DIA_MiltenNW_Monastery_03_01"); //Pourquoi cette question ? J'ai traversé la passe et je suis allé droit vers le monastère.
	AI_Output (self ,other,"DIA_MiltenNW_Monastery_03_02"); //Et bien, éviter les monstres qui se sont installés de ce côté de la vallée n'a pas été facile, mais j'ai rencontré moins de problèmes que prévu.
};

// ************************************************************
// 	  				   Weisst du wo die Anderen sind?
// ************************************************************

INSTANCE DIA_MiltenNW_FourFriends(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 35;
	condition	= DIA_MiltenNW_FourFriends_Condition;
	information	= DIA_MiltenNW_FourFriends_Info;
	permanent	= FALSE;
	description = "Savez-vous où sont les autres ?";
};                       
FUNC INT DIA_MiltenNW_FourFriends_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_FourFriends_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_FourFriends_15_00"); //Savez-vous où sont les autres ?
	if (Npc_IsDead (PC_FIGHTER_NW_vor_DJG) == FALSE)
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_01"); //Gorn semble avoir bien supporté son séjour dans les geôles de Garond.
		
		if (MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output (other,self ,"DIA_MiltenNW_FourFriends_15_02"); //Comment est-il sorti ?
			AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_03"); //J'ai dû mentir à Garond afin qu'il abandonne toutes les charges.
			AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_04"); //Mais que cela reste entre nous, d'accord ?
		};
		
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_05"); //Quoi qu'il en soit, il voulait aller rencontrer Lee pour voir se qui se passait à la ferme.
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_06"); //Après le régime auquel il a été soumis en prison, il doit probablement s'empiffrer maintenant. Les provisions des mercenaires vont le sentir passer.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_07"); //Gorn ne s'en est pas sorti.
	};
	if (Npc_IsDead (PC_THIEF_NW) == FALSE)
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_08"); //Diego a marmonné quelque chose à propos d'une reconnaissance. Je ne sais pas ce qu'il voulait dire par là.
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_09"); //Mais je le soupçonne d'être dans la ville. Vous le connaissez : toujours là où il y a quelque chose d'intéressant.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_FourFriends_03_10"); //Diego ne s'en est pas sorti : on dirait que cette Barrière l'a eu finalement.
	};
};
//*************************************************************
//Ich muss ins Kloster //HauptStory!!!
//*************************************************************

INSTANCE DIA_MiltenNW_KAP3_Entry(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 32;
	condition	= DIA_MiltenNW_KAP3_Entry_Condition;
	information	= DIA_MiltenNW_KAP3_Entry_Info;
	permanent	= TRUE;
	description = "Je dois entrer dans le monastère. C'est urgent !";
};                       
FUNC INT DIA_MiltenNW_KAP3_Entry_Condition()
{
	if (Kapitel == 3)	
	&& (hero.guild != GIL_KDF)
	&& (MiltenNW_GivesMonasteryKey == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP3_Entry_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_15_00"); //Je dois entrer dans le monastère. C'est urgent !
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self,other,"DIA_MiltenNW_KAP3_Entry_03_01"); //Pas de problème. Voilà la clef.
		
		CreateInvItems (self,ItKe_Innos_Mis,1);
		B_GiveInvItems (self,other,ItKe_Innos_Mis,1); 
	
		MiltenNW_GivesMonasteryKey = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_03_02"); //Je ne peux pas vous laisser entrer. J'aurais des problèmes avec le Haut Conseil.
		AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_03_03"); //Sans la permission de mes supérieurs, je ne peux laisser entrer personne au monastère.
	
		Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice (DIA_MiltenNW_KAP3_Entry,DIALOG_Back,DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice (DIA_MiltenNW_KAP3_Entry,"C'est important !",DIA_MiltenNW_KAP3_Entry_Important);
	
		if (Npc_HasItems (other,ItWr_PermissionToWearInnosEye_MIS) >=1)
		{	
			Info_AddChoice (DIA_MiltenNW_KAP3_Entry,"J'ai une lettre du seigneur Hagen.",DIA_MiltenNW_KAP3_Entry_Permit); 
		};
	};	
};	
	
FUNC VOID DIA_MiltenNW_KAP3_Entry_BACK ()
{
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};	

FUNC VOID DIA_MiltenNW_KAP3_Entry_Important ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_Important_15_00"); //C'est important !
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01"); //Inutile. Pyrokar m'arracherait la tête.
	
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};

FUNC VOID DIA_MiltenNW_KAP3_Entry_Permit ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Entry_Permit_15_00"); //J'ai une lettre du seigneur Hagen.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01"); //Montrez-moi ça.
	
	B_GiveInvItems (other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	B_UseFakeScroll ();	
	
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02"); //(hésitant) D'accord. Voilà la clef du monastère. Pyrokar est dans l'église.
	
	CreateInvItems (self,ItKe_Innos_Mis,1);
	B_GiveInvItems (self,other,ItKe_Innos_Mis,1); 
	B_GiveInvItems (self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	
	MiltenNW_GivesMonasteryKey = TRUE;
	
	Info_ClearChoices (DIA_MiltenNW_KAP3_Entry);
};

//***************************************************************
//	Hast du hier jemanden herauskommen gesehen?
//***************************************************************

INSTANCE DIA_MiltenNW_KAP3_NovizenChase(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 31;
	condition	= DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information	= DIA_MiltenNW_KAP3_NovizenChase_Info;
	permanent	= FALSE;
	description = "Savez-vous où est Pedro ?";
};                       
FUNC INT DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	IF 	(Kapitel == 3) 
	&&	(MIS_NOVIZENCHASE == LOG_RUNNING) 
	&& 	(MIS_SCKnowsInnosEyeIsBroken == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_NovizenChase_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_NovizenChase_15_00"); //Vous savez où est Pedro ?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01"); //Vous croyez que je resterais là si je savais où se cache le renégat ?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02"); //Il doit payer pour ses actes. J'espère que nous pourrons récupérer l'Œil.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03"); //Vous devez nous aider. Trouvez-le et ramenez l'Œil d'Innos.
	//Joly: AI_Output (self ,other,"DIA_MiltenNW_KAP3_NovizenChase_03_04"); //Ich werde sehen, was ich tun kann.
};	

//***************************************************************
//	Weißt du etwas über die vermummten Gestalten?
//***************************************************************

INSTANCE DIA_MiltenNW_KAP3_Perm(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 39;
	condition	= DIA_MiltenNW_KAP3_Perm_Condition;
	information	= DIA_MiltenNW_KAP3_Perm_Info;
	permanent	= FALSE;
	description = "Savez-vous quelque chose au sujet des gens encapuchonnés ?";
};                       
FUNC INT DIA_MiltenNW_KAP3_Perm_Condition()
{
	IF 	(Kapitel == 3)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_MiltenNW_KAP3_Perm_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP3_Perm_15_00"); //Savez-vous quoi que ce soit à propos des encapuchonnés ?
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Perm_03_01"); //Non, mais j'ai un mauvais pressentiment sur ces gars.
	AI_Output (self ,other,"DIA_MiltenNW_KAP3_Perm_03_02"); //Prenez garde si vous les rencontrez.
};	
	

//########################
//##					##
//##	Kapitel 4		##
//##					##
//########################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_MiltenNW_KAP4_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP4_EXIT_Condition;
	information	= DIA_MiltenNW_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   Perm KAP4
// ************************************************************

INSTANCE DIA_MiltenNW_KAP4_PERM(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 49;
	condition	= DIA_MiltenNW_KAP4_PERM_Condition;
	information	= DIA_MiltenNW_KAP4_PERM_Info;
	permanent	= TRUE;
	description = "Des nouvelles ?";
};                       
FUNC INT DIA_MiltenNW_KAP4_PERM_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_KAP4_PERM_15_00"); //Des nouvelles ?
	AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_01"); //C'est moi qui devrait poser la question. Nous sommes toujours très inquiets ici.
	AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_02"); //Le Haut Conseil essaye de découvrir ce que prépare l'ennemi.
	AI_Output (other,self ,"DIA_MiltenNW_KAP4_PERM_15_03"); //Autre chose ?
	
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_04"); //Depuis quelque temps, on parle de plus en plus d'attaques d'orques, même en dehors de la Vallée des mines.
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_05"); //Ça ne me plaît pas. J'ai la sensation qu'il ne nous reste pas beaucoup de temps.
	}
	else if (hero.guild == GIL_DJG)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_06"); //Un fermier a indiqué qu'il avait aperçu des créatures écailleuses à proximité de sa ferme.
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_07"); //Je ne sais qu'en penser, mais j'ai la sensation que l'ennemi mijote quelque chose.
	}
	else if (MIS_FindTheObesessed == LOG_RUNNING)
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_08"); //Nous recevons de plus en plus de rapports faisant état de gens possédés. L'ennemi est bien plus puissant que je ne le pensais.
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_KAP4_PERM_03_09"); //Non, la situation est toujours aussi préoccupante. Nous ne pouvons que faire confiance à Innos.
	};
};

//########################
//##					##
//##	Kapitel 5		##
//##					##
//########################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_MiltenNW_KAP5_EXIT(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 999;
	condition	= DIA_MiltenNW_KAP5_EXIT_Condition;
	information	= DIA_MiltenNW_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_MiltenNW_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************

INSTANCE DIA_MiltenNW_AllDragonsDead(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 900;
	condition	= DIA_MiltenNW_AllDragonsDead_Condition;
	information	= DIA_MiltenNW_AllDragonsDead_Info;
	permanent	= FALSE;
	description = "J'ai tué tous les dragons.";
};                       
FUNC INT DIA_MiltenNW_AllDragonsDead_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_MiltenNW_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_AllDragonsDead_15_00"); //J'ai tué tous les dragons.
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_01"); //C'est vrai ? Il y a donc un espoir pour peu que nous parvenions à trancher la tête du mal...
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_02"); //Si c'est vrai, alors nous allons l'emporter.
	AI_Output (other,self ,"DIA_MiltenNW_AllDragonsDead_15_03"); //Qui, moi ?
	AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_04"); //Evidemment ! Qui d'autre ?
	
	if (MiltenNW_IsOnBoard	 == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_MiltenNW_AllDragonsDead_03_05"); //Mettons-nous en route sans perdre de temps, sans quoi il risquerait d'être trop tard.
	};
};

///////////////////////////////////////////////////////////////////////
//	In Bibliothek gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_SCWasInLib		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	3;
	condition	 = 	DIA_MiltenNW_SCWasInLib_Condition;
	information	 = 	DIA_MiltenNW_SCWasInLib_Info;
	important	 = 	TRUE;

};
func int DIA_MiltenNW_SCWasInLib_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_SCWasInLib_Info ()
{
	AI_Output			(self, other, "DIA_MiltenNW_SCWasInLib_03_00"); //Hé, je me suis laissé dire que vous aviez passé beaucoup de temps dans la cave du monastère. Qu'y avez-vous découvert ?
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_KnowWhereEnemy_Condition;
	information	 = 	DIA_MiltenNW_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Je sais désormais où se terre l'ennemi.";
};

func int DIA_MiltenNW_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (MiltenNW_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
var int SCToldMiltenHeKnowWhereEnemy;
func void DIA_MiltenNW_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_KnowWhereEnemy_15_00"); //Je sais désormais où l'ennemi se cache. Sur une petite île, non loin d'ici.
	AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_01"); //Voilà notre chance ! Il faut nous mettre en route sans perdre un instant afin d'éradiquer le mal une bonne fois pour toutes.
	SCToldMiltenHeKnowWhereEnemy = TRUE;
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);  
  	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
  	if ((Npc_IsDead(DiegoNW))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_02"); //En avez-vous parlé à Diego ? Je suis sûr qu'il aimerait bien vous accompagner.
 		B_LogEntry (TOPIC_Crew,"Diego pourrait s'avérer utile. Il ne reste jamais très longtemps au même endroit.");
 	};

  	if ((Npc_IsDead(GornNW_nach_DJG))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_03"); //Et Gorn ? Allez le voir. J'ai entendu dire qu'il était de retour de la Vallée des mines.
 		B_LogEntry (TOPIC_Crew,"Gorn serait certainement très utile. Cela ne peut pas faire de mal d'avoir un bon combattant à ses côtés. Peut-être peut-il m'entraîner.");
 	};
	
	if ((Npc_IsDead(Lester))== FALSE)
  	{
 		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_04"); //Et n'oubliez pas Lester. Si vous ne le sortez pas de force de cette vallée, il finira par y prendre racine.
 		B_LogEntry (TOPIC_Crew,"Si je ne prends pas Lester avec moi, il ne sortira probablement jamais de cette vallée.");
 	};
	
	AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_05"); //Je connais également mon rôle dans cette histoire. Je peux augmenter votre mana et vous aider à tracer des runes quand nous nous retrouverons face à l'ennemi. Quand y allons-nous ?
	
	B_LogEntry (TOPIC_Crew,"Si Milten vient avec moi, il peut m'apprendre comment créer des runes et augmenter mon mana.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_MiltenNW_KnowWhereEnemy_15_06"); //Pas si vite, j'ai déjà bien assez de gens avec moi.
		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_07"); //Vous savez que je suis disposé à vous accompagner. Si vous changez d'avis, vous savez où me trouver.
		AI_Output			(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_08"); //Bonne chance, et puisse Innos vous protéger.
	}
	else 
	{
		Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice (DIA_MiltenNW_KnowWhereEnemy,"Je n'ai pas besoin de vous pour le moment.",DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_MiltenNW_KnowWhereEnemy,"Bienvenue à bord !",DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_MiltenNW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00"); //Bienvenue à bord !
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01"); //Nous devrions nous retrouver au port. Attendez-moi là.
	AI_Output (self ,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02"); //Bien. J'y serai quand vous y reviendrez.
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard	 = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_Crewmember_Success);
	
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};

	Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
};

FUNC VOID DIA_MiltenNW_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_MiltenNW_KnowWhereEnemy_No_15_00"); //Vous ne m'êtes d'aucune utilité pour le moment.
	AI_Output (self ,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01"); //Vous savez que je vous aurais été fidèle jusqu'au bout. Si vous changez d'avis, vous savez où me trouver.

	MiltenNW_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_MiltenNW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	WhereCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_WhereCaptain		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	3;
	condition	 = 	DIA_MiltenNW_WhereCaptain_Condition;
	information	 = 	DIA_MiltenNW_WhereCaptain_Info;
	
	description	 = 	"Où dois-je aller pour trouver un capitaine.";

};
func int DIA_MiltenNW_WhereCaptain_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (SCToldMiltenHeKnowWhereEnemy == TRUE)
	&& (SCGotCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_WhereCaptain_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_WhereCaptain_15_00"); //Où puis-je trouver un capitaine ?
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_01"); //Demandez à Jorgen. C'est un marin, après tout. Il devrait encore se trouver au monastère.
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_02"); //S'il est incapable de vous aider, il vous faudra chercher, en ville ou dans les fermes, quelqu'un qui puisse piloter votre bateau.
	AI_Output			(self, other, "DIA_MiltenNW_WhereCaptain_03_03"); //Je vous conseille d'aller parler à Lee ou de vous rendre au port de Khorinis C'est tout ce qui me vient à l'esprit pour le moment.
 
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                                                            
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                                                          
	B_LogEntry (TOPIC_Captain,"Je pourrais prendre Jorgen comme capitaine. Il devrait encore se trouver au monastère. A part ça, il devrait y avoir d'autres candidats dans les fermes ou en ville. Peut-être devrais-je parler à Lee ou me renseigner au port.");
	
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_LeaveMyShip_Condition;
	information	 = 	DIA_MiltenNW_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"En fait, je ne peux pas vous emmener avec moi.";
};
func int DIA_MiltenNW_LeaveMyShip_Condition ()
{	
	if (MiltenNW_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_LeaveMyShip_15_00"); //Finalement je ne peux pas vous emmener avec moi.
	AI_Output			(self, other, "DIA_MiltenNW_LeaveMyShip_03_01"); //Vous êtes le mieux placé pour savoir qui est à même de vous être utile, mais je reste tout de même au monastère, des fois que vous changiez d'avis.
	
	MiltenNW_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Mage_NW;
	nr			 = 	55;
	condition	 = 	DIA_MiltenNW_StillNeedYou_Condition;
	information	 = 	DIA_MiltenNW_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"J'ai besoin de vous.";
};
func int DIA_MiltenNW_StillNeedYou_Condition ()
{	
	if ((MiltenNW_IsOnBOard == LOG_OBSOLETE)		//Hier brauch man natürlich nur eine variable abfragen
	|| (MiltenNW_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_MiltenNW_StillNeedYou_15_00"); //J'ai besoin de vous.

	AI_Output	(self, other, "DIA_MiltenNW_StillNeedYou_03_01"); //C'est trop d'honneur que vous me faites. Allons-y, il n'y a pas un instant à perdre.
	AI_Output	(self, other, "DIA_MiltenNW_StillNeedYou_03_02"); //Je vais au port. Nous nous y retrouverons.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
		if (MIS_ReadyforChapter6 == TRUE)
			{
				Npc_ExchangeRoutine (self,"SHIP"); 
			}
			else
			{
				Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
			};
	
		AI_StopProcessInfos (self);
};



// ************************************************************
// 		Teach
// ************************************************************
INSTANCE DIA_MiltenNW_Teach(C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 90;
	condition	= DIA_MiltenNW_Teach_Condition;
	information	= DIA_MiltenNW_Teach_Info;
	permanent	= TRUE;
	description = "Je veux apprendre de nouveaux sorts.";
};                       

FUNC INT DIA_MiltenNW_Teach_Condition()
{	
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenNW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_MiltenNW_Teach_15_00");//Je souhaiterais apprendre de nouveaux sorts.
	
	if  (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices (DIA_MiltenNW_Teach);
		Info_AddChoice (DIA_MiltenNW_Teach,DIALOG_BACK,DIA_MiltenNW_Teach_BACK);
		
		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_MiltenNW_Teach_Windfist);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_MiltenNW_Teach_Feuerball);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenNW_Teach, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_MiltenNW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenNW_Teach_03_01");//Vous n'avez pas encore atteint le 2nd Cercle de magie. Il m'est donc impossible de vous enseigner quoi que ce soit.
	};
};	
FUNC VOID DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices (DIA_MiltenNW_Teach);
};
FUNC VOID DIA_MiltenNW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_MiltenNW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_MiltenNW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_Mana		(C_INFO)
{
	npc		  	 = 	PC_Mage_NW;
	nr			 = 	100;
	condition	 = 	DIA_MiltenNW_Mana_Condition;
	information	 = 	DIA_MiltenNW_Mana_Info;
	permanent	 = 	TRUE;
	description	 = 	"Je veux augmenter mon pouvoir magique.";
};
func int DIA_MiltenNW_Mana_Condition ()
{	
	if (other.guild == GIL_KDF)	
	{
		return TRUE;
	};
};
func void DIA_MiltenNW_Mana_Info ()
{
	AI_Output (other, self, "DIA_MiltenNW_Mana_15_00"); //Je veux augmenter mon pouvoir magique.
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
};
func void DIA_MiltenNW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenNW_Mana_03_00"); //Votre puissance magique est déjà grande, trop pour que je puisse vous aider à l'augmenter encore.
	};
	Info_ClearChoices (DIA_MiltenNW_Mana);
};
func void DIA_MiltenNW_Mana_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
	
};
func void DIA_MiltenNW_Mana_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_MiltenNW_Mana);
	
	Info_AddChoice 		(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenNW_Mana_1);
	Info_AddChoice		(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenNW_Mana_5);
	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mage_NW_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_NW;
	nr			= 900;
	condition	= DIA_Mage_NW_PICKPOCKET_Condition;
	information	= DIA_Mage_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Mage_NW_PICKPOCKET_Condition()
{
	C_Beklauen (56, 75);
};
 
FUNC VOID DIA_Mage_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mage_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Mage_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Mage_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mage_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mage_NW_PICKPOCKET_DoIt);
};

func void DIA_Mage_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mage_NW_PICKPOCKET);
};
	
func void DIA_Mage_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mage_NW_PICKPOCKET);
};


