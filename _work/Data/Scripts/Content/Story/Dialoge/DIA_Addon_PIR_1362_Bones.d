// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Addon_Bones_EXIT(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 999;
	condition	= DIA_Addon_Bones_EXIT_Condition;
	information	= DIA_Addon_Bones_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Bones_PICKPOCKET (C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 900;
	condition	= DIA_Addon_Bones_PICKPOCKET_Condition;
	information	= DIA_Addon_Bones_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Bones_PICKPOCKET_Condition()
{
	C_Beklauen (75, 104);
};
 
FUNC VOID DIA_Addon_Bones_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Bones_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
	
func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Bones_PICKPOCKET);
};
// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
func void B_Addon_Bones_KeineZeit()
{
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_01"); //Je suis désolé mais je n'ai pas le temps.
	AI_Output (self ,other,"DIA_Addon_Bones_Train_01_02"); //Je dois m'entraîner.
};
// -------------------------------------------------------------
INSTANCE DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 1;
	condition	= DIA_Addon_Bones_Anheuern_Condition;
	information	= DIA_Addon_Bones_Anheuern_Info;

	description = "Le canyon nous attend.";
};                       
FUNC INT DIA_Addon_Bones_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Bones_Anheuern_Info()
{	
	AI_Output	(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //Le canyon nous attend.
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  				Hello 
// ************************************************************
INSTANCE DIA_Addon_Bones_Hello(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Hello_Condition;
	information	= DIA_Addon_Bones_Hello_Info;
	permanent	= FALSE;
	description = "Comment ça se passe ?";
};                       
FUNC INT DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bones_Hello_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Hello_15_00"); //Comment ça se passe ?
	AI_Output (self ,other,"DIA_Addon_Bones_Hello_01_01"); //Faut pas se plaindre. C'est un peu ennuyeux, mais au moins je ne travaille pas.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_01"); //Je me prépare pour la prochaine mission que Greg m'a confiée.
	AI_Output (other,self ,"DIA_Addon_Bones_Work_15_02"); //Quelle mission ?
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_03"); //Je n'ai pas le droit de le dire.
	AI_Output (self ,other,"DIA_Addon_Bones_Work_01_04"); //Excuse-moi, petit, mais j'ai travaillé dur pour ce privilège et je n'ai pas envie de le reperdre.
	
	Npc_ExchangeRoutine (self, "START");
};

// ************************************************************
// 			  			Kannst du mir was beibringen? 
// ************************************************************
INSTANCE DIA_Addon_Bones_Train(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Train_Condition;
	information	= DIA_Addon_Bones_Train_Info;
	permanent	= FALSE;
	description = "Pouvez-vous m'enseigner quelque chose ?";
};                       
FUNC INT DIA_Addon_Bones_Train_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_Train_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Train_15_00"); //Pouvez-vous m'apprendre quelque chose ?
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  			Wo finde ich Lehrer
// ************************************************************
INSTANCE DIA_Addon_Bones_Teacher(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 5;
	condition	= DIA_Addon_Bones_Teacher_Condition;
	information	= DIA_Addon_Bones_Teacher_Info;
	permanent	= FALSE;
	description = "Qui prodigue son enseignement ici ?";
};                       
FUNC INT DIA_Addon_Bones_Teacher_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Bones_Teacher_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_00"); //Qui peut m'apprendre quelque chose par ici ?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_04"); //Henry et Morgan commandent notre troupe.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_05"); //Ils pourront vous apprendre à devenir un meilleur guerrier.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_07"); //Les gars de Henry utilisent des armes à deux mains.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_08"); //Morgan préfère les armes à une main. Elles sont plus rapides.
	AI_Output (other,self ,"DIA_Addon_Bones_Teacher_15_09"); //Qui d'autre ?
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_10"); //Que je sois damné. Je ne me suis jamais intéressé à autre chose.
	AI_Output (self ,other,"DIA_Addon_Bones_Teacher_01_11"); //Mais je suis sûr que Alligator Jack ou Samuel pourraient vous apprendre un ou deux trucs.
	Knows_HenrysEntertrupp = TRUE;
	
	Log_CreateTopic (Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry (Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);

};

// ************************************************************
// 			  			Was weißt du über Francis?
// ************************************************************
INSTANCE DIA_Addon_Bones_Francis(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 3;
	condition	= DIA_Addon_Bones_Francis_Condition;
	information	= DIA_Addon_Bones_Francis_Info;
	permanent	= FALSE;
	description = "Vous savez quelque chose sur Francis ?";
};                       
FUNC INT DIA_Addon_Bones_Francis_Condition()
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

FUNC VOID DIA_Addon_Bones_Francis_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_Francis_15_00"); //Vous savez quelque chose sur Francis ?
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_03"); //Regardez autour de vous. Les seuls qui travaillent, c'est Henry et ses gars.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_04"); //Morgan passe toute la journée au lit ou à vider des bouteilles.
	AI_Output (self ,other,"DIA_Addon_Bones_Francis_01_05"); //Avec Greg, ça ne se passe pas comme ça. Si vous franchissez la ligne, un coup de pied aux fesses et puis c'est tout.
};

//*********************************************************
//	BDT Armor
//*********************************************************
instance DIA_Addon_Bones_WantArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_WantArmor_Condition;
	information	= DIA_Addon_Bones_WantArmor_Info;
	permanent	= TRUE;
	description = "Donnez-moi cette armure de bandit.";
};                       
FUNC INT DIA_Addon_Bones_WantArmor_Condition()
{
	if (Greg_GaveArmorToBones == TRUE)
	&& (MIS_Greg_ScoutBandits == 0)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Addon_Bones_WantArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_WantArmor_15_00"); //Donnez-moi cette armure de bandit.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_01"); //Je ne suis pas fou. Greg va me faire la peau.
	AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_02"); //Il a clairement ordonné que personne n'aura cette armure sans qu'il en donne l'ordre.
	if (GregIsBack == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_Bones_WantArmor_01_03"); //Je ne peux pas vous la donner. Surtout maintenant qu'il est revenu.
	};
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"Bones ne me remettra pas l'armure sans l'autorisation de Greg."); 
};

//*********************************************************
//	Du sollst mir die Rüstung geben.
//*********************************************************
instance DIA_Addon_Bones_GiveArmor(C_INFO)
{
	npc			= PIR_1362_Addon_Bones;
	nr			= 2;
	condition	= DIA_Addon_Bones_GiveArmor_Condition;
	information	= DIA_Addon_Bones_GiveArmor_Info;
	permanent	= FALSE;
	description = "Vous devez me donner l'armure de bandit. Ordre de Greg.";
};                       
FUNC INT DIA_Addon_Bones_GiveArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};	
};
func VOID DIA_Addon_Bones_GiveArmor_Info()
{	
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_00"); //Vous devez me donner l'armure de bandit. Ordre de Greg.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_01"); //De Greg ? Pff, je le savais bien qu'il faudrait que j'y aille.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_02"); //Aller espionner dans le camp des bandits, c'est une mission-suicide.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_03"); //Je préfère crouler sous les tâches de Greg que d'aller me faire tuer par ces bandits.
	AI_Output (other,self ,"DIA_Addon_Bones_GiveArmor_15_04"); //(agacé) L'armure.
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_05"); //Oh, oui, bon, la voilà.
	B_GiveInvItems (self,other,ItAr_BDT_M,1);
	AI_Output (self ,other,"DIA_Addon_Bones_GiveArmor_01_06"); //Faites attention. Ces bandits ne rigolent pas.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	
	B_LogEntry (TOPIC_Addon_BDTRuestung,"La parole de Greg semble d'or. Je possède maintenant l'armure de bandit !"); 
	
	B_GivePlayerXP (XP_Bones_GetBDTArmor);
};

