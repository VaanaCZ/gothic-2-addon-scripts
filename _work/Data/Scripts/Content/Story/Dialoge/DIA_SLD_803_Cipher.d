// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Cipher_EXIT(C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 999;
	condition	= DIA_Cipher_EXIT_Condition;
	information	= DIA_Cipher_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cipher_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cipher_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************

instance DIA_Cipher_Hello (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 1;
	condition	= DIA_Cipher_Hello_Condition;
	information	= DIA_Cipher_Hello_Info;
	permanent	= FALSE;
	description = "Qu'y a-t-il?";
};                       

FUNC INT DIA_Cipher_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Cipher_Hello_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Hello_15_00"); //Comment �a va ?
	AI_Output (self, other, "DIA_Cipher_Hello_07_01"); //H�! On se conna�t, non�?
	AI_Output (other, self, "DIA_Cipher_Hello_15_02"); //Ce n'est pas impossible...
	AI_Output (self, other, "DIA_Cipher_Hello_07_03"); //Je vendais de l'herbe des marais � la colonie, vous vous rappelez�?
};

// ************************************************************
// 			  					TradeWhat 
// ************************************************************

instance DIA_Cipher_TradeWhat (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TradeWhat_Condition;
	information	= DIA_Cipher_TradeWhat_Info;
	permanent	= FALSE;
	description = "Et de quoi vous occupez-vous maintenant ?";
};                       

FUNC INT DIA_Cipher_TradeWhat_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TradeWhat_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TradeWhat_15_00"); //Et maintenant, qu'est-ce que vous vendez�?
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_01"); //Ne me le demandez pas...
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_02"); //J'ai pris de l'herbe des marais avec moi quand on a quitt� la colonie mini�re.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_03"); //Beaucoup de mercenaires aiment fumer de temps en temps, ce qui m'a permis de mettre un peu d'argent de c�t�.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_04"); //Mais un fumier m'a vol� toute l'herbe contenue dans mon coffre�!
	
	Log_CreateTopic (Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus (Topic_CipherPaket,LOG_RUNNING);
	B_LogEntry (Topic_CipherPaket, "Le mercenaire Cipher a perdu un paquet d'herbes des marais.");
	
	
	if (!Npc_IsDead (Bodo))
	{
		AI_Output (self, other, "DIA_Cipher_TradeWhat_07_05"); //Je suis quasiment certain qu'il s'agit de Bodo. On partage la m�me chambre et il me sourit toujours comme un gros d�bile...
		B_LogEntry (Topic_CipherPaket, "Il soup�onne Bodo de le lui avoir vol�.");
	};
	
	MIS_Cipher_Paket = LOG_RUNNING;
};

// ************************************************************
// 			  					DoWithThief 
// ************************************************************

instance DIA_Cipher_DoWithThief (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DoWithThief_Condition;
	information	= DIA_Cipher_DoWithThief_Info;
	permanent	= FALSE;
	description = "Alors qu'allez-vous faire au sujet du voleur ?";
};                       

FUNC INT DIA_Cipher_DoWithThief_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DoWithThief_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_00"); //Que comptez-vous faire au sujet de ce vol�?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_01"); //Un de ces jours, je l'attraperai bien en train de fumer mon herbe.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_02"); //Et � ce moment, je trouverai un coin tranquille pour lui donner une le�on qu'il n'oubliera pas de sit�t.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_03"); //Si jamais je m'occupe de lui ici, les autres fermiers le verront et �a me co�tera un max.
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_04"); //Comment �a�?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_05"); //C'est simple�: si on touche aux fermiers, Lee nous oblige � verser une lourde amende. C'est Onar qui a fix� cette r�gle.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_06"); //Et plus il y a de t�moins, plus l'affaire fait du bruit... et plus l'amende est �lev�e.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_07"); //Alors, on va r�gler �a tranquillement, loin des regards...
};

// ************************************************************
// 			  					WannaJoin 
// ************************************************************

instance DIA_Cipher_WannaJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_WannaJoin_Condition;
	information	= DIA_Cipher_WannaJoin_Info;
	permanent	= FALSE;
	description = "Je veux me joindre aux hommes de Lee !";
};                       

FUNC INT DIA_Cipher_WannaJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_00"); //Je veux rejoindre la bande de Lee.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_01"); //La bande de Lee�? Ha�! Si �a continue comme �a, elle sera bient�t plus � lui�!
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_02"); //Pourquoi ?
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_03"); //Lee est du genre calme. Il �tait d�j� comme �a du temps de la colonie.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_04"); //Mais il pousse le bouchon un peu loin. Tout ce qu'il veut, c'est rester ici � ne rien faire et attendre que les paladins meurent de faim.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_05"); //Sylvio est de l'avis qu'on devrait ratisser ce qu'on peut au niveau des petites fermes et � l'ext�rieur de la ville.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_06"); //C'est vrai que �a nous changerait, et ce serait pas un mal.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_07"); //En ce moment, on passe nos journ�es � se tourner les pouces. Vous voulez toujours vous joindre � nous�?
};

// ************************************************************
// 			  					YesJoin 
// ************************************************************

instance DIA_Cipher_YesJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_YesJoin_Condition;
	information	= DIA_Cipher_YesJoin_Info;
	permanent	= FALSE;
	description = "Quoi qu'il m'en co�te, je veux devenir l'un des v�tres !";
};                       

FUNC INT DIA_Cipher_YesJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_YesJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_00"); //Je veux devenir l'un des v�tres quoi qu'il advienne�!
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_01"); //Vous �tes au courant que tout le monde vote pour d�terminer si les nouveaux doivent �tre accept�s ou pas�?
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_02"); //Que voulez-vous dire�?
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_03"); //Eh bien, �a fait un bon moment que je n'ai plus fum�. Apportez-moi de l'herbe des marais et ma voix vous est acquise.
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_04"); //Je suis s�r que vous devriez pouvoir y arriver.
	
	MIS_Cipher_BringWeed = LOG_RUNNING;
	
	Log_CreateTopic (Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_RUNNING);
	B_LogEntry (Topic_CipherHerb,"Cipher votera pour moi si je lui ram�ne des herbes des marais.");
};

// ************************************************************
// 			  					Joints 
// ************************************************************

instance DIA_Cipher_Joints (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_Joints_Condition;
	information	= DIA_Cipher_Joints_Info;
	permanent	= TRUE;
	description = "A propos de l'herbe des marais...";
};                       

FUNC INT DIA_Cipher_Joints_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_Joints_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Joints_15_00"); //A propos de l'herbe des marais...
	
	if (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Cipher_Joints_07_01"); //Vous me l'avez amen�e�! Excellent�!
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_07_02"); //Je voterai pour vous, pas de probl�me.
			
			B_LogEntry (TOPIC_SLDRespekt,"Cipher votera pour moi quand je ferai ma demande pour rejoindre les mercenaires.");
		};
		
		MIS_Cipher_BringWeed = LOG_OBSOLETE; //Cipher ist gl�cklich
	}
	else //normal Running
	{
		Info_ClearChoices (DIA_Cipher_Joints);
		Info_AddChoice (DIA_Cipher_Joints, "Je verrai ce que je peux faire...", DIA_Cipher_Joints_Running);
		if (Npc_HasItems (other, itmi_joint) > 0)
		{
			Info_AddChoice (DIA_Cipher_Joints, "Voici quelques tiges pour vous...", DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Running_15_00"); //Je vais voir ce que je peux faire.
	Info_ClearChoices (DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Success_15_00"); //En voil� un peu.
	
	if (B_GiveInvItems (other, self, itmi_joint, 10))
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_01"); //Ah�! Vous �tes un type bien�!
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_02"); //Ma voix vous est acquise.
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_LogEntry (TOPIC_SLDRespekt,"Cipher votera pour moi quand je ferai ma demande pour rejoindre les mercenaires.");
		B_GivePlayerXP (XP_CipherWeed);
		
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_03"); //C'est tout�? J'aurai tout fum� d'un coup�!
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_04"); //Il m'en faut au moins dix joints�!
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_05"); //Quoi qu'il en soit, ma voix vous est acquise.
		};
	};

	Info_ClearChoices (DIA_Cipher_Joints);
};


// ************************************************************
// 			  					TRADE
// ************************************************************

instance DIA_Cipher_TRADE (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TRADE_Condition;
	information	= DIA_Cipher_TRADE_Info;
	permanent	= TRUE;
	description = "Montrez-moi vos marchandises.";
	trade		= TRUE;
};                       

FUNC INT DIA_Cipher_TRADE_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TRADE_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TRADE_15_00"); //Montrez-moi vos marchandises.
	if (Npc_HasItems(self, itmi_joint) > 0)
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_01"); //Pas de probl�me. Servez-vous.
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_02"); //Je n'ai pas d'herbe des marais en ce moment. Vous d�sirez autre chose�?
	};
};

// ************************************************************
// 			  					Dar Dieb
// ************************************************************

instance DIA_Cipher_DarDieb (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarDieb_Condition;
	information	= DIA_Cipher_DarDieb_Info;
	permanent	= FALSE;
	description = "Je sais qui a pris votre herbe.";
};                       

FUNC INT DIA_Cipher_DarDieb_Condition()
{
	if ( (Dar_Dieb == TRUE) || (Dar_Verdacht == TRUE) )
	&& (!Npc_IsDead (Dar))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarDieb_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_00"); //Je sais qui a vol� votre herbe des marais.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_01"); //Qui c'est, alors�? Bodo�?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_02"); //Non, c'est un mercenaire. Dar.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_03"); //Le fumier�! O� il est�?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_04"); //Le retrouver ne vous servira � rien, il a vendu le paquet � Khorinis.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_05"); //OU IL EST�?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_06"); //Derri�re le b�timent de la cuisine, � l'angle...
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_07"); //JE VAIS L'ECRABOUILLER�!
	
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Dar, AR_NONE, 0);
};

// ************************************************************
// 			  					Dar LOST
// ************************************************************

instance DIA_Cipher_DarLOST (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarLOST_Condition;
	information	= DIA_Cipher_DarLOST_Info;
	permanent	= FALSE;
	description = "On a donn� � Dar ce qu'il m�ritait� Vous sentez-vous mieux maintenant ?";
};                       

FUNC INT DIA_Cipher_DarLOST_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarLOST_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_00"); //Vous avez mis une bonne racl�e � Dar. Vous vous sentez mieux, maintenant�?
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_01"); //(soupire) Ouais, �a m'a fait du bien.
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_02"); //Pas � lui, j'imagine.
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_03"); //Il n'avait qu'� pas fouiner dans mon coffre, ce pourri�!
	
	B_GivePlayerXP ((XP_Ambient)*2);
};

// ************************************************************
// 			  				Kraut PAKET
// ************************************************************

instance DIA_Cipher_KrautPaket (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_KrautPaket_Condition;
	information	= DIA_Cipher_KrautPaket_Info;
	permanent	= FALSE;
	description = "Ce paquet d'herbes des marais serait-il � vous ?";
};                       

FUNC INT DIA_Cipher_KrautPaket_Condition()
{
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_KrautPaket_Info()
{	
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_00"); //Ce paquet d'herbe des marais ne serait pas � vous, des fois�?
	B_GiveInvItems (other, self, ItMi_HerbPaket, 1);
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_01"); //�a alors�! O� l'avez-vous trouv�?
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_02"); //C'est une longue histoire...
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_03"); //Sans importance. Vous �tes un type bien.
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_04"); //Tenez, prenez �a en guise de r�compense et amusez-vous bien.
	B_GiveInvItems (self, other, itmi_gold, 200);
	B_GiveInvItems (self, other, itmi_joint, 10);
	B_GivePlayerXP (XP_Cipher_KrautPaket);
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_05"); //Laissez-moi en rouler quelques uns
	CreateInvItems (self, itmi_joint, 40);
	Npc_RemoveInvItems (self, ItMi_HerbPaket, 1);
	
	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_CipherPaket);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_CipherSLD_PICKPOCKET (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 900;
	condition	= DIA_CipherSLD_PICKPOCKET_Condition;
	information	= DIA_CipherSLD_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_CipherSLD_PICKPOCKET_Condition()
{
	C_Beklauen (65, 65);
};
 
FUNC VOID DIA_CipherSLD_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_CipherSLD_PICKPOCKET);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_BACK 		,DIA_CipherSLD_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_CipherSLD_PICKPOCKET_DoIt);
};

func void DIA_CipherSLD_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};
	
func void DIA_CipherSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};


		



		
	
//#####################################################################
//##
//##
//##						Bis - KAPITEL 3 - (danach in OW!)
//##
//##
//#####################################################################
	

	



	
/**/
